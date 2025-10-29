-----------------------------------
-- * Locals
-----------------------------------

local runtime = false

-----------------------------------
-- * Variables
-----------------------------------

Console = {}
Console.__index = Console

Console.localPlayerObject = false

-----------------------------------
-- * Functions
-----------------------------------

function Console.setup()
    runtime = Runtime:create()

    runtime:registerClass('Actor', ActorClass)
    runtime:registerClass('Vehicle', VehicleClass)
    runtime:registerClass('Train', TrainClass)
    runtime:registerClass('Blip', BlipClass)

    runtime:registerClass('Location', LocationClass)
    runtime:registerClass('ExternalScript', ExternalScriptClass)
    runtime:registerClass('Stat', StatClass)
    runtime:registerClass('IPL', IPLClass)

    runtime:registerFunction('sleep', SleepFunction)
    runtime:registerFunction('assertLoaded', AssertLoadedFunction)
    runtime:registerFunction('assertNotLoaded', AssertNotLoadedFunction)
    runtime:registerFunction('assertInside', AssertInsideFunction)

    local localPlayerCheck = false

    Console.localPlayerObject = false

    localPlayerCheck = function()
        if (PlayerElement) then
            local player = PlayerElement.getLocalPlayer()

            if (player) then
                Logger.info('CONSOLE', 'Local player initialized. Creating \'Me\' object.')
                Console.localPlayerObject = ActorClass.__createFromPlayer(runtime, player)
                runtime:registerObject('Me', Console.localPlayerObject)
                return
            end
        end

        setTimer(localPlayerCheck, 100, 1)
    end

    setTimer(localPlayerCheck, 100, 1)
end

function Console.onDebugConsoleRun(hash, code)
    local routine = coroutine.create(function()
        local error, program = runtime:loadString(code)

        if (error) then
            Overlay.triggerEvent('onDebugConsoleCodeError', hash, program)
            return
        end

        if (Console.localPlayerObject) then
            Console.localPlayerObject.programNode = program
        end

        local runtimeError, output = runtime:run(program)

        if (runtimeError) then
            Overlay.triggerEvent('onDebugConsoleCodeError', hash, output)
            return
        end

        Overlay.triggerEvent('onDebugConsoleCodeExecuted', hash, output)
    end)

    coroutine.resume(routine)
end

-----------------------------------
-- * Events
-----------------------------------

addEvent('sphene:debug:console:run', true)
addEventHandler('sphene:debug:console:run', root, Console.onDebugConsoleRun)