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


-- INI: 0219=10,%10d% = create_garage_type %9h% door %1d% %2d% %3d% to %6d% %7d% %8d% depth %4d% %5d%
Opcode.register(0x0219, ViceCityOpcodeGarage.create, 10, '${10} = set_garage ${9} ${1} ${2} ${3} ${6} ${7} ${8} ${4} ${5}', {false, false, false, false, false, false, false, false, false, true})
-- INI: 021c=1,  car_inside_garage %1d%
Opcode.register(0x021c, ViceCityOpcodeGarage.isCarInMission, 1, 'is_car_in_mission_garage ${1}', {false})
-- INI: 0329=1,  garage %1d% respray_done
Opcode.register(0x0329, ViceCityOpcodeGarage.hasResprayHappened, 1, 'has_respray_happened ${1}', {false})
-- INI: 03bb=1,set_garage %1d% door_type_to_swing_open
Opcode.register(0x03bb, ViceCityOpcodeGarage.setRotatingDoor, 1, 'set_rotating_garage_door ${1}', {false})
-- INI: 03d4=2,  garage %1d% contains_neededcar %2d%
Opcode.register(0x03d4, ViceCityOpcodeGarage.hasSlotBeenFilled, 2, 'has_import_garage_slot_been_filled ${1} ${2}', {false, false})
-- INI: 03da=1,set_garage %1d% camera_follows_player
Opcode.register(0x03da, ViceCityOpcodeGarage.noSpecialCameraForThisGarage, 1, 'no_special_camera_for_this_garage ${1}', {false})
-- INI: 057a=2,set_garage %1d% max_cars_to %2h%
Opcode.register(0x057a, ViceCityOpcodeGarage.setMaximumNumberOfCars, 2, 'set_maximum_number_of_cars_in_garage ${1} ${2}', {false, true})
