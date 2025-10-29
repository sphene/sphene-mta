-----------------------------------
-- * Variables
-----------------------------------

Compiler = {}
Compiler.__index = Compiler

-----------------------------------
-- * Functions
-----------------------------------

function Compiler.compile(runtime, code)
    local tokens = Lexer.tokenize(code)

    local parser = Parser:create(runtime, tokens)
    local success, program = pcall(parser.parse, parser)

    if (not success) then
        local errorMessage = program:sub(program:find(':') + 1)
        errorMessage = errorMessage:sub(errorMessage:find(':') + 2)

        Logger.info('CONSOLE COMPILER', 'Encountered parsing error: {}', errorMessage)

        return true, errorMessage
    end

    return false, program
end

-----------------------------------
-- * Events
-----------------------------------
