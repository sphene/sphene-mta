-----------------------------------
-- * Locals
-----------------------------------

-----------------------------------
-- * Variables
-----------------------------------

Dictionary = {}
Dictionary.__index = Dictionary

-----------------------------------
-- * Functions
-----------------------------------

function Dictionary:create()
    local mt = setmetatable({}, Dictionary)

    mt.type = "Dictionary"
    mt.rasters = {}

    return mt
end

function Dictionary:getRasters()
    return self.rasters
end

-- luacheck:ignore 211
function Dictionary.load(stream)
    local startPosition = stream:getPos() - 4
    local dictionary = Dictionary:create()

    local size = stream:readUInt32(BitStream.LITTLE_ENDIAN)
    local version = stream:readUInt32(BitStream.LITTLE_ENDIAN)

    local structType = stream:readUInt32(BitStream.LITTLE_ENDIAN)
    local structSize = stream:readUInt32(BitStream.LITTLE_ENDIAN)
    local structVersion = stream:readUInt32(BitStream.LITTLE_ENDIAN)

    local textureCount = stream:readUInt16(BitStream.LITTLE_ENDIAN)
    local deviceId = stream:readUInt16(BitStream.LITTLE_ENDIAN)

    while (not stream:isEOF() and stream:getPos() < startPosition + size) do
        local type = stream:readUInt32(BitStream.LITTLE_ENDIAN)

        if (type == 0x15) then
            dictionary.rasters[#dictionary.rasters + 1] = Raster.load(stream)
        elseif (type == 0x03) then
            local extType = stream:readUInt32(BitStream.LITTLE_ENDIAN)
            local extSize = stream:readUInt32(BitStream.LITTLE_ENDIAN)
            local extVersion = stream:readUInt32(BitStream.LITTLE_ENDIAN)

            stream:setOffset(extSize)
        else
            size = stream:readUInt32(BitStream.LITTLE_ENDIAN)
            stream:setOffset(size + 4)
        end

        Loader.yieldIfRequired()
    end

    return dictionary
end

-----------------------------------
-- * Events
-----------------------------------