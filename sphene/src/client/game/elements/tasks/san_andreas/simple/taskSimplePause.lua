-----------------------------------
-- * Variables
-----------------------------------

TaskSimplePause = {}
TaskSimplePause.__index = TaskSimplePause

-----------------------------------
-- * Functions
-----------------------------------

function TaskSimplePause:create(ped, time)
    local mt = setmetatable({}, TaskSimplePause)

    mt.parent.create(mt, ped)

    mt.time = time or 0
    mt.startTick = false

    return mt
end

function TaskSimplePause:process()
    local now = getTickCount()

    if not self:hasStarted() then
        self:setStarted()
        self.startTick = now
    end

    return now - self.startTick >= self.time
end

function TaskSimplePause:getName()
    return "TASK_SIMPLE_PAUSE"
end

function TaskSimplePause:getDebugParameters()
    return {
        Time = tostring(self.time),
        TimeLeft = tostring(
            self.startTick and math.max(0, self.time - (getTickCount() - self.startTick)) or self.time
        ),
    }
end

Core.mergeInto(TaskSimplePause, SimpleTask)
