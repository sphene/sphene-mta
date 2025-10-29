-----------------------------------
-- * Variables
-----------------------------------

NanNode = {}
NanNode.__index = NanNode

-----------------------------------
-- * Functions
-----------------------------------

function NanNode:create(runtime)
    local mt = setmetatable({}, NanNode)

    NumberNode.parent.create(mt, runtime, Node.NAN)

    mt.value = 'NaN'

    return mt
end

function NanNode:toString()
    return "NanNode"
end

Core.mergeInto(NanNode, Node)