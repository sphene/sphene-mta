-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _math_rad = math.rad
local _math_sin = math.sin

-----------------------------------
-- * Variables
-----------------------------------

CameraAnimation = {}
CameraAnimation.__index = CameraAnimation

-----------------------------------
-- * Functions
-----------------------------------

function CameraAnimation:create(startPoint, endPoint, ease, returnToStart, time)
    local mt = setmetatable({}, CameraAnimation)

    mt.startPoint = startPoint
    mt.endPoint = endPoint
    mt.ease = ease
    mt.returnToStart = returnToStart
    mt.startTick = getTickCount()
    mt.endTick = mt.startTick + time

    return mt
end

function CameraAnimation:isFinished()
    return getTickCount() > self.endTick
end

function CameraAnimation:getFinalPoint()
    if (self.returnToStart) then
        return self.startPoint
    end

    return self.endPoint
end

function CameraAnimation:getInterpolatedPoint()
    local progress = (getTickCount() - self.startTick) / (self.endTick - self.startTick)

    if (self.ease) then
        -- Replaced from InOutQuad to half sine wave, just as GTA
        progress = (_math_sin(_math_rad(270 - progress * 180)) + 1) * 0.5
    end

    return lerp(self.startPoint, self.endPoint, progress)
end
