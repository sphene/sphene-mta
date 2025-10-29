-----------------------------------
-- * Variables
-----------------------------------

ImgArchive = {}
ImgArchive.__index = ImgArchive

ImgFile = {}
ImgFile.__index = ImgFile

-----------------------------------
-- * Functions
-----------------------------------

function ImgArchive:create(path)
    local mt = setmetatable({}, ImgArchive)

    mt.bitStream = BitStream:create(path, false)
    mt.path = path
    mt.files = {}

    mt:parseHeader()

    return mt
end

-- luacheck:ignore 211
function ImgArchive:parseHeader()
    local stream = self.bitStream
    local version = stream:readFixedString(4)

    if (version == "VER2") then
        local entries = stream:readInt32(BitStream.LITTLE_ENDIAN)

        for i=1,entries do
            local offset = stream:readInt32(BitStream.LITTLE_ENDIAN) * 2048
            local streamingSize = stream:readInt16(BitStream.LITTLE_ENDIAN) * 2048
            local size = stream:readInt16(BitStream.LITTLE_ENDIAN)
            local fileName = stream:readFixedString(24)

            self.files[fileName] = {
                offset = offset,
                size = streamingSize,
            }
        end
    else
        local dirFilePath = self.path:sub(0, -5)..".dir"

        if (not File.exists(dirFilePath)) then
            Logger.error('IMGARCHIVE', 'For ImgArchive {}, Cannot find {}', self.path, dirFilePath)
            stream:close()
            return
        end

        local dirStream = BitStream:create(dirFilePath, false)
        local index = 1

        while (not dirStream:isEOF()) do
            local offset = dirStream:readInt32(BitStream.LITTLE_ENDIAN) * 2048
            local size = dirStream:readInt32(BitStream.LITTLE_ENDIAN) * 2048
            local fileName = dirStream:readFixedString(24)

            self.files[fileName] = {
                offset = offset,
                size = size,
            }
        end

        dirStream:close()
    end
end

function ImgArchive:readFile(fileName)
    if (not self.bitStream) then
        return false
    end

    local file = self.files[fileName]

    if (file == nil) then
        return false
    end

    local stream = self.bitStream
    stream:setPos(file.offset)

    return stream:readBytes(file.size, nil, true)
end

function ImgArchive:exists(fileName)
    return (self.files[fileName] ~= nil)
end

function ImgArchive:openFile(fileName)
    local fileData = self.files[fileName]

    if (fileData == nil) then
        return
    end

    return ImgFile:create(self, fileData.offset, fileData.size)
end

function ImgArchive:extract(directory)
    if (directory == nil) then
        local path = self.path
        local lastSlash = path:find("[/\\][^/\\]*$")

        directory = path:sub(1, lastSlash)
    end

    for fileName, _ in pairs(self.files) do
        local filePath = directory.."/"..fileName
        local fileData = self:readFile(fileName)
        local skipExtract = false

        if (not fileData) then
            Logger.error('IMGARCHIVE', 'For ImgArchive {}, Unable to find {}', self.path, fileName)
            return false
        end

        if (fileExists(filePath)) then
            local fileOnDisk = fileOpen(filePath)

            if (fileOnDisk) then
                local fileOnDiskHash = hash('sha1', fileRead(fileOnDisk, fileGetSize(fileOnDisk)))

                if (hash('sha1', fileData) == fileOnDiskHash) then
                    skipExtract = true
                    Logger.info('IMGARCHIVE', 'For ImgArchive {}, skipping extracting {} (hashes match)', self.path, fileName)
                end

                fileClose(fileOnDisk)
            end
        end

        if (not skipExtract) then
            local file = fileCreate(filePath)

            if (file) then
                Logger.info('IMGARCHIVE', 'For ImgArchive {}, Extracting {}', self.path, fileName)
                fileWrite(file, fileData)
                fileClose(file)
            else
                Logger.error('IMGARCHIVE', 'For ImgArchive {}, Unable to extract {}', self.path, fileName)
                return false
            end
        end

        Loader.yieldIfRequired()
    end

    return true
end

function ImgArchive:close()
    self.files = {}

    if (self.bitStream) then
        self.bitStream:close()
    end
end

function ImgFile:create(archive, offset, size)
    local mt = setmetatable({}, ImgFile)

    mt.archive = archive
    mt.offset = offset
    mt.size = size
    mt.position = 0

    return mt
end

function ImgFile:setOffset(offset)
    return self:setPos(self:getPos() + offset)
end

function ImgFile:setPos(position)
    if (position < 0) then
        return false
    end

    if (position > self.size) then
        position = self.size
    end

    self.position = position

    return true
end

function ImgFile:getPos()
    return self.position
end

function ImgFile:getSize()
    return self.size
end

function ImgFile:isEOF()
    if (self.position >= self.size) then
        return true
    end

    return false
end

function ImgFile:read(bytes)
    if (self.position + bytes > self.size) then
        bytes = self.size - self.position
    end

    self.archive.bitStream:setPos(self.offset + self.position)

    local result = self.archive.bitStream:readBytes(bytes, nil, true)

    self:setOffset(bytes)

    return result
end

function ImgFile:close()
    self.archive = nil
    self.offset = nil
    self.size = nil
    self.position = nil
end