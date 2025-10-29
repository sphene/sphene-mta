-----------------------------------
-- * Variables
-----------------------------------

ProgramNode = {}
ProgramNode.__index = ProgramNode

ProgramNode.IDENTIFIERS = {
    print = PrintFunction,
}

-----------------------------------
-- * Functions
-----------------------------------

function ProgramNode:create(runtime)
    local mt = setmetatable({}, ProgramNode)

    ProgramNode.parent.create(mt, runtime, Node.PROGRAM)

    mt.children = {}
    mt.variables = {}
    mt.output = ""
    mt.error = ""

    for i=1, 32 do
        mt.variables[i] = nil
    end

    return mt
end

function ProgramNode:execute()
    local result = nil

    for i = 1, #self.children do
        if (self:hasError()) then
            break
        end

        result = self.children[i]:execute()
    end

    if (self:hasError()) then
        return true, self.error
    end

    return false, result
end

function ProgramNode:setVariable(index, value)
    index = tonumber(index)

    if (index < 1 or index > 32) then
        return self.runtime:error("Variable index out of bounds")
    end

    if (not self.runtime) then
        error("Runtime not set")
    end

    self.runtime.variables[index] = value or nil
end

function ProgramNode:addChild(node)
    self.children[#self.children + 1] = node
end

function ProgramNode:error(message)
    self.error = message
end

function ProgramNode:getChildren()
    return self.children
end

function ProgramNode:getIdentifier(identifier)
    if (not self.runtime) then
        error("Runtime not set")
    end

    return self.runtime.identifiers[identifier] or function() error("Unknown identifier: "..identifier) end
end

function ProgramNode:getOutput()
    return self.output
end

function ProgramNode:getVariable(index)
    index = tonumber(index)

    if (index < 1 or index > 32) then
        error("Variable index out of bounds")
    end

    if (not self.runtime) then
        error("Runtime not set")
    end

    return self.runtime.variables[index] or nil
end

function ProgramNode:hasError()
    return self.error ~= ""
end

function ProgramNode:toString()
    local data = "ProgramNode"

    if (#self.children > 0) then
        data = data.."\n"
    end

    for i = 1, #self.children do
        data = data.."    "..self.children[i]:toString():gsub("\n", "\n    ").."\n"
    end

    return data
end

Core.mergeInto(ProgramNode, Node)