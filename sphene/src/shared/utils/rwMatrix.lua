-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _math_cos = math.cos
local _math_sin = math.sin
local _setmetatable = setmetatable

-----------------------------------
-- * Variables
-----------------------------------

RwMatrix = {}
RwMatrix.__index = RwMatrix

-----------------------------------
-- * Functions
-----------------------------------

function RwMatrix:create(right, forward, up, position)
    local mt = _setmetatable({}, RwMatrix)

    mt.right = right or RwVector3:create(1, 0, 0)
    mt.forward = forward or RwVector3:create(0, 1, 0)
    mt.up = up or RwVector3:create(0, 0, 1)
    mt.position = position or RwVector3:create(0, 0, 0)

    return mt
end

function RwMatrix:fromRotation(x, y, z)
    local cosX, sinX = _math_cos(x), _math_sin(x)
    local cosY, sinY = _math_cos(y), _math_sin(y)
    local cosZ, sinZ = _math_cos(z), _math_sin(z)

    return RwMatrix:create(
        RwVector3:create(cosZ * cosY - sinZ * sinX * sinY, cosZ * sinX * sinY + sinZ * cosY, -sinY * cosX),
        RwVector3:create(-sinZ * cosX, cosZ * cosX, sinX),
        RwVector3:create(cosZ * sinY + sinZ * sinX * cosY, sinZ * sinY - cosZ * sinX * cosY, cosY * cosX)
    )
end

function RwMatrix:fromElementMatrix(rows)
    return RwMatrix:create(
        RwVector3:fromTable(rows[1]),
        RwVector3:fromTable(rows[2]),
        RwVector3:fromTable(rows[3]),
        RwVector3:fromTable(rows[4])
    )
end

function RwMatrix:toElementMatrix()
    local right, forward, up, position = self.right, self.forward, self.up, self.position

    return {
        { right.x, right.y, right.z, 0 },
        { forward.x, forward.y, forward.z, 0 },
        { up.x, up.y, up.z, 0 },
        { position.x, position.y, position.z, 1 }
    }
end

function RwMatrix:multiply3x3(vector)
    return RwVector3:create(self.right:dot(vector), self.forward:dot(vector), self.up:dot(vector))
end

function RwMatrix:hasSameRotation(other)
    return self.right == other.right and self.forward == other.forward and self.up == other.up
end
