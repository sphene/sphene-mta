-----------------------------------
-- * Variables
-----------------------------------

AbstractClass = {}
AbstractClass.__index = AbstractClass

AbstractClass.identifiers = {}

-----------------------------------
-- * Functions
-----------------------------------

function AbstractClass.create(runtime)
    local mt = setmetatable({}, AbstractClass)

    mt.runtime = runtime
    mt.properties = {}

    return mt.runtime:returnObject(mt)
end

function AbstractClass:__isOperand()
    return false
end

function AbstractClass:__isValidOperator(_)
    return false
end

function AbstractClass:__instanceof(object, class)
    if (object == nil) then
        return false
    end

    if (type(object) ~= "table") then
        return false
    end

    return object.__index == class
end

function AbstractClass:__add(runtime, node)
    if (node.nodeType == Node.OBJECT) then
        return Vector3Class.create(runtime, self.vector + node.object.vector)
    end

    return false
end

function AbstractClass:__tostring(_)
    return "Class<>"
end

function AbstractClass.__preinit(_)

end