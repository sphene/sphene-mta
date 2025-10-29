-----------------------------------
-- * Variables
-----------------------------------

BinaryNode = {}
BinaryNode.__index = BinaryNode

-----------------------------------
-- * Functions
-----------------------------------

function BinaryNode:create(runtime, leftNode, rightNode, operator, token)
    local mt = setmetatable({}, BinaryNode)

    BinaryNode.parent.create(mt, runtime, Node.BINARY, nil, token)

    mt.operator = operator
    mt.leftNode = leftNode
    mt.rightNode = rightNode

    return mt
end

function BinaryNode:execute()
    if (self.runtime:hasError()) then
        return
    end

    local operator = self.operator
    local leftNode = self.leftNode
    local rightNode = self.rightNode

    if (leftNode.nodeType ~= Node.NUMBER and leftNode.nodeType ~= Node.STRING) then
        leftNode = self.leftNode:execute()

        if (self.runtime:hasError()) then
            return
        end
    end

    if (rightNode.nodeType ~= Node.NUMBER and rightNode.nodeType ~= Node.STRING) then
        rightNode = self.rightNode:execute()

        if (self.runtime:hasError()) then
            return
        end
    end

    if (leftNode.nodeType == Node.OBJECT) then
        if (operator == "+" and leftNode.object.__add) then
            return leftNode.object:__add(self.runtime, rightNode)
        elseif (operator == "-" and leftNode.object.__subtract) then
            return leftNode.object:__subtract(self.runtime, rightNode)
        elseif (operator == "*" and leftNode.object.__multiply) then
            return leftNode.object:__multiply(self.runtime, rightNode)
        elseif (operator == "/" and leftNode.object.__divide) then
            return leftNode.object:__divide(self.runtime, rightNode)
        elseif (operator == "%" and leftNode.object.__modulo) then
            return leftNode.object:__modulo(self.runtime, rightNode)
        elseif (operator == "^" and leftNode.object.__power) then
            return leftNode.object:__power(self.runtime, rightNode)
        end
    end

    if (rightNode.nodeType == Node.OBJECT) then
        if (operator == "+" and rightNode.object.__add) then
            return rightNode.object:__add(self.runtime, leftNode)
        elseif (operator == "-" and rightNode.object.__subtract) then
            return rightNode.object:__subtract(self.runtime, leftNode)
        elseif (operator == "*" and rightNode.object.__multiply) then
            return rightNode.object:__multiply(self.runtime, leftNode)
        elseif (operator == "/" and rightNode.object.__divide) then
            return rightNode.object:__divide(self.runtime, leftNode)
        elseif (operator == "%" and rightNode.object.__modulo) then
            return rightNode.object:__modulo(self.runtime, leftNode)
        elseif (operator == "^" and rightNode.object.__power) then
            return rightNode.object:__power(self.runtime, leftNode)
        end
    end

    if (operator == "+") then
        if (leftNode.nodeType == Node.STRING or rightNode.nodeType == Node.STRING) then
            return StringNode:create(self.runtime, tostring(leftNode.value)..tostring(rightNode.value))
        end

        return NumberNode:create(self.runtime, leftNode.value + rightNode.value)
    elseif (operator == "-") then
        return NumberNode:create(self.runtime, leftNode.value - rightNode.value)
    elseif (operator == "*") then
        return NumberNode:create(self.runtime, leftNode.value * rightNode.value)
    elseif (operator == "/") then
        return NumberNode:create(self.runtime, leftNode.value / rightNode.value)
    elseif (operator == "%") then
        return NumberNode:create(self.runtime, leftNode.value % rightNode.value)
    elseif (operator == "^") then
        return NumberNode:create(self.runtime, leftNode.value ^ rightNode.value)
    end
end

function BinaryNode:setLeft(node)
    self.leftNode = node
end

function BinaryNode:setRight(node)
    self.rightNode = node
end

function BinaryNode:isOperand()
    return true
end

function BinaryNode:toString()
    local data = "BinaryNode: \n"

    data = data.."    Left: "..self.leftNode:toString():gsub("\n", "\n    ").."\n    Operator: "..self.operator.."\n    Right: "..self.rightNode:toString():gsub("\n", "\n    ").."\n"

    if (data:sub(-1) == "\n") then
        data = data:sub(1, -2)
    end

    return data
end

Core.mergeInto(BinaryNode, Node)