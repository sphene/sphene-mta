-----------------------------------
-- * Locals
-----------------------------------

-----------------------------------
-- * Variables
-----------------------------------

Txd = {}
Txd.__index = Txd

-----------------------------------
-- * Functions
-----------------------------------

function Txd:create()
    local mt = setmetatable({}, Txd)

    mt.dictionary = false

    return mt
end

function Txd:save(filePath)
    local bitStream = BitStream:create(nil)

    return bitStream:save(filePath)
end

function Txd.load(stream)
    local txd = Txd:create()
    local type = stream:readUInt32(BitStream.LITTLE_ENDIAN)

    if (type ~= 0x16) then
        return false
    end

    txd.dictionary = Dictionary.load(stream)

    stream:close()

    return txd
end

function Txd.merge(txd1, txd2)
    local mergedTxd = Txd:create()

    mergedTxd.dictionary = Dictionary:create()

    for i=1, #txd1.dictionary.rasters do
        mergedTxd.dictionary.rasters[#mergedTxd.dictionary.rasters + 1] = txd1.dictionary.rasters[i]
        Loader.yieldIfRequired()
    end

    for i=1, #txd2.dictionary.rasters do
        mergedTxd.dictionary.rasters[#mergedTxd.dictionary.rasters + 1] = txd2.dictionary.rasters[i]
        Loader.yieldIfRequired()
    end

    return mergedTxd
end

-----------------------------------
-- * Events
-----------------------------------