IPL = {
    loadedIPLs = {},
}

IPL.__index = IPL

-----------------------------------
-- * Functions
-----------------------------------

function IPL:create()
    local mt = setmetatable({}, IPL)

    mt.objects = {}
    mt.enexes = {}

    return mt
end

function IPL:createObject(objectID, positionX, positionY, positionZ, rotationX, rotationY, rotationZ, interior, lodIndex)
    Logger.debug('IPL', 'Creating object with ID {} at {} {} {} with rotation {} {} {} and interior {} and lodIndex {}',
        objectID, positionX, positionY, positionZ, rotationX, rotationY, rotationZ, interior, flags)

    local object = ObjectElement:create(objectID, true)

    object:spawn(positionX, positionY, positionZ, rotationX, rotationY, rotationZ)
    --object:setInterior(interior)

    self.objects[#self.objects + 1] = object
end

function IPL:unload()
    for i=1, #self.objects do
        self.objects[i]:destroy()
    end

    for group, _ in pairs(self.loadedIPLs) do
        if (self.loadedIPLs[group] == self) then
            self.loadedIPLs[group] = nil
        end
    end

    for i=1, #self.enexes do
        local enex = self.enexes[i]
        local enexGroup = enex:getGroup()

        if enexGroup then
            enexGroup:removeEnex(enex)

            if enexGroup:getEnexesCount() == 0 then
                EnexGroup.removeGroup(enexGroup.name)
            end
        end
    end
end

function IPL.loadFromBinary(file)
    local ipl = IPL:create()
    local stream = BitStream:create(file)

    Logger.info('IPL', 'Loading binary IPL file')

    if (not stream) then
        return false
    end

    if (stream:readFixedString(4) ~= "bnry") then
        Logger.error('IPL', 'Invalid binary IPL file')

        stream:close()
        return false
    end

    local itemInstances = stream:readInt32(BitStream.LITTLE_ENDIAN)

    stream:setOffset(12)

    -- luacheck:ignore 211
    local parkedCars = stream:readInt32(BitStream.LITTLE_ENDIAN)

    stream:setOffset(4)

    local itemInstancesOffset = stream:readInt32(BitStream.LITTLE_ENDIAN)

    stream:setOffset(28)

    -- luacheck:ignore 211
    local parkedCarsOffset = stream:readInt32(BitStream.LITTLE_ENDIAN)

    stream:setPos(itemInstancesOffset)

    for i=1, itemInstances do
        if (stream:isEOF()) then
            Logger.error('IPL', 'Unexpected end of file while reading item instances.')
            stream:close()
            return false
        end

        local positionX = stream:readFloat(BitStream.LITTLE_ENDIAN)
        local positionY = stream:readFloat(BitStream.LITTLE_ENDIAN)
        local positionZ = stream:readFloat(BitStream.LITTLE_ENDIAN)
        local rotationX = stream:readFloat(BitStream.LITTLE_ENDIAN)
        local rotationY = stream:readFloat(BitStream.LITTLE_ENDIAN)
        local rotationZ = stream:readFloat(BitStream.LITTLE_ENDIAN)
        local rotationW = stream:readFloat(BitStream.LITTLE_ENDIAN)
        local objectID = stream:readInt32(BitStream.LITTLE_ENDIAN)
        local interior = stream:readInt32(BitStream.LITTLE_ENDIAN)
        local lodIndex = stream:readInt32(BitStream.LITTLE_ENDIAN)

        rotationX, rotationY, rotationZ = fromQuaternion(rotationX, rotationY, rotationZ, rotationW)

        ipl:createObject(objectID, positionX, positionY, positionZ, rotationX, rotationY, rotationZ, interior, lodIndex)
    end

    stream:close()

    return ipl
end

function IPL.loadFromText(file, skipObjectCreation)
    skipObjectCreation = skipObjectCreation or false

    local ipl = IPL:create()
    local contents = fileRead(file, fileGetSize(file))

    Logger.info('IPL', 'Loading text IPL file')

    if (not contents) then
        return false
    end

    local lines = split(contents, '\n')
    local group = false

    for i=1, #lines do
        local line = lines[i]

        line = trim(line)

        if string.sub(line, 1, 1) ~= "#" and string.len(line) > 0 then
            if group == false then
                Logger.debug('IPL', 'Loading group \'{}\'', line)
                group = line
            elseif line == "end" then
                Logger.debug('IPL', 'End of group \'{}\'', group)
                group = false
            else
                local parts = split(line, ',')

                if group == "inst" and not skipObjectCreation then
                    local objectID = tonumber(trim(parts[1]))
                    --local modelName = trim(parts[2])
                    local interior = tonumber(trim(parts[3]))
                    local positionX = tonumber(trim(parts[4]))
                    local positionY = tonumber(trim(parts[5]))
                    local positionZ = tonumber(trim(parts[6]))
                    local rotationX = tonumber(trim(parts[7]))
                    local rotationY = tonumber(trim(parts[8]))
                    local rotationZ = tonumber(trim(parts[9]))
                    local rotationW = tonumber(trim(parts[10]))
                    local lodIndex = tonumber(trim(parts[11]))

                    rotationX, rotationY, rotationZ = fromQuaternion(rotationX, rotationY, rotationZ, rotationW)

                    ipl:createObject(objectID, positionX, positionY, positionZ, rotationX, rotationY, rotationZ, interior, lodIndex)
                elseif group == 'grge' then
                elseif group == 'enex' then
                    local entranceX = tonumber(trim(parts[1]))
                    local entranceY = tonumber(trim(parts[2]))
                    local entranceZ = tonumber(trim(parts[3]))
                    local enterAngle = tonumber(trim(parts[4]))

                    local xWidth = tonumber(trim(parts[5]))
                    local yWidth = tonumber(trim(parts[6]))
                    -- luacheck:ignore 211
                    local c8 = tonumber(trim(parts[7]))

                    local exitX = tonumber(trim(parts[8]))
                    local exitY = tonumber(trim(parts[9]))
                    local exitZ = tonumber(trim(parts[10]))
                    local exitAngle = tonumber(trim(parts[11]))

                    local interiorId = tonumber(trim(parts[12]))
                    local flags = tonumber(trim(parts[13]))
                    local name = trim(trim(parts[14]), {'"'})
                    local sky = tonumber(trim(parts[15]))

                    -- luacheck:ignore 211
                    local unknownFlags = tonumber(trim(parts[16]))
                    local timeEnableAt = tonumber(trim(parts[17]))
                    local timeDisableAt = tonumber(trim(parts[18]))

                    local enexGroup = EnexGroup.createGroup(name)

                    local enex = Enex:create(entranceX, entranceY, entranceZ, enterAngle, xWidth, yWidth, exitX, exitY, exitZ, exitAngle,
                        interiorId, flags, sky, timeEnableAt, timeDisableAt)

                    enexGroup:addEnex(enex)

                    ipl.enexes[#ipl.enexes + 1] = enex
                end
            end

            Loader.yieldIfRequired()
        end
    end

    Loader.yieldIfRequired()

    return ipl
end

function IPL.load(pathOrFile)
    local closeFile = false

    if (type(pathOrFile) == "string") then
        pathOrFile = fileOpen(pathOrFile, true)
        closeFile = true
    end

    if (not pathOrFile) then
        return false
    end

    local ipl

    pathOrFile:setPos(0)

    if (pathOrFile:read(4) == "bnry") then
        pathOrFile:setPos(0)
        ipl = IPL.loadFromBinary(pathOrFile)
    else
        pathOrFile:setPos(0)
        ipl = IPL.loadFromText(pathOrFile, true)
    end

    if (closeFile) then
        pathOrFile:close()
    end

    return ipl
end

function IPL.loadGroup(group)
    if (IPL.loadedIPLs[group]) then
        return IPL.loadedIPLs[group]
    end

    Logger.info('IPL', 'Loading IPL group {}', group)

    local gta3Img = ImgArchive:create('data/game/san_andreas/models/gta3.img')

    if (not gta3Img) then
        return false
    end

    local iplFile = gta3Img:openFile(string.lower(group)..'.ipl')

    if (not iplFile) then
        Logger.error('IPL', 'Failed to open ipl file with group {}', group)
        gta3Img:close()
        return false
    end

    local ipl = IPL.load(iplFile)

    if (ipl) then
        IPL.loadedIPLs[group] = ipl
    end

    iplFile:close()
    gta3Img:close()

    return ipl
end

function IPL.unloadGroup(group)
    if (IPL.loadedIPLs[group]) then
        Logger.info('IPL', 'Unloading IPL group {}', group)

        IPL.loadedIPLs[group]:unload()
        IPL.loadedIPLs[group] = nil
    end
end

function IPL.clear()
    for group, ipl in pairs(IPL.loadedIPLs) do
        ipl:unload()
        IPL.loadedIPLs[group] = nil
    end
end