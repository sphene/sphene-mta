-----------------------------------
-- * Variables
-----------------------------------

FONTS = {
    futheavy = dxCreateFont("assets/fonts/futheavy.ttf", 20, false)
}

Text = {}
Text.__index = Text

Text.messageQueue = {
    ["1"] = {},
    ["2"] = {},
    ["textbox"] = {},
    ["1022"] = {}
}

Text.textData = {}

Text.renderTimerText = false
Text.renderStatusText = false

Text.gxtTable = 'MAIN'

-----------------------------------
-- * Functions
-----------------------------------

-- luacheck:ignore 211
function Text.loadGXT(path)
    local data = Loader.tryLoadCached(path)

    if (data == false) then
        local stream = BitStream:create(path, nil, false)

        if (not stream) then
            return false
        end

        local version = stream:readInt16(BitStream.LITTLE_ENDIAN)
        local bitsPerCharacter = stream:readInt16(BitStream.LITTLE_ENDIAN)

        if (stream:readFixedString(4) ~= "TABL") then
            stream:close()
            return false
        end

        local blockSize = stream:readInt32(BitStream.LITTLE_ENDIAN)

        for i=1, blockSize / 12 do
            local blockName = stream:readFixedString(8)
            local blockOffset = stream:readInt32(BitStream.LITTLE_ENDIAN)
            local currentPosition = stream:getPos()

            Text.textData[blockName] = {}

            stream:setPos(blockOffset)

            if (blockName ~= "MAIN") then
                if (stream:readFixedString(8) ~= blockName) then
                    stream:close()
                    return false
                end
            end

            if (stream:readFixedString(4) ~= "TKEY") then
                stream:close()
                return false
            end

            local keyBlockSize = stream:readInt32(BitStream.LITTLE_ENDIAN)

            for j=1, keyBlockSize / 8 do
                local entryOffset = stream:readInt32(BitStream.LITTLE_ENDIAN)
                local entryName = stream:readUInt32(BitStream.LITTLE_ENDIAN)

                entryName = string.upper(string.format("%.8x", entryName))

                local keyCurrentPosition = stream:getPos()

                if (blockName ~= "MAIN") then
                    stream:setPos(blockOffset + keyBlockSize + entryOffset + 24)
                else
                    stream:setPos(blockOffset + keyBlockSize + entryOffset + 16)
                end

                Text.textData[blockName][entryName] = stream:readVariableString()

                stream:setPos(keyCurrentPosition)

                Loader.yieldIfRequired()
            end

            stream:setPos(currentPosition)

            Loader.yieldIfRequired()
        end

        stream:close()

        Loader.saveToCache(path, Text.textData)
    else
        Text.textData = data
    end
end

function Text.onRender()
    if (#Text.messageQueue["1022"] > 0) then
        local messageData = Text.messageQueue["1022"][1]

        if (messageData.startTick == -1) then
            messageData.startTick = getTickCount()
            messageData.endTick = messageData.startTick + messageData.time
            Overlay.triggerEvent("onDisplaySubTitle", messageData.message)
        end

        if (messageData.endTick < getTickCount()) then
            Overlay.triggerEvent("onRemoveSubTitle")
            table.remove(Text.messageQueue["1022"], 1)
        end
    end

    if (#Text.messageQueue["1"] > 0) then
        local messageData = Text.messageQueue["1"][1]

        if (messageData.startTick == -1) then
            messageData.startTick = getTickCount()
            messageData.endTick = getTickCount() + 9000
        end

        if (messageData.endTick >= getTickCount()) then
            local frontAlpha

            if ((getTickCount() - messageData.startTick) < 1000) then
                frontAlpha = 255 * (1 / (1000 / (getTickCount() - messageData.startTick)))
            elseif (((messageData.endTick - getTickCount()) < 1000)) then
                frontAlpha = 255 * (1 / (1000 / (messageData.endTick - getTickCount())))
            else
                frontAlpha = 255
            end

            dxDrawBorderedText(1, messageData.message:lower(), 0, 0, Game.screenWidth, Game.screenHeight,
                tocolor(125, 85, 14, frontAlpha), convertRes(6), convertRes(4), "pricedown", "center", "center",
                false, false, true, true)
        else
            table.remove(Text.messageQueue["1"], 1)
        end
    end

    if (#Text.messageQueue["2"] > 0) then
        local messageData = Text.messageQueue["2"][1]

        if (messageData.startTick == -1) then
            messageData.startTick = getTickCount()
            messageData.endTick = getTickCount() + 3000
        end

        if (messageData.endTick >= getTickCount()) then
            local backAlpha
            local frontAlpha

            if ((getTickCount() - messageData.startTick) < 750) then
                backAlpha = 255 * (1 / (750 / (getTickCount() - messageData.startTick)))
            elseif (((messageData.endTick - getTickCount()) < 750)) then
                backAlpha = 255 * (1 / (750 / (messageData.endTick - getTickCount())))
            else
                backAlpha = 255
            end

            if ((getTickCount() - messageData.startTick) < 1000) then
                frontAlpha = 255 * (1 / (1000 / (getTickCount() - messageData.startTick)))
            elseif (((messageData.endTick - getTickCount()) < 1000)) then
                frontAlpha = 255 * (1 / (1000 / (messageData.endTick - getTickCount())))
            else
                frontAlpha = 255
            end

            dxDrawText(messageData.message:lower():gsub("#%x%x%x%x%x%x", ""), Game.screenWidth - convertRes(602), Game.screenHeight - convertRes(302),
                Game.screenWidth - convertRes(48), Game.screenHeight - convertRes(48),
                tocolor(0, 0, 0, backAlpha), convertRes(4.2), convertRes(2.2), "pricedown", "center", "top",
                false, false, true, true)

            dxDrawText(messageData.message:lower(), Game.screenWidth - convertRes(600), Game.screenHeight - convertRes(300),
                Game.screenWidth - convertRes(50), Game.screenHeight - convertRes(50),
                tocolor(125, 85, 14, frontAlpha), convertRes(4), convertRes(2), "pricedown", "center", "top",
                false, false, true, true)
        else
            table.remove(Text.messageQueue["2"], 1)
        end
    end

    if (#Text.messageQueue['textbox'] > 0) then
        local messageData = Text.messageQueue['textbox'][1]

        if (messageData.state == 0) then
            if (messageData.time == -1 or messageData.time == 0) then
                if (messageData.startTick == -1) then
                    messageData.startTick = getTickCount()
                    messageData.endTick = getTickCount() + 6000
                    Logger.info('TEXT', 'Displaying temporary text box: \'{}\'', messageData.message)
                    Overlay.triggerEvent("onDisplayTextBox", messageData.message)

                    messageData.state = 1
                end
            else
                if (messageData.startTick == -1) then
                    messageData.startTick = getTickCount()
                    messageData.endTick = getTickCount() + messageData.time
                    Sound.playFrontEnd(32) -- Shouldn't play it more than once, but I have a feeling it does... Check?
                    Logger.info('TEXT', 'Displaying temporary text box: \'{}\'', messageData.message)
                    Overlay.triggerEvent("onDisplayTextBox", messageData.message)

                    messageData.state = 1
                end
            end
        end

        if (messageData.endTick < getTickCount()) then
            Logger.info('TEXT', 'Removing temporary text box')
            Overlay.triggerEvent("onRemoveTextBox")
            table.remove(Text.messageQueue['textbox'], 1)
        end
    end

    if (Text.renderTimerText) then
        dxDrawBorderedText(1, Text.renderTimerText.label:upper(), 0, convertRes(350),
            Game.screenWidth - convertRes(350), 0, tocolor(255, 255, 255, 255),
            convertRes(1.1), FONTS.futheavy,
                "right", "top",
                false, true, true, true)

        local timer = getTickCount() - Text.renderTimerText.startTick

        if (Text.renderTimerText.type == 0) then
            timer = Text.renderTimerText.startValue + timer
        else
            timer = Text.renderTimerText.startValue - timer

            if (timer < 0) then
                timer = 0
            end
        end

        local seconds = timer / 1000
        local minutes = string.format("%02d", math.floor(seconds / 60))
        seconds = string.format("%02d", seconds - (60 * minutes))

        dxDrawBorderedText(1, minutes..":"..seconds, Game.screenWidth - convertRes(301), convertRes(350),
            0, 0, tocolor(255, 255, 255, 255),
            convertRes(1.1), FONTS.futheavy,
                "left", "top",
                false, true, true, true)

        Script.setVarValue(Text.renderTimerText.timer.pointer, timer, Text.renderTimerText.timer.type)
    end

    if (Text.renderStatusText) then
        dxDrawBorderedText(1, Text.renderStatusText.label:upper(), 0, convertRes(400),
            Game.screenWidth - convertRes(350), 0, tocolor(193, 221, 227, 255),
            convertRes(1.1), FONTS.futheavy,
                "right", "top",
                false, true, true, true)

        local counter =  Script.getVarValue(Text.renderStatusText.counter.pointer, Text.renderStatusText.counter.type)

        if (Text.renderStatusText.type == 1) then
            dxDrawRectangle(Game.screenWidth - convertRes(303), convertRes(406), convertRes(205), convertRes(25),
                tocolor(0, 0, 0, 255))

            dxDrawRectangle(Game.screenWidth - convertRes(301), convertRes(408), convertRes(201), convertRes(21),
                tocolor(55, 75, 79, 255))

            dxDrawRectangle(Game.screenWidth - convertRes(301), convertRes(408),
                convertRes(201) * 1 / (100 / counter)
                , convertRes(21), tocolor(193, 221, 227, 255))
        else
            dxDrawBorderedText(1, tostring(counter), Game.screenWidth - convertRes(301), convertRes(400),
                0, 0, tocolor(193, 221, 227, 255),
                convertRes(1.1), FONTS.futheavy,
                    "left", "top",
                    false, true, true, true)
        end
    end
end

function Text.addMessageToQueue(message, label, time, style, priority)
    priority = priority or 0

    if style == -1 then
        style = 'textbox'
    end

    if (style == 1022 and priority == 2) then
        Text.messageQueue[tostring(style)] = {}
        Overlay.triggerEvent("onRemoveSubTitle")
    end

    if (Text.messageQueue[tostring(style)] == nil) then
        Text.messageQueue[tostring(style)] = {}
    end

    if (#Text.messageQueue[tostring(style)] > 9) then
        return
    end

    Logger.info('TEXT', 'Adding message to queue (style: {}, priority: {}, time: {}): \'{}\'', style, priority, time, message)

    table.insert(Text.messageQueue[tostring(style)], {
        ["message"] = message:gsub("|", "°"),
        ["time"] = time,
        ["style"] = style,
        ["label"] = label,
        ["startTick"] = -1,
        ["endTick"] = -1,
        ["state"] = 0
    })
end

function Text.showPermanentBox(text, label)
    Text.removeTextBox()
    Logger.info('TEXT', 'Displaying permanent box: \'{}\'', text)

    Text.addMessageToQueue(text, label, -1, 'textbox')
end

function Text.removeTextBox()
    Text.messageQueue["textbox"] = {}

    Logger.info('TEXT', 'Clearing text box')
    Overlay.triggerEvent("onRemoveTextBox")
end

function Text.setTimerText(label, type, timer)
    Text.renderTimerText = {
        label = label,
        type = type,
        timer = timer,
        startTick = getTickCount(),
        startValue = Script.getVarValue(timer.pointer, timer.type)
    }
end

function Text.setStatusText(label, type, counter)
    Text.renderStatusText = {
        label = label,
        type = type,
        counter = counter
    }
end

function Text.removeTimerText(timer)
    if (Text.renderTimerText and (timer == nil or Text.renderTimerText.timer.pointer == timer.pointer)) then
        Text.renderTimerText = false
    end
end

function Text.removeStatusText(counter)
    if (Text.renderStatusText and (counter == nil or Text.renderStatusText.counter.pointer == counter.pointer)) then
        Text.renderStatusText = false
    end
end

function Text.setGXTTable(gxtTable)
    Text.gxtTable = gxtTable
end

function Text.isTextBoxDisplayed()
    return #Text.messageQueue["textbox"] > 0
end

function Text.getTextFromHash(hash)
    if (Text.textData["MAIN"][hash] ~= nil) then
        return Text.textData["MAIN"][hash]
    end

    if (Text.textData[Text.gxtTable] ~= nil) then
        if (Text.textData[Text.gxtTable][hash] ~= nil) then
            return Text.textData[Text.gxtTable][hash]
        end
    end

    return ""
end

function Text.getFormattedTextFromHash(hash, removeNumbers)
    local text = Text.getTextFromHash(hash)

    if (text ~= false) then
        text = text:gsub("~[b|B]~", "#2B2096")
        text = text:gsub("~[r|R]~", "#6E1919")
        text = text:gsub("~[w|W]~", "#FFFFFF")
        text = text:gsub("~[y|Y]~", "#DCB865")
        text = text:gsub("~[g|G]~", "#335F3F")
        text = text:gsub("~[n|N]~", "\n")
        text = text:gsub("~[z|Z]~", "")
        text = text:gsub("~[h|H]~", "")
        text = text:gsub("~[s|S]~", "#FFFFFF") -- Needs some more looking into

        if (removeNumbers) then
            text = text:gsub("~1~", "")
        end

        while (text:find("~k~~[a-zA-Z_]+~")) do
            local match = text:match("~k~~([a-zA-Z_]+)~")
            local actualMatch = Pad.convertGtaControlToMta(match) or match

            local keys = getBoundKeys(actualMatch:lower())

            if (not keys) then
                text = text:gsub("~k~~"..match.."~", match:upper())
            else
                keys, _ = next(keys)
                text = text:gsub("~k~~"..match.."~", keys:upper())
            end
        end
    else
        text = ""
    end

    return text:gsub(" $", "")
end

function Text.getGXTTable()
    return Text.gxtTable
end

function Text.clearAllPrint()
    Logger.debug('TEXT', 'Clearing all print text messages')

    Text.messageQueue = {
        ["1"] = {},
        ["2"] = {},
        ["1022"] = {}
    }

    Text.renderTimerText = false
    Text.renderStatusText = false

    Overlay.triggerEvent("onRemoveSubTitle")
    -- TODO: Remove other types of messages as needed. Needs more CEF integration.
end

function Text.cleanup()
    Logger.debug('TEXT', 'Cleaning up')

    Text.textData = {}
    Text.gxtTable = 'MAIN'

    Text.clearAllPrint()
    Text.messageQueue['textbox'] = {}
end