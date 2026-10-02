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


-- INI: 021b=2,set_garage %1d% to_accept_car %2d%
Opcode.register(0x021b, SharedOpcodeGarage.setTargetCarForMission, 2, 'set_target_car_for_mission_garage ${1} ${2}', {false, false})
-- INI: 02fa=2,garage %1d% change_to_type %2d%
Opcode.register(0x02fa, SharedOpcodeGarage.changeType, 2, 'change_garage_type ${1} ${2}', {false, true})
-- INI: 0360=1,open_garage %1d%
Opcode.register(0x0360, SharedOpcodeGarage.open, 1, 'open_garage ${1}', {false})
-- INI: 0361=1,close_garage %1d%
Opcode.register(0x0361, SharedOpcodeGarage.close, 1, 'close_garage ${1}', {false})
-- INI: 03b0=1,  garage %1d% door_open
Opcode.register(0x03b0, SharedOpcodeGarage.isOpen, 1, 'is_garage_open ${1}', {false})
-- INI: 03b1=1,  garage %1d% door_closed
Opcode.register(0x03b1, SharedOpcodeGarage.isClosed, 1, 'is_garage_closed ${1}', {false})
