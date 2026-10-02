-----------------------------------
-- * Variables
-----------------------------------

TaskSimpleGoToPoint = {}
TaskSimpleGoToPoint.__index = TaskSimpleGoToPoint

TaskSimpleGoToPoint.DEFAULT_RADIUS = 0.5
TaskSimpleGoToPoint.MAX_HEIGHT_DIFFERENCE = 2.0

TaskSimpleGoToPoint.PLAYER_MOVE_BLEND_RATIOS = {
    [ActorElement.MoveState.WALK] = 1.0,
    [ActorElement.MoveState.RUN] = 1.8,
    [ActorElement.MoveState.SPRINT] = 2.5,
}

TaskSimpleGoToPoint.STICK_UNITS_PER_BLEND = 60

-----------------------------------
-- * Functions
-----------------------------------

function TaskSimpleGoToPoint:create(ped, moveState, x, y, z, radius)
    local mt = setmetatable({}, TaskSimpleGoToPoint)

    mt.parent.create(mt, ped)

    mt.moveState = moveState
    mt.x = x
    mt.y = y
    mt.z = z
    mt.radius = radius or TaskSimpleGoToPoint.DEFAULT_RADIUS

    mt.circled = {}

    return mt
end

function TaskSimpleGoToPoint:process()
    if not self:hasStarted() then
        self:setStarted()
    end

    local ped = self:getPed()
    local x, y, z = ped:getPosition()

    -- Original GTA checks if ped has "circled" the target.
    if self:hasCircledTarget(x, y, z) then
        return true
    end

    -- NOTE: GTA doesn't move the ped on its first frame out of a car (PED_HAS_JUST_LEFT_CAR).
    -- This isn't implemented yet.

    local dx, dy = self.x - x, self.y - y
    local distanceSquared = dx * dx + dy * dy
    local heightReached = math.abs(z - self.z) < TaskSimpleGoToPoint.MAX_HEIGHT_DIFFERENCE

    -- Is the target still ahead after this frame's move?
    local velocityX, velocityY = ped:getVelocity()
    local nextX, nextY = x + velocityX * Game.timeStep, y + velocityY * Game.timeStep
    local stillAhead = dy * (self.y - nextY) + dx * (self.x - nextX) > 0

    if (distanceSquared >= self.radius * self.radius or not heightReached) and stillAhead then
        self:steer(dx, dy, math.sqrt(distanceSquared))
        return false
    end

    return true
end

function TaskSimpleGoToPoint:makeAbortable(priority)
    local ped = self:getPed()

    if
        priority ~= Task.ABORT_PRIORITY_IMMEDIATE
        and (isPedDoingTask(ped.element, "TASK_SIMPLE_FALL") or isPedDoingTask(ped.element, "TASK_SIMPLE_CLIMB"))
    then
        return false
    end

    if not ped:isInVehicle() then
        ped:stopMoving()
    end

    return true
end

function TaskSimpleGoToPoint:hasCircledTarget(x, y, z)
    if math.abs(z - self.z) >= TaskSimpleGoToPoint.MAX_HEIGHT_DIFFERENCE then
        return false
    end

    local circled = self.circled

    circled.lessX = circled.lessX or x < self.x
    circled.moreX = circled.moreX or x > self.x
    circled.lessY = circled.lessY or y < self.y
    circled.moreY = circled.moreY or y > self.y

    return circled.lessX and circled.moreX and circled.lessY and circled.moreY
end

function TaskSimpleGoToPoint:steer(dx, dy, distance)
    local ped = self:getPed()

    -- Normalize vector, a zero vector becomes (1, 0)
    local dirX, dirY = 1, 0
    if distance > 0 then
        dirX, dirY = dx / distance, dy / distance
    end

    local heading = math.atan2(-dirX, dirY)

    -- Pointing the ped's camera at the target and pushing the stick straight ahead
    -- doesn't work and takes the camera matrix instead, so we're using the stick.
    -- setPedCameraRotation(ped.element, math.deg(-heading))

    local angle = heading + math.rad(getPedCameraRotation(ped.element))

    local stickLength, walk, sprint = self:getMoveControls()

    ped:setMoveStick(angle, stickLength)
    ped:setControlState("walk", walk)
    ped:setControlState("sprint", sprint)
end

function TaskSimpleGoToPoint:getMoveControls()
    local ped = self:getPed()
    local moveState = self.moveState

    if not ped:isPlayer() then
        if moveState < ActorElement.MoveState.WALK then
            return 0, false, false
        end
        return Pad.STICK_MAX,
            moveState == ActorElement.MoveState.WALK,
            moveState == ActorElement.MoveState.SPRINT
    end

    -- If player has control and task move state is SPRINT, then player decides
    -- whether the player runs or sprints, but the default state is RUN.
    if Pad.moveable and moveState == ActorElement.MoveState.SPRINT then
        moveState = ActorElement.MoveState.RUN
    end

    if moveState == ActorElement.MoveState.WALK then
        return Pad.STICK_MAX, true, false
    elseif moveState == ActorElement.MoveState.SPRINT then
        return Pad.STICK_MAX, false, true
    end

    local blendRatio = TaskSimpleGoToPoint.PLAYER_MOVE_BLEND_RATIOS[moveState] or 0
    return blendRatio * TaskSimpleGoToPoint.STICK_UNITS_PER_BLEND, false, false
end

function TaskSimpleGoToPoint:getName()
    return "TASK_SIMPLE_GO_TO_POINT"
end

function TaskSimpleGoToPoint:getDebugParameters()
    local ped = self:getPed()

    return {
        Ped = tostring(ped:getId() or 'UNKNOWN'),
        Position = string.format("x: %.2f, y: %.2f, z: %.2f", self.x, self.y, self.z),
        MoveState = tostring(self.moveState),
        Radius = string.format("%.2f", self.radius),
        Distance = string.format("%.2f", ped:distanceTo(self.x, self.y, self.z))
    }
end

Core.mergeInto(TaskSimpleGoToPoint, SimpleTask)
