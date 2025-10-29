-----------------------------------
-- * Variables
-----------------------------------

Vector3Class = {}
Vector3Class.__index = Vector3Class

-----------------------------------
-- * Functions
-----------------------------------

function Vector3Class.create(runtime, x, y, z)
    local mt = setmetatable({}, Vector3Class)

    if (type(x) == 'userdata') then
        mt.vector = x
    else
        mt.vector = Vector3(x, y, z)
    end

    mt.runtime = runtime

    mt.properties = {
        x = 'getX',
        y = 'getY',
        z = 'getZ'
    }

    return mt.runtime:returnObject(mt)
end

function Vector3Class:setX(_, x)
    self.vector.x = x
end

function Vector3Class:setY(_, y)
    self.vector.y = y
end

function Vector3Class:setZ(_, z)
    self.vector.z = z
end

function Vector3Class:getX(_)
    return self.runtime:returnNumber(self.vector.x)
end

function Vector3Class:getY(_)
    return self.runtime:returnNumber(self.vector.y)
end

function Vector3Class:getZ(_)
    return self.runtime:returnNumber(self.vector.z)
end

function Vector3Class:__add(runtime, node)
    if (node.nodeType == Node.OBJECT) then
        return Vector3Class.create(runtime, self.vector + node.object.vector)
    end

    return false
end

function Vector3Class:__multiply(runtime, node)
    if (node.nodeType == Node.NUMBER) then
        return Vector3Class.create(runtime, self.vector * node.value)
    elseif (node.nodeType == Node.OBJECT) then
        return Vector3Class.create(runtime, self.vector * node.object.vector)
    end

    return false
end

function Vector3Class:__tostring()
    return "Vector3<"..self:getX(self.runtime).value..", "..self:getY(self.runtime).value..", "..self:getZ(self.runtime).value..">"
end

Core.mergeInto(Vector3Class, AbstractClass)