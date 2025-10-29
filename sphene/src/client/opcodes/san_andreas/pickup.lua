SanAndreasOpcodePickup = {}
SanAndreasOpcodePickup.__index = SanAndreasOpcodePickup

-- Opcode: 0x065B
-- Instruction: [var x: float], [var y: float], [var z: float] = get_pickup_coordinates [Pickup]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/065B
function SanAndreasOpcodePickup.getCoordinates(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x094A
-- Instruction: update_pickup_money_per_day [Pickup] {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/094A
function SanAndreasOpcodePickup.updateMoneyPerDay(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0958
-- Instruction: [var handle: Pickup] = create_snapshot_pickup {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0958
function SanAndreasOpcodePickup.createSnapshot()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0959
-- Instruction: [var handle: Pickup] = create_horseshoe_pickup {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0959
function SanAndreasOpcodePickup.createHorseshoe()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x095A
-- Instruction: [var handle: Pickup] = create_oyster_pickup {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/095A
function SanAndreasOpcodePickup.createOyster(posX, posY, posZ, _)
    --@TODO: Re-add oyster support
end

-- Opcode: 0x09D1
-- Instruction: does_pickup_exist {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09D1
function SanAndreasOpcodePickup.doesExist(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E34
-- Instruction: [var modelId: model_any] = get_pickup_model [Pickup]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E34
function SanAndreasOpcodePickup.getModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E38
-- Instruction: [var pointer: int] = get_pickup_pointer [Pickup]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E38
function SanAndreasOpcodePickup.getPointer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E39
-- Instruction: [var type: PickupType] = get_pickup_type [Pickup]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E39
function SanAndreasOpcodePickup.getType(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x065b, SanAndreasOpcodePickup.getCoordinates, '[var x: float], [var y: float], [var z: float] = get_pickup_coordinates [Pickup]')
Opcode.register(0x094a, SanAndreasOpcodePickup.updateMoneyPerDay, 'update_pickup_money_per_day [Pickup] {value} [int]')
Opcode.register(0x0958, SanAndreasOpcodePickup.createSnapshot, '[var handle: Pickup] = create_snapshot_pickup {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0959, SanAndreasOpcodePickup.createHorseshoe, '[var handle: Pickup] = create_horseshoe_pickup {x} [float] {y} [float] {z} [float]')
Opcode.register(0x095a, SanAndreasOpcodePickup.createOyster, '[var handle: Pickup] = create_oyster_pickup {x} [float] {y} [float] {z} [float]')
Opcode.register(0x09d1, SanAndreasOpcodePickup.doesExist, 'does_pickup_exist {handle} [any]')
Opcode.register(0x0e34, SanAndreasOpcodePickup.getModel, '[var modelId: model_any] = get_pickup_model [Pickup]')
Opcode.register(0x0e38, SanAndreasOpcodePickup.getPointer, '[var pointer: int] = get_pickup_pointer [Pickup]')
Opcode.register(0x0e39, SanAndreasOpcodePickup.getType, '[var type: PickupType] = get_pickup_type [Pickup]')
