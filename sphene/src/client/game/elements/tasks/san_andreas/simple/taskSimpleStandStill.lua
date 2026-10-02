-----------------------------------
-- * Variables
-----------------------------------

TaskSimpleStandStill = {}
TaskSimpleStandStill.__index = TaskSimpleStandStill

-- With useAnimIdleStance the task ends once the idle anim is blended in this far
TaskSimpleStandStill.IDLE_BLENDED_IN = 0.99

-----------------------------------
-- * Functions
-----------------------------------

-- blendDelta: how fast the idle anim blends in, per second
function TaskSimpleStandStill:create(ped, time, looped, useAnimIdleStance, blendDelta)
    local mt = setmetatable({}, TaskSimpleStandStill)

    mt.parent.create(mt, ped)

    mt.time = time or 0
    mt.looped = looped == true
    mt.useAnimIdleStance = useAnimIdleStance == true
    mt.blendDelta = blendDelta or 8.0
    mt.startTick = false

    return mt
end

function TaskSimpleStandStill:process()
    local ped = self:getPed()
    local now = getTickCount()

    if not self:hasStarted() then
        self:setStarted()
        self.startTick = now
    end

    if not ped:isInVehicle() then
        ped:stopMoving()
    end

    local elapsed = now - self.startTick

    -- MTA can't read the idle anim's blend amount (getPedAnimation only covers setPedAnimation), so estimate when it gets there
    -- TODO: Add a getPedAnimationBlendAmount binding to MTA and check it against IDLE_BLENDED_IN like the game does
    if self.useAnimIdleStance and self.blendDelta > 0 and elapsed >= TaskSimpleStandStill.IDLE_BLENDED_IN / self.blendDelta * 1000 then
        return true
    end

    return not self.looped and elapsed >= self.time
end

function TaskSimpleStandStill:getName()
    return "TASK_SIMPLE_STAND_STILL"
end

function TaskSimpleStandStill:getDebugParameters()
    return {
        Time = tostring(self.time),
        Looped = tostring(self.looped),
        UseAnimIdleStance = tostring(self.useAnimIdleStance),
        BlendDelta = string.format("%.2f", self.blendDelta),
    }
end

Core.mergeInto(TaskSimpleStandStill, SimpleTask)
