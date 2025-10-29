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


Opcode.register(0x0556, ViceCityOpcodeShortcut.setUpTaxi, 'set_up_taxi_shortcut {pickUpX} [float] {pickUpY} [float] {pickUpZ} [float] {pickUpAngle} [float] {dropoffX} [float] {dropoffY} [float] {dropoffZ} [float] {dropoffAngle} [float]')
Opcode.register(0x0557, ViceCityOpcodeShortcut.clearTaxi, 'clear_taxi_shortcut')
Opcode.register(0x058d, ViceCityOpcodeShortcut.setPickupPoint, 'set_shortcut_pickup_point {x} [float] {y} [float] {z} [float] {angle} [float]')
Opcode.register(0x058e, ViceCityOpcodeShortcut.setDropoffPointForMission, 'set_shortcut_dropoff_point_for_mission {x} [float] {y} [float] {z} [float] {angle} [float]')
