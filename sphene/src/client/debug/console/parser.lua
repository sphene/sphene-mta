-----------------------------------
-- * Variables
-----------------------------------

Parser = {}
Parser.__index = Parser

-----------------------------------
-- * Functions
-----------------------------------

function Parser:create(runtime, tokens)
    mt = setmetatable({}, Parser)

    mt.runtime = runtime
    mt.program = false
    mt.position = 1
    mt.tokens = tokens
    mt.inMathLoop = false

    return mt
end

function Parser:parse()
    self.program = ProgramNode:create()

    while (self:current().type ~= Token.T_EOF) do
        Logger.debug('PARSER', 'parse: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))
        local current = self:current()

        if (current.type == Token.T_VARIABLE) then
            if (self:peek().type == Token.T_EQUALS) then
                self.program:addChild(self:parseAssignment())
            else
                self.program:addChild(self:parseExpression())
            end
        else
            self.program:addChild(self:parseExpression())
        end
    end

    return self.program
end

function Parser:parseExpression()
    Logger.debug('PARSER', 'parseExpression: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    self:expectAny(Token.T_OPENING_PARANTHESES, Token.T_IDENTIFIER, Token.T_VARIABLE, Token.T_NUMBER, Token.T_STRING, Token.T_BOOLEAN, Token.T_ADD, Token.T_SUBTRACT)

    local token = self:current()
    local tokenType = token.type

    local node = false

    if (tokenType == Token.T_OPENING_PARANTHESES and not self.inMathLoop) then
        Logger.debug('PARSER', 'Parse opening parantheses: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

        node = self:parseMathOperation()

        return node
    elseif (tokenType == Token.T_IDENTIFIER) then
        if (self:peek().type == Token.T_OPENING_PARANTHESES) then
            node = self:parseFunctionCall()
        else
            node = self:parseIdentifier()
        end
    elseif (tokenType == Token.T_VARIABLE) then
        node = self:parseVariable()
    elseif (tokenType == Token.T_NUMBER or tokenType == Token.T_STRING or tokenType == Token.T_BOOLEAN) then
        node = self:parseLiteral()
    elseif (tokenType == Token.T_ADD or tokenType == Token.T_SUBTRACT) then
        node = self:parseUnary()
    else
        self:syntaxError(nil, token)
    end

    if (not self.inMathLoop and
        (self:current().type == Token.T_ADD
        or self:current().type == Token.T_SUBTRACT
        or self:current().type == Token.T_MULTIPLY
        or self:current().type == Token.T_DIVIDE
        or self:current().type == Token.T_MODULO
        or self:current().type == Token.T_POWER)
    ) then
        node = self:parseMathOperation(node)
    end

    return node
end

function Parser:parseMathOperation(node)
    if (self.inMathLoop) then
        return
    end

    self:expectAny(Token.T_OPENING_PARANTHESES, Token.T_ADD, Token.T_SUBTRACT, Token.T_MULTIPLY, Token.T_DIVIDE, Token.T_MODULO, Token.T_POWER)

    Logger.debug('PARSER', 'parseMathOperation: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    local operators = {
        [Token.T_ADD] = 1,
        [Token.T_SUBTRACT] = 1,
        [Token.T_MULTIPLY] = 2,
        [Token.T_DIVIDE] = 2,
        [Token.T_MODULO] = 2,
        [Token.T_POWER] = 3,
    }

    local queue = {}
    local stack = {}

    table.insert(queue, node)

    -- Shunting-yard algorithm with parantheses and everything. We need a proper BinarNode tree in the end
    while (self:current().type == Token.T_ADD
        or self:current().type == Token.T_SUBTRACT
        or self:current().type == Token.T_MULTIPLY
        or self:current().type == Token.T_DIVIDE
        or self:current().type == Token.T_MODULO
        or self:current().type == Token.T_POWER
        or self:current().type == Token.T_OPENING_PARANTHESES
        or self:current().type == Token.T_CLOSING_PARANTHESES
    ) do
        self.inMathLoop = true
        local operator = self:current()

        if (operator.type == Token.T_OPENING_PARANTHESES) then
            table.insert(stack, operator)

            self:next()

            if (self:current().type ~= Token.T_OPENING_PARANTHESES and self:current().type ~= Token.T_CLOSING_PARANTHESES) then
                Logger.debug('PARSER', 'Math loop 1: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column)
                table.insert(queue, self:parseExpression())
            end
        elseif (operator.type == Token.T_CLOSING_PARANTHESES) then
            Logger.debug('PARSER', 'Math loop 2: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column)

            while (#stack > 0 and stack[#stack].type ~= Token.T_OPENING_PARANTHESES) do
                table.insert(queue, table.remove(stack))
            end

            if (#stack > 0) then
                self:next()
                table.remove(stack)
            else
                self.inMathLoop = false
                break
            end
        else
            if (operators[operator.type] ~= nil) then
                while (#stack > 0 and operators[stack[#stack].type] ~= nil and operators[stack[#stack].type] >= operators[operator.type]) do
                    table.insert(queue, table.remove(stack))
                end

                table.insert(stack, operator)
            end

            self:next()

            if (self:current().type ~= Token.T_OPENING_PARANTHESES and self:current().type ~= Token.T_CLOSING_PARANTHESES) then
                Logger.debug('PARSER', 'Math loop 3: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column)
                table.insert(queue, self:parseExpression())
            end
        end

        self.inMathLoop = false
    end

    Logger.debug('PARSER', 'After loop: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    while (#stack > 0) do
        local stackItem = table.remove(stack)

        if (stackItem.type == Token.T_OPENING_PARANTHESES) then
            self:syntaxError(Token.T_CLOSING_PARANTHESES, self:current())
        end

        table.insert(queue, stackItem)
    end

    -- Now we have a proper postfix notation, we can build the tree
    stack = {}

    for i=1, #queue do
        if (queue[i].type == Token.T_ADD
            or queue[i].type == Token.T_SUBTRACT
            or queue[i].type == Token.T_MULTIPLY
            or queue[i].type == Token.T_DIVIDE
            or queue[i].type == Token.T_MODULO
            or queue[i].type == Token.T_POWER
        ) then
            local right = table.remove(stack)
            local left = table.remove(stack)

            if (left.nodeType == Node.STRING and queue[i].type ~= Token.T_ADD) then
                self:syntaxError(Token.T_NUMBER, left.token)
            elseif (right.nodeType == Node.STRING and queue[i].type ~= Token.T_ADD) then
                self:syntaxError(Token.T_NUMBER, right.token)
            end

            table.insert(stack, BinaryNode:create(self.runtime, left, right, queue[i].value))
        else
            table.insert(stack, queue[i])
        end
    end

    node = table.remove(stack)

    Logger.debug('PARSER', 'ending math: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    return node
end

function Parser:parseAssignment()
    Logger.debug('PARSER', 'parseAssignment: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    local current = self:current()
    local node = false

    if (current.type == Token.T_VARIABLE) then
        node = self:parseVariable()
    else
        self:syntaxError(Token.T_VARIABLE, current)
    end

    self:expect(Token.T_EQUALS)
    self:next()

    local expression = self:parseExpression()

    return AssignmentNode:create(self.runtime, node, expression, current)
end

function Parser:parseVariable()
    Logger.debug('PARSER', 'parseVariable: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    self:expect(Token.T_VARIABLE)

    local token = self:current()
    local node = VariableNode:create(self.runtime, token.value, token)

    if (self:peek().type == Token.T_DOT) then
        self:next()
        self:next()

        if (self:peek().type == Token.T_OPENING_PARANTHESES) then
            node:setChild(self:parseFunctionCall())
        else
            node:setChild(self:parseIdentifier())
        end
    else
        self:next()
    end

    return node
end

function Parser:parseLiteral()
    Logger.debug('PARSER', 'parseLiteral: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    self:expectAny(Token.T_NUMBER, Token.T_STRING, Token.T_BOOLEAN)

    local token = self:current()
    local node = false

    if (token.type == Token.T_NUMBER) then
        node = NumberNode:create(self.runtime, token.value, token)
    elseif (token.type == Token.T_STRING) then
        node = StringNode:create(self.runtime, token.value, token)
    elseif (token.type == Token.T_BOOLEAN) then
        node = BooleanNode:create(self.runtime, token.value, token)
    end

    self:next()

    Logger.debug('PARSER', 'parseLiteral now: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    return node
end

function Parser:parseUnary()
    Logger.debug('PARSER', 'parseUnary: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    self:expectAny(Token.T_ADD, Token.T_SUBTRACT)

    local token = self:current()
    local node = false

    self:next()

    if (token.type == Token.T_ADD) then
        node = UnaryNode:create(self.runtime, '+', self:parseExpression(), token)
    elseif (token.type == Token.T_SUBTRACT) then
        node = UnaryNode:create(self.runtime, '-', self:parseExpression(), token)
    end

    return node
end

function Parser:parseIdentifier()
    Logger.debug('PARSER', 'parseIdentifier: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    self:expect(Token.T_IDENTIFIER)

    local token = self:current()
    local node = IdentifierNode:create(self.runtime, token.value, token)

    if (self:peek().type == Token.T_DOT) then
        self:next()
        self:next()

        if (self:peek().type == Token.T_OPENING_PARANTHESES) then
            node:setChild(self:parseFunctionCall())
        else
            node:setChild(self:parseIdentifier())
        end
    else
        self:next()
    end

    return node
end

function Parser:parseFunctionCall()
    Logger.debug('PARSER', 'parseFunctionCall: '..Token.TOKEN_NAMES[self:current().type].. ' at '..self:current().line..':'..self:current().column..' with value: '..tostring(self:current().value))

    self:expect(Token.T_IDENTIFIER)

    local token = self:current()
    local identifierNode = IdentifierNode:create(self.runtime, token.value, token)
    local callNode = CallNode:create(self.runtime, identifierNode, token)

    callNode:setCallee(identifierNode)

    self:next()
    self:expect(Token.T_OPENING_PARANTHESES)
    self:next()

    local firstElement = true

    while (self:current().type ~= Token.T_CLOSING_PARANTHESES) do
        if (not firstElement) then
            self:expect(Token.T_SEPARATOR)
            self:next()
        end

        firstElement = false

        local expressionNode = self:parseExpression()

        callNode:addParameter(expressionNode)

        self:expectAny(Token.T_CLOSING_PARANTHESES, Token.T_SEPARATOR)
    end

    if (self:peek().type == Token.T_DOT) then
        self:next()
        self:next()

        if (self:peek().type == Token.T_OPENING_PARANTHESES) then
            identifierNode:setChild(self:parseFunctionCall())
        else
            identifierNode:setChild(self:parseIdentifier())
        end
    else
        self:next()
    end

    return callNode
end

function Parser:current()
    if (#self.tokens < self.position) then
        return Token:create(self.runtime, Token.T_EOF, 0, 0, '')
    end

    return self.tokens[self.position]
end

function Parser:next(skip)
    for i=1, (skip or 1) do
        self.position = self.position + 1
    end

    return self:current()
end

function Parser:previous()
    self.position = self.position - 1

    return self:current()
end

function Parser:peek()
    if (#self.tokens < (self.position + 1)) then
        return Token:create(self.runtime, Token.T_EOF, 0, 0, '')
    end

    return self.tokens[self.position + 1]
end

function Parser:lookback()
    if (self.position <= 1) then
        return Token:create(self.runtime, Token.T_EOF, 0, 0, '')
    end

    return self.tokens[self.position - 1]
end

function Parser:expect(tokenType)
    local token = self:current()

    if (token.type ~= tokenType) then
        self:syntaxError(tokenType, token, 1)
    end
end

function Parser:expectAny(...)
    local token = self:current()
    local types = {...}

    for i=1, #types do
        if (token.type == types[i]) then
            return
        end
    end

    self:syntaxError(types[1], token, 1)
end

function Parser:expectNext(tokenType)
    local token = self:peek()

    if (token.type ~= tokenType) then
        self:syntaxError(tokenType, token, 1)
    end
end

function Parser:expectAnyNext(...)
    local token = self:peek()
    local types = {...}

    for i=1, #types do
        if (token.type == types[i]) then
            return
        end
    end

    self:syntaxError(types[1], token, 1)
end

function Parser:syntaxError(tokenType, token, offset)
    if (token == nil) then
        token = self:current()
    end

    if (tokenType) then
        error('Expected '..Token.TOKEN_NAMES[tokenType]..' but got '..Token.TOKEN_NAMES[token.type]..' at line '..token.line..', column '..token.column + 1, 2 + (offset or 0))
    end

    error('Unexpected '..Token.TOKEN_NAMES[token.type]..' at line '..token.line..', column '..token.column + 1, 2 + (offset or 0))
end

-----------------------------------
-- * Events
-----------------------------------
