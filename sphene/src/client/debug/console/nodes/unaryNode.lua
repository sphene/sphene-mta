-----------------------------------
-- * Variables
-----------------------------------

UnaryNode = {}
UnaryNode.__index = UnaryNode

-----------------------------------
-- * Functions
-----------------------------------

function UnaryNode:create(runtime, operator, attribute, token)
    local mt = setmetatable({}, UnaryNode)

    UnaryNode.parent.create(mt, runtime, Node.UNARY, nil, token)

    mt.operator = operator
    mt.attribute = attribute

    return mt
end

function UnaryNode:execute()
    if (self.runtime:hasError()) then
        return
    end

    if (self.operator == "-") then
        if (type(self.attribute.value) == "number") then
            self.attribute.value = -self.attribute.value
            return self.attribute
        else
            return self.runtime:error("Unary minus operator can only be applied to numbers")
        end
    elseif (self.operator == '+') then
        if (type(self.attribute.value) == "number") then
            return self.attribute
        else
            return self.runtime:error("Unary plus operator can only be applied to numbers")
        end
    else
        return self.runtime:error("Unknown unary operator: "..self.operator)
    end
end

function UnaryNode:setOperator(operator)
    self.operator = operator
end

function UnaryNode:setAttribute(attribute)
    self.attribute = attribute
end

function UnaryNode:getOperator()
    return self.operator
end

function UnaryNode:getAttribute()
    return self.attribute
end

function UnaryNode:toString()
    local data = "UnaryNode: \n"

    data = data.."    Operator: "..self.operator.."\n    Attribute: "..self.attribute:toString():gsub("\n", "\n    ").."\n"

    if (data:sub(-1) == "\n") then
        data = data:sub(1, -2)
    end

    return data
end

Core.mergeInto(UnaryNode, Node)