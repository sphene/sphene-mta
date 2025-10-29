-----------------------------------
-- * Variables
-----------------------------------

Benchmark = {}
Benchmark.__index = Benchmark

local cycleStartTime = 0

local fps = 0
local nextTick = 0
local totalFPS = 0
local measurementsPassed = 0
local systemInfo = {}
local benchmarkScores = {}

-----------------------------------
-- * Functions
-----------------------------------

function Benchmark.load()
    Overlay.triggerEvent("onBenchmarkMenu")
    Overlay.showCursor()

    Discord.setState('Benchmark main menu')
    Discord.setMissionName()
end

function Benchmark.start()
    benchmarkScores = {
        ['overall'] = 0,
        ['idleInstructions'] = 0,
        ['scmInstructions'] = 0,
        ['copScene'] = 0,
        ['vehicleCarrec'] = 0,
        ['10Threads'] = 0,
        ['50Threads'] = 0,
        ['100Threads'] = 0,
        ['kickstartStadium'] = 0,
        ['vehiclePath1'] = 0,
        ['vehiclePath2'] = 0
    }

    Game.start(Core.game.SAN_ANDREAS)
    Overlay.triggerEvent("onBenchmark")

    Discord.setState('Benchmarking')
    Discord.setMissionName()

    setTimer(function()
        Overlay.triggerEvent("onBenchmarkStateChange", {
            state = 0,
            message = "Preparing benchmark"
        })

        loadOpcodeTable("assets/opcodes/SASCM.ini")
        Text.loadGXT("data/game/san_andreas/text/american.gxt")
        VehicleElement.loadData("data/game/san_andreas")

        toggleAllControls(false, true, false)
        setElementFrozen(localPlayer, true)
        setElementPosition(localPlayer, 2078.7668457031, 1170.2449951172, 5.820312)
        setElementRotation(localPlayer, 0, 0, 61.895637512207)

        setPlayerHudComponentVisible("all", false)
        setCameraMatrix(2068.7668457031, 1170.2449951172, 22.820312, 2068.7668457031, 1170.2449951172, 22.820312)

        local dxStatus = dxGetStatus()
        local version = getVersion()

        systemInfo = {
            gpu = dxStatus.VideoCardName,
            videoRam = dxStatus.VideoCardRAM,
            ram = math.floor(dxStatus.TotalPhysicalMemory or -1),
            windowed = dxStatus.SettingWindowed,
            antiAliasing = dxStatus.SettingAntiAliasing,
            anisotropic = dxStatus.SettingAnisotropicFiltering,
            aspectRatio = dxStatus.SettingAspectRatio,
            drawDistance = dxStatus.SettingDrawDistance,
            version = version.sortable,
            tag = version.tag,
            netcode = version.netcode,
            os = version.os,
        }

        setTimer(Benchmark.idleFrameRateTest, 1000, 1)
    end, 1100, 1)
end

function Benchmark.idleFrameRateTest()
    fadeCamera(true, 0)

    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 1,
        message = "Measuring idle framerate",
        subMessage = ""
    })

    setTime(0, 0)
    cycleStartTime = getTickCount()

    fps = 0
    nextTick = 0
    totalFPS = 0
    measurementsPassed = 0

    addEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)
    addEventHandler("onClientRender", root, Benchmark.cycleTime)

    setTimer(function()
        removeEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)
        removeEventHandler("onClientRender", root, Benchmark.cycleTime)

        benchmarkScores['idleInstructions'] = math.floor(totalFPS / measurementsPassed) * 80

        Benchmark.instructionsTest()
    end, 15000, 1)
end

function Benchmark.instructionsTest()
    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 0,
        message = "Preparing SCM instructions benchmark",
        subMessage = ""
    })

    setTimer(function()
        Script.load("assets/benchmark/blank.scm")
        Script.start()

        local scm = SCM:create({ 0xB6, 0x01, 0x01, 0x01, 0x00, 0x00, 0x00 })
        local stream = BitStream:create(scm, true)

        Script.setMainOffset(0)
        Script.setOptimizedScript(Optimizer.optimize(stream))

        local thread = Thread:create(0)
        local timer = false
        local totalInstructions = 0
        local totalTimesRun = 0

        thread:sleep(-1)

        removeEventHandler("onClientRender", getRootElement(resourceRoot), Thread.run)

        timer = setTimer(function()
            Overlay.triggerEvent("onBenchmarkStateChange", {
                state = 0,
                message = "Measuring SCM instructions per second",
                subMessage = (totalTimesRun > 0) and ("Average: "..math.floor(totalInstructions / totalTimesRun)) or ""
            })

            local startTime = getTickCount()

            while ((getTickCount() - startTime) < 1000) do
                thread:setPosition(0)
                Thread.currentThread = thread
                Script.nextOpcode()

                totalInstructions = totalInstructions + 1
            end

            totalTimesRun = totalTimesRun + 1

            local timerElapsed = false

            if (not isTimer(timer)) then
                timerElapsed = true
            else
                local _, timesLeft = getTimerDetails(timer)

                if (timesLeft <= 1) then
                    timerElapsed = true
                end
            end

            if (timerElapsed) then
                Script.stop()
                Thread.threadTable = false
                Thread.currentThread = nil

                addEventHandler("onClientRender", getRootElement(resourceRoot), Thread.run)

                benchmarkScores['scmInstructions'] = math.floor(totalInstructions / totalTimesRun) * 0.3

                Benchmark.copSceneTest()
            end
        end, 1000, 15)
    end, 1500, 1)
end

function Benchmark.copSceneTest()
    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 0,
        message = "Preparing cop scene benchmark",
        subMessage = ""
    })

    Thread.threadTable = false
    Thread.currentThread = nil

    local checkInitialRunning = false
    local startTime = getTickCount()

    checkInitialRunning = function()
        if (#Thread.getThreadsFromName('intro') == 0 or getPedOccupiedVehicle(localPlayer) == false) then
            if ((getTickCount() - startTime) > 10000) then
                Benchmark.error()
                return
            end

            setTimer(checkInitialRunning, 100, 1)
        else
            Overlay.triggerEvent("onBenchmarkStateChange", {
                state = 1,
                message = "Running cop scene benchmark",
                subMessage = ""
            })

            local vehicle = getPedOccupiedVehicle(localPlayer)

            for i=0, 5 do
                setVehicleDoorOpenRatio(vehicle, i, 0, 0)
            end

            Camera.fade(0, 0)

            fps = 0
            nextTick = 0
            totalFPS = 0
            measurementsPassed = 0

            addEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

            setSoundVolume(Loader.loadingScreenSound, 0.2)

            local finishTimerCheck = false
            startTime = getTickCount()

            finishTimerCheck = function()
                if (#Thread.getThreadsFromName('intro') == 0) then
                    Benchmark.cleanup()
                    setSoundVolume(Loader.loadingScreenSound, 1)
                    removeEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

                    benchmarkScores['copScene'] = math.floor(totalFPS / measurementsPassed) * 110

                    Benchmark.vehicleCarrecBenchmarkTest()
                else
                    if ((getTickCount() - startTime) > 90000) then
                        Benchmark.error()
                        return
                    end

                    setTimer(finishTimerCheck, 100, 1)
                end
            end

            setTimer(finishTimerCheck, 100, 1)
        end
    end

    setTimer(function()
        Script.load("assets/benchmark/benchmark1.scm")
        Script.start()

        setTimer(checkInitialRunning, 100, 1)
    end, 200, 1)
end

function Benchmark.vehicleCarrecBenchmarkTest()
    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 0,
        message = "Preparing vehicle carrec benchmark",
        subMessage = ""
    })

    Thread.threadTable = false
    Thread.currentThread = nil

    local checkInitialRunning = false
    local startTime = getTickCount()

    checkInitialRunning = function()
        if (#Thread.getThreadsFromName('main') == 0) then
            if ((getTickCount() - startTime) > 10000) then
                Benchmark.error()
                return
            end

            setTimer(checkInitialRunning, 100, 1)
        else
            Overlay.triggerEvent("onBenchmarkStateChange", {
                state = 1,
                message = "Running vehicle carrec benchmark",
                subMessage = ""
            })

            fadeCamera(true, 0)

            fps = 0
            nextTick = 0
            totalFPS = 0
            measurementsPassed = 0

            addEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

            local finishTimerCheck = false
            startTime = getTickCount()

            finishTimerCheck = function()
                if (#Thread.getThreadsFromName('main') == 0) then
                    Benchmark.cleanup()
                    removeEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

                    benchmarkScores['vehicleCarrec'] = math.floor(totalFPS / measurementsPassed) * 100

                    Benchmark.threads10Test()
                else
                    if ((getTickCount() - startTime) > 20000) then
                        Benchmark.error()
                        return
                    end

                    setTimer(finishTimerCheck, 100, 1)
                end
            end

            setTimer(finishTimerCheck, 100, 1)
        end
    end

    setTimer(function()
        Script.load("assets/benchmark/benchmark2.scm")
        Script.start()

        setTimer(checkInitialRunning, 100, 1)
    end, 200, 1)
end

function Benchmark.threads10Test()
    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 0,
        message = "Preparing 10 threads benchmark",
        subMessage = ""
    })

    Thread.threadTable = false
    Thread.currentThread = nil

    local checkInitialRunning = false
    local startTime = false

    checkInitialRunning = function()
        if (#Thread.getThreadsFromName('main') == 0) then
            if ((getTickCount() - startTime) > 10000) then
                Benchmark.error()
                return
            end

            setTimer(checkInitialRunning, 100, 1)
        else
            Overlay.triggerEvent("onBenchmarkStateChange", {
                state = 0,
                message = "Running 10 threads benchmark",
                subMessage = ""
            })

            fps = 0
            nextTick = 0
            totalFPS = 0
            measurementsPassed = 0

            addEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

            local finishTimerCheck = false
            startTime = getTickCount()

            finishTimerCheck = function()
                if (((getTickCount() - startTime) > 15000) or #Thread.getThreadsFromName('main') == 0) then
                    Benchmark.cleanup()
                    removeEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

                    benchmarkScores['10Threads'] = math.floor(totalFPS / measurementsPassed) * 120

                    Benchmark.threads50Test()
                else
                    setTimer(finishTimerCheck, 100, 1)
                end
            end

            setTimer(finishTimerCheck, 100, 1)
        end
    end

    setTimer(function()
        Script.load("assets/benchmark/threads10benchmark.scm")
        Script.start()

        setTimer(checkInitialRunning, 100, 1)
    end, 200, 1)
end

function Benchmark.threads50Test()
    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 0,
        message = "Preparing 50 threads benchmark",
        subMessage = ""
    })

    Thread.threadTable = false
    Thread.currentThread = nil

    local checkInitialRunning = false
    local startTime = getTickCount()

    checkInitialRunning = function()
        if (#Thread.getThreadsFromName('main') == 0) then
            if ((getTickCount() - startTime) > 10000) then
                Benchmark.error()
                return
            end

            setTimer(checkInitialRunning, 100, 1)
        else
            Overlay.triggerEvent("onBenchmarkStateChange", {
                state = 0,
                message = "Running 50 threads benchmark",
                subMessage = ""
            })

            fps = 0
            nextTick = 0
            totalFPS = 0
            measurementsPassed = 0

            addEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

            local finishTimerCheck = false
            startTime = getTickCount()

            finishTimerCheck = function()
                if (((getTickCount() - startTime) > 15000) or #Thread.getThreadsFromName('main') == 0) then
                    Benchmark.cleanup()
                    removeEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

                    benchmarkScores['50Threads'] = math.floor(totalFPS / measurementsPassed) * 140

                    Benchmark.threads100Test()
                else
                    setTimer(finishTimerCheck, 100, 1)
                end
            end

            setTimer(finishTimerCheck, 100, 1)
        end
    end

    setTimer(function()
        Script.load("assets/benchmark/threads50benchmark.scm")
        Script.start()

        setTimer(checkInitialRunning, 100, 1)
    end, 200, 1)
end

function Benchmark.threads100Test()
    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 0,
        message = "Preparing 100 threads benchmark",
        subMessage = ""
    })

    Thread.threadTable = false
    Thread.currentThread = nil

    local checkInitialRunning = false
    local startTime = getTickCount()

    checkInitialRunning = function()
        if (#Thread.getThreadsFromName('main') == 0) then
            if ((getTickCount() - startTime) > 10000) then
                Benchmark.error()
                return
            end

            setTimer(checkInitialRunning, 100, 1)
        else
            Overlay.triggerEvent("onBenchmarkStateChange", {
                state = 0,
                message = "Running 100 threads benchmark",
                subMessage = ""
            })

            fps = 0
            nextTick = 0
            totalFPS = 0
            measurementsPassed = 0

            addEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

            local finishTimerCheck = false
            startTime = getTickCount()

            finishTimerCheck = function()
                if (((getTickCount() - startTime) > 15000) or #Thread.getThreadsFromName('main') == 0) then
                    Benchmark.cleanup()
                    removeEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

                    benchmarkScores['100Threads'] = math.floor(totalFPS / measurementsPassed) * 160

                    Benchmark.kickstartStadiumTest()
                else
                    setTimer(finishTimerCheck, 100, 1)
                end
            end

            setTimer(finishTimerCheck, 100, 1)
        end
    end

    setTimer(function()
        Script.load("assets/benchmark/threads100benchmark.scm")
        Script.start()

        setTimer(checkInitialRunning, 100, 1)
    end, 200, 1)
end

function Benchmark.kickstartStadiumTest()
    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 0,
        message = "Preparing kickstart stadium benchmark",
        subMessage = ""
    })

    Thread.threadTable = false
    Thread.currentThread = nil

    local checkInitialRunning = false
    local startTime = getTickCount()

    checkInitialRunning = function()
        if (#Thread.getThreadsFromName('kicksta') == 0) then
            if ((getTickCount() - startTime) > 10000) then
                Benchmark.error()
                return
            end

            setTimer(checkInitialRunning, 100, 1)
        else
            Overlay.triggerEvent("onBenchmarkStateChange", {
                state = 1,
                message = "Running kickstart stadium benchmark",
                subMessage = ""
            })

            fadeCamera(false, 0)
            toggleAllControls(false, true, false)

            fps = 0
            nextTick = 0
            totalFPS = 0
            measurementsPassed = 0

            addEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

            local finishTimerCheck = false
            startTime = getTickCount()

            finishTimerCheck = function()
                if (((getTickCount() - startTime) > 15000) or #Thread.getThreadsFromName('kicksta') == 0) then
                    Benchmark.cleanup()
                    removeEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

                    benchmarkScores['kickstartStadium'] = math.floor(totalFPS / measurementsPassed) * 200

                    Benchmark.vehiclePath1Test()
                else
                    setTimer(finishTimerCheck, 100, 1)
                end
            end

            setTimer(finishTimerCheck, 100, 1)
        end
    end

    setTimer(function()
        Script.load("assets/benchmark/benchmark3.scm")
        Script.start()

        setTimer(checkInitialRunning, 100, 1)
    end, 200, 1)
end

function Benchmark.vehiclePath1Test()
    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 0,
        message = "Preparing vehicle path finding benchmark 1/2",
        subMessage = "Screen may freeze for a moment during this benchmark!"
    })

    local car = VehicleElement:create(429)
    car:spawn(1227.2169189453, 1318.1877441406, 6.4178428649902, 359.99987792969, 359.73999023438, 0.0113525390625)

    local actor = ActorElement:create(0)
    actor:spawn(1227.2169189453, 1318.1877441406, 3.4178428649902)
    actor:warpIntoVehicle(car, 0)

    local runBenchmark = function()
        Overlay.triggerEvent("onBenchmarkStateChange", {
            state = 0,
            message = "Running vehicle path finding benchmark 1/2",
            subMessage = "Screen may freeze for a moment during this benchmark!"
        })

        setTimer(function()
            local startTime = getTickCount()

            for i=1, 100 do
                local task = TaskComplexCarDriveToPoint:create(actor, car, 1413.6956787109, 1870.3370361328, 10.351771354675, 30, 30, 0, 0)

                actor:addScriptedTask(task, 1, "TASK_PRIORITY_PRIMARY")
            end

            local timeTaken = getTickCount() - startTime

            setTimer(function()
                Benchmark.cleanup()

                if (timeTaken > 1000) then
                    timeTaken = 1000
                end

                benchmarkScores['vehiclePath1'] = (1000 - timeTaken) * 20

                Benchmark.vehiclePath2Test()
            end, 1000, 1)
        end, 1000, 1)
    end

    local attempts = 0
    local waitTimer = false

    waitTimer = function()
        if (not actor:isInVehicle()) then
            attempts = attempts + 1

            if (attempts <= 10) then
                setTimer(waitTimer, 1000, 1)
                return
            end

            Benchmark.error()
        else
            runBenchmark()
        end
    end

    setTimer(waitTimer, 1000, 1)
end

function Benchmark.vehiclePath2Test()
    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 0,
        message = "Preparing vehicle path finding benchmark 2/2",
        subMessage = ""
    })

    local cars = {}
    local actors = {}

    local vehicleModels = {
        429, 541, 415, 480, 562, 565, 434, 494, 502, 503, 411, 559, 561, 560, 506, 451, 558, 555, 477
    }

    for i=1, 60 do
        if ((i % 2) == 0) then
            cars[i] = VehicleElement:create(vehicleModels[(i % #vehicleModels) + 1])
            cars[i]:spawn(1227.2169189453, 1340 - (6 * (i - 1)), 6.4178428649902, 359.99987792969, 359.73999023438, 0.0113525390625)

            actors[i] = ActorElement:create(0)
            actors[i]:spawn(1227.2169189453, 1340 - (6 * (i - 1)), 3.4178428649902)
            actors[i]:warpIntoVehicle(cars[i], 0)
        else
            cars[i] = VehicleElement:create(vehicleModels[(i % #vehicleModels) + 1])
            cars[i]:spawn(1210.2169189453, 1380 - (6 * (i - 1)), 6.4178428649902, 359.99987792969, 359.73999023438, 180.0113525390625)

            actors[i] = ActorElement:create(0)
            actors[i]:spawn(1210.2169189453, 1380 - (6 * (i - 1)), 3.4178428649902)
            actors[i]:warpIntoVehicle(cars[i], 0)
        end
    end

    setTime(12, 0)
    setWeather(0)
    setCameraMatrix(1227.2169189453, 1280.1877441406, 20.4178428649902, 1227.2169189453, 1400.1877441406, 0.4178428649902)

    local runBenchmark = function()
        for i=1, 60 do
            if (i % 2 == 0) then
                local task = TaskComplexCarDriveToPoint:create(actors[i], cars[i], 1413.6956787109, 1870.3370361328, 10.351771354675, 30, 30, 0, 0)

                actors[i]:addScriptedTask(task, 1, "TASK_PRIORITY_PRIMARY")
            else
                local task = TaskComplexCarDriveToPoint:create(actors[i], cars[i], 1413.6956787109, -1870.3370361328, 10.351771354675, 30, 30, 0, 0)

                actors[i]:addScriptedTask(task, 1, "TASK_PRIORITY_PRIMARY")
            end
        end

        setTimer(function()
            Overlay.triggerEvent("onBenchmarkStateChange", {
                state = 1,
                message = "Running vehicle path finding benchmark 2/2",
                subMessage = ""
            })

            fps = 0
            nextTick = 0
            totalFPS = 0
            measurementsPassed = 0

            addEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

            fadeCamera(true, 0)

            setTimer(function()
                Benchmark.cleanup()
                removeEventHandler("onClientPreRender", root, Benchmark.measureFrameRate)

                benchmarkScores['vehiclePath2'] = math.floor(totalFPS / measurementsPassed) * 100

                Benchmark.finish()
            end, 15000, 1)
        end, 200, 1)
    end

    local attempts = 0
    local waitTimer = false

    waitTimer = function()
        for i=1, 60 do
            if (not actors[i]:isInVehicle()) then
                Logger.debug('BENCHMARK', 'Ped with ID {} is not in vehicle, waiting...', actors[i]:getId())

                attempts = attempts + 1

                if (attempts <= 10) then
                    setTimer(waitTimer, 1000, 1)
                    return
                end

                Benchmark.error()
                return
            end
        end

        runBenchmark()
    end

    setTimer(waitTimer, 1000, 1)
end

function Benchmark.finish()
    Benchmark.cleanup()

    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 0,
        message = "Recording benchmark results",
        subMessage = "Results will be available shortly"
    })

    local totalScore = 0

    for benchmark, score in pairs(benchmarkScores) do
        if (benchmark ~= 'overall') then
            totalScore = totalScore + score
        end
    end

    benchmarkScores['overall'] = totalScore

    triggerServerEvent("sphene:benchmark:record", resourceRoot, {systemInfo, benchmarkScores})
end

function Benchmark.onResultsRecorded()
    stopSound(Loader.loadingScreenSound)
    Overlay.showCursor()

    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 2,
        score = benchmarkScores.overall
    })
end

function Benchmark.onResultsRecordError()
    stopSound(Loader.loadingScreenSound)
    Overlay.showCursor()

    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 3,
        score = benchmarkScores.overall,
        message = "Something went wrong while recording your benchmark results"
    })
end

function Benchmark.fetchLeaderboard(hash, type, isLegacy)
    type = type or 'overall'
    isLegacy = isLegacy or false

    triggerServerEvent("sphene:benchmark:leaderboard:request", resourceRoot, hash, type, isLegacy)
end

function Benchmark.onLeaderboardReceived(hash, leaderboard)
    Overlay.triggerEvent("onBenchmarkLeaderboardDataReceived", hash, leaderboard)
end

function Benchmark.onLeaderboardError(hash, leaderboard)
    Overlay.triggerEvent("onBenchmarkLeaderboardDataReceived", hash, {})
end

function Benchmark.fetchHistory(hash, type)
    type = type or 'overall'

    triggerServerEvent("sphene:benchmark:history:request", resourceRoot, hash, type)
end

function Benchmark.onHistoryReceived(hash, history)
    Overlay.triggerEvent("onBenchmarkHistoryDataReceived", hash, history)
end

function Benchmark.onHistoryError(hash, history)
    Overlay.triggerEvent("onBenchmarkHistoryDataReceived", hash, {})
end

function Benchmark.error()
    Logger.error('BENCHMARK', 'Benchmark failed')

    Benchmark.cleanup()

    for i, timer in ipairs(getTimers()) do
        killTimer(timer)
    end

    if (Loader.loadingScreenSound) then
        stopSound(Loader.loadingScreenSound)
    end

    Overlay.showCursor()

    Overlay.triggerEvent("onBenchmarkStateChange", {
        state = 3,
        message = "Something went wrong while running the benchmark"
    })
end

function Benchmark.cleanup()
    Logger.info('BENCHMARK', 'Cleaning up benchmark')

    fadeCamera(false, 0)

    Thread.threadTable = false
    Thread.currentThread = nil

    Script.stop()
    Script.unload()

    Audio.cleanup()
    Text.cleanup()
    Camera.cleanup()

    for _, element in pairs(ActorElement.elementTable) do
        if (element:getType() ~= 'player') then
            element:destroy()
        end
    end

    for _, element in pairs(BlipElement.elementTable) do
        element:destroy()
    end

    for _, element in pairs(MarkerElement.elementTable) do
        element:destroy()
    end

    for _, element in pairs(ObjectElement.elementTable) do
        element:destroy()
    end

    for _, element in pairs(PickupElement.elementTable) do
        element:destroy()
    end

    for _, element in pairs(TrainElement.elementTable) do
        element:destroy()
    end

    for _, element in pairs(TrainCarriageElement.elementTable) do
        element:destroy()
    end

    for _, element in pairs(VehicleElement.elementTable) do
        element:destroy()
    end

    for carrecId, _ in pairs(Carrec.data) do
        Carrec.release(carrecId)
    end

    setElementInterior(localPlayer, 0)
    setCameraTarget(localPlayer)
end

function Benchmark.measureFrameRate(delta)
    local now = getTickCount()

    if (now >= nextTick) then
        fps = math.floor((1 / delta) * 1000)

        nextTick = now + 1000
        totalFPS = totalFPS + fps
        measurementsPassed = measurementsPassed + 1
    end

    local averageFPS = 0

    if (measurementsPassed > 0) then
        averageFPS = math.floor(totalFPS / measurementsPassed)
    end

    Overlay.triggerEvent("onBenchmarkStateChange", {
        subMessage = "FPS: "..fps.."\nAverage: "..averageFPS
    })

    setPlayerHudComponentVisible("all", false)
end

function Benchmark.cycleTime()
    local time = (getTickCount() - cycleStartTime) / 5000

    local hour = math.floor(time * 24)
    local minute = math.floor((time * 24 - hour) * 60)

    setTime(hour, minute)

    if ((getTickCount() - cycleStartTime) > 5000) then
        cycleStartTime = getTickCount()
    end
end

addEvent("sphene:benchmark:start", false)
addEventHandler("sphene:benchmark:start", root, function()
    Overlay.hideCursor()
    Loader.init(Core.game.SAN_ANDREAS)
end)

addEvent("sphene:benchmark:record:success", true)
addEventHandler("sphene:benchmark:record:success", root, Benchmark.onResultsRecorded)

addEvent("sphene:benchmark:record:error", true)
addEventHandler("sphene:benchmark:record:error", root, Benchmark.onResultsRecordError)

addEvent("sphene:benchmark:leaderboard:fetch", false)
addEventHandler("sphene:benchmark:leaderboard:fetch", root, Benchmark.fetchLeaderboard)

addEvent("sphene:benchmark:leaderboard:received", true)
addEventHandler("sphene:benchmark:leaderboard:received", root, Benchmark.onLeaderboardReceived)

addEvent("sphene:benchmark:leaderboard:error", true)
addEventHandler("sphene:benchmark:leaderboard:error", root, Benchmark.onLeaderboardError)

addEvent("sphene:benchmark:history:fetch", false)
addEventHandler("sphene:benchmark:history:fetch", root, Benchmark.fetchHistory)

addEvent("sphene:benchmark:history:received", true)
addEventHandler("sphene:benchmark:history:received", root, Benchmark.onHistoryReceived)

addEvent("sphene:benchmark:history:error", true)
addEventHandler("sphene:benchmark:history:error", root, Benchmark.onHistoryError)