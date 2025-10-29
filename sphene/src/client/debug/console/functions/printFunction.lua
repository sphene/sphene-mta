-----------------------------------
-- * Variables
-----------------------------------

PrintFunction = {}
PrintFunction.__index = PrintFunction

-----------------------------------
-- * Functions
-----------------------------------

function PrintFunction.execute(runtime, value)
    runtime:getProgramNode().output = runtime:getProgramNode().output..tostring(value)..'\n'
end

Core.mergeInto(PrintFunction, AbstractFunction)