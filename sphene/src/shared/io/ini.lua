-----------------------------------
-- * Variables
-----------------------------------

INI = {}
INI.__index = INI

-----------------------------------
-- * Functions
-----------------------------------

function INI.parse(filePath)
    local data = {}

	if (not File.exists(filePath)) then
        return false
    end

    local iniFile = File.open(filePath, true)

    if (not iniFile) then
        Logger.error('INI', 'INI File {} not found', filePath)
        return false
    end

    local buffer = ""
    local lineIndex = 0
    local currentLine = 1

    local inBlock = false
    local isBlockClosed = false
    local inComment = false
    local inVar = false
    local emptyLine = false

    local currentBlock = nil
    local currentVar = nil

    while (not iniFile:isEOF()) do
        local char = iniFile:read(1)

        if (char == '\n') then
            if (inVar) then
                if (currentBlock == nil) then
                    data[currentVar] = buffer
                else
                    data[currentBlock][currentVar] = buffer
                end
            end

            if (inBlock == false and inComment == false
                and emptyLine == false and inVar == false
                and #buffer > 0) then
                Logger.error('INI', 'For INI file {}, Unexpected {} on line {}', filePath, buffer, currentLine)
                return false
            end

            lineIndex = 0
            inBlock = false
            isBlockClosed = false
            inComment = false
            inVar = false
            emptyLine = false
            buffer = ""
            currentVar = nil
            currentLine = currentLine + 1
        elseif (char ~= '\r') then
            if (not inComment) then
                if (lineIndex == 0 and char == '[') then
                    inBlock = true
                elseif(lineIndex == 0 and char == '=') then
                    Logger.error('INI', 'For INI file {}, Unexpected = on line {}', filePath, currentLine)
                    return false
                elseif (inBlock and char ~= ']') then
                    if ((utfCode(char) < 65 or utfCode(char) > 90) and
                        (utfCode(char) < 48 or utfCode(char) > 57) and
                        (utfCode(char) < 97 or utfCode(char) > 122) and
                        (utfCode(char) ~= 95)) then
                        Logger.error('INI', 'For INI file {}, Unexpected {} in block on line {} at position {}', filePath, char, currentLine, lineIndex)
                        return false
                    end

                    buffer = buffer..char
                elseif (inBlock and char == ']') then
                    if (data[buffer] ~= nil) then
                        Logger.error('INI', 'For INI file {}, Block {} already exists!', filePath, buffer)
                        return false
                    end

                    data[buffer] = {}
                    currentBlock = buffer
                    isBlockClosed = true
                elseif (char ~= ' ' and isBlockClosed) then
                    Logger.error('INI', 'For INI file {}, Unexpected {} on line {} at position {}', filePath, char, currentLine, lineIndex)
                    return false
                elseif (char == ';') then
                    inComment = true
                elseif (not inVar) then
                    if (char == '=') then
                        inVar = true
                        currentVar = buffer
                        buffer = ""

                        if (currentBlock == nil) then
                            if (data[currentVar] ~= nil) then
                                Logger.error('INI', 'For INI file {}, Key {} already exists!', filePath, currentVar)
                                return false
                            end
                        elseif (data[currentBlock][currentVar] ~= nil) then
                            Logger.error('INI', 'For INI file {}, Key {} already exists for block {}!', filePath, urrentVar, currentBlock)
                            return false
                        end
                    elseif ((utfCode(char) < 65 or utfCode(char) > 90) and
                        (utfCode(char) < 48 or utfCode(char) > 57) and
                        (utfCode(char) < 97 or utfCode(char) > 122) and
                        ((char ~= ' ' and utfCode(char) > 31) or (lineIndex ~= 0 and emptyLine))) then
                        Logger.error('INI', 'For INI file {}, Unexpected {} on line {} at position {}', filePath, char, currentLine, lineIndex)
                        return false
                    else
                        if ((char == ' ' or utfCode(char) <= 31) and lineIndex == 0) then
                            emptyLine = true
                        else
                            buffer = buffer..char
                        end
                    end
                elseif (inVar) then
                    buffer = buffer..char
                end
            end

            lineIndex = lineIndex + 1
        end

        Loader.yieldIfRequired()
    end

    iniFile:close()

    return data
end