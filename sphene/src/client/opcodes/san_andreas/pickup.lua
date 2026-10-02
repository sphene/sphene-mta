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


-- INI: 065B=4,store_pickup %1d% position_to %2d% %3d% %4d%
Opcode.register(0x065b, SanAndreasOpcodePickup.getCoordinates, 4, '${1}, ${2}, ${3} = get_pickup_coordinates ${4}', {false, true, true, true})
-- INI: 094A=2,set_money_pickup %1d% cash_to %2d%
Opcode.register(0x094a, SanAndreasOpcodePickup.updateMoneyPerDay, 2, 'update_pickup_money_per_day ${1} ${2}', {false, false})
-- INI: 0958=4,%4d% = create_photo_at %1d% %2d% %3d%
Opcode.register(0x0958, SanAndreasOpcodePickup.createSnapshot, 4, '${4} = create_snapshot_pickup ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0959=4,%4d% = create_horseshoe_at %1d% %2d% %3d%
Opcode.register(0x0959, SanAndreasOpcodePickup.createHorseshoe, 4, '${4} = create_horseshoe_pickup ${1} ${2} ${3}', {false, false, false, true})
-- INI: 095A=4,%4d% = create_oyster_at %1d% %2d% %3d%
Opcode.register(0x095a, SanAndreasOpcodePickup.createOyster, 4, '${4} = create_oyster_pickup ${1} ${2} ${3}', {false, false, false, true})
-- INI: 09D1=1,  pickup %1d% created
Opcode.register(0x09d1, SanAndreasOpcodePickup.doesExist, 1, 'does_pickup_exist ${1}', {false})
-- INI: 0E34=2,get_pickup_model %1d% %2d%
Opcode.register(0x0e34, SanAndreasOpcodePickup.getModel, 2, '${1} = get_pickup_model ${2}', {false, false})
-- INI: 0E38=2,get_pickup_pointer %1d% store_to %2d%
Opcode.register(0x0e38, SanAndreasOpcodePickup.getPointer, 2, '${1} = get_pickup_pointer ${2}', {true, false})
-- INI: 0E39=2,get_pickup_type %1d% store_to %2d%
Opcode.register(0x0e39, SanAndreasOpcodePickup.getType, 2, '${1} = get_pickup_type ${2}', {true, false})
