-----------------------------------
-- * Locals
-----------------------------------

local _bitAnd = bitAnd
local _bitOr = bitOr
local _bitRShift = bitRShift

-----------------------------------
-- * Variables
-----------------------------------

Raster = {}
Raster.__index = Raster

-----------------------------------
-- * Functions
-----------------------------------

function Raster:create()
    local mt = setmetatable({}, Raster)

    mt.type = "Raster"
    mt.platformId = 0
    mt.flags = 0

    mt.filterMode = 0
    mt.uAddressing = 0
    mt.vAddressing = 0

    mt.textureName = ""
    mt.maskName = ""

    mt.rasterFormat = 0

    mt.d3dFormat = ""

    mt.width = 0
    mt.height = 0
    mt.depth = 0
    mt.mipmapCount = 0
    mt.rasterType = 0

    mt.compressionFlags = 0

    mt.alpha = false
    mt.cubeTexture = false
    mt.autoMipMaps = false
    mt.compressed = false

    mt.texture = false

    return mt
end

-- luacheck:ignore 211
function Raster.load(stream)
    local startPosition = stream:getPos() - 4
    local raster = Raster:create()

    local size = stream:readUInt32(BitStream.LITTLE_ENDIAN)
    local version = stream:readUInt32(BitStream.LITTLE_ENDIAN)

    local structType = stream:readUInt32(BitStream.LITTLE_ENDIAN)
    local structSize = stream:readUInt32(BitStream.LITTLE_ENDIAN)
    local structVersion = stream:readUInt32(BitStream.LITTLE_ENDIAN)

    raster.platformId = stream:readUInt32(BitStream.LITTLE_ENDIAN)
    raster.flags = stream:readUInt32(BitStream.LITTLE_ENDIAN)

    raster.filterMode = _bitAnd(raster.flags, 0xFF)
    raster.uAddressing = _bitRShift(_bitAnd(raster.flags, 0xF00), 8)
    raster.vAddressing = _bitRShift(_bitAnd(raster.flags, 0xF000), 12)

    raster.textureName = stream:readFixedString(32)
    raster.maskName = stream:readFixedString(32)

    raster.rasterFormat = stream:readUInt32(BitStream.LITTLE_ENDIAN)

    raster.d3dFormat = stream:readFixedString(4)

    raster.width = stream:readUInt16(BitStream.LITTLE_ENDIAN)
    raster.height = stream:readUInt16(BitStream.LITTLE_ENDIAN)
    raster.depth = stream:readUInt8()
    raster.mipmapCount = stream:readUInt8()
    raster.mipmapCount = 1
    raster.rasterType = stream:readUInt8()

    raster.compressionFlags = stream:readUInt8()

    raster.alpha = _bitAnd(raster.compressionFlags, 0x1) ~= 0
    raster.cubeTexture = _bitAnd(raster.compressionFlags, 0x2) ~= 0
    raster.autoMipMaps = _bitAnd(raster.compressionFlags, 0x4) ~= 0
    raster.compressed = _bitAnd(raster.compressionFlags, 0x8) ~= 0

    raster.mipmaps = {}

    local textureStream = BitStream:create()

    -- We only process the first mipmap
    local mipmapSize = stream:readUInt32(BitStream.LITTLE_ENDIAN)

    if (mipmapSize <= 1100000) then
        local textureData = stream:readBytes(mipmapSize, BitStream.BIG_ENDIAN, true)

        if (not raster.compressed) then
            local plain = ""

            for j=1, mipmapSize, 4 do
                local b = textureData:byte(j)
                local g = textureData:byte(j + 1)
                local r = textureData:byte(j + 2)
                local a = textureData:byte(j + 3)

                plain = plain..string.char(b, g, r, a)

                Loader.yieldIfRequired()
            end

            textureStream:writeInt16(raster.width, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt16(raster.height, BitStream.LITTLE_ENDIAN)

            textureStream:setPos(0)

            raster.texture = textureData..textureStream:readBytes(textureStream:getSize(), BitStream.BIG_ENDIAN, true)
        else
            textureStream:writeString("DDS ")
            textureStream:writeInt32(124, BitStream.LITTLE_ENDIAN)

            local flags = 0x1 + 0x2 + 0x4 + 0x1000

            if (raster.mipmapCount > 1) then
                flags = _bitOr(flags, 0x20000)
            end

            if (raster.compressed) then
                flags = _bitOr(flags, 0x80000)
            end

            textureStream:writeInt32(flags, BitStream.LITTLE_ENDIAN)

            textureStream:writeInt32(raster.height, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(raster.width, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(mipmapSize, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(raster.mipmapCount, BitStream.LITTLE_ENDIAN)

            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)

            textureStream:writeInt32(0x20, BitStream.LITTLE_ENDIAN)

            flags = 0

            if (raster.d3dFormat == "DXT1" or raster.d3dFormat == "DXT3" or raster.d3dFormat == "DXT5") then
                flags = _bitOr(flags, 0x4)
            end

            textureStream:writeInt32(flags, BitStream.LITTLE_ENDIAN)
            textureStream:writeString(raster.d3dFormat)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)

            local caps = 0x1000

            if (raster.mipmapCount > 1) then
                caps = _bitOr(caps, 0x8)
                caps = _bitOr(caps, 0x400000)
            end

            textureStream:writeInt32(caps, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)
            textureStream:writeInt32(0, BitStream.LITTLE_ENDIAN)

            textureStream:setPos(0)

            raster.texture = textureStream:readBytes(textureStream:getSize(), BitStream.BIG_ENDIAN, true)
                ..textureData
        end
    else
        textureStream:close()
        stream:setPos(startPosition + size)
    end

    stream:setPos(startPosition + size)

    local extType = stream:readUInt32(BitStream.LITTLE_ENDIAN)
    local extSize = stream:readUInt32(BitStream.LITTLE_ENDIAN)
    local extVersion = stream:readUInt32(BitStream.LITTLE_ENDIAN)

    stream:setOffset(extSize)

    return raster
end

-----------------------------------
-- * Events
-----------------------------------