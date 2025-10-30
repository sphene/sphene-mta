-----------------------------------
-- * Variables
-----------------------------------

Cutscene = {}
Cutscene.__index = Cutscene

Cutscene.DATA_PATH = "data/game/san_andreas/anim/cuts.img"
Cutscene.MODEL_PATH = "data/game/san_andreas/models/cutscene.img"

Cutscene.cutsceneData = {}

Cutscene.cutscenePlaying = false
Cutscene.canBeSkipped = false
Cutscene.isCutsceneSkipped = false

Cutscene.cutsceneSkipPointer = 0
Cutscene.cutsceneSkipThread = false
Cutscene.startTick = 0

Cutscene.dataImgArchive = nil
Cutscene.modelImgArchive = nil

Cutscene.cutsceneMapping = {
    ["DATE6B"] = 44,
    ["DATE6A"] = 45,
    ["DATE5B"] = 44,
    ["DATE5A"] = 45,
    ["DATE4B"] = 44,
    ["DATE4A"] = 45,
    ["DATE3B"] = 44,
    ["DATE3A"] = 45,
    ["DATE2B"] = 44,
    ["DATE2A"] = 45,
    ["DATE1B"] = 44,
    ["DATE1A"] = 45,
    ["ZERO_4"] = 141,
    ["ZERO_2"] = 140,
    ["ZERO_1"] = 139,
    ["WOOZIE4"] = 138,
    ["WOOZIE2"] = 135,
    ["WOOZI1B"] = 137,
    ["WOOZI1A"] = 136,
    ["W2_ALT"] = 134,
    ["TRUTH_2"] = 132,
    ["TRUTH_1"] = 133,
    ["SYND_7"] = 131,
    ["SYND_4B"] = 130,
    ["SYND_4A"] = 129,
    ["SYND_3A"] = 128,
    ["SYND_2B"] = 127,
    ["SYND_2A"] = 126,
    ["SWEET7A"] = 125,
    ["SWEET6B"] = 124,
    ["SWEET6A"] = 123,
    ["SWEET5A"] = 122,
    ["SWEET4A"] = 121,
    ["SWEET3B"] = 120,
    ["SWEET3A"] = 119,
    ["SWEET2B"] = 118,
    ["SWEET2A"] = 117,
    ["SWEET1C"] = 116,
    ["SWEET1B"] = 115,
    ["SWEET1A"] = 114,
    ["STRP4B2"] = 113,
    ["STRP4B1"] = 112,
    ["STRAP4A"] = 111,
    ["STRAP3A"] = 110,
    ["STRAP2A"] = 109,
    ["STRAP1A"] = 108,
    ["STEAL_5"] = 107,
    ["STEAL_4"] = 106,
    ["STEAL_2"] = 105,
    ["STEAL_1"] = 104,
    ["SMOKE4A"] = 103,
    ["SMOKE3A"] = 102,
    ["SMOKE2B"] = 101,
    ["SMOKE2A"] = 100,
    ["SMOKE1B"] = 99,
    ["SMOKE1A"] = 98,
    ["SCRASH2"] = 97,
    ["SCRASH1"] = 96,
    ["RYDER3A"] = 95,
    ["RYDER2A"] = 94,
    ["RYDER1A"] = 93,
    ["RIOT4E2"] = 92,
    ["RIOT4E1"] = 91,
    ["RIOT_4D"] = 90,
    ["RIOT_4C"] = 89,
    ["RIOT_4B"] = 88,
    ["RIOT_4A"] = 87,
    ["RIOT_2"] = 86,
    ["RIOT_1B"] = 85,
    ["RIOT_1A"] = 84,
    ["PROLOG3"] = 83,
    ["PROLOG2"] = 82,
    ["PROLOG1"] = 81,
    ["INTRO2A"] = 80,
    ["INTRO1B"] = 79,
    ["INTRO1A"] = 78,
    ["HEIST8A"] = 77,
    ["HEIST6A"] = 76,
    ["HEIST5A"] = 75,
    ["HEIST4A"] = 74,
    ["HEIST2A"] = 73,
    ["HEIST1A"] = 72,
    ["GROVE2"] = 71,
    ["GROVE1C"] = 70,
    ["GROVE1B"] = 69,
    ["GROVE1A"] = 68,
    ["GARAG3A"] = 67,
    ["GARAG1C"] = 66,
    ["GARAG1B"] = 65,
    ["FINAL2B"] = 64,
    ["FINAL2A"] = 63,
    ["FINAL1A"] = 62,
    ["FARL_5A"] = 61,
    ["FARL_4A"] = 60,
    ["FARL_3B"] = 59,
    ["FARL_3A"] = 58,
    ["FARL_2A"] = 57,
    ["EPILOG"] = 56,
    ["DOC_2"] = 55,
    ["DES_10B"] = 54,
    ["DES_10A"] = 53,
    ["DESERT9"] = 52,
    ["DESERT8"] = 51,
    ["DESERT6"] = 50,
    ["DESERT4"] = 49,
    ["DESERT3"] = 48,
    ["DESERT2"] = 47,
    ["DESERT1"] = 46,
    ["D8_ALT"] = 43,
    ["D10_ALT"] = 42,
    ["CRASv2b"] = 41,
    ["CRASv2a"] = 40,
    ["CRASHV1"] = 39,
    ["CRASH3A"] = 38,
    ["CRASH2A"] = 37,
    ["CRASH1A"] = 36,
    ["CESAR2A"] = 35,
    ["CESAR1A"] = 34,
    ["CAT_4"] = 33,
    ["CAT_3"] = 32,
    ["CAT_2"] = 31,
    ["CAT_1"] = 30,
    ["CAS_11A"] = 16,
    ["CAS_9A2"] = 29,
    ["CAS_9A1"] = 28,
    ["CAS_7B"] = 27,
    ["CAS6B_2"] = 26,
    ["CAS6B_1"] = 25,
    ["CAS_6A"] = 24,
    ["CAS_5A"] = 23,
    ["CAS_4C"] = 22,
    ["CAS_4B"] = 21,
    ["CAS_4A"] = 20,
    ["CAS_3"] = 19,
    ["CAS_2"] = 18,
    ["CAS_1B"] = 17,
    ["CAS_1A"] = 15,
    ["BHILL5B"] = 14,
    ["BHILL5A"] = 13,
    ["BHILL3C"] = 12,
    ["BHILL3B"] = 11,
    ["BHILL3A"] = 10,
    ["BHILL2"] = 9,
    ["BHILL1"] = 8,
    ["BCRAS2"] = 7,
    ["BCRAS1"] = 6,
    ["BCESA5W"] = 5,
    ["BCESAR5"] = 4,
    ["BCESA4W"] = 3,
    ["BCESAR4"] = 2,
    ["BCESAR2"] = 1
}

-----------------------------------
-- * Functions
-----------------------------------

function Cutscene.load(cutscene)
    Logger.info('CUTSCENE', 'Loading cutscene: {}', cutscene)

    setTimer(function()
        Cutscene.dataImgArchive = ImgArchive:create(Cutscene.DATA_PATH)
        Cutscene.modelImgArchive = ImgArchive:create(Cutscene.MODEL_PATH)
        Cutscene.cutsceneData = {}

        if (not Cutscene.parseCutFile(cutscene)) then
            if (Cutscene.dataImgArchive) then
                Cutscene.dataImgArchive:close()
                Cutscene.dataImgArchive = nil
            end

            if (Cutscene.modelImgArchive) then
                Cutscene.modelImgArchive:close()
                Cutscene.modelImgArchive = nil
            end

            Cutscene.cutsceneData = {}
            return false
        end

        if (not Cutscene.parseDatFile(cutscene)) then
            if (Cutscene.dataImgArchive) then
                Cutscene.dataImgArchive:close()
                Cutscene.dataImgArchive = nil
            end

            if (Cutscene.modelImgArchive) then
                Cutscene.modelImgArchive:close()
                Cutscene.modelImgArchive = nil
            end

            Cutscene.cutsceneData = {}
            return false
        end

        --[[if (not Cutscene.parseIFPFile(cutscene)) then
            if (Cutscene.dataImgArchive) then
                Cutscene.dataImgArchive:close()
                Cutscene.dataImgArchive = nil
            end

            if (Cutscene.modelImgArchive) then
                Cutscene.modelImgArchive:close()
                Cutscene.modelImgArchive = nil
            end

            Cutscene.cutsceneData = {}
            return false
        end]]
    end, 100, 1)

    return true
end

function Cutscene.startScene()
    if (Cutscene.cutsceneData["cutscene"] ~= nil) then
        Cutscene.cutscenePlaying = true
        Cutscene.isCutsceneSkipped = false
        Cutscene.startTick = getTickCount()
        showPlayerHudComponent("all", false)

        -- Disable gunfire and general ambient sounds
        setAmbientSoundEnabled("general", false)
        setAmbientSoundEnabled("gunfire", false)

        -- Disable wind ambient sounds
        setWorldSoundEnabled(0, 0, false, true)
        setWorldSoundEnabled(0, 29, false, true)
        setWorldSoundEnabled(0, 30, false, true)

        localPlayer:setDimension(60000 + getElementData(getElementParent(localPlayer), 'dimension'))

        local soundId = Cutscene.cutsceneMapping[Cutscene.cutsceneData["cutscene"]:upper()]

        Logger.debug('CUTSCENE', 'Playing cutscene: {}, Sound ID: {}', Cutscene.cutsceneData["cutscene"], soundId)

        if (soundId ~= nil) then
            Cutscene.cutsceneData["sound"]
                = playSFX('radio', 'Cutscene', soundId, false)
            if (Cutscene.cutsceneData["sound"]) then
                setSoundVolume(Cutscene.cutsceneData["sound"], 1.0)
            else
                Logger.error('CUTSCENE', 'Could not play sound ID {} for cutscene {}', soundId, Cutscene.cutsceneData["cutscene"])
            end
        end

        --[[if (Cutscene.cutsceneData["objectMapping"] ~= nil) then
            for object, data in pairs(Cutscene.cutsceneData["objectMapping"]) do
                if (Cutscene.modelImgArchive:exists(data.model..".txd")
                    and Cutscene.modelImgArchive:exists(data.model..".dff")) then

                    if (data.model == "cstaxi92"
                        or data.model == "csopcarla"
                        or data.model == "cscopcarla92"
                        or data.model == "csglendale92") then
                        data.vehicle = true
                    end

                    if (data.vehicle == true) then
                        local modelId = engineRequestModel('vehicle')
                        data.id = modelId
                    else
                        local modelId = engineRequestModel('object')
                        data.id = modelId
                    end

                    local txd = engineLoadTXD(Cutscene.modelImgArchive:readFile(data.model..".txd"))
                    engineImportTXD(txd, data.id)

                    local dff = engineLoadDFF(Cutscene.modelImgArchive:readFile(data.model..".dff"))
                    engineReplaceModel(dff, data.id)

                    data.txd = txd
                    data.dff = dff

                    if (data.vehicle == true) then
                        data.object = createVehicle(data.id, 0, 0, 0)
                        data.object:setFrozen(true)
                        data.object:setCollisionsEnabled(false)
                        data.object:setDimension(60000 + getElementData(getElementParent(localPlayer), 'dimension'))
                    elseif (data.ped == true) then
                        data.object = createPed(data.id, 0, 0, 0)
                        data.object:setFrozen(true)
                        data.object:setCollisionsEnabled(false)
                        data.object:setDimension(60000 + getElementData(getElementParent(localPlayer), 'dimension'))
                    else
                        data.object = createObject(data.id, 0, 0, 0)
                        data.object:setFrozen(true)
                        data.object:setCollisionsEnabled(false)
                        data.object:setDimension(60000 + getElementData(getElementParent(localPlayer), 'dimension'))
                    end
                end
            end
        end

        Cutscene.cutsceneData["objectMapping"]['csplay'] = {
            ["id"] = localPlayer:getModel(),
            ["object"] = localPlayer,
            ["txd"] = nil,
            ["dff"] = nil,
            ["ped"] = true
        }]]

        Cutscene.cutsceneData["starttick"] = getTickCount()

        return true
    end

    return false
end

function Cutscene.endScene()
    Cutscene.cutscenePlaying = false
    Cutscene.isCutsceneSkipped = false
    showPlayerHudComponent("all", true)
    resetAmbientSounds()
    resetWorldSounds()

    if (isElement(Cutscene.cutsceneData["sound"])) then
        destroyElement(Cutscene.cutsceneData["sound"])
    end

    local deleteModels = {}

    if (Cutscene.cutsceneData["objectMapping"] ~= nil) then
        for object, data in pairs(Cutscene.cutsceneData["objectMapping"]) do
            if (isElement(data.object)) then
                destroyElement(data.object)
            end

            engineFreeModel(data.id)

            table.insert(deleteModels, {
                ["txd"] = data.txd,
                ["dff"] = data.dff,
                ["id"] = data.id
            })
        end
    end

    Cutscene.cutsceneData = {}

    if (Cutscene.dataImgArchive) then
        Cutscene.dataImgArchive:close()
        Cutscene.dataImgArchive = nil
    end

    if (Cutscene.modelImgArchive) then
        Cutscene.modelImgArchive:close()
        Cutscene.modelImgArchive = nil
    end

    setTimer(function()
        for _, modelData in pairs(deleteModels) do
            if (isElement(modelData.dff)) then
                destroyElement(modelData.dff)
            end

            --engineRestoreModel(modelData.id)

            if (isElement(modelData.txd)) then
                destroyElement(modelData.txd)
            end
        end

        localPlayer:setDimension(getElementData(getElementParent(localPlayer), 'dimension'))
    end, 100, 1)

    return true
end

function Cutscene.startSkipSection(pointer)
    Cutscene.cutsceneSkipPointer = pointer
    Cutscene.cutsceneSkipThread = Thread.currentThread

    Cutscene.canBeSkipped = true
    return true
end

function Cutscene.skip()
    Game.isSkipping = false

    if (Cutscene.skippable() or Cutscene.isPlaying()) then
        Cutscene.endScene()
        Cutscene.isCutsceneSkipped = true

        if (Cutscene.skippable()) then
            Cutscene.cutsceneSkipThread:setPosition(Cutscene.cutsceneSkipPointer)
        end
    end
    return true
end

function Cutscene.endSkipSection()
    Cutscene.canBeSkipped = false
    Cutscene.cutsceneSkipPointer = 0
    Cutscene.cutsceneSkipThread = false
    return true
end

function Cutscene.hasReachedEnd()
    return not Cutscene.isPlaying()
end

function Cutscene.isPlaying()
    return Cutscene.cutscenePlaying
end

function Cutscene.hasSkipped()
    return Cutscene.isCutsceneSkipped
end

function Cutscene.skippable()
    return Cutscene.canBeSkipped
end

function Cutscene.isLoaded()
    return (Cutscene.cutsceneData["cutscene"] ~= nil)
end

function Cutscene.run()
    if (not Cutscene.isPlaying()) then
        return
    end

    local cutsceneMessage = "Cutscenes do not yet contain peds/objects/vehicles due to MTA restrictions"

    dxDrawText(cutsceneMessage:gsub("#%x%x%x%x%x%x", ""), convertRes(17), convertRes(102),
        Game.screenWidth - convertRes(28), convertRes(7), tocolor(0, 0, 0, 255),
        convertRes(0.8), FONTS.futheavy,
            "center", "center",
            false, true, true, false)

    dxDrawText(cutsceneMessage, convertRes(15), convertRes(100),
        Game.screenWidth - convertRes(30), convertRes(5), tocolor(255, 255, 255, 255),
        convertRes(0.8), FONTS.futheavy,
            "center", "center",
            false, true, true, true)

    localPlayer:setInterior(getCameraInterior())

    local offsetX = Cutscene.cutsceneData["offset"]["x"]
    local offsetY = Cutscene.cutsceneData["offset"]["y"]
    local offsetZ = Cutscene.cutsceneData["offset"]["z"]

    if (Cutscene.cutsceneData["lastValues"] == nil) then
        Cutscene.cutsceneData["lastValues"] = {
            ["x"] = offsetX,
            ["y"] = offsetY,
            ["z"] = offsetZ,
            ["lookX"] = 0,
            ["lookY"] = 0,
            ["lookZ"] = 0,
            ["angle"] = 0,
            ["zoom"] = 0
        }
    end

    local elapsedTime = (getTickCount() - Cutscene.cutsceneData["starttick"])
    local progressed = false

    for i=Cutscene.cutsceneData["cameraData"][1].currentNode,
        #Cutscene.cutsceneData["cameraData"][1].data do
        local data = Cutscene.cutsceneData["cameraData"][1].data[i]
        local time = (data[1] * 1000)
        local nextData = Cutscene.cutsceneData["cameraData"][1].data[i + 1]
        local nextTime = (nextData ~= nil) and (nextData[1] * 1000) or -1

        if (time <= elapsedTime and (nextTime > elapsedTime or nextTime == -1)) then
            local zoom = data[2]

            if (nextData ~= nil) then
                local nextZoom = nextData[2]
                local progress = 1 / ((nextTime - time) / (elapsedTime - time))

                Cutscene.cutsceneData["lastValues"].zoom =
                    zoom + ((nextZoom - zoom) * progress)

                progressed = true
            else
                Cutscene.cutsceneData["lastValues"].zoom = zoom
            end

            Cutscene.cutsceneData["cameraData"][1].currentNode = i
            break
        end
    end

    for i=Cutscene.cutsceneData["cameraData"][2].currentNode,
        #Cutscene.cutsceneData["cameraData"][2].data do
        local data = Cutscene.cutsceneData["cameraData"][2].data[i]
        local time = (data[1] * 1000)
        local nextData = Cutscene.cutsceneData["cameraData"][2].data[i + 1]
        local nextTime = (nextData ~= nil) and (nextData[1] * 1000) or -1

        if (time <= elapsedTime and (nextTime > elapsedTime or nextTime == -1)) then
            local angle = data[2]

            if (nextData ~= nil) then
                local nextAngle = nextData[2]
                local progress = 1 / ((nextTime - time) / (elapsedTime - time))

                Cutscene.cutsceneData["lastValues"].angle =
                    angle + ((nextAngle - angle) * progress)

                progressed = true
            else
                Cutscene.cutsceneData["lastValues"].angle = angle
            end

            Cutscene.cutsceneData["cameraData"][2].currentNode = i
            break
        end
    end

    for i=Cutscene.cutsceneData["cameraData"][3].currentNode,
        #Cutscene.cutsceneData["cameraData"][3].data do
        local data = Cutscene.cutsceneData["cameraData"][3].data[i]
        local time = (data[1] * 1000)
        local nextData = Cutscene.cutsceneData["cameraData"][3].data[i + 1]
        local nextTime = (nextData ~= nil) and (nextData[1] * 1000) or -1

        if (time <= elapsedTime and (nextTime > elapsedTime or nextTime == -1)) then
            local posX, posY, posZ = offsetX + data[2], offsetY + data[3], offsetZ + data[4]

            if (nextData ~= nil) then
                local nextX, nextY, nextZ =
                    offsetX + nextData[2], offsetY + nextData[3], offsetZ + nextData[4]
                local progress = 1 / ((nextTime - time) / (elapsedTime - time))

                Cutscene.cutsceneData["lastValues"].x =
                    posX + ((nextX - posX) * progress)

                Cutscene.cutsceneData["lastValues"].y =
                    posY + ((nextY - posY) * progress)

                Cutscene.cutsceneData["lastValues"].z =
                    posZ + ((nextZ - posZ) * progress)

                progressed = true
            else
                Cutscene.cutsceneData["lastValues"].x = posX
                Cutscene.cutsceneData["lastValues"].y = posY
                Cutscene.cutsceneData["lastValues"].z = posZ
            end

            Cutscene.cutsceneData["cameraData"][3].currentNode = i
            break
        end
    end

    for i=Cutscene.cutsceneData["cameraData"][4].currentNode,
        #Cutscene.cutsceneData["cameraData"][4].data do
        local data = Cutscene.cutsceneData["cameraData"][4].data[i]
        local time = (data[1] * 1000)
        local nextData = Cutscene.cutsceneData["cameraData"][4].data[i + 1]
        local nextTime = (nextData ~= nil) and (nextData[1] * 1000) or -1

        if (time <= elapsedTime and (nextTime > elapsedTime or nextTime == -1)) then
            local lookX, lookY, lookZ = offsetX + data[2], offsetY + data[3], offsetZ + data[4]

            if (nextData ~= nil) then
                local nextLookX, nextLookY, nextLookZ =
                    offsetX + nextData[2], offsetY + nextData[3], offsetZ + nextData[4]
                local progress = 1 / ((nextTime - time) / (elapsedTime - time))

                Cutscene.cutsceneData["lastValues"].lookX =
                    lookX + ((nextLookX - lookX) * progress)

                Cutscene.cutsceneData["lastValues"].lookY =
                    lookY + ((nextLookY - lookY) * progress)

                Cutscene.cutsceneData["lastValues"].lookZ =
                    lookZ + ((nextLookZ - lookZ) * progress)

                progressed = true
            else
                Cutscene.cutsceneData["lastValues"].x = lookX
                Cutscene.cutsceneData["lastValues"].y = lookY
                Cutscene.cutsceneData["lastValues"].z = lookZ
            end

            Cutscene.cutsceneData["cameraData"][4].currentNode = i
            break
        end
    end

    setCameraMatrix(Cutscene.cutsceneData["lastValues"].x
        , Cutscene.cutsceneData["lastValues"].y
        , Cutscene.cutsceneData["lastValues"].z
        , Cutscene.cutsceneData["lastValues"].lookX
        , Cutscene.cutsceneData["lastValues"].lookY
        , Cutscene.cutsceneData["lastValues"].lookZ
        , Cutscene.cutsceneData["lastValues"].angle
        , Cutscene.cutsceneData["lastValues"].zoom)

    if (Cutscene.cutsceneData["texts"] ~= nil) then
        for i=Cutscene.cutsceneData["texts"].currentNode,
            #Cutscene.cutsceneData["texts"].data do
            local textData = Cutscene.cutsceneData["texts"].data[i]
            if (elapsedTime >= textData.time and textData.shown == false) then
                local text = Text.getFormattedTextFromHash(CRC32.getKey(textData.label))
                Text.addMessageToQueue(text, textData.label, textData.length, 1022)

                textData.shown = true
                progressed = true

                Cutscene.cutsceneData["texts"].currentNode = i
            end
        end
    end

    --local playerInterior = getCameraInterior()

    -- if (Cutscene.cutsceneData["objectAnim"] ~= nil) then
    --     for object, bones in pairs(Cutscene.cutsceneData["objectAnim"]) do
    --         object = string.lower(object)

    --         for bone, boneData in pairs(bones) do
    --             for i=boneData.currentNode, #boneData.data do
    --                 local time = boneData.data[i].time
    --                 local nextTime = (boneData.data[i + 1] ~= nil) and boneData.data[i + 1].time or -1
    --                 local progress = 1 / ((nextTime - time) / (elapsedTime - time))

    --                 if (time <= elapsedTime and (nextTime > elapsedTime or nextTime == -1)) then
    --                     local data = boneData.data[i].position
    --                     if (data ~= nil) then
    --                         local posX, posY, posZ = offsetX + data.posX, offsetY + data.posY, offsetZ + data.posZ

    --                         if (boneData.data[i + 1] ~= nil) then
    --                             local nextData = boneData.data[i + 1].position

    --                             local nextX, nextY, nextZ =
    --                                 offsetX + nextData.posX, offsetY + nextData.posY, offsetZ + nextData.posZ

    --                             if (Cutscene.cutsceneData["objectMapping"][object] ~= nil) then
    --                                 local objectElement = Cutscene.cutsceneData["objectMapping"][object].object

    --                                 if (isElement(objectElement)) then
    --                                     if (objectElement:getInterior() ~= playerInterior) then
    --                                         objectElement:setInterior(playerInterior)
    --                                     end

    --                                     local _, _, minZ, _, _, maxZ = getElementBoundingBox(objectElement)
    --                                     --posZ = posZ + ((maxZ - minZ) / 2)
    --                                     --nextZ = nextZ + ((maxZ - minZ) / 2)

    --                                     local baseOffset = getElementDistanceFromCentreOfMassToBaseOfModel(objectElement)

    --                                     if (boneData.first == true) then
    --                                         --[[objectElement:setPosition(
    --                                             posX + ((nextX - posX) * progress)
    --                                             , posY + ((nextY - posY) * progress)
    --                                             , posZ + ((nextZ - posZ) * progress))

    --                                         local objectX, objectY, objectZ = posX + ((nextX - posX) * progress)
    --                                             , posY + ((nextY - posY) * progress)
    --                                             , posZ + ((nextZ - posZ) * progress)

    --                                         if (Cutscene.cutsceneData["objectMapping"][object].vehicle == true
    --                                             or Cutscene.cutsceneData["objectMapping"][object].ped == true) then
    --                                             objectZ = objectZ + baseOffset
    --                                         end]]

    --                                         --[[local drawX, drawY, distance = getScreenFromWorldPosition(
    --                                             objectX, objectY, objectZ, 100
    --                                         )

    --                                         if (drawX ~= false) then
    --                                             local cameraX, cameraY, cameraZ = getCameraMatrix()

    --                                             if (isLineOfSightClear(cameraX, cameraY, cameraZ,
    --                                                 objectX, objectY, objectZ)) then
    --                                                 dxDrawCircle(drawX, drawY, 7 / (distance * 0.1), 0, 360, tocolor(255, 0, 0, 255))
    --                                                 dxDrawText(tostring(object), drawX, drawY + ((7 / (distance * 0.1)) / 2) + ((2 / (distance * 0.1)) + 0.5), 0, 0, tocolor(255, 0, 0, 255),
    --                                                     2 / (distance * 0.1), "default-bold")
    --                                             else
    --                                                 dxDrawCircle(drawX, drawY, 7 / (distance * 0.1), 0, 360, tocolor(0, 0, 255, 255))
    --                                                 dxDrawText(tostring(object), drawX, drawY + ((7 / (distance * 0.1)) / 2) + ((2 / (distance * 0.1)) + 0.5), 0, 0, tocolor(0, 0, 255, 255),
    --                                                     2 / (distance * 0.1), "default-bold")
    --                                             end
    --                                         end]]
    --                                     else
    --                                         if (Cutscene.cutsceneData["objectMapping"][object].vehicle == true) then
    --                                             objectElement:setComponentPosition(bone
    --                                                 , data.posX + ((nextData.posX - data.posX) * progress)
    --                                                 , data.posY + ((nextData.posY - data.posY) * progress)
    --                                                 , data.posZ + ((nextData.posZ - data.posZ) * progress))
    --                                         elseif (Cutscene.cutsceneData["objectMapping"][object].ped == true) then
    --                                             local boneId = boneNameToId[bone:gsub("^%s*(.-)%s*$", "%1")]

    --                                             if (boneId) then
    --                                                 setElementBonePosition(objectElement, boneId
    --                                                     , data.posX
    --                                                     , data.posY
    --                                                     , data.posZ)
    --                                             end
    --                                         end
    --                                     end
    --                                 end
    --                             end
    --                         else
    --                             local objectElement = Cutscene.cutsceneData["objectMapping"][object].object

    --                             if (isElement(objectElement)) then
    --                                 --[[local _, _, minZ, _, _, maxZ = getElementBoundingBox(object)
    --                                 posZ = posZ + ((maxZ - minZ) / 2)]]

    --                                 local baseOffset = getElementDistanceFromCentreOfMassToBaseOfModel(objectElement)
    --                                 posZ = posZ + baseOffset

    --                                 if (boneData.first == true) then
    --                                     objectElement:setPosition(posX, posY, posZ)
    --                                 else
    --                                     if (Cutscene.cutsceneData["objectMapping"][object].vehicle == true) then
    --                                         objectElement:setComponentPosition(bone, data.posX, data.posY, data.posZ)
    --                                     end
    --                                 end
    --                             end
    --                         end
    --                     end

    --                     if (boneData.data[i].rotation ~= nil) then
    --                         data = boneData.data[i].rotation
    --                         local rotX, rotY, rotZ = data.rotX, data.rotY, data.rotZ

    --                         if (boneData.data[i + 1] ~= nil) then
    --                             local nextData = boneData.data[i + 1].rotation

    --                             local nextX, nextY, nextZ = nextData.rotX, nextData.rotY, nextData.rotZ

    --                             if (Cutscene.cutsceneData["objectMapping"][object] ~= nil) then
    --                                 local objectElement = Cutscene.cutsceneData["objectMapping"][object].object

    --                                 if (isElement(objectElement)) then
    --                                     if (boneData.first == true) then
    --                                         objectElement:setRotation(
    --                                             rotX + ((nextX - rotX) * progress)
    --                                             , rotY + ((nextY - rotY) * progress)
    --                                             , rotZ + ((nextZ - rotZ) * progress))
    --                                     else
    --                                         if (Cutscene.cutsceneData["objectMapping"][object].vehicle == true) then
    --                                             objectElement:setComponentRotation(bone:gsub("^%s*(.-)%s*$", "%1")
    --                                                 , rotX + ((nextX - rotX) * progress)
    --                                                 , rotY + ((nextY - rotY) * progress)
    --                                                 , rotZ + ((nextZ - rotZ) * progress))
    --                                         elseif (Cutscene.cutsceneData["objectMapping"][object].ped == true) then
    --                                             local boneId = boneNameToId[bone:gsub("^%s*(.-)%s*$", "%1")]

    --                                             if (boneId) then
    --                                                 setElementBoneRotation(objectElement, boneId
    --                                                 , rotX
    --                                                 , rotY
    --                                                 , rotZ)
    --                                                 updateElementRpHAnim(objectElement)
    --                                             end
    --                                         end
    --                                     end
    --                                 end
    --                             end
    --                         else
    --                             local objectElement = Cutscene.cutsceneData["objectMapping"][object].object

    --                             if (isElement(objectElement) and rotX) then
    --                                 if (boneData.first == true) then
    --                                     objectElement:setRotation(rotX, rotY, rotZ)
    --                                 else
    --                                     if (Cutscene.cutsceneData["objectMapping"][object].vehicle == true) then
    --                                         objectElement:setComponentRotation(bone, rotX, rotY, rotZ)
    --                                     elseif (Cutscene.cutsceneData["objectMapping"][object].ped == true) then
    --                                         local boneId = boneNameToId[bone:gsub("^%s*(.-)%s*$", "%1")]

    --                                         if (boneId) then
    --                                             setElementBoneRotation(objectElement, boneId, rotX, rotY, rotZ)
    --                                             updateElementRpHAnim(objectElement)
    --                                         end
    --                                     end
    --                                 end
    --                             end
    --                         end
    --                     end

    --                     boneData.currentNode = i
    --                     break
    --                 end
    --             end
    --         end
    --     end
    -- end

    if (progressed == false) then
        Cutscene.cutscenePlaying = false
    end
end

function Cutscene.parseCutFile(cutscene)
    local cutsceneFile = Cutscene.dataImgArchive:openFile(cutscene:lower()..".cut")
    local objectId = 1462

    if (cutsceneFile) then
        local data = {
            ["block"] = false
        }

        local validBlocks = {
            ["info"] = true, ["model"] = true, ["extracol"] = true, ["text"] = true,
            ["uncompress"] = true, ["peffect"] = true, ["remove"] = true, ["attach"] = true,
            ["motion"] = true
        }

        local buffer = ""

        while (not cutsceneFile:isEOF()) do
            local char = cutsceneFile:read(1)

            if (char == '\n') then
                if (#buffer > 0) then
                    if (data.block == false) then
                        if (validBlocks[buffer] == nil) then
                            Logger.error('CUTSCENE', 'Unknown block tag {} for cutscene {}.', buffer, cutscene)
                            cutsceneFile:close()
                            cutsceneImgArchive:close()
                            return false
                        end

                        data.block = buffer
                    else
                        if (validBlocks[buffer] ~= nil) then
                            Logger.error('CUTSCENE', 'Unexpected block tag {} in block {} for cutscene {}.', buffer, data.block, cutscene)
                            return false
                        elseif (buffer:sub(0, 3) == "end") then
                            data = {
                                ["block"] = false
                            }
                        else
                            if (data.block == "info") then
                                local spl = split(buffer, " ")

                                if (#spl ~= 4 or spl[1] ~= "offset"
                                    or tonumber(spl[2]) == nil or tonumber(spl[3]) == nil
                                     or tonumber(spl[4]) == nil) then
                                    Logger.error('CUTSCENE', 'Invalid offset format {} in block {} for cutscene {}.', buffer, data.block, cutscene)
                                    Logger.error('CUTSCENE', 'Expected: offset x y z')

                                    cutsceneFile:close()
                                    cutsceneImgArchive:close()
                                    return false
                                end

                                if (data.offsetSet ~= nil) then
                                    Logger.error('CUTSCENE', 'Unknown instruction {} in block {} for cutscene {}.', buffer, data.block, cutscene)

                                    cutsceneFile:close()
                                    cutsceneImgArchive:close()
                                    return false
                                end

                                data.offsetSet = true
                                Cutscene.cutsceneData["offset"] = {
                                    ["x"] = tonumber(spl[2]),
                                    ["y"] = tonumber(spl[3]),
                                    ["z"] = tonumber(spl[4])
                                }
                            elseif (data.block == "text") then
                                local spl = split(buffer:gsub(" ", ""), ",")

                                if (#spl ~= 3 or tonumber(spl[1]) == nil
                                    or tonumber(spl[2]) == nil) then
                                    Logger.error('CUTSCENE', 'Invalid format {} in block {} for cutscene {}.', buffer, data.block, cutscene)
                                    Logger.error('CUTSCENE', 'Expected: time,length,label')

                                    cutsceneFile:close()
                                    return false
                                end

                                if (Cutscene.cutsceneData["texts"] == nil) then
                                    Cutscene.cutsceneData["texts"] = {
                                        ["currentNode"] = 1,
                                        ["data"] = {}
                                    }
                                end

                                table.insert(Cutscene.cutsceneData["texts"].data, {
                                    ["time"] = tonumber(spl[1]),
                                    ["length"] = tonumber(spl[2]),
                                    ["label"] = spl[3],
                                    ["shown"] = false
                                })
                            elseif (data.block == "model") then
                                local spl = split(buffer:gsub(" ", ""), ",")

                                if (#spl ~= 3 or tonumber(spl[1]) == nil) then
                                    Logger.error('CUTSCENE', 'Invalid format {} in block {} for cutscene {}.', buffer, data.block, cutscene)
                                    Logger.error('CUTSCENE', 'Expected: id,name,animation')

                                    cutsceneFile:close()
                                    cutsceneImgArchive:close()
                                    return false
                                end


                                if (Cutscene.cutsceneData["objectMapping"] == nil) then
                                    Cutscene.cutsceneData["objectMapping"] = {}
                                end

                                if (Cutscene.cutsceneData["objectMapping"] == nil) then
                                    Cutscene.cutsceneData["objectMapping"] = {}
                                end

                                Cutscene.cutsceneData["objectMapping"][spl[3]] = {
                                    ["model"] = spl[2],
                                    ["id"] = objectId,
                                    ["object"] = false
                                }

                                objectId = objectId + 1
                            end
                        end
                    end

                    buffer = ""
                end
            else
                if (char ~= '\r' and char ~= '\0') then
                    buffer = buffer..char
                end
            end
        end

        Cutscene.cutsceneData["cutscene"] = cutscene

        cutsceneFile:close()
        return true
    else
        Logger.error('CUTSCENE', 'Unable to open cutscene file {}.', cutscene)
    end

    return false
end

function Cutscene.parseDatFile(cutscene)
    local cutsceneFile = Cutscene.dataImgArchive:openFile(cutscene:lower()..".dat")

    Cutscene.cutsceneData["cameraData"] = {}

    if (cutsceneFile) then
        local buffer = ""
        local blocksLoaded = 0
        local insideBlock = false

        local expectedEntries = 0
        local entries = 0

        local fileEnded = false

        while (not cutsceneFile:isEOF() and fileEnded == false) do
            local char = cutsceneFile:read(1)

            if (char == '\n') then
                if (#buffer > 0) then
                    local spl = split(buffer, ",")

                    if (insideBlock == false) then
                        if (buffer == ";") then
                            fileEnded = true
                        else
                            if (#spl ~= 1 or tonumber(spl[1]) == nil) then
                                Logger.error('CUTSCENE', 'Unexpected {} in cutscene DAT file for cutscene {}.', buffer, cutscene)

                                cutsceneFile:close()
                                return false
                            end

                            expectedEntries = tonumber(spl[1])
                            insideBlock = true
                            blocksLoaded = blocksLoaded + 1
                        end
                    else
                        if (buffer == ";") then
                            if (entries ~= expectedEntries) then
                                Logger.error('CUTSCENE', 'Expected {} entries, found {} in DAT file for cutscene {}.',
                                    expectedEntries, entries, cutscene)

                                cutsceneFile:close()
                                return false
                            end

                            insideBlock = false
                            entries = 0
                        else
                            if (blocksLoaded == 1 or blocksLoaded == 2) then
                                if (#spl ~= 4) then
                                    Logger.error('CUTSCENE', 'Unexpected {} for block {} in cutscene DAT file for cutscene {}.',
                                        buffer, blocksLoaded, cutscene)

                                    cutsceneFile:close()
                                    return false
                                end

                                if (Cutscene.cutsceneData["cameraData"][blocksLoaded] == nil) then
                                    Cutscene.cutsceneData["cameraData"][blocksLoaded] = {
                                        ["currentNode"] = 1,
                                        ["data"] = {}
                                    }
                                end

                                Cutscene.cutsceneData["cameraData"][blocksLoaded]["data"][entries + 1] = {}

                                for i=1,4 do
                                    spl[i] = spl[i]:gsub("f", "")
                                    if (tonumber(spl[i]) == nil) then
                                        Logger.error('CUTSCENE', 'Unexpected {} for block {} in cutscene DAT file for cutscene {}.',
                                            buffer, blocksLoaded, cutscene)

                                        cutsceneFile:close()
                                        return false
                                    end

                                    Cutscene.cutsceneData["cameraData"][blocksLoaded]["data"][entries + 1][i] = tonumber(spl[i])
                                end
                            elseif (blocksLoaded == 3 or blocksLoaded == 4) then
                                if (#spl ~= 10) then
                                    Logger.error('CUTSCENE', 'Unexpected {} for block {} in cutscene DAT file for cutscene {}.',
                                        buffer, blocksLoaded, cutscene)

                                    cutsceneFile:close()
                                    return false
                                end

                                if (Cutscene.cutsceneData["cameraData"][blocksLoaded] == nil) then
                                    Cutscene.cutsceneData["cameraData"][blocksLoaded] = {
                                        ["currentNode"] = 1,
                                        ["data"] = {}
                                    }
                                end

                                Cutscene.cutsceneData["cameraData"][blocksLoaded]["data"][entries + 1] = {}

                                for i=1,10 do
                                    spl[i] = spl[i]:gsub("f", "")
                                    if (tonumber(spl[i]) == nil) then
                                        Logger.error('CUTSCENE', 'Unexpected {} for block {} in cutscene DAT file for cutscene {}.',
                                            buffer, blocksLoaded, cutscene)

                                        cutsceneFile:close()
                                        return false
                                    end

                                    Cutscene.cutsceneData["cameraData"][blocksLoaded]["data"][entries + 1][i] = tonumber(spl[i])
                                end
                            else
                                Logger.error('CUTSCENE', 'Unexpected block in cutscene DAT file for cutscene {}.', cutscene)

                                cutsceneFile:close()
                                return false
                            end

                            entries = entries + 1
                        end
                    end

                    buffer = ""
                end
            else
                if (char ~= '\r' and char ~= '\0') then
                    buffer = buffer..char
                end
            end
        end

        if (blocksLoaded ~= 4) then
            Logger.error('CUTSCENE', 'Expected 4 blocks in cutscene DAT file, got {} for cutscene {}.', blocksLoaded, cutscene)

            cutsceneFile:close()
            return false
        end

        cutsceneFile:close()
        return true
    else
        Logger.error('CUTSCENE', 'Unable to open cutscene DAT file {}.', cutscene)
    end

    return false
end

-- function Cutscene.parseIFPFile(cutscene)
--     local cutsceneIfpFile = Cutscene.dataImgArchive:openFile(cutscene:lower()..".ifp")

--     if (cutsceneIfpFile) then
--         local stream = BitStream:create(cutsceneIfpFile, false)

--         if (stream:readFixedString(4) ~= "ANPK") then
--             Logger.error('CUTSCENE', 'IFP file for cutscene {} may be corrupt.', cutscene)

--             stream:close()
--             return false
--         end

--         local offset = stream:readInt32(BitStream.LITTLE_ENDIAN) + stream:getPos()

--         stream:readFixedString(4)

--         local headerEndOffset = stream:readInt32(BitStream.LITTLE_ENDIAN) + stream:getPos()
--         local animationCount = stream:readInt32(BitStream.LITTLE_ENDIAN)
--         local internalFileName = stream:readVariableString()

--         if (((#internalFileName + 1) % 4) ~= 0) then
--             stream:setOffset(4 - ((#internalFileName + 1) % 4))
--         end

--         Cutscene.cutsceneData["objectAnim"] = {}

--         -- ANIMATION

--         for i=1,animationCount do
--             if (stream:isEOF()) then
--                 Logger.error('CUTSCENE', 'Unexpected end of IFP file for cutscene {}.', cutscene)

--                 stream:close()
--                 return false
--             end

--             if (stream:readFixedString(4) ~= "NAME") then
--                 Logger.error('CUTSCENE', 'IFP file for cutscene {} may be corrupt.', cutscene)

--                 stream:close()
--                 return false
--             end

--             local animNameLen = stream:readInt32(BitStream.LITTLE_ENDIAN)
--             local animationName = stream:readFixedString(animNameLen)

--             if (((#animationName + 1) % 4) ~= 0) then
--                 stream:setOffset(4 - ((#animationName + 1) % 4))
--             end

--             local dgan = stream:readFixedString(4)

--             if (dgan ~= "DGAN") then
--                 Logger.error('CUTSCENE', 'IFP file for cutscene {} may be corrupt.', cutscene)

--                 stream:close()
--                 return false
--             end

--             local endAnimOffset = stream:readInt32(BitStream.LITTLE_ENDIAN) + stream:getPos()
--             stream:readFixedString(4)

--             local firstObjectOffset = stream:readInt32(BitStream.LITTLE_ENDIAN) + stream:getPos()
--             local objectCount = stream:readInt32(BitStream.LITTLE_ENDIAN)
--             stream:readInt32(BitStream.LITTLE_ENDIAN)

--             Cutscene.cutsceneData["objectAnim"][string.lower(animationName)] = {}

--             -- - OBJECT

--             for j=1,objectCount do
--                 if (stream:isEOF()) then
--                     Logger.error('CUTSCENE', 'Unexpected end of IFP file for cutscene {}.', cutscene)

--                     stream:close()
--                     return false
--                 end

--                 stream:readFixedString(4)

--                 local endObjectOffset = stream:readInt32(BitStream.LITTLE_ENDIAN) + stream:getPos()

--                 stream:readFixedString(4)

--                 local firstFrameOffset = stream:readInt32(BitStream.LITTLE_ENDIAN) + stream:getPos()
--                 local objectName = stream:readFixedString(28)

--                 local frameCount = stream:readInt32(BitStream.LITTLE_ENDIAN)
--                 stream:readInt32(BitStream.LITTLE_ENDIAN)

--                 local nextSibling = stream:readInt32(BitStream.LITTLE_ENDIAN)
--                 local previousSibling = stream:readInt32(BitStream.LITTLE_ENDIAN)

--                 Cutscene.cutsceneData["objectAnim"][string.lower(animationName)][objectName] = {
--                     ["data"] = {},
--                     ["currentNode"] = 1,
--                     ["first"] = false
--                 }

--                 if (j == 1) then
--                     Cutscene.cutsceneData["objectAnim"][string.lower(animationName)][objectName].first = true
--                 end

--                 -- -- FRAME

--                 local frameType = stream:readFixedString(4)
--                 local endOfFrameData = stream:readInt32(BitStream.LITTLE_ENDIAN) + stream:getPos()

--                 --[[local lastX = 0
--                 local lastY = 0
--                 local lastZ = 0]]

--                 -- --- FRAME DATA

--                 for f=1,frameCount do
--                     if (stream:isEOF()) then
--                         Logger.error('CUTSCENE', 'Unexpected end of IFP file for cutscene {}.', cutscene)

--                         stream:close()
--                         return false
--                     end

--                     local frameData = {}

--                     for a=1,string.len(frameType) do
--                         local cType = string.char(string.byte(frameType, a, a))

--                         if (cType == "R") then
--                             local rotX = stream:readFloat()
--                             local rotY = stream:readFloat()
--                             local rotZ = stream:readFloat()
--                             local rotW = stream:readFloat()

--                             rotX, rotY, rotZ = fromQuaternion(rotX, rotY, rotZ, rotW)

--                             frameData["rotation"] = {
--                                 ["rotX"] = rotX,
--                                 ["rotY"] = rotY,
--                                 ["rotZ"] = rotZ
--                             }
--                         elseif (cType == "T") then
--                             local posX = stream:readFloat()
--                             local posY = stream:readFloat()
--                             local posZ = stream:readFloat()

--                             --posX = lastX + posX
--                             --posY = lastY + posY
--                             --posZ = lastZ + posZ

--                             lastX = posX
--                             lastY = posY
--                             lastZ = posZ

--                             frameData["position"] = {
--                                 ["posX"] = posX,
--                                 ["posY"] = posY,
--                                 ["posZ"] = posZ
--                             }
--                         elseif (cType == "S") then
--                             local scaleX = stream:readFloat()
--                             local scaleY = stream:readFloat()
--                             local scaleZ = stream:readFloat()

--                             frameData["scale"] = {
--                                 ["scaleX"] = scaleX,
--                                 ["scaleY"] = scaleY,
--                                 ["scaleZ"] = scaleZ
--                             }
--                         elseif (cType ~= "0" and cType ~= "K") then
--                             Logger.error('CUTSCENE', 'Unknown frame type {} for cutscene {}, IFP may be corrupt.', cType, cutscene)

--                             stream:close()
--                             return false
--                         end
--                     end

--                     local timeInMs = stream:readFloat() * 1000

--                     frameData["time"] = timeInMs

--                     table.insert(
--                         Cutscene.cutsceneData["objectAnim"][string.lower(animationName)][objectName]["data"],
--                         frameData)
--                 end
--             end
--         end

--         stream:close()
--         return true
--     else
--         Logger.error('CUTSCENE', 'Unable to open cutscene IFP file {}.', cutscene)
--     end

--     return false
-- end

-----------------------------------
-- * Events
-----------------------------------
