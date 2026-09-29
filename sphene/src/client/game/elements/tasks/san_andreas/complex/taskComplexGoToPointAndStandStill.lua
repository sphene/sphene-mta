-----------------------------------
-- * Variables
-----------------------------------

TaskComplexGoToPointAndStandStill = {}
TaskComplexGoToPointAndStandStill.__index = TaskComplexGoToPointAndStandStill

TaskComplexGoToPointAndStandStill.TIME_UNLIMITED_STOP_ON_POINT = -2
TaskComplexGoToPointAndStandStill.TIME_DEFAULT = -1

TaskComplexGoToPointAndStandStill.DEFAULT_RADIUS = 0.5
TaskComplexGoToPointAndStandStill.DEFAULT_MOVE_STATE_RADIUS = 2.0
TaskComplexGoToPointAndStandStill.DEFAULT_TIME = 20000
TaskComplexGoToPointAndStandStill.RUN_RADIUS = 100000000.0
TaskComplexGoToPointAndStandStill.SPRINT_RADIUS = 10.0

TaskComplexGoToPointAndStandStill.STOP_ON_POINT_WALK_RADIUS = 0.5
TaskComplexGoToPointAndStandStill.STOP_ON_POINT_RUN_RADIUS = 1.0

TaskComplexGoToPointAndStandStill.STAND_STILL_TIME = 1
TaskComplexGoToPointAndStandStill.STAND_STILL_BLEND_DELTA = 8.0
TaskComplexGoToPointAndStandStill.STOP_ON_POINT_STAND_STILL_TIME = 2000
TaskComplexGoToPointAndStandStill.STOP_ON_POINT_MAX_BLEND_DELTA = 16.0

-----------------------------------
-- * Functions
-----------------------------------

function TaskComplexGoToPointAndStandStill:create(ped, x, y, z, moveState, time)
    local mt = setmetatable({}, TaskComplexGoToPointAndStandStill)

    mt.parent.create(mt, ped)

    mt.x = x
    mt.y = y
    mt.z = z
    mt.moveState = moveState or ActorElement.MoveState.WALK
    mt.time = time or TaskComplexGoToPointAndStandStill.TIME_UNLIMITED_STOP_ON_POINT

    mt.radius = TaskComplexGoToPointAndStandStill.DEFAULT_RADIUS
    mt.moveStateRadius = TaskComplexGoToPointAndStandStill.DEFAULT_MOVE_STATE_RADIUS
    mt.timeLimit = false

    if mt.time == TaskComplexGoToPointAndStandStill.TIME_UNLIMITED_STOP_ON_POINT then
        mt.moveStateRadius = 0
        local stopRadius = mt.moveState <= ActorElement.MoveState.WALK
            and TaskComplexGoToPointAndStandStill.STOP_ON_POINT_WALK_RADIUS
            or TaskComplexGoToPointAndStandStill.STOP_ON_POINT_RUN_RADIUS
        mt.radius = math.max(stopRadius, mt.radius)
    elseif mt.time == TaskComplexGoToPointAndStandStill.TIME_DEFAULT then
        mt.timeLimit = TaskComplexGoToPointAndStandStill.DEFAULT_TIME
    elseif mt.time >= 0 then
        mt.timeLimit = mt.time
    end

    mt.timerStartTick = false

    return mt
end

function TaskComplexGoToPointAndStandStill:createFirstSubTask()
    if self.timeLimit then
        self.timerStartTick = getTickCount()
    end

    if self:getPed():isInVehicle() then
        return TaskComplexLeaveCar:create(self:getPed(), false)
    end

    return self:createGoToPoint()
end

function TaskComplexGoToPointAndStandStill:createNextSubTask()
    local finishedSubTask = self:getSubTask()

    if finishedSubTask:is(TaskComplexLeaveCar) then
        if self:getPed():isInVehicle() then
            return false
        end
        return self:createGoToPoint()
    elseif finishedSubTask:is(TaskSimpleGoToPoint) then
        return self:createStandStill()
    end

    return false
end

function TaskComplexGoToPointAndStandStill:createGoToPoint()
    local goToPoint = TaskSimpleGoToPoint:create(self:getPed(), self.moveState, self.x, self.y, self.z, self.radius)

    self:selectMoveState(goToPoint)

    return goToPoint
end

function TaskComplexGoToPointAndStandStill:createStandStill()
    if self.time ~= TaskComplexGoToPointAndStandStill.TIME_UNLIMITED_STOP_ON_POINT then
        return TaskSimpleStandStill:create(
            self:getPed(),
            TaskComplexGoToPointAndStandStill.STAND_STILL_TIME,
            false,
            false,
            TaskComplexGoToPointAndStandStill.STAND_STILL_BLEND_DELTA
        )
    end

    local ped = self:getPed()
    local x, y, z = ped:getPosition()
    local forward = getElementMatrix(ped.element)[2]
    local distanceAhead = (self.x - x) * forward[1] + (self.y - y) * forward[2] + (self.z - z) * forward[3]

    local timeStep = Game.timeStep
    local velocityX, velocityY, velocityZ = ped:getVelocity()
    -- How far the ped moves forward this frame
    local forwardPerFrame = (velocityX * forward[1] + velocityY * forward[2] + velocityZ * forward[3]) * timeStep

    local blendDelta = TaskComplexGoToPointAndStandStill.STAND_STILL_BLEND_DELTA

    -- If ped is still moving, approximate how many frames left until he's on point and blend the stand still.
    -- The ped slows to half speed on average while the idle blends in, and 50.0 makes it per second (1/50 s steps).
    -- SA magic on CTaskComplexGoToPointAndStandStill::CreateSubTask (0x6682D0).
    if forwardPerFrame >= 0.01 then
        local maxBlendDelta = TaskComplexGoToPointAndStandStill.STOP_ON_POINT_MAX_BLEND_DELTA
        local framesLeft = distanceAhead / (forwardPerFrame * 0.5) - 1.0

        blendDelta = distanceAhead > 0.01 and math.min(50.0 / (framesLeft * timeStep), maxBlendDelta) or maxBlendDelta
    end

    return TaskSimpleStandStill:create(
        ped,
        TaskComplexGoToPointAndStandStill.STOP_ON_POINT_STAND_STILL_TIME,
        false,
        true,
        blendDelta
    )
end

function TaskComplexGoToPointAndStandStill:controlSubTask()
    local subTask = self:getSubTask()

    -- We're out of time, put the ped on the target (the go to point, then sees it arrived).
    if self.timerStartTick and getTickCount() - self.timerStartTick >= self.timeLimit
        and not subTask:is(TaskSimpleStandStill) and not self:getPed():isInVehicle()
    then
        self:placeOnTarget()
    end

    if subTask:is(TaskSimpleGoToPoint) then
        self:selectMoveState(subTask)
    end

    return subTask
end

-- CTaskComplexGoToPointAndStandStill::SelectMoveState
function TaskComplexGoToPointAndStandStill:selectMoveState(goToPoint)
    local sprintRadius

    if self.moveState == ActorElement.MoveState.RUN then
        sprintRadius = TaskComplexGoToPointAndStandStill.RUN_RADIUS
    elseif self.moveState == ActorElement.MoveState.SPRINT then
        sprintRadius = TaskComplexGoToPointAndStandStill.SPRINT_RADIUS
    else
        return
    end

    local x, y = self:getPed():getPosition()
    local dx, dy = x - goToPoint.x, y - goToPoint.y
    local distanceSquared = dx * dx + dy * dy

    if distanceSquared < self.moveStateRadius * self.moveStateRadius then
        goToPoint.moveState = ActorElement.MoveState.WALK
    elseif distanceSquared < sprintRadius * sprintRadius then
        goToPoint.moveState = ActorElement.MoveState.RUN
    else
        goToPoint.moveState = ActorElement.MoveState.SPRINT
    end
end

-- CPedPlacement::FindZCoorForPed
function TaskComplexGoToPointAndStandStill:placeOnTarget()
    local groundZ = -100.0

    -- Only way to make this readable... it shouldn't affect performance as it fires only
    -- when the timer runs out.
    for _, offset in ipairs({0.0, 0.1}) do
        local x, y = self.x + offset, self.y + offset
        local hit, _, _, hitZ = processLineOfSight(x, y, self.z + 0.5, x, y, self.z - 100.0, true, true, false, false, true, false, false)
        if hit and hitZ > groundZ then
            groundZ = hitZ
        end
    end

    if groundZ <= -99.0 then
        return
    end

    self.z = groundZ + 1.0

    -- No warp, SA doesn't touch ped's animations or tasks here.
    setElementPosition(self:getPed().element, self.x, self.y, self.z, false)
end

function TaskComplexGoToPointAndStandStill:getName()
    return "TASK_COMPLEX_GO_TO_POINT_AND_STAND_STILL"
end

function TaskComplexGoToPointAndStandStill:getDebugParameters()
    local ped = self:getPed()

    return {
        Ped = tostring(ped:getId() or 'UNKNOWN'),
        Position = string.format("x: %.2f, y: %.2f, z: %.2f", self.x, self.y, self.z),
        MoveState = tostring(self.moveState),
        Time = tostring(self.time),
        Distance = string.format("%.2f", ped:distanceTo(self.x, self.y, self.z))
    }
end

Task.register(0x05D3, TaskComplexGoToPointAndStandStill)

Core.mergeInto(TaskComplexGoToPointAndStandStill, ComplexTask)
