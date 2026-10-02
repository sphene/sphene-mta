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


-- INI: 04a2=5,heli %1d% fly_to %2d% %3d% %4d% speed %5h%
Opcode.register(0x04a2, SharedOpcodeHeli.gotoCoords, 6, 'heli_goto_coords ${1} ${2} ${3} ${4} ${5} ${6}', {false, true, false, false, false, false})
-- INI: 04d0=2,force_heli %1d% looking_angle_to %2d%
Opcode.register(0x04d0, SharedOpcodeHeli.setOrientation, 2, 'set_heli_orientation ${1} ${2}', {false, true})
-- INI: 04d1=1,reset_heli %1d% looking_angle
Opcode.register(0x04d1, SharedOpcodeHeli.clearOrientation, 1, 'clear_heli_orientation ${1}', {false})
-- INI: 04df=2,set_heli %1d% lean_and_thrust_limiter %2h%
Opcode.register(0x04df, SharedOpcodeHeli.setStabiliser, 2, 'set_heli_stabiliser ${1} ${2}', {false, false})
-- INI: 0541=1,fire_guns_on_vehicle %1d%
Opcode.register(0x0541, SharedOpcodeHeli.fireHunterGun, 1, 'fire_hunter_gun ${1}', {false})
-- INI: 0564=1,set_vehicle %1d% helicopter_simulate_crash_landing
Opcode.register(0x0564, SharedOpcodeHeli.makeComeCrashingDown, 1, 'make_heli_come_crashing_down ${1}', {false})
