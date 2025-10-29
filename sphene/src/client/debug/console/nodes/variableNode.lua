-----------------------------------
-- * Variables
-----------------------------------

VariableNode = {}
VariableNode.__index = VariableNode

-----------------------------------
-- * Functions
-----------------------------------

function VariableNode:create(runtime, value, token)
    local mt = setmetatable({}, VariableNode)

    IdentifierNode.parent.create(mt, runtime, Node.VariableNode, value, token)

    mt.child = nil

    return mt
end

function VariableNode:execute()
    if (self.runtime:hasError()) then
        return
    end

    local variable = self.runtime:getProgramNode():getVariable(self.value)

    if (self.child) then
        return self.child:execute(variable)
    end

    return variable
end

function VariableNode:setChild(node)
    self.child = node
end

function VariableNode:getChild()
    return self.child
end

function VariableNode:toString()
    local data = "VariableNode\n    Value: "..tostring(self.value)

    if (self.child) then
        data =
            data.."\n    "
            ..self.child:toString():gsub("\n", "\n    ")
    end

    if (data:sub(-1) == "\n") then
        data = data:sub(1, -2)
    end

    return data
end

Core.mergeInto(VariableNode, Node)