-----------------------------------
-- * Variables
-----------------------------------

Core = {}
Core.__index = Core

Core.game = {
    SAN_ANDREAS = "SAN_ANDREAS",
    VICE_CITY = "VICE_CITY"
}

Core.running = false

-----------------------------------
-- * Functions
-----------------------------------

function Core.load()
    fadeCamera(false, 0)
    setCameraTarget(localPlayer)
    setElementModel(localPlayer, 0)

    toggleAllControls(true)
    setPedControlState(localPlayer, "jump", false)
    setPedControlState(localPlayer, "fire", false)
    setPedControlState(localPlayer, "walk", false)
    setPedControlState(localPlayer, "sprint", false)
    setPedControlState(localPlayer, "forwards", false)

    setAnalogControlState("accelerate", 0)
    setAnalogControlState("vehicle_right", 0)
    setAnalogControlState("vehicle_left", 0)

    --setDevelopmentMode(true, true)
end

function Core.start(configOptions)
    Core.running = true

    showChat(false)

    Logger.info('CORE', 'Starting Sphene...')
    Overlay.start()

    loadConfig(configOptions)

    Discord.load()

    local checkOverlay = false

    if (config('debug') == 1 or config('debug') == 'true') then
        Debug.start()
    end

    checkOverlay = function()
        if (Overlay.isReady()) then
            Overlay.triggerEvent("onSpheneReady")

            triggerEvent("sphene:core:loaded", resourceRoot)

            if (config('mode') == 'benchmark') then
                Benchmark.load()
            elseif (config('mode') == 'sandbox') then
                Sandbox.load()
            else
                Loader.init(Core.game.SAN_ANDREAS)
            end
        else
            setTimer(checkOverlay, 100, 1)
        end
    end

    setFPSLimit(config('mode') == 'benchmark' and 100 or 50)

    setTimer(checkOverlay, 100, 1)
end

function Core.stop()
    Loader.cleanupLoader()

    if (not Core.running) then
        collectgarbage("collect")
        return
    end

    Logger.info('CORE', 'Stopping Sphene...')

    if (Game and Game.isRunning) then
        Game.stop()
    end

    if (Debug.isLoaded()) then
        Debug.stop()
    end

    Core.running = false

    collectgarbage("collect")
end

function Core.onLoadFinished()
    if (config('mode') == 'benchmark') then
        Benchmark.start()
    elseif (config('mode') == 'sandbox') then
        Sandbox.start()
    else
        Game.start(Loader.game)
    end
end

function Core.onCrash(message, file, line, loaderMessage)
    if Game == nil or not Game.isRunning and Loader.active then
        Loader.onCrash(loaderMessage)
    elseif Overlay and Game.isRunning then
        Overlay.triggerEvent("onError", "UNKNOWN_CODING_EXCEPTION", message)
    end

    Logger.error('CRASH', 'Crash detected: {} (file {} - line {})', message, file, line)

    if (Script and Thread.currentThread) then
        Logger.error('CRASH', 'Main thread position: {}', Thread.currentThread.position)
    end

    Core.stop()
end

function Core.mergeInto(mergeIntoClass, mergeFromClass)
    mergeIntoClass.parent = {}

    for key, value in pairs(mergeFromClass) do
        if (key ~= "__index" and key ~= "parent") then
            if (mergeIntoClass[key] ~= nil) then
                mergeIntoClass.parent[key] = value
            else
                mergeIntoClass[key] = value
            end
        end
    end
end

local _assert = assert

_G['assert'] = function(condition, message)
    if not condition then
        if Script then
            Script.panic(message)
        end
    end

    return _assert(condition, message)
end

local _enginePreloadWorldArea = enginePreloadWorldArea

function enginePreloadWorldArea(x, y, z)
    local cameraX, cameraY, cameraZ = getCameraMatrix()

    if (getDistanceBetweenPoints3D(x, y, z, cameraX, cameraY, cameraZ) > 100) then
        _enginePreloadWorldArea(x, y, z)
    end
end

function onClientDebugMessage(message, level, file, line)
    if (((Game == nil or Game.isRunning == false) and not Loader.active)) then
        return
    end

    if level == 2 and message == 'bad allocation' then
        Core.onCrash(message, file or 'UNKNOWN', line or 'UNKNOWN', 'Failed to generate file hash. Restart your game.')
        return
    end

    if level == 1 and message == 'not enough memory' then
        Core.onCrash(message, file or 'UNKNOWN', line or 'UNKNOWN', 'Out of memory! Restart your game.')
        return
    end

    if level ~= 1 then
        return
    end

    -- Sphene is never supposed to run with other resources!
    -- A basic check is in place nevertheless but errors without files in them will trip the crash check.
    -- @TODO: Add a environment variable to disable crashes on nil files
    if (file == nil or file:match("^"..getResourceName(resource)..".+")
        or file:match("^%[[a-zA-Z0-9%-_]+%]\\"..getResourceName(resource)..".+")) then
        Core.onCrash(message, file or 'UNKNOWN', line or 'UNKNOWN')
        Discord.setState('Crashed')
    end
end
addEventHandler("onClientDebugMessage", root, onClientDebugMessage)

-----------------------------------
-- * Events
-----------------------------------

addEvent("sphene:core:loaded", false)

addEventHandler("onClientResourceStart", resourceRoot, Core.load)
addEventHandler("onClientResourceStop", resourceRoot, Core.stop)

addEvent("sphene:core:start", true)
addEventHandler("sphene:core:start", resourceRoot, Core.start)

addEvent("sphene:quit", true)
addEventHandler("sphene:quit", resourceRoot, function()
    triggerServerEvent("sphene:quit", resourceRoot)
end)