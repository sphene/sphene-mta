SharedOpcodeBoat = {}
SharedOpcodeBoat.__index = SharedOpcodeBoat

-- Opcode: 0x02D3
-- Instruction: boat_goto_coords [Boat] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02D3
function SharedOpcodeBoat.gotoCoordinates(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02D4
-- Instruction: boat_stop [Boat]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02D4
function SharedOpcodeBoat.stop(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02DB
-- Instruction: set_boat_cruise_speed [Boat] {maxSpeed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02DB
function SharedOpcodeBoat.setCruiseSpeed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0323
-- Instruction: anchor_boat [Boat] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0323
function SharedOpcodeBoat.anchor(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 02d3=4,boat %1d% drive_to %2d% %3d% %4d%
Opcode.register(0x02d3, SharedOpcodeBoat.gotoCoordinates, 4, 'boat_goto_coords ${1} ${2} ${3} ${4}', {false, true, false, false})
-- INI: 02d4=1,car %1d% turn_off_engine
Opcode.register(0x02d4, SharedOpcodeBoat.stop, 1, 'boat_stop ${1}', {false})
-- INI: 02db=2,set_boat %1d% speed_to %2d%
Opcode.register(0x02db, SharedOpcodeBoat.setCruiseSpeed, 2, 'set_boat_cruise_speed ${1} ${2}', {false, true})
-- INI: 0323=2,enable_boat %1d% anchor %2d%
Opcode.register(0x0323, SharedOpcodeBoat.anchor, 2, 'anchor_boat ${1} ${2}', {false, false})
