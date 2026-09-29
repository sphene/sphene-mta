-----------------------------------
-- * Variables
-----------------------------------

TaskComplexEvasiveDiveAndGetUp = {}
TaskComplexEvasiveDiveAndGetUp.__index = TaskComplexEvasiveDiveAndGetUp

-- EV_dive ends with the body turned 90 degrees from the first frame of getup_front,
-- SA turns the ped by this before getting up so the two line up.
TaskComplexEvasiveDiveAndGetUp.GET_UP_HEADING_OFFSET = -90

-----------------------------------
-- * Functions
-----------------------------------

function TaskComplexEvasiveDiveAndGetUp:create(ped, directionX, directionY, timeOnGround)
    local mt = setmetatable({}, TaskComplexEvasiveDiveAndGetUp)

    mt.parent.create(mt, ped)

    mt.directionX = directionX
    mt.directionY = directionY
    mt.timeOnGround = timeOnGround or 0

    return mt
end

function TaskComplexEvasiveDiveAndGetUp:createFirstSubTask()
    local ped = self:getPed()

    -- TODO: SA starts with TaskSimpleAchieveHeading to the direction.
    -- For now, we set the ped rotation instantly instead.
    local rotX, rotY = ped:getRotation()
    ped:setRotation(rotX, rotY, findRotation(0, 0, self.directionX, self.directionY))

    return TaskSimpleEvasiveDive:create(ped)
end

function TaskComplexEvasiveDiveAndGetUp:createNextSubTask()
    local ped = self:getPed()
    local finishedSubTask = self:getSubTask()

    if finishedSubTask:is(TaskSimpleEvasiveDive) then
        return TaskSimplePause:create(ped, self.timeOnGround)
    elseif finishedSubTask:is(TaskSimplePause) then
        local rotX, rotY, rotZ = ped:getRotation()
        ped:setRotation(rotX, rotY, rotZ + TaskComplexEvasiveDiveAndGetUp.GET_UP_HEADING_OFFSET)

        return TaskSimpleGetUp:create(ped, true)
    end

    return false
end

function TaskComplexEvasiveDiveAndGetUp:getName()
    return "TASK_COMPLEX_EVASIVE_DIVE_AND_GET_UP"
end

function TaskComplexEvasiveDiveAndGetUp:getDebugParameters()
    return {
        Direction = string.format("x: %.2f, y: %.2f", self.directionX, self.directionY),
        TimeOnGround = tostring(self.timeOnGround),
    }
end

Task.register(0x0673, TaskComplexEvasiveDiveAndGetUp)

Core.mergeInto(TaskComplexEvasiveDiveAndGetUp, ComplexTask)
