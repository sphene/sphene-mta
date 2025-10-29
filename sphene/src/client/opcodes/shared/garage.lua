SharedOpcodeGarage = {}
SharedOpcodeGarage.__index = SharedOpcodeGarage

-- Opcode: 0x021B
-- Instruction: set_target_car_for_mission_garage {garageName} [GarageName] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/021B
function SharedOpcodeGarage.setTargetCarForMission(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02FA
-- Instruction: change_garage_type {garageId} [string] {type} [GarageType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02FA
function SharedOpcodeGarage.changeType(name, type)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0360
-- Instruction: open_garage {garageId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0360
function SharedOpcodeGarage.open(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0361
-- Instruction: close_garage {garageId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0361
function SharedOpcodeGarage.close(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03B0
-- Instruction: is_garage_open {garageId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03B0
function SharedOpcodeGarage.isOpen(_)
    Script.setOpcodePartiallyImplemented()
    return false
end

-- Opcode: 0x03B1
-- Instruction: is_garage_closed {garageId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03B1
function SharedOpcodeGarage.isClosed(_)
    Script.setOpcodePartiallyImplemented()
    return true
end


Opcode.register(0x021b, SharedOpcodeGarage.setTargetCarForMission, 'set_target_car_for_mission_garage {garageName} [GarageName] {vehicle} [Car]')
Opcode.register(0x02fa, SharedOpcodeGarage.changeType, 'change_garage_type {garageId} [string] {type} [GarageType]')
Opcode.register(0x0360, SharedOpcodeGarage.open, 'open_garage {garageId} [string]')
Opcode.register(0x0361, SharedOpcodeGarage.close, 'close_garage {garageId} [string]')
Opcode.register(0x03b0, SharedOpcodeGarage.isOpen, 'is_garage_open {garageId} [string]')
Opcode.register(0x03b1, SharedOpcodeGarage.isClosed, 'is_garage_closed {garageId} [string]')
