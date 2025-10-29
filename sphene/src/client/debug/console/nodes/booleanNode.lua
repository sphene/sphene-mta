-----------------------------------
-- * Variables
-----------------------------------

BooleanNode = {}
BooleanNode.__index = BooleanNode

-----------------------------------
-- * Functions
-----------------------------------

function BooleanNode:create(runtime, value, token)
    local mt = setmetatable({}, BooleanNode)

    BooleanNode.parent.create(mt, runtime, Node.BOOLEAN, value, token)

    return mt
end

function BooleanNode:toString()
    return "BooleanNode\n    Value: "..tostring(self.value)
end

Core.mergeInto(BooleanNode, Node)