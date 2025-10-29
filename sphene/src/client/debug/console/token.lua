-----------------------------------
-- * Variables
-----------------------------------

Token = {}
Token.__index = Token

Token.T_UNKNOWN = 1
Token.T_OPENING_PARANTHESES = 2
Token.T_CLOSING_PARANTHESES = 3
Token.T_STRING = 4
Token.T_NUMBER = 5
Token.T_BOOLEAN = 6
Token.T_DOT = 7
Token.T_EQUALS = 8
Token.T_ADD = 9
Token.T_SUBTRACT = 10
Token.T_MULTIPLY = 11
Token.T_DIVIDE = 12
Token.T_POWER = 13
Token.T_MODULO = 14
Token.T_SEPARATOR = 15
Token.T_IDENTIFIER = 16
Token.T_VARIABLE = 17
Token.T_EOF = 18

Token.TOKEN_NAMES = {
    [Token.T_UNKNOWN] = "T_UNKNOWN",
    [Token.T_OPENING_PARANTHESES] = "T_OPENING_PARANTHESES",
    [Token.T_CLOSING_PARANTHESES] = "T_CLOSING_PARANTHESES",
    [Token.T_STRING] = "T_STRING",
    [Token.T_NUMBER] = "T_NUMBER",
    [Token.T_BOOLEAN] = "T_BOOLEAN",
    [Token.T_DOT] = "T_DOT",
    [Token.T_EQUALS] = "T_EQUALS",
    [Token.T_ADD] = "T_ADD",
    [Token.T_SUBTRACT] = "T_SUBTRACT",
    [Token.T_MULTIPLY] = "T_MULTIPLY",
    [Token.T_DIVIDE] = "T_DIVIDE",
    [Token.T_POWER] = "T_POWER",
    [Token.T_MODULO] = "T_MODULO",
    [Token.T_SEPARATOR] = "T_SEPARATOR",
    [Token.T_IDENTIFIER] = "T_IDENTIFIER",
    [Token.T_VARIABLE] = "T_VARIABLE",
    [Token.T_EOF] = "T_EOF"
}

-----------------------------------
-- * Functions
-----------------------------------

function Token:create(type, line, column, value)
    mt = setmetatable({}, Token)

    mt.type = type
    mt.line = line
    mt.column = column
    mt.value = value

    return mt
end

function Token:getLine()
    return self.line
end

function Token:getColumn()
    return self.column
end

function Token:getType()
    return self.type
end

function Token:getValue()
    return self.value
end

function Token:toString()
    return string.format(
        "%s: Line: %d, Column: %d, Value: %s",
        Token.TOKEN_NAMES[self.type],
        self.line,
        self.column,
        tostring(self.value or '')
    )
end
