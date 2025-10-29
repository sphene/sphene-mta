-----------------------------------
-- * Variables
-----------------------------------

Opcode = {}
Opcode.__index = Opcode

GLOBAL_VAR = 0
LOCAL_VAR = 1

opcodeData = {}
opcodes = {}
opcodeExamples = {}

for i=1, 0xffff do
    opcodes[i] = function()
        return false
    end
end

-- Legacy, still in use for displaying example opcodes (to be changed soon)
-- Also, still in use by the optimizer.
function loadOpcodeTable(opcodeRefPath)
    Logger.info('OPCODE', 'Loading opcode data...')

    local sASCM = INI.parse(opcodeRefPath)

    if (not sASCM) then
        Logger.error('OPCODE', 'Failed to load in opcode data.')
        return
    end

    if (sASCM['OPCODES'] == nil) then
        Logger.error('OPCODE', 'Opcode data is missing!')
        return
    end

    local opcodeCount = 0

    for opcode,opcodeLine in pairs(sASCM['OPCODES']) do
        Loader.yieldIfRequired()

        local dataSpl = split(opcodeLine, ",")

        if (#dataSpl >= 2) then
            local example = ""

            for i=2, #dataSpl do
                example = dataSpl[i]..","
                Loader.yieldIfRequired()
            end

            opcodeData[tonumber("0x"..opcode)] = {
                ["parameterCount"] = tonumber(dataSpl[1]),
                ["example"] = example:gsub("^%s*(.-)%s*$", "%1")
            }
        end

        opcodeCount = opcodeCount + 1
    end

    Logger.info('OPCODE', 'Loaded {} opcodes.', opcodeCount)
end

function Opcode.register(opcode, func, example)
    opcodes[opcode] = func
    opcodeExamples[opcode] = example
end