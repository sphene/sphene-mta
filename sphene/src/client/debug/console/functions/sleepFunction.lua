-----------------------------------
-- * Variables
-----------------------------------

SleepFunction = {}
SleepFunction.__index = SleepFunction

-----------------------------------
-- * Functions
-----------------------------------

function SleepFunction.execute(_, timeInMs)
    local routine = coroutine.running()

    setTimer(function()
        coroutine.resume(routine)
    end, timeInMs, 1)

    coroutine.yield()
end

Core.mergeInto(SleepFunction, AbstractFunction)