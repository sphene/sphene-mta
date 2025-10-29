-----------------------------------
-- * Variables
-----------------------------------

ObjectNode = {}
ObjectNode.__index = ObjectNode

-----------------------------------
-- * Functions
-----------------------------------

function ObjectNode:create(runtime, object)
    local mt = setmetatable({}, ObjectNode)

    ObjectNode.parent.create(mt, runtime, Node.OBJECT, nil)

    mt.object = object

    return mt
end

function ObjectNode:execute(call, ...)
    if (self.runtime:hasError()) then
        return
    end

    if (string.sub(call, 1, 2) == "__") then
        return self.runtime:error("Methods prefixed with __ are reserved calls")
    end

    if (self.object[call] == nil) then
        return self.runtime:error("Tried to call '"..call.."' but it's not defined")
    end

    return self.object[call](self.object, self.runtime, ...)
end

function ObjectNode:resolve(property)
    return self.object[self.object.properties[property]](self.object, self.runtime)
end

function ObjectNode:setObject(object)
    self.object = object
end

function ObjectNode:getObject()
    return self.object
end

Core.mergeInto(ObjectNode, Node)