-----------------------------------
-- * Variables
-----------------------------------

TaskSimpleDuck = {}
TaskSimpleDuck.__index = TaskSimpleDuck

-----------------------------------
-- * Functions
-----------------------------------

function TaskSimpleDuck:create(ped, timeInMs)
    local mt = setmetatable({}, TaskSimpleDuck)

    mt.parent.create(mt, ped)

    mt.timeInMs = timeInMs
    mt.endTime = 0

    return mt
end

function TaskSimpleDuck:process()
    if (not self:hasStarted()) then
        self.ped:setAnimation("ped", "duck_cower", self.timeInMs, false, true)
        self.endTime = getTickCount() + self.timeInMs

        self:setStarted()
    elseif (getTickCount() > self.endTime) then
        self:setFinished()

        local _, anim = self.ped:getAnimation()

        if (anim == "duck_cower") then
            self.ped:setAnimation()
        end
    end
end

function TaskSimpleDuck:getName()
    return "TASK_SIMPLE_DUCK"
end

Task.register(0x05C5, TaskSimpleCarDrive)

Core.mergeInto(TaskSimpleDuck, SimpleTask)
