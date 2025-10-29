ViceCityOpcodePickup = {}
ViceCityOpcodePickup.__index = ViceCityOpcodePickup

-- Opcode: 0x055B
-- Instruction: [var handle: Pickup] = create_clothes_pickup {x} [float] {y} [float] {z} [float] {type} [Clothing]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/055B
function ViceCityOpcodePickup.createClothes(posX, posY, posZ, type, _)
   Script.setOpcodePartiallyImplemented()

    local pickup = PickupElement:create(type, 1275)
    pickup:spawn(posX, posY, posZ)

    return pickup
end


Opcode.register(0x055b, ViceCityOpcodePickup.createClothes, '[var handle: Pickup] = create_clothes_pickup {x} [float] {y} [float] {z} [float] {type} [Clothing]')
