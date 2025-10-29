-----------------------------------
-- * Variables
-----------------------------------

Lexer = {}
Lexer.__index = Lexer

-----------------------------------
-- * Functions
-----------------------------------

function Lexer.tokenize(code)
    local tokens = {}

    local i = 1
    local line = 1
    local column = 1

    local inString = false
    local inComment = false
    local inMultilineComment = false
    local escapeNext = false
    local stringQuote = ''
    local stringContent = ''

    while (i <= #code) do
        local character = code:sub(i, i)

        -- Ignore whitespace
        if (not inString and (character == ' ' or character == '\r' or character == '\t')) then
            -- Do nothing
        elseif (not inString and character == '\n') then
            line = line + 1
            column = 0
            inComment = false
        elseif (inMultilineComment and character == '*' and code:sub(i + 1, i + 1) == '/') then
            inMultilineComment = false
            i = i + 1
            column = column + 1
        elseif (inComment or inMultilineComment) then
            -- Do nothing
        elseif (not inString and not inComment and not inMultiComment and character == '/' and code:sub(i + 1, i + 1) == '/') then
            inComment = true
            i = i + 1
            column = column + 1
        elseif (not inString and not inComment and not inMultiComment and character == '/' and code:sub(i + 1, i + 1) == '*') then
            inMultilineComment = true
            i = i + 1
            column = column + 1
        elseif (character == '\\') then
            if (inString and not escapeNext) then
                escapeNext = true
            else
                tokens[#tokens + 1] = Token:create(Token.T_UNKNOWN, line, column, character)
            end
        elseif (character == '\'' or character == '"') then
            if (inString and not escapeNext and character == stringQuote) then
                inString = false
                stringQuote = ''
                tokens[#tokens + 1] = Token:create(Token.T_STRING, line, column, stringContent)
            else
                inString = true
                stringQuote = character
                escapeNext = false
                stringContent = ''
            end
        elseif (inString) then
            stringContent = stringContent..character
        elseif (string.lower(code:sub(i, i + 3)) == 'true') then
            tokens[#tokens + 1] = Token:create(Token.T_BOOLEAN, line, column, true)
            i = i + 3
            column = column + 3
        elseif (string.lower(code:sub(i, i + 4)) == 'false') then
            tokens[#tokens + 1] = Token:create(Token.T_BOOLEAN, line, column, false)
            i = i + 4
            column = column + 4
        elseif (character == '(') then
            tokens[#tokens + 1] = Token:create(Token.T_OPENING_PARANTHESES, line, column, character)
        elseif (character == ')') then
            tokens[#tokens + 1] = Token:create(Token.T_CLOSING_PARANTHESES, line, column, character)
        elseif (character == '.') then
            tokens[#tokens + 1] = Token:create(Token.T_DOT, line, column, character)
        elseif (character == ',') then
            tokens[#tokens + 1] = Token:create(Token.T_SEPARATOR, line, column, character)
        elseif (character == '=') then
            tokens[#tokens + 1] = Token:create(Token.T_EQUALS, line, column, character)
        elseif (character == '+') then
            tokens[#tokens + 1] = Token:create(Token.T_ADD, line, column, character)
        elseif (character == '-') then
            tokens[#tokens + 1] = Token:create(Token.T_SUBTRACT, line, column, character)
        elseif (character == '*') then
            tokens[#tokens + 1] = Token:create(Token.T_MULTIPLY, line, column, character)
        elseif (character == '/') then
            tokens[#tokens + 1] = Token:create(Token.T_DIVIDE, line, column, character)
        elseif (character == '%') then
            tokens[#tokens + 1] = Token:create(Token.T_MODULO, line, column, character)
        elseif (character == '^') then
            tokens[#tokens + 1] = Token:create(Token.T_POWER, line, column, character)
        elseif (character == '@') then
            local token = Token:create(Token.T_VARIABLE, line, column, '')
            local continue = true

            while (continue) do
               i = i + 1
               column = column + 1

                if (i <= #code) then
                    character = code:sub(i, i)

                    if (string.byte(character) >= 48 and string.byte(character) <= 57) then
                        token.value = token.value .. character
                    else
                        continue = false
                        i = i - 1
                        column = column - 1
                    end
                else
                    continue = false
                    i = i - 1
                    column = column - 1
                end
            end

            tokens[#tokens + 1] = token
        elseif (string.byte(character) >= 48 and string.byte(character) <= 57) then
            local token = Token:create(Token.T_NUMBER, line, column, character)
            local continue = true
            local isFloat = false

            while (continue) do
                i = i + 1
                column = column + 1

                if (i <= #code) then
                    character = code:sub(i, i)

                    if (string.byte(character) >= 48 and string.byte(character) <= 57) then
                        token.value = token.value .. character
                    elseif (character == '.') then
                        if (isFloat) then
                            continue = false
                            i = i - 1
                            column = column - 1
                        else
                            isFloat = true
                            token.value = token.value .. character
                        end
                    else
                        continue = false
                        i = i - 1
                        column = column - 1
                    end
                else
                    continue = false
                    i = i - 1
                    column = column - 1
                end
            end

            tokens[#tokens + 1] = token
        elseif (
            (string.byte(character) >= 65 and string.byte(character) <= 90) or
            (string.byte(character) >= 97 and string.byte(character) <= 122)
        ) then
            local token = Token:create(Token.T_IDENTIFIER, line, column, character)
            local continue = true

            while (continue) do
                i = i + 1
                column = column + 1

                if (i <= #code) then
                    character = code:sub(i, i)

                    if (
                        (string.byte(character) >= 48 and string.byte(character) <= 57) or
                        (string.byte(character) >= 65 and string.byte(character) <= 90) or
                        (string.byte(character) >= 97 and string.byte(character) <= 122) or
                        (character == '_') or (character == '-')
                    ) then
                        token.value = token.value .. character
                    else
                        continue = false
                        i = i - 1
                        column = column - 1
                    end
                else
                    continue = false
                    i = i - 1
                    column = column - 1
                end
            end

            tokens[#tokens + 1] = token
        else
            tokens[#tokens + 1] = Token:create(Token.T_UNKNOWN, line, column, character)
        end

        column = column + 1
        i = i + 1
    end

    if (inString) then
        error('Unterminated string literal')
    end

    if (inMultilineComment) then
        error('Unterminated multiline comment')
    end

    tokens[#tokens + 1] = Token:create(Token.T_EOF, line, column, '')

    return tokens
end

-----------------------------------
-- * Events
-----------------------------------
