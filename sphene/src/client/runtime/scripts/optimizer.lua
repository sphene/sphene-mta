-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _firstSetup = false

-----------------------------------
-- * Variables
-----------------------------------

Optimizer = {}
Optimizer.__index = Optimizer

-----------------------------------
-- * Functions
-----------------------------------

function Optimizer.optimize(stream, optimizedScript, startOffset, endOffset)
    Logger.info('OPTIMIZER', 'Optimizing script...')

    local mainOffset = Script.getMainOffset()

    if (startOffset == nil) then
        stream:setPos(mainOffset)
    else
        stream:setPos(0)
    end

    optimizedScript = optimizedScript or {}
    startOffset = startOffset or 0

    local insideIf = false
    local ifStatementOpcodesHandled = 0
    local ifStatementOpcodes = 0
    local debugEnabled = (config('debug') == 1 or config('debug') == 'true')

    if (not _firstSetup) then
        for i=1, 0xFFFF do
            _G['opcode'..i] = opcodes[i]
            Loader.yieldIfRequired()
        end

        globalVars = Script.globalVars

        _firstSetup = true
    end

    if (stream:isEOF()) then
        Logger.error('OPTIMIZER', 'Stream is empty... can\'t optimize!')
        return false
    end

    Logger.info('OPTIMIZER', 'Pre-parsing script...')

    local scriptOffset = stream:getPos()

    while (not stream:isEOF()) do
        local offset = startOffset + (stream:getPos() - mainOffset)

        if endOffset ~= nil and offset > endOffset then
            break
        end

        optimizedScript[offset + 1] = {
            raw = stream:readByte(),
            nextOffset = offset + 1
        }

        Loader.yieldIfRequired()
    end

    Logger.info('OPTIMIZER', 'Parsing script...')

    stream:setPos(scriptOffset)

    while (not stream:isEOF()) do
        local offset = startOffset + (stream:getPos() - mainOffset)

        if (endOffset ~= nil and offset > endOffset) then
            break
        end

        local opcode = Optimizer.parseOpcode(stream)

        local debugParamsData = {}

        local prefix = ""
        local suffix = ""

        local parameters = ""
        local debugParameters = ""
        local assignment = false

        if(opcode and opcode.opcode) then
            opcode.raw = opcode.opcode

            if (ifStatementOpcodesHandled >= ifStatementOpcodes) then
                insideIf = false
                ifStatementOpcodesHandled = 0
                ifStatementOpcodes = 0
            end

            if (opcode.opcode == 0x00d6) then
                insideIf = true
                ifStatementOpcodes = 1

                local paramCount = opcode.params[1].value

                if (paramCount >= 1 and paramCount <= 7) then
                    ifStatementOpcodes = (paramCount + 1)
                elseif (paramCount >= 21 and paramCount <= 27) then
                    ifStatementOpcodes = ((paramCount - 20) + 1)
                end
            end

            for i=1, #opcode.params do
                local param = opcode.params[i]

                if (i > 1) then
                    parameters = parameters..", "
                    debugParameters = debugParameters..", "
                end

                if (type(param.value) == 'string') then
                    param.value = param.value:gsub('\\', '\\\\')
                    param.value = param.value:gsub('"', '\\"')
                end

                if (type(param.value) == "table" and param.value.pointer ~= nil) then
                    if ((param.value.type or -1) == 0) then
                        if (param.assignment) then
                            prefix = "globalVars["..param.value.pointer.."] = "
                            suffix = ""

                            assignment = "globalVars["..param.value.pointer.."]"

                            parameters = parameters.."{ value=globalVars["..param.value.pointer.."] or 0, pointer="..param.value.pointer..", type=0 }"
                            debugParameters = debugParameters.."globalVars["..param.value.pointer.."] or 0"
                        else
                            parameters = parameters.."globalVars["..param.value.pointer.."] or 0"
                            debugParameters = debugParameters.."globalVars["..param.value.pointer.."] or 0"
                        end
                    elseif ((param.value.type or -1) == 1) then
                        if (param.assignment) then
                            prefix = "Thread.currentThread:setLocalVar("..param.value.pointer..", "
                            suffix = ")"

                            assignment = "Thread.currentThread:getLocalVar("..param.value.pointer..")"

                            parameters = parameters.."{ value=Thread.currentThread:getLocalVar("..param.value.pointer.."), pointer="..param.value.pointer..", type=1 }"
                            debugParameters = debugParameters.."Thread.currentThread:getLocalVar("..param.value.pointer..")"
                        else
                            parameters = parameters.."Thread.currentThread:getLocalVar("..param.value.pointer..")"
                            debugParameters = debugParameters.."Thread.currentThread:getLocalVar("..param.value.pointer..")"
                        end
                    end
                elseif (type(param.value) == "table" and param.value.index ~= nil) then
                    local indexParam = ""

                    if (param.value.flags >= 0 and param.value.flags <= 0x3) then
                        if (param.value.flags == 0 or param.value.flags == 1) then
                            indexParam = "Thread.currentThread:getLocalVar("..param.value.index..")"
                        elseif (param.value.flags == 2) then
                            indexParam = "Thread.currentThread:getLocalVar("..param.value.index..") * 2"
                        elseif (param.value.flags == 3) then
                            indexParam = "Thread.currentThread:getLocalVar("..param.value.index..") * 4"
                        end
                    elseif (param.value.flags >= 0x80 and param.value.flags <= 0x83) then
                        if (param.value.flags == 0x80 or param.value.flags == 0x81) then
                            indexParam = "globalVars["..(param.value.index / 4).."] or 0"
                        elseif (param.value.flags == 0x82) then
                            indexParam = "(globalVars["..(param.value.index / 4).."] or 0) * 2"
                        elseif (param.value.flags == 0x83) then
                            indexParam = "(globalVars["..(param.value.index / 4).."] or 0) * 4"
                        end
                    else
                        indexParam = param.value.index
                    end

                    if ((param.value.type or -1) == 0) then
                        if (param.assignment) then
                            prefix = "globalVars["..(param.value.offset / 4).." + ("..indexParam..")] = "
                            suffix = ""

                            assignment = "globalVars["..(param.value.offset / 4).." + ("..indexParam..")]"

                            parameters = parameters.."{ value=globalVars["..(param.value.offset / 4).." + ("..indexParam..")] or 0, pointer=("..(param.value.offset / 4).." + ("..indexParam..")), type=0 }"
                            debugParameters = debugParameters.."globalVars["..(param.value.offset / 4).." + ("..indexParam..")] or 0"
                        else
                            parameters = parameters.."globalVars["..(param.value.offset / 4).." + ("..indexParam..")] or 0"
                            debugParameters = debugParameters.."globalVars["..(param.value.offset / 4).." + ("..indexParam..")] or 0"
                        end
                    elseif ((param.value.type or -1) == 1) then
                        if (param.assignment) then
                            prefix = "Thread.currentThread:setLocalVar("..param.value.offset.." + ("..indexParam.."), "
                            suffix = ")"

                            assignment = "Thread.currentThread:getLocalVar("..param.value.offset.." + ("..indexParam.."))"

                            parameters = parameters.."{ value=Thread.currentThread:getLocalVar("..param.value.offset.." + ("..indexParam..")), pointer=("..param.value.offset.." + ("..indexParam..")), type=1 }"
                            debugParameters = debugParameters.."Thread.currentThread:getLocalVar("..param.value.offset.." + ("..indexParam.."))"
                        else
                            parameters = parameters.."Thread.currentThread:getLocalVar("..param.value.offset.." + ("..indexParam.."))"
                            debugParameters = debugParameters.."Thread.currentThread:getLocalVar("..param.value.offset.." + ("..indexParam.."))"
                        end
                    end
                else
                    if (type(param.value) == "string") then
                        parameters = parameters..'"'..param.value..'"'
                        debugParameters = debugParameters..'"'..param.value..'"'
                    elseif (type(param.value) == "number") then
                        parameters = parameters..param.value
                        debugParameters = debugParameters..param.value
                    end
                end

                debugParamsData[i] = param
                opcode.params[i] = param.value
            end

            if (prefix == "" and not insideIf) then
                prefix = "return "
            end

            if (insideIf and opcode.opcode ~= 0x00d6) then
                ifStatementOpcodesHandled = ifStatementOpcodesHandled + 1

                if (assignment) then
                    suffix = suffix.. " Thread.currentThread.ifData[\"paramData\"]["..ifStatementOpcodesHandled.."] = ("..assignment.." > -1)"
                else
                    prefix = prefix.." Thread.currentThread.ifData[\"paramData\"]["..ifStatementOpcodesHandled.."] = "
                end
            end

            if (opcode.negated) then
                prefix = prefix.." not "
            end

            opcode.call, _error = loadstring(prefix.."opcode"..opcode.opcode.."("..parameters..")"..suffix)

            if (opcode.call == nil) then
                Logger.error('OPTIMIZER', 'Error: {}', _error)
                Logger.error('OPTIMIZER', '{}opcodes[{}]({}}){}', prefix, opcode.opcode, parameters, suffix)

                return false
            end

            if (debugEnabled) then
                opcode.debug = {
                    offset = offset,
                    actualOffset = offset + mainOffset,
                    example = opcodeData[opcode.opcode].example,
                    paramString = function()
                        return loadstring("return { "..debugParameters.." }")()
                    end,
                    paramsData = debugParamsData,
                }
            end

            opcode.nextOffset = startOffset + stream:getPos()
            optimizedScript[offset + 1] = opcode
        end

        Loader.yieldIfRequired()
    end

    Logger.info('OPTIMIZER', 'Optimization done!')

    return optimizedScript
end

function Optimizer.parseArray(stream, type)
    local offset = stream:readInt16(BitStream.LITTLE_ENDIAN)
    local index = stream:readInt16(BitStream.LITTLE_ENDIAN)
    local size = stream:readByte()
    local flags = stream:readByte()

    return {
        ["offset"] = offset,
        ["index"] = index,
        ["size"] = size,
        ["flags"] = flags,
        ["type"] = type
    }
end

local parameterParseLookupTable = {
    function(stream, index) return stream:readInt32(BitStream.LITTLE_ENDIAN), false end, -- Data type 1
    function(stream, index) -- Data type 2
        return {
            ["pointer"] = stream:readInt16(BitStream.LITTLE_ENDIAN) / 4,
            ["type"] = 0 -- Global var
        }
    end,
    function(stream, index) -- Data type 3
        return {
            ["pointer"] = stream:readInt16(BitStream.LITTLE_ENDIAN),
            ["type"] = 1 -- Local var
        }
    end,
    function(stream, index) return stream:readInt8(), false end, -- Data type 4
    function(stream, index) return stream:readInt16(BitStream.LITTLE_ENDIAN), false end, -- Data type 5
    function(stream, index) return stream:readFloat(), false end, -- Data type 6
    function(stream, index) -- Data type 7
        return Optimizer.parseArray(stream, 0) -- Global var
    end,
    function(stream, index) -- Data type 8
        return Optimizer.parseArray(stream, 1) -- Local var
    end,
    function(stream, index) return stream:readFixedString(8), false end, -- Data type 9,
    function(stream, index) -- Data type 10
        return  {
            ["pointer"] = stream:readInt16(BitStream.LITTLE_ENDIAN) / 4,
            ["type"] = 0 -- Global var
        }
    end,
    function(stream, index) -- Data type 11
        return {
            ["pointer"] = stream:readInt16(BitStream.LITTLE_ENDIAN),
            ["type"] = 1 -- Local var
        }
    end,
    function(stream, index) -- Data type 12
        return Optimizer.parseArray(stream, 0) -- Global var
    end,
    function(stream, index) -- Data type 13
        return Optimizer.parseArray(stream, 1) -- Local var
    end,
    function(stream, index) return stream:readFixedString(stream:readInt8()), false end, -- Data type 14
    function(stream, index) return stream:readFixedString(16), false end, -- Data type 15
    function(stream, index)
        return {
            ["pointer"] = stream:readInt16(BitStream.LITTLE_ENDIAN) / 4,
            ["type"] = 0 -- Global var
        }
    end, -- Data type 16
    function(stream, index)
        return {
            ["pointer"] = stream:readInt16(BitStream.LITTLE_ENDIAN),
            ["type"] = 1 -- Local var
        }
    end, -- Data type 17
    function(stream, index) -- Data type 18
        return Optimizer.parseArray(stream, 0) -- Global var
    end,
    function(stream, index) -- Data type 19
        return Optimizer.parseArray(stream, 1) -- Local var
    end,
    function(stream, index) return false end, -- Data type 20,
    function(stream, index) return false end, -- Data type 21,
    function(stream, index) return false end, -- Data type 22,
    function(stream, index) return false end, -- Data type 23,
    function(stream, index) return false end, -- Data type 24,
    function(stream, index) return false end, -- Data type 25,
    function(stream, index) return false end, -- Data type 26,
    function(stream, index) return false end, -- Data type 27,
    function(stream, index) return false end, -- Data type 28,
    function(stream, index) return false end, -- Data type 29,
    function(stream, index) return false end, -- Data type 30,
    function(stream, index)
        stream:setOffset(-1)
        return stream:readFixedString(8), false
    end, -- Data type 31
}

function Optimizer.parseParameter(stream, dataType)
    if (dataType > 31) then
        dataType = 31
    end

    if (parameterParseLookupTable[dataType] == nil) then
        return false
    end

    return parameterParseLookupTable[dataType](stream, index)
end

function Optimizer.parseOpcode(stream)
    local opcode = stream:readInt16(BitStream.LITTLE_ENDIAN)
    local params = {}

    local isNegated = false

    if (opcode > 0x7FFF) then
        isNegated = true
        opcode = opcode - 0x8000
    elseif (opcode < 0x0) then
        isNegated = true
        opcode = (opcode + 0xFFFF + 1) - 0x8000
    end

    if (opcodeData[opcode] ~= nil) then
        local example = opcodeData[opcode].example

        local resultIndex = example:match("^ *%%([0-9]+)[a-z]+%% */=")
            or example:match("^ *%%([0-9]+)[a-z]+%% *%+=")
            or example:match("^ *%%([0-9]+)[a-z]+%% *%-=")
            or example:match("^ *%%([0-9]+)[a-z]+%% *%*=")
            or example:match("^ *%%([0-9]+)[a-z]+%% *=[^=]")

        if (opcode == 0x07D3 or opcode == 0x0884) then
            resultIndex = nil
        end

        local parameterCount = opcodeData[opcode]["parameterCount"]

        if (parameterCount == -1) then
            local dataType = stream:readByte()

            local i = 1
            while (dataType ~= 0) do
                local param = Optimizer.parseParameter(stream, dataType)

                if (param == false) then
                    stream:setOffset(-1)
                    return false
                end

                params[#params + 1] = {
                    ["type"] = dataType,
                    ["value"] = param,
                    ['assignment'] = (resultIndex ~= nil and i == tonumber(resultIndex))
                }

                dataType = stream:readByte()
                i = i + 1

                Loader.yieldIfRequired()
            end
        elseif (parameterCount > 0) then
            for i=1,parameterCount do
                local dataType = stream:readByte()

                local param = Optimizer.parseParameter(stream, dataType)

                if (param == false) then
                    stream:setOffset(-1)
                    return false
                end

                params[#params + 1] = {
                    ["type"] = dataType,
                    ["value"] = param,
                    ['assignment'] = (resultIndex ~= nil and i == tonumber(resultIndex))
                }
            end
        end

        if (opcode == 0x05B6) then
            stream:readBytes(128)
        end
    else
        return false
    end

    return {
        ["opcode"] = opcode,
        ["params"] = params,
        ["negated"] = isNegated,
    }
end