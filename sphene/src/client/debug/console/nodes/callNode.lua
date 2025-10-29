-----------------------------------
-- * Variables
-----------------------------------

CallNode = {}
CallNode.__index = CallNode

-----------------------------------
-- * Functions
-----------------------------------

function CallNode:create(runtime, callee, token)
    local mt = setmetatable({}, CallNode)

    CallNode.parent.create(mt, runtime, Node.CALL, nil, token)

    mt.callee = callee
    mt.parameters = {}

    return mt
end

function CallNode:execute(identifier)
    if (self.runtime:hasError()) then
        return
    end

    local result

    local parameters = {}

    for i = 1, #self.parameters do
        local value = self.parameters[i]:execute()

        if (self.runtime:hasError()) then
            return
        end

        if (value.value == nil) then
            parameters[i] = value.object or value.class
        else
            parameters[i] = value.value
        end
    end

    if (type(identifier) == 'table' and (identifier.nodeType == Node.CLASS or identifier.nodeType == Node.OBJECT)) then
        result = identifier:execute(self.callee.value, unpack(parameters))
    else
        if (identifier ~= nil) then
            identifier = identifier[self.callee.value] or nil
        else
            identifier = self.runtime:getProgramNode():getIdentifier(self.callee.value)
        end

        if (type(identifier) ~= "table" or identifier.execute == nil) then
            if (identifier == nil) then
                return self.runtime:error("Tried to call '"..self.callee.value.."' but it's not defined")
            end

            return self.runtime:error("Tried to call '"..self.callee.value.."' but it's not a function")
        end

        result = identifier['execute'](self.runtime, unpack(parameters))

        if (self.runtime:hasError()) then
            return
        end
    end

    if (self.callee.child) then
        return self.callee.child:execute(result)
    end

    return result
end

function CallNode:setCallee(callee)
    self.callee = callee
end

function CallNode:addParameter(parameter)
    self.parameters[#self.parameters + 1] = parameter
end

function CallNode:getCallee()
    return self.callee
end

function CallNode:getParameters()
    return self.parameters
end

function CallNode:toString()
    local data = 'CallNode\n    Callee: '..self.callee:toString():gsub("\n", "\n    ")

    if (#self.parameters > 0) then
        data = data.."\n    Parameters: \n"
    end

    for i = 1, #self.parameters do
        data = data.."        "..self.parameters[i]:toString():gsub("\n", "\n        ").."\n"
    end

    if (data:sub(-1) == "\n") then
        data = data:sub(1, -2)
    end

    if (data:sub(-1) == "\n") then
        data = data:sub(1, -2)
    end

    return data
end

Core.mergeInto(CallNode, Node)