-----------------------------------
-- * Variables
-----------------------------------

AssignmentNode = {}
AssignmentNode.__index = AssignmentNode

-----------------------------------
-- * Functions
-----------------------------------

function AssignmentNode:create(runtime, identifier, assignment, token)
    local mt = setmetatable({}, AssignmentNode)

    AssignmentNode.parent.create(mt, runtime, Node.ASSIGNMENT, nil, token)

    mt.identifier = identifier
    mt.assignment = assignment

    return mt
end

function AssignmentNode:execute()
    if (self.runtime:hasError()) then
        return
    end

    self.runtime:getProgramNode():setVariable(self.identifier:getValue(), self.assignment:execute())
end

function AssignmentNode:setIdentifier(identifier)
    self.identifier = identifier
end

function AssignmentNode:setAssignment(assignment)
    self.assignment = assignment
end

function AssignmentNode:getIdentifer()
    return self.identifier
end

function AssignmentNode:getAssignment()
    return self.assignment
end

function AssignmentNode:toString()
    local data = "AssignmentNode\n    Identifier: "..self.identifier:toString():gsub("\n", "\n    ")

    if (data:sub(-1) == "\n") then
        data = data:sub(1, -2)
    end

    if (self.assignment) then
        data =
            data.."\n    "
            ..self.assignment:toString():gsub("\n", "\n    ")
    end

    if (data:sub(-1) == "\n") then
        data = data:sub(1, -2)
    end

    return data
end

Core.mergeInto(AssignmentNode, Node)