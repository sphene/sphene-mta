ViceCityOpcodeShortcut = {}
ViceCityOpcodeShortcut.__index = ViceCityOpcodeShortcut

-- Opcode: 0x0556
-- Instruction: set_up_taxi_shortcut {pickUpX} [float] {pickUpY} [float] {pickUpZ} [float] {pickUpAngle} [float] {dropoffX} [float] {dropoffY} [float] {dropoffZ} [float] {dropoffAngle} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0556
function ViceCityOpcodeShortcut.setUpTaxi(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0557
-- Instruction: clear_taxi_shortcut
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0557
function ViceCityOpcodeShortcut.clearTaxi()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x058D
-- Instruction: set_shortcut_pickup_point {x} [float] {y} [float] {z} [float] {angle} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/058D
function ViceCityOpcodeShortcut.setPickupPoint(_, _, _, _)
    return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x058E
-- Instruction: set_shortcut_dropoff_point_for_mission {x} [float] {y} [float] {z} [float] {angle} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/058E
function ViceCityOpcodeShortcut.setDropoffPointForMission(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0556=8,create_cab %1d% %2d% %3d% %4d% %5d% %6d% %7d% %8d%
Opcode.register(0x0556, ViceCityOpcodeShortcut.setUpTaxi, 8, 'set_up_taxi_shortcut ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0557=0,release_cab
Opcode.register(0x0557, ViceCityOpcodeShortcut.clearTaxi, 0, 'clear_taxi_shortcut', {})
-- INI: 058d=4,set_restart_mission_taxi_start %1d% %2d% %3d% angle %4d%
Opcode.register(0x058d, ViceCityOpcodeShortcut.setPickupPoint, 4, 'set_shortcut_pickup_point ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 058e=4,set_restart_mission_taxi_destination %1d% %2d% %3d% %4d%
Opcode.register(0x058e, ViceCityOpcodeShortcut.setDropoffPointForMission, 4, 'set_shortcut_dropoff_point_for_mission ${1} ${2} ${3} ${4}', {false, false, false, false})
