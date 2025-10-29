-----------------------------------
-- * Variables
-----------------------------------

IdentifierNode = {}
IdentifierNode.__index = IdentifierNode

-----------------------------------
-- * Functions
-----------------------------------

function IdentifierNode:create(runtime, value, token)
    local mt = setmetatable({}, IdentifierNode)

    IdentifierNode.parent.create(mt, runtime, Node.IDENTIFIER, value, token)

    mt.child = nil

    return mt
end

function IdentifierNode:execute(identifier)
    if (self.runtime:hasError()) then
        return
    end

    if (type(identifier) == 'table' and (identifier.nodeType == Node.CLASS or identifier.nodeType == Node.OBJECT)) then
        identifier = identifier:resolve(self.value)
    else
        if (identifier ~= nil) then
            identifier = identifier[self.value]
        else
            identifier = self.runtime:getProgramNode():getIdentifier(self.value)
        end
    end

    if (self.child) then
        return self.child:execute(identifier)
    end

    return identifier
end

function IdentifierNode:setChild(node)
    self.child = node
end

function IdentifierNode:getChild()
    return self.child
end

function IdentifierNode:toString()
    local data = "IdentifierNode\n    Value: "..tostring(self.value)

    if (self.child) then
        data =
            data.."\n    Child: "
            ..self.child:toString():gsub("\n", "\n    ")
    end

    if (data:sub(-1) == "\n") then
        data = data:sub(1, -2)
    end

    return data
end

Core.mergeInto(IdentifierNode, Node)