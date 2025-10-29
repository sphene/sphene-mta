-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _utf8_char = utf8.char
local _utf8_byte = utf8.byte
local _string_byte = string.byte
local _string_char = string.char
local _math_abs = math.abs
local _math_frexp = math.frexp
local _math_floor = math.floor
local _math_ldexp = math.ldexp
local _bitAnd = bitAnd

-----------------------------------
-- * Variables
-----------------------------------

BitStream = {}
BitStream.__index = BitStream

BitStream.LITTLE_ENDIAN = 0
BitStream.BIG_ENDIAN = 1

-----------------------------------
-- * Functions
-----------------------------------

function BitStream:create(path, preload)
    local mt = setmetatable({}, BitStream)

    if (path == nil) then
        mt.data = {}
        mt.preload = true
        mt.position = 0

        return mt
    end

    local file

    if (type(path) == "table") then
        file = path
    elseif (type(path) == 'userdata') then
        file = path
        file:setPos(0)
    else
        file = fileOpen(path, true)
    end

    if (preload) then
        local isEOF = file.isEOF
        local read = file.read
        local fileSize = file:getSize()

        mt.data = {}

        while (not isEOF(file) and #mt.data < fileSize) do
            mt.data[#mt.data + 1] = read(file, 1)
        end

        fileClose(file)
    else
        if (not file) then
            Logger.error('BITSTREAM', 'Unable to open file: {}.', path)
            return false
        end

        mt.file = file
        mt.fileSize = file:getSize()
    end

    mt.position = 0
    mt.preload = preload
    return mt
end

function BitStream:setPos(position)
    if (position < 0) then
        return false
    end

    if (self.preload) then
        if (position > #self.data) then
            position = #self.data

        end
    else
        self.file:setPos(position)
        position = self.file:getPos()
    end

    self.position = position

    return true
end

function BitStream:setOffset(offset)
    return self:setPos(self:getPos() + offset)
end

function BitStream:getPos()
    if (not self.preload) then
        return self.file:getPos()
    end
    return self.position
end

function BitStream:getSize()
    if (not self.preload) then
        return self.fileSize
    end
    return #self.data
end

function BitStream:isEOF()
    if (not self.preload) then
        return ((self:getPos() >= self.fileSize) or self.file:isEOF())
    elseif (self.position >= #self.data) then
        return true
    end

    return false
end

function BitStream:writeByte(byte)
    if (not self.preload) then
        self.file:write(_string_char(byte))
    else
        if (type(byte) == 'number') then
            self.data[#self.data + 1] = _string_char(byte)
        else
            self.data[#self.data + 1] = byte
        end
    end
end

function BitStream:writeBytes(bytes)
    for i=1, #bytes do
        self:writeByte(bytes:sub(i, i))
    end
end

function BitStream:writeInt8(byte)
    self:writeByte(byte)
end

function BitStream:writeInt16(value, endianType)
    endianType = endianType or BitStream.BIG_ENDIAN

    if (endianType == BitStream.LITTLE_ENDIAN) then
        self:writeByte(_bitAnd(value, 0x00FF))
        self:writeByte(_bitAnd(0xFF00, value) / 256)
    else
        self:writeByte(_bitAnd(0xFF00, value) / 256)
        self:writeByte(_bitAnd(value, 0x00FF))
    end
end

function BitStream:writeInt32(value, endianType)
    endianType = endianType or BitStream.BIG_ENDIAN

    if (endianType == BitStream.LITTLE_ENDIAN) then
        self:writeByte(_bitAnd(value, 0x000000FF))
        self:writeByte(_bitAnd(0x0000FF00, value) / 256)
        self:writeByte(_bitAnd(0x00FF0000, value) / 65536)
        self:writeByte(_bitAnd(0xFF000000, value) / 16777216)
    else
        self:writeByte(_bitAnd(0xFF000000, value) / 16777216)
        self:writeByte(_bitAnd(0x00FF0000, value) / 65536)
        self:writeByte(_bitAnd(0x0000FF00, value) / 256)
        self:writeByte(_bitAnd(value, 0x000000FF))
    end
end

function BitStream:writeFloat(value, endianType)
    endianType = endianType or BitStream.BIG_ENDIAN

    local sign
    local mantissa
    local exponent

    if (value == 0) then
        mantissa = 0
        exponent = 0
        sign = 0
    else
        sign = (value < 0) and 1 or 0
        value = _math_abs(value)

        mantissa, exponent = _math_frexp(value)
        mantissa = (mantissa * 2 - 1) * 8388608
        exponent = exponent + 126
    end

    self:writeInt32(_bitAnd(0x80000000, _math_ldexp(sign, 31)) + _bitAnd(0x7F800000, _math_ldexp(exponent, 23)) + _bitAnd(0x007FFFFF, _math_floor(mantissa + 0.5)), endianType)
end

function BitStream:writeString(str, nullTerminated)
    nullTerminated = nullTerminated or false

    for i=1, #str do
        self:writeByte(_string_byte(str, i))
    end

    if (nullTerminated) then
        self:writeByte(0)
    end
end

function BitStream:readByte(disableConversion)
    local byte

    if (not self.preload) then
        byte = self.file:read(1)
    else
        self:setPos(self.position + 1)
        byte = self.data[self.position]
    end

    if (not disableConversion) then
        return _utf8_byte(byte)
    end

    return byte
end

function BitStream:readUInt8()
    return self:readByte()
end

function BitStream:readInt8()
    local byte = self:readByte()

    if (byte >= 0x80) then
        byte = -((0xFF - byte) + 1)
    end

    return byte
end

function BitStream:readBytes(count, endianType, asDirectStream)
    local readByte = self.readByte
    local isEOF = self.isEOF

    if (asDirectStream and not self.preload) then
        return self.file:read(count)
    elseif (asDirectStream) then
        local bytes = ""

        while (#bytes < count and not isEOF(self)) do
            bytes = bytes..readByte(self, true)
        end

        return bytes
    end

    endianType = endianType or BitStream.BIG_ENDIAN

    if (endianType == BitStream.LITTLE_ENDIAN) then
        local bytes = {}
        local revBytes = {}

        while (#bytes < count and not isEOF(self)) do
            bytes[#bytes + 1] = readByte(self)
        end

        for i=1,#bytes do
            revBytes[i] = bytes[(#bytes - i) + 1]
        end

        return revBytes
    else
        local bytes = {}

        while (#bytes < count and not isEOF(self)) do
            bytes[#bytes + 1] = readByte(self)
        end

        return bytes
    end
end

function BitStream:readUInt16(endianType)
    local bytes = self:readBytes(2, endianType)

    if (#bytes == 1) then
        return bytes[1]
    end

    return bytes[1] * 256 + bytes[2]
end

function BitStream:readInt16(endianType)
    local bytes = self:readBytes(2, endianType)

    if (#bytes == 1) then
        return bytes[1]
    end

    local value = bytes[1] * 256 + bytes[2]

    if (value >= 0x8000) then
        value = -((0xFFFF - value) + 1)
    end

    return value
end

function BitStream:readUInt32(endianType)
    local bytes = self:readBytes(4, endianType)
    return bytes[1] * 16777216 + bytes[2] * 65536 + bytes[3] * 256 + bytes[4]
end

function BitStream:readInt32(endianType)
    local bytes = self:readBytes(4, endianType)
    local value = bytes[1] * 16777216 + bytes[2] * 65536 + bytes[3] * 256 + bytes[4]

    if (triggerClientEvent and value >= 0x8000000000000000) then
        value = -((0xFFFFFFFFFFFFFFFF - value) + 1)
    elseif (value >= 0x80000000) then
        value = -((0xFFFFFFFF - value) + 1)
    end

    return value
end

function BitStream:readFloat(endianType)
    endianType = endianType or BitStream.LITTLE_ENDIAN

    local readByte = self.readByte
    local value = readByte(self, true)

    value = readByte(self, true)..value
    value = readByte(self, true)..value
    value = readByte(self, true)..value

    local byte1, byte2, byte3, byte4

    if (endianType == BitStream.LITTLE_ENDIAN) then
        byte1, byte2, byte3, byte4 = _string_byte(value, 1, 4)
    else
        byte4, byte3, byte2, byte1 = _string_byte(value, 1, 4)
    end

    local exponent = (byte1 % 128) * 2 + _math_floor(byte2 / 128)

    if (exponent == 0) then
        return 0
    end

    local sign = (byte1 > 127) and -1 or 1
    local mantissa = ((byte2 % 128) * 256 + byte3) * 256 + byte4

    mantissa = (_math_ldexp(mantissa, -23) + 1) * sign

    return _math_ldexp(mantissa, exponent - 127)
end

function BitStream:readFixedString(bytes)
    local string = ""
    local charsRead = 0
    local appendString = true

    local readByte = self.readByte
    local isEOF = self.isEOF

    while (charsRead < bytes and not isEOF(self)) do
        local byte = readByte(self)

        if (byte ~= nil) then
            if (byte < 0x20 or byte == 0xCC) then
                byte = 0x20
                appendString = false
            end

            if (appendString) then
                string = string.._utf8_char(byte)
            end
        end

        charsRead = charsRead + 1
    end

    return string
end

function BitStream:readVariableString()
    local string = ""
    local readByte = self.readByte

    while (not self:isEOF()) do
        local byte = readByte(self)

        if (byte ~= nil) then
            if (byte == '\0' or byte == 0x0) then
                return string
            end

            string = string.._utf8_char(byte)
        end
    end

    return string
end

function BitStream:close()
    if (self.preload) then
        self.data = {}
        collectgarbage("collect")
    else
        self.file:close()
    end
end