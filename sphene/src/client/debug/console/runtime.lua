-----------------------------------
-- * Variables
-----------------------------------

Runtime = {}
Runtime.__index = Runtime

Runtime.IDENTIFIERS = {
    print = PrintFunction,
}

-----------------------------------
-- * Functions
-----------------------------------

function Runtime:create()
    local mt = setmetatable({}, Runtime)

    mt.variables = {}
    mt.identifiers = {}

    mt.programNode = nil

    for k, v in pairs(Runtime.IDENTIFIERS) do
        mt.identifiers[k] = v
    end

    for i=1, 32 do
        mt.variables[i] = nil
    end

    return mt
end

function Runtime:error(message)
    self.programNode.error = message
end

function Runtime:registerFunction(name, func)
    self.identifiers[name] = func
end

function Runtime:registerClass(name, class)
    self.identifiers[name] = ClassNode:create(self, class)
    class.__preinit(self)
end

function Runtime:registerObject(name, object)
    self.identifiers[name] = ObjectNode:create(self, object)
end

function Runtime:returnClass(class)
    return ClassNode:create(self, class)
end

function Runtime:returnObject(object)
    return ObjectNode:create(self, object)
end

function Runtime:returnNumber(number)
    return NumberNode:create(self, number)
end

function Runtime:returnBoolean(boolean)
    return BooleanNode:create(self, boolean)
end

function Runtime:returnString(string)
    return StringNode:create(self, string)
end

function Runtime:returnNaN()
    return NanNode:create(self)
end

function Runtime:run(programNode)
    self.programNode = programNode

    local error, result = programNode.execute(programNode)

    Logger.info('CONSOLE RUNTIME', 'Error state: {}, Result: {}', error, result or 'None')

    if (error) then
        return true, result
    end

    return false, programNode:getOutput()
end

function Runtime:getProgramNode()
    return self.programNode
end

function Runtime:getOutput()
    return self.programNode.output
end

function Runtime:hasError()
    return self.programNode:hasError()
end

function Runtime:loadString(string)
    local error, node = Compiler.compile(self, string)

    if (error) then
        return true, node
    end

    node:setRuntime(self)

    return false, node
end

-----------------------------------
-- * Events
-----------------------------------
