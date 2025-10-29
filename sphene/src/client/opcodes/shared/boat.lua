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


Opcode.register(0x02d3, SharedOpcodeBoat.gotoCoordinates, 'boat_goto_coords [Boat] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x02d4, SharedOpcodeBoat.stop, 'boat_stop [Boat]')
Opcode.register(0x02db, SharedOpcodeBoat.setCruiseSpeed, 'set_boat_cruise_speed [Boat] {maxSpeed} [float]')
Opcode.register(0x0323, SharedOpcodeBoat.anchor, 'anchor_boat [Boat] {state} [bool]')
