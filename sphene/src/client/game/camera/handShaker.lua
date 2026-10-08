-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _math_abs = math.abs
local _math_floor = math.floor
local _math_random = math.random

-----------------------------------
-- * Variables
-----------------------------------

HandShaker = {}
HandShaker.__index = HandShaker

-- gHandShaker (0xB6ECA0)
HandShaker.PRESETS = {
    -- z angle limit, twitch frequency, twitch velocity
    [0] = { 0.01, 20, 0.001 },
    [1] = { 0.01, 15, 0.001 },
    [2] = { 0.04, 20, 0.001 },
    [3] = { 0.01, 10, 0.0005 },
    [4] = { 0.01, 20, 0.002 },
    [5] = { 0.01, 2, 0.003 }
}

-- Highest random acceleration per axis
HandShaker.MOTION = { 0.0002, 0.0002, 0.0001 }

HandShaker.PULL_MIN = 0.3
HandShaker.PULL_MAX = 1

HandShaker.OUTWARD_SCALE = { 1.3, 1.3, 1.4 }

HandShaker.STEP_PER_MS = 0.030000001

-- GTA's shakers are stateful and continue where they left off
HandShaker.shakers = {}

-----------------------------------
-- * Functions
-----------------------------------

function HandShaker.get(shakeType)
    local shaker = HandShaker.shakers[shakeType]

    if (not shaker) then
        local preset = HandShaker.PRESETS[shakeType]

        if (not preset) then
            return false
        end

        shaker = HandShaker:create(preset[1], preset[2], preset[3])
        HandShaker.shakers[shakeType] = shaker
    end

    return shaker
end

function HandShaker:create(limitZ, twitchFrequency, twitchVelocity)
    local mt = setmetatable({}, HandShaker)

    mt.angles = { 0, 0, 0 }
    mt.velocities = { 0, 0, 0 }
    mt.limits = { 0.02, 0.02, limitZ }
    mt.twitchFrequency = twitchFrequency
    mt.twitchVelocity = twitchVelocity

    for axis = 1, 3 do
        mt.velocities[axis] = _math_random() * HandShaker.MOTION[axis]
    end

    return mt
end

function HandShaker:process(frameMs)
    local angles, velocities, limits = self.angles, self.velocities, self.limits

    for axis = 1, 3 do
        -- Angles never pass their limits, so this stays between MIN and MAX
        local pull = lerp(HandShaker.PULL_MIN, HandShaker.PULL_MAX, _math_abs(angles[axis] / limits[axis]))

        if ((angles[axis] > 0 and velocities[axis] > 0) or (angles[axis] < 0 and velocities[axis] < 0)) then
            pull = pull * HandShaker.OUTWARD_SCALE[axis]
        end

        local acceleration = _math_random() * HandShaker.MOTION[axis] * pull

        if (angles[axis] > 0) then
            acceleration = -acceleration
        end

        velocities[axis] = velocities[axis] + acceleration
    end

    local step = frameMs * HandShaker.STEP_PER_MS
    local twitchRange = _math_floor(self.twitchFrequency * step)

    if (_math_floor(_math_random() * (twitchRange - 1)) == 1) then
        for axis = 1, 3 do
            velocities[axis] = velocities[axis] + (_math_random() * 2 - 1) * self.twitchVelocity
        end
    end

    for axis = 1, 3 do
        local angle = angles[axis] + step * velocities[axis]

        if (angle > limits[axis]) then
            angle = limits[axis]
        elseif (angle < -limits[axis]) then
            angle = -limits[axis]
        end

        angles[axis] = angle
    end
end

function HandShaker:getRotation(intensity)
    local angles = self.angles

    return intensity * angles[1], intensity * angles[2], intensity * angles[3]
end
