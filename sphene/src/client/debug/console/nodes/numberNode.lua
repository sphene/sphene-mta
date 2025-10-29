-----------------------------------
-- * Variables
-----------------------------------

NumberNode = {}
NumberNode.__index = NumberNode

-----------------------------------
-- * Functions
-----------------------------------

function NumberNode:create(runtime, value, token)
    local mt = setmetatable({}, NumberNode)

    NumberNode.parent.create(mt, runtime, Node.NUMBER, tonumber(value), token)

    return mt
end

function NumberNode:toString()
    return "NumberNode\n    Value: "..tostring(self.value)
end

Core.mergeInto(NumberNode, Node)