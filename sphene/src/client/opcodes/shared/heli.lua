SharedOpcodeHeli = {}
SharedOpcodeHeli.__index = SharedOpcodeHeli

-- Opcode: 0x04A2
-- Instruction: heli_goto_coords [Heli] {x} [float] {y} [float] {z} [float] {minAltitude} [float] {maxAltitude} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04A2
function SharedOpcodeHeli.gotoCoords()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x04D0
-- Instruction: set_heli_orientation [Heli] {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04D0
function SharedOpcodeHeli.setOrientation(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04D1
-- Instruction: clear_heli_orientation [Heli]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04D1
function SharedOpcodeHeli.clearOrientation(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04DF
-- Instruction: set_heli_stabiliser [Heli] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04DF
function SharedOpcodeHeli.setStabiliser(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0541
-- Instruction: fire_hunter_gun [Heli]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0541
function SharedOpcodeHeli.fireHunterGun(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0564
-- Instruction: make_heli_come_crashing_down [Heli]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0564
function SharedOpcodeHeli.makeComeCrashingDown(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x04a2, SharedOpcodeHeli.gotoCoords, 'heli_goto_coords [Heli] {x} [float] {y} [float] {z} [float] {minAltitude} [float] {maxAltitude} [float]')
Opcode.register(0x04d0, SharedOpcodeHeli.setOrientation, 'set_heli_orientation [Heli] {angle} [float]')
Opcode.register(0x04d1, SharedOpcodeHeli.clearOrientation, 'clear_heli_orientation [Heli]')
Opcode.register(0x04df, SharedOpcodeHeli.setStabiliser, 'set_heli_stabiliser [Heli] {state} [bool]')
Opcode.register(0x0541, SharedOpcodeHeli.fireHunterGun, 'fire_hunter_gun [Heli]')
Opcode.register(0x0564, SharedOpcodeHeli.makeComeCrashingDown, 'make_heli_come_crashing_down [Heli]')
