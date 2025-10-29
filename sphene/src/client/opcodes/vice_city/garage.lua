ViceCityOpcodeGarage = {}
ViceCityOpcodeGarage.__index = ViceCityOpcodeGarage

-- Opcode: 0x0219
-- Instruction: [var handle: Garage] = set_garage {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {frontX} [float] {frontY} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {type} [GarageType]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0219
function ViceCityOpcodeGarage.create(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x021C
-- Instruction: is_car_in_mission_garage [Garage]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/021C
function ViceCityOpcodeGarage.isCarInMission(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0329
-- Instruction: has_respray_happened [Garage]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0329
function ViceCityOpcodeGarage.hasResprayHappened(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03BB
-- Instruction: set_rotating_garage_door [Garage]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03BB
function ViceCityOpcodeGarage.setRotatingDoor(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03D4
-- Instruction: has_import_garage_slot_been_filled [Garage] {importSlot} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03D4
function ViceCityOpcodeGarage.hasSlotBeenFilled(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03DA
-- Instruction: no_special_camera_for_this_garage [Garage]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03DA
function ViceCityOpcodeGarage.noSpecialCameraForThisGarage(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x057A
-- Instruction: set_maximum_number_of_cars_in_garage [Garage] {max} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/057A
function ViceCityOpcodeGarage.setMaximumNumberOfCars(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0219, ViceCityOpcodeGarage.create, '[var handle: Garage] = set_garage {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {frontX} [float] {frontY} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {type} [GarageType]')
Opcode.register(0x021c, ViceCityOpcodeGarage.isCarInMission, 'is_car_in_mission_garage [Garage]')
Opcode.register(0x0329, ViceCityOpcodeGarage.hasResprayHappened, 'has_respray_happened [Garage]')
Opcode.register(0x03bb, ViceCityOpcodeGarage.setRotatingDoor, 'set_rotating_garage_door [Garage]')
Opcode.register(0x03d4, ViceCityOpcodeGarage.hasSlotBeenFilled, 'has_import_garage_slot_been_filled [Garage] {importSlot} [int]')
Opcode.register(0x03da, ViceCityOpcodeGarage.noSpecialCameraForThisGarage, 'no_special_camera_for_this_garage [Garage]')
Opcode.register(0x057a, ViceCityOpcodeGarage.setMaximumNumberOfCars, 'set_maximum_number_of_cars_in_garage [Garage] {max} [int]')
