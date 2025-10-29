-----------------------------------
-- * Variables
-----------------------------------

ClassNode = {}
ClassNode.__index = ClassNode

-----------------------------------
-- * Functions
-----------------------------------

function ClassNode:create(runtime, class)
    local mt = setmetatable({}, ClassNode)

    ClassNode.parent.create(mt, runtime, Node.CLASS, nil, nil)

    mt.class = class

    return mt
end

function ClassNode:execute(call, ...)
    if (self.runtime:hasError()) then
        return
    end

    if (string.sub(call, 1, 2) == "__") then
        return
    end

    return self.class[call](self.runtime, ...)
end

function ClassNode:resolve(call)
    if (string.sub(call, 1, 2) == "__") then
        return
    end

    return self.class.identifiers[call]
end

function ClassNode:setClass(class)
    self.class = class
end

function ClassNode:getClass()
    return self.class
end

Core.mergeInto(ClassNode, Node)