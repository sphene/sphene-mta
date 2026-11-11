-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _math_cos = math.cos
local _math_floor = math.floor
local _math_sin = math.sin

-----------------------------------
-- * Variables
-----------------------------------

-- MTA has no shake, so we have to implement it ourselves
-- Do we need CameraShake object here? Is static class enough?
CameraShake = {}
CameraShake.__index = CameraShake

CameraShake.type = 1
CameraShake.intensity = 0
CameraShake.endTick = 0

CameraShake.base = false
CameraShake.applied = false

-----------------------------------
-- * Functions
-----------------------------------

function CameraShake.start(duration, shakeType, intensity)
    CameraShake.type = shakeType
    CameraShake.intensity = intensity
    CameraShake.endTick = getTickCount() + duration
end

function CameraShake.stop()
    CameraShake.endTick = 0
    CameraShake.remove()
end

function CameraShake.getCameraMatrix()
    return RwMatrix:fromElementMatrix(getElementMatrix(getCamera(), false))
end

function CameraShake.remove()
    local applied = CameraShake.applied

    CameraShake.applied = false

    -- TODO: Figure out how can we apply shakeness when camera has a target
    if (not applied or getCameraTarget()) then
        return
    end

    local matrix = CameraShake.getCameraMatrix()

    if (not matrix:hasSameRotation(applied)) then
        return
    end

    local base = CameraShake.base

    setElementMatrix(getCamera(), RwMatrix:create(base.right, base.forward, base.up, matrix.position):toElementMatrix())
end

-- The shake step of CCamera::Process (0x516560). Returns the right, front and up vector.
function CameraShake.getShakenAxes(shaker, intensity, baseFront)
    local rotX, rotY, rotZ = shaker:getRotation(intensity)
    local rotationMatrix = RwMatrix:fromRotation(rotX, rotY, rotZ)
    local rolledUp = RwVector3:create(_math_sin(rotZ), 0, _math_cos(rotZ))

    local front = rotationMatrix:multiply3x3(baseFront):getNormalised()
    local right = front:cross(rolledUp):getNormalised()
    local up = right:cross(front)

    -- Nudge front vector
    if (front.x == 0 and front.y == 0) then
        front = RwVector3:create(0.0001, 0.0001, front.z)
    end

    -- The game builds the axes a second time whether it nudged front or not
    right = front:cross(up):getNormalised()
    up = right:cross(front)

    return right, front, up
end

function CameraShake.process(timeSlice)
    if (getTickCount() > CameraShake.endTick) then
        CameraShake.remove()
        return
    end

    local shaker = HandShaker.get(CameraShake.type)

    if (not shaker) then
        return
    end

    shaker:process(_math_floor(timeSlice * getGameSpeed()))

    -- We can't rotate targeted cameras
    if (getCameraTarget()) then
        CameraShake.applied = false
        return
    end

    local matrix = CameraShake.getCameraMatrix()

    if (not CameraShake.applied or not matrix:hasSameRotation(CameraShake.applied)) then
        CameraShake.base = matrix
    end

    local right, front, up = CameraShake.getShakenAxes(shaker, CameraShake.intensity, CameraShake.base.forward)

    -- Unlike setCameraMatrix, this keeps the field of view
    setElementMatrix(getCamera(), RwMatrix:create(right, front, up, matrix.position):toElementMatrix())

    CameraShake.applied = CameraShake.getCameraMatrix()
end
