-----------------------------------
-- * Variables
-----------------------------------

Node = {}
Node.__index = Node

Node.PROGRAM = 1
Node.ASSIGNMENT = 2
Node.IDENTIFIER = 3
Node.NUMBER = 4
Node.BOOLEAN = 5
Node.STRING = 6
Node.CALL = 7
Node.VARIABLE = 8
Node.BINARY = 9
Node.UNARY = 10
Node.NAN = 11
Node.CLASS = 12
Node.OBJECT = 13

-----------------------------------
-- * Functions
-----------------------------------

function Node:create(runtime, nodeType, value, token)
    local mt = self or setmetatable({}, Node)

    mt.nodeType = nodeType
    mt.runtime = runtime
    mt.value = value
    mt.token = token

    return mt
end

function Node:execute()
    if (self.runtime:hasError()) then
        return
    end

    return self
end

function Node:isOperand()
    return false
end

function Node:setRuntime(runtime)
    self.runtime = runtime
end

function Node:getType()
    return self.nodeType
end

function Node:getValue()
    return self.value
end

function Node:getToken()
    return self.token
end

function Node:getRuntime()
    return self.runtime
end

function Node:getProgramNode()
    return self.runtime:getProgramNode()
end

function Node.toString()
    return "Node"
end