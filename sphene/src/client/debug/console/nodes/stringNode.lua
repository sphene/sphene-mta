-----------------------------------
-- * Variables
-----------------------------------

StringNode = {}
StringNode.__index = StringNode

-----------------------------------
-- * Functions
-----------------------------------

function StringNode:create(runtime, value, token)
    local mt = setmetatable({}, StringNode)

    StringNode.parent.create(mt, runtime, Node.STRING, value, token)

    return mt
end

function StringNode:toString()
    return "StringNode\n    Value: "..tostring(self.value)
end

Core.mergeInto(StringNode, Node)