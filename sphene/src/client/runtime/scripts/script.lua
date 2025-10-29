-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local scriptImgPath = ""
local stream = false
local mainSize = 0
local mainOffset = 0
local gameIdentifier = 0

--local streamedScriptsByName = {}
local streamedScriptsById = {}

local optimizedScript = {}

-----------------------------------
-- * Variables
-----------------------------------

Script = {}
Script.__index = Script

Script.scriptTable = false
Script.currentScript = nil

Script.GAME_SAN_ANDREAS = 0
Script.GAME_VICE_CITY = 1

Script.globalVars = setmetatable({}, {__len = function() return 10000 end})

Script.missionOffsets = {}

Script.objectsByName = {}
Script.objectsById = {}

-----------------------------------
-- * Functions
-----------------------------------

-- luacheck:ignore 211
function Script.load(path, imgPath)
    Logger.info('SCRIPT', 'Loading script [{}].', path)

    if (not fileExists(path)) then
        Logger.error('SCRIPT', 'Script \'{}\' could not be found.', path)
        return false
    end

    scriptImgPath = imgPath

    stream = BitStream:create(path, true)

    if (not stream) then
        return false
    end

    if (not Script.verifyPadding()) then
        return false
    end

    local offset = stream:readInt32(BitStream.LITTLE_ENDIAN)

    gameIdentifier = stream:readInt8()

    if (not stream:setPos(offset)) then
        return false
    end

    if (not Script.verifyPadding()) then
        return false
    end

    offset = stream:readInt32(BitStream.LITTLE_ENDIAN)

    if (not stream:setOffset(1)) then
        return false
    end

    local objectCount = stream:readInt32(BitStream.LITTLE_ENDIAN)

    local i = 1
    while (i <= objectCount and (not stream:isEOF())) do
        Loader.yieldIfRequired()

        local object = stream:readFixedString(24)

        Script.objectsByName[object] = i
        Script.objectsById[i] = object

        i = i + 1
    end

    if (stream:isEOF()) then
        return false
    end

    if (not stream:setPos(offset)) then
        return false
    end

    if (not Script.verifyPadding()) then
        return false
    end

    offset = stream:readInt32(BitStream.LITTLE_ENDIAN)

    if (not stream:setOffset(1)) then
        return false
    end

    mainSize = stream:readInt32(BitStream.LITTLE_ENDIAN)

    local largestMissionSize = stream:readInt32(BitStream.LITTLE_ENDIAN)
    local missionScripts = stream:readInt16(BitStream.LITTLE_ENDIAN)
    local exclusiveMissionScripts = stream:readInt16(BitStream.LITTLE_ENDIAN)

    if (gameIdentifier == 0x73) then
        largestMissionLocalVarCount = stream:readInt32(BitStream.LITTLE_ENDIAN)
    end

    i = 1
    while (i <= missionScripts and (not stream:isEOF())) do
        Loader.yieldIfRequired()
        Script.missionOffsets[i] = stream:readInt32(BitStream.LITTLE_ENDIAN)
        i = i + 1
    end

    if (stream:isEOF()) then
        return false
    end

    if (not stream:setPos(offset)) then
        return false
    end

    if (gameIdentifier == 0x73) then
        if (not Script.verifyPadding()) then
            return false
        end

        offset = stream:readInt32(BitStream.LITTLE_ENDIAN)

        if (not stream:setOffset(1)) then
            return false
        end

        local largestStreamedScriptSize = stream:readInt32(BitStream.LITTLE_ENDIAN)
        local streamedScriptCount = stream:readInt32(BitStream.LITTLE_ENDIAN)

        i = 1
        while (i <= streamedScriptCount and (not stream:isEOF())) do
            Loader.yieldIfRequired()

            local streamedScriptName = pregReplace(stream:readFixedString(20), "\0", "")
            local streamedScriptOffset = stream:readInt32(BitStream.LITTLE_ENDIAN)
            local streamedScriptSize = stream:readInt32(BitStream.LITTLE_ENDIAN)

            streamedScriptsById[i] = {
                ["name"] = streamedScriptName,
                ["offset"] = streamedScriptOffset,
                ["size"] = streamedScriptSize
            }

            --streamedScriptsByName[streamedScriptName] = i

            i = i + 1
        end

        if (not stream:setPos(offset)) then
            return false
        end

        if (not Script.verifyPadding()) then
            return false
        end

        offset = stream:readInt32(BitStream.LITTLE_ENDIAN)

        if (not stream:setPos(offset)) then
            return false
        end

        if (not Script.verifyPadding()) then
            return false
        end

        offset = stream:readInt32(BitStream.LITTLE_ENDIAN)

        if (not stream:setOffset(1)) then
            return false
        end

        local globalVarSpaceSize = stream:readInt32(BitStream.LITTLE_ENDIAN)

        if (not stream:setPos(offset)) then
            return false
        end
    end

    mainOffset = stream:getPos()

    optimizedScript = Optimizer.optimize(stream)

    collectgarbage("collect")

    Logger.info('SCRIPT', 'Script [{}] loaded.', path)
    Logger.debug('SCRIPT', 'Main offset: {}', string.format("0x%.4X", mainOffset))
    Logger.debug('SCRIPT', 'Main size: {} bytes', mainSize)
    Logger.debug('SCRIPT', "Optimized script exists: {}.", (optimizedScript ~= false) and "true" or "false")

    return (optimizedScript ~= false)
end

function Script.unload()
    optimizedScript = false
end

function Script.start()
    Thread:create(mainOffset)

    if (Debug.isLoaded()) then
        Debug.scriptLoaded()
    end
end

function Script.stop()
    Thread.threadTable = false
    Thread.currentThread = nil
end

function Script.loadExternalScript(id)
    if (Script.isExternalScriptLoaded(id)) then
        return false
    end

    local script = streamedScriptsById[id + 1]

    if (script == nil) then
        return false
    end

    Logger.info('SCRIPT', 'Loading external script [{}].', script.name)

    local scriptImgArchive = ImgArchive:create(scriptImgPath)

    if (not scriptImgArchive) then
        return false
    end

    local scmPath = script.name:lower()..".scm"
    local scmFile = scriptImgArchive:openFile(scmPath)

    if (not scmFile) then
        scriptImgArchive:close()
        return false
    end

    scmFile.size = script.size

    local scriptStream = BitStream:create(scmFile, true)

    if (not scriptStream) then
        scmFile:close()
        scriptImgArchive:close()
        return false
    end

    local updatedOptimizedScript = Optimizer.optimize(scriptStream, optimizedScript, script.offset)

    scmFile:close()
    scriptImgArchive:close()

    if (not updatedOptimizedScript) then
        return false
    end

    optimizedScript = updatedOptimizedScript

    return true
end

function Script.isExternalScriptLoaded(id)
    local script = streamedScriptsById[id + 1]

    if (script == nil) then
        return false
    end

    return (optimizedScript[(script.offset - mainOffset) + 1] ~= nil)
end

function Script.getExternalScriptRunningCount(id)
    return #Thread.getThreadsFromExternalScriptId(id)
end

function Script.runExternalScript(id, ...)
    local script = streamedScriptsById[id + 1]

    if (script == nil) then
        return false
    end

    Logger.info('SCRIPT', 'Running external script [{}].', script.name)

    local thread = Thread:create(script.offset, false, Thread.currentThread)

    thread.externalScriptId = id

    local args = {unpack(arg)}

    for index,param in pairs(args) do
        thread:setLocalVar(index - 1, param)
    end

    return true
end

function Script.stopExternalScript(id)
    local threads = Thread.getThreadsFromExternalScriptId(id)

    if (#threads == 0) then
        return
    end

    Logger.info('SCRIPT', 'Stopping external script [{}].', streamedScriptsById[id + 1].name)

    for _,thread in pairs(threads) do
        if (thread) then
            thread:setKeepAlive(false)
            thread:wake()
        end
    end
end

function Script.releaseExternalScript(id)
    local script = streamedScriptsById[id + 1]

    if (script == nil) then
        return false
    end

    Logger.info('SCRIPT', 'Releasing external script [{}].', script.name)

    local offset = script.offset
    local size = script.size

    for i = 1, size do
        optimizedScript[(offset - mainOffset) + i] = nil
    end

    return true
end

function Script.panic(message)
    Logger.error('SCRIPT', 'Panic [{}]: {} Pausing all threads.', string.format("%.4X", Thread.currentThread:getLastOpcode().opcode), message)
    Overlay.triggerEvent("onError", "SCRIPT_PANIC", message)

    Script.stop()

    local thread = Thread.threadTable

    while (thread ~= false) do
        thread:sleep()
        thread = thread.next
    end
end

function Script.setOpcodePartiallyImplemented()
    return 0
end

function Script.setOpcodeUnimplemented()
    Logger.warning('SCRIPT', 'Unimplemented opcode [{}].', string.format("%.4X", Thread.currentThread:getLastOpcode().opcode))

    if (Thread.currentThread:getLastOpcode().debug and Thread.currentThread:getLastOpcode().debug.example) then
        Logger.debug('SCRIPT', 'Example: {}', Thread.currentThread:getLastOpcode().debug.example)
    end

    return 0
end

function Script.setOptimizedScript(script)
    optimizedScript = script
end

function Script.setMainOffset(offset)
    mainOffset = offset
end

function Script.storeValueAtIndex(index, value)
    local opcode = Thread.currentThread:getLastOpcode().params[index]

    if (opcode == nil) then
        return false
    end

    if (opcode.pointer == nil and opcode.offset ~= nil) then
        if (opcode.flags >= 0 and opcode.flags <= 0x3) then
            if (opcode.flags == 0 or opcode.flags == 1) then
                index = Thread.currentThread:getLocalVar(opcode.index)
            elseif (opcode.flags == 2) then
                index = Thread.currentThread:getLocalVar(opcode.index * 2)
            elseif (opcode.flags == 3) then
                index = Thread.currentThread:getLocalVar(opcode.index * 4)
            end
        elseif (opcode.flags >= 0x80 and opcode.flags <= 0x83) then
            if (opcode.flags == 0x80 or opcode.flags == 0x81) then
                index = Script.globalVars[opcode.index / 4] or 0
            elseif (opcode.flags == 0x82) then
                index = (Script.globalVars[opcode.index / 4] or 0) * 2
            elseif (opcode.flags == 0x83) then
                index = (Script.globalVars[opcode.index / 4] or 0) * 4
            end
        else
            index = opcode.index
        end

        if (opcode.type == 0) then
            return Script.setVarValue((opcode.offset / 4) + index, value, opcode.type)
        elseif (opcode.type == 1) then
            return Script.setVarValue(opcode.offset + index, value, opcode.type)
        end
    end

    Script.setVarValue(opcode.pointer, value, opcode.type)
end

function Script.getValueAtIndex(index)
    local opcode = Thread.currentThread:getLastOpcode().params[index]

    if (opcode == nil) then
        return 0
    end

    if (opcode.pointer == nil and opcode.offset ~= nil) then
        if (opcode.flags >= 0 and opcode.flags <= 0x3) then
            if (opcode.flags == 0 or opcode.flags == 1) then
                index = Thread.currentThread:getLocalVar(opcode.index)
            elseif (opcode.flags == 2) then
                index = Thread.currentThread:getLocalVar(opcode.index * 2)
            elseif (opcode.flags == 3) then
                index = Thread.currentThread:getLocalVar(opcode.index * 4)
            end
        elseif (opcode.flags >= 0x80 and opcode.flags <= 0x83) then
            if (opcode.flags == 0x80 or opcode.flags == 0x81) then
                index = Script.globalVars[opcode.index / 4] or 0
            elseif (opcode.flags == 0x82) then
                index = (Script.globalVars[opcode.index / 4] or 0) * 2
            elseif (opcode.flags == 0x83) then
                index = (Script.globalVars[opcode.index / 4] or 0) * 4
            end
        else
            index = opcode.index
        end

        if (opcode.type == 0) then
            return Script.getVarValue((opcode.offset / 4) + index, opcode.type)
        elseif (opcode.type == 1) then
            return Script.getVarValue(opcode.offset + index, opcode.type)
        end
    end

    return Script.getVarValue(opcode.pointer, opcode.type)
end

function Script.setVarValue(pointer, value, type)
    if (type == 0) then
        Script.globalVars[pointer] = value
        return true
    elseif (type == 1) then
        Thread.currentThread:setLocalVar(pointer, value)
        return true
    end

    return false
end

function Script.getVarValue(pointer, type)
    local result = 0

    if (type == 0) then
        result = Script.globalVars[pointer]
    elseif (type == 1) then
        result = Thread.currentThread:getLocalVar(pointer)
    end

    if (result == nil) then
        result = 0
    end

    return result
end

function Script.verifyPadding()
    local checkBytes = stream:readBytes(3)

    if (#checkBytes ~= 3 or
        (checkBytes[1] ~= 0x02 or
        checkBytes[2] ~= 0x00 or
        checkBytes[3] ~= 0x01)) then
        return false
    end

    return true
end

function Script.getMainOffset()
    return mainOffset
end

function Script.getMainSize()
    return mainSize
end

function Script.getStream()
    return stream
end

function Script.getOptimizedScript()
    return optimizedScript
end

function Script.nextOpcode()
    local currentThread = Thread.currentThread

    if not currentThread then
        return false
    end

    local position = currentThread.position
    local opcode = optimizedScript[(position - mainOffset) + 1]

    if (opcode == nil or opcode == false) then
        Logger.info('SCRIPT', 'No opcode to run! Terminating thread \'{}\' at {}.', currentThread.name, position)
        return false
    end

    if (opcode.call == nil) then
        if (opcode.opcode) then
            Logger.error('SCRIPT', 'Opcode [{}] not implemented.', string.format("%.4X", opcode.opcode))
            return
        else
            currentThread.position = opcode.nextOffset
            return true
        end
    end

    currentThread.position = opcode.nextOffset
    currentThread.lastOpcode = opcode

    currentThread:setLastResult(opcode.call())

    return true
end

-----------------------------------
-- * Events
-----------------------------------