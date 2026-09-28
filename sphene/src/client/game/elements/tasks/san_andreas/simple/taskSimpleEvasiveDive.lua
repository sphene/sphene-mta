-----------------------------------
-- * Variables
-----------------------------------

TaskSimpleEvasiveDive = {}
TaskSimpleEvasiveDive.__index = TaskSimpleEvasiveDive

TaskSimpleEvasiveDive.ANIM_BLOCK = "ped"
TaskSimpleEvasiveDive.ANIM_NAME = "EV_dive"

-- SA blends it in with a blend delta of 8.0 per second, MTA takes the blend time in ms
TaskSimpleEvasiveDive.BLEND_TIME = 1000 / 8.0

-----------------------------------
-- * Functions
-----------------------------------

function TaskSimpleEvasiveDive:create(ped)
    local mt = setmetatable({}, TaskSimpleEvasiveDive)

    mt.parent.create(mt, ped)

    return mt
end

function TaskSimpleEvasiveDive:process()
    local ped = self:getPed()

    if not self:hasStarted() then
        self:setStarted()

        ped:setAnimation(
            TaskSimpleEvasiveDive.ANIM_BLOCK,
            TaskSimpleEvasiveDive.ANIM_NAME,
            -1,     -- Infinite time
            false,  -- Not looped
            true,   -- Update position
            true,   -- Interruptable
            true,   -- Freeze last frame
            TaskSimpleEvasiveDive.BLEND_TIME
        )
    end

    -- If ped is not streamed in, mark task as finished.
    if not ped:isStreamedIn() then
        return true
    end

    return ped:getAnimationProgress() >= 1
end

function TaskSimpleEvasiveDive:getName()
    return "TASK_SIMPLE_EVASIVE_DIVE"
end

Core.mergeInto(TaskSimpleEvasiveDive, SimpleTask)
