-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _math_sqrt = math.sqrt
local _setmetatable = setmetatable

-----------------------------------
-- * Variables
-----------------------------------

RwVector3 = {}
RwVector3.__index = RwVector3

-----------------------------------
-- * Functions
-----------------------------------

function RwVector3:create(x, y, z)
    return _setmetatable({ x = x or 0, y = y or 0, z = z or 0 }, RwVector3)
end

function RwVector3:fromTable(values)
    return RwVector3:create(values[1], values[2], values[3])
end

function RwVector3:unpack()
    return self.x, self.y, self.z
end

function RwVector3:getLength()
    return _math_sqrt(self.x * self.x + self.y * self.y + self.z * self.z)
end

function RwVector3:dot(other)
    return self.x * other.x + self.y * other.y + self.z * other.z
end

function RwVector3:cross(other)
    return RwVector3:create(
        self.y * other.z - self.z * other.y,
        self.z * other.x - self.x * other.z,
        self.x * other.y - self.y * other.x
    )
end

function RwVector3:getNormalised()
    local length = self:getLength()

    if (length > 0) then
        return self / length
    end

    -- Unlike MTA, a zero vector returns (1, Y, Z)
    return RwVector3:create(1, self.y, self.z)
end

function RwVector3.__add(a, b)
    return RwVector3:create(a.x + b.x, a.y + b.y, a.z + b.z)
end

function RwVector3.__sub(a, b)
    return RwVector3:create(a.x - b.x, a.y - b.y, a.z - b.z)
end

function RwVector3.__mul(a, b)
    if (type(a) == "number") then
        a, b = b, a
    end

    return RwVector3:create(a.x * b, a.y * b, a.z * b)
end

function RwVector3.__div(a, b)
    return RwVector3:create(a.x / b, a.y / b, a.z / b)
end

function RwVector3.__unm(a)
    return RwVector3:create(-a.x, -a.y, -a.z)
end

function RwVector3.__eq(a, b)
    return a.x == b.x and a.y == b.y and a.z == b.z
end
