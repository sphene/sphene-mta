-----------------------------------
-- * Variables
-----------------------------------

TaskSimpleGetUp = {}
TaskSimpleGetUp.__index = TaskSimpleGetUp

TaskSimpleGetUp.ANIM_BLOCK = "ped"
TaskSimpleGetUp.ANIM_NAME = "getup"
TaskSimpleGetUp.ANIM_NAME_FRONT = "getup_front"

-- SA blends it in with a blend delta of 1000.0 per second (instant), MTA takes the blend time in ms
TaskSimpleGetUp.BLEND_TIME = 1

-----------------------------------
-- * Functions
-----------------------------------

function TaskSimpleGetUp:create(ped, front)
    local mt = setmetatable({}, TaskSimpleGetUp)

    mt.parent.create(mt, ped)

    -- Animation depends on whether ped is on its back or front
    mt.anim = front and TaskSimpleGetUp.ANIM_NAME_FRONT or TaskSimpleGetUp.ANIM_NAME

    return mt
end

function TaskSimpleGetUp:process()
    local ped = self:getPed()

    if not self:hasStarted() then
        self:setStarted()

        ped:setAnimation(
            TaskSimpleGetUp.ANIM_BLOCK,
            self.anim,
            -1,     -- Infinite time
            false,  -- Not looped
            true,   -- Update position
            true,   -- Interruptable
            false,  -- Do not freeze last frame
            TaskSimpleGetUp.BLEND_TIME
        )
    end

    local _, anim = ped:getAnimation()

    -- If get up animation is still active, then task is not done yet.
    if anim == self.anim then
        return false
    end

    -- Clear Sphene animation on the ActorElement.
    -- TODO: We should probably do it automatically within Sphene.
    if ped:isPerformingAnimation(self.anim) then
        ped:setAnimation()
    end

    return true
end

function TaskSimpleGetUp:getName()
    return "TASK_SIMPLE_GET_UP"
end

Core.mergeInto(TaskSimpleGetUp, SimpleTask)
