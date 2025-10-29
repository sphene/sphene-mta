-----------------------------------
-- * Variables
-----------------------------------

Carrec = {}
Carrec.__index = Carrec

Carrec.data = {}

-----------------------------------
-- * Functions
-----------------------------------

function Carrec.load(pathId)
    local carrecFileName = "carrec"..string.format("%03d", pathId)..".rrr"
    local imgArchive = ImgArchive:create("data/game/san_andreas/data/Paths/carrec.img")
    local carrecFile = imgArchive:openFile(carrecFileName)

    if (not carrecFile) then
        Logger.error('CARREC', "Carrec file not found {}.", carrecFileName)
        imgArchive:close()
        return false
    end

    local stream = BitStream:create(carrecFile, false)
    local carrecData = {}

    Logger.info('CARREC', "Loading {}.", carrecFileName)

    local i = 0
    while (not carrecFile:isEOF()) do
        local timeInMs = stream:readInt32(BitStream.LITTLE_ENDIAN)
        local velX = stream:readInt16(BitStream.LITTLE_ENDIAN) / 16383.5
        local velY = stream:readInt16(BitStream.LITTLE_ENDIAN) / 16383.5
        local velZ = stream:readInt16(BitStream.LITTLE_ENDIAN) / 16383.5
        local rightX = stream:readInt8() / 127.0
        local rightY = stream:readInt8() / 127.0
        local rightZ = stream:readInt8() / 127.0
        local topX = stream:readInt8() / 127.0
        local topY = stream:readInt8() / 127.0
        local topZ = stream:readInt8() / 127.0
        local steeringAngle = stream:readInt8() / 20.0
        local gasPaddlePower = stream:readInt8() / 100.0
        local brakePaddlePower = stream:readInt8() / 100.0
        local handbrakeUsed = stream:readInt8()
        local posX = stream:readFloat()
        local posY = stream:readFloat()
        local posZ = stream:readFloat()

        if (timeInMs == 0 and i > 0) then
            break
        end

        carrecData[#carrecData + 1] =
            {
                ["time"] = timeInMs,
                ["velX"] = velX,
                ["velY"] = velY,
                ["velZ"] = velZ,
                ["rightX"] = rightX,
                ["rightY"] = rightY,
                ["rightZ"] = rightZ,
                ["topX"] = topX,
                ["topY"] = topY,
                ["topZ"] = topZ,
                ["steeringAngle"] = steeringAngle,
                ["gasPaddlePower"] = gasPaddlePower,
                ["brakePaddlePower"] = brakePaddlePower,
                ["handbrakeUsed"] = handbrakeUsed,
                ["posX"] = posX,
                ["posY"] = posY,
                ["posZ"] = posZ
            }

        i = i + 1
    end

    carrecFile:close()
    imgArchive:close()
    stream:close()

    Carrec.data[pathId] = carrecData
end

function Carrec.release(pathId)
    Carrec.data[pathId] = nil
end

function Carrec.isAvailable(pathId)
    return (Carrec.data[pathId] ~= nil)
end

function Carrec.get(pathId)
    return Carrec.data[pathId] or false
end