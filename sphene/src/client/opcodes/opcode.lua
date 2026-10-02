-----------------------------------
-- * Variables
-----------------------------------

Opcode = {}
Opcode.__index = Opcode

GLOBAL_VAR = 0
LOCAL_VAR = 1

opcodeData = {}
opcodes = {}

local NOP = function()
    return false
end

for i=1, 0xffff do
    opcodes[i] = NOP
    opcodeData[i] = {
        example = 'NOP',
        parameterCount = 0,
        parameters = {}
    }
end

function Opcode.register(opcode, func, parameterCount, example, parameters)
    opcodes[opcode] = func
    opcodeData[opcode] = {
        example = example,
        parameterCount = parameterCount,
        parameters = parameters or {}
    }
end

Opcode.register(0x0052, NOP, 6, 'NOP', {})
Opcode.register(0x018d, NOP, 5, 'NOP', {})
Opcode.register(0x018e, NOP, 1, 'NOP', {})
Opcode.register(0x0235, NOP, 3, 'NOP', {})
Opcode.register(0x0236, NOP, 2, 'NOP', {})
Opcode.register(0x02ec, NOP, 3, 'NOP', {})
Opcode.register(0x03a7, NOP, 1, 'NOP', {})
Opcode.register(0x03a8, NOP, 1, 'NOP', {})
Opcode.register(0x03aa, NOP, 3, 'NOP', {})
Opcode.register(0x03ad, NOP, 1, 'NOP', {})
Opcode.register(0x04e2, NOP, 2, 'NOP', {})
Opcode.register(0x0596, NOP, 1, 'NOP', {})
Opcode.register(0x05e9, NOP, 2, 'NOP', {})
Opcode.register(0x0636, NOP, 9, 'NOP', {})
Opcode.register(0x065D, NOP, 2, 'NOP', {})
Opcode.register(0x065E, NOP, 2, 'NOP', {})
Opcode.register(0x065F, NOP, 2, 'NOP', {})
Opcode.register(0x0660, NOP, 2, 'NOP', {})
Opcode.register(0x0661, NOP, 1, 'NOP', {})
Opcode.register(0x0662, NOP, 1, 'NOP', {})
Opcode.register(0x0663, NOP, 2, 'NOP', {})
Opcode.register(0x0664, NOP, 2, 'NOP', {})
Opcode.register(0x06aa, NOP, 1, 'NOP', {})
Opcode.register(0x06cf, NOP, 1, 'NOP', {})
Opcode.register(0x0735, NOP, 1, 'NOP', {})
Opcode.register(0x0736, NOP, 1, 'NOP', {})
Opcode.register(0x0752, NOP, 1, 'NOP', {})
Opcode.register(0x080b, NOP, 1, 'NOP', {})
Opcode.register(0x0868, NOP, 1, 'NOP', {})
Opcode.register(0x0869, NOP, 1, 'NOP', {})
Opcode.register(0x086b, NOP, 1, 'NOP', {})
Opcode.register(0x086c, NOP, 1, 'NOP', {})
Opcode.register(0x0914, NOP, 1, 'NOP', {})
Opcode.register(0x091a, NOP, 1, 'NOP', {})
Opcode.register(0x093e, NOP, 2, 'NOP', {})
Opcode.register(0x09d8, NOP, 1, 'NOP', {})