SharedOpcodeScriptFire = {}
SharedOpcodeScriptFire.__index = SharedOpcodeScriptFire

-- Opcode: 0x02CF
-- Instruction: [var handle: ScriptFire] = start_script_fire {x} [float] {y} [float] {z} [float] {propagation} [int] {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02CF
function SharedOpcodeScriptFire.start(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02D0
-- Instruction: is_script_fire_extinguished [ScriptFire]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02D0
function SharedOpcodeScriptFire.isExtinguished(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02D1
-- Instruction: remove_script_fire [ScriptFire]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02D1
function SharedOpcodeScriptFire.remove(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0325
-- Instruction: [var handle: ScriptFire] = start_car_fire {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0325
function SharedOpcodeScriptFire.createCarFire(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0326
-- Instruction: [var handle: ScriptFire] = start_char_fire {char} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0326
function SharedOpcodeScriptFire.createCharFire(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 02cf=4,%4d% = create_fire_at %1d% %2d% %3d%
Opcode.register(0x02cf, SharedOpcodeScriptFire.start, 6, '${4} = start_script_fire ${1} ${2} ${3}', {false, false, false, true})
-- INI: 02d0=1,  fire %1d% extinguished
Opcode.register(0x02d0, SharedOpcodeScriptFire.isExtinguished, 1, 'is_script_fire_extinguished ${1}', {false})
-- INI: 02d1=1,destroy_fire %1d%
Opcode.register(0x02d1, SharedOpcodeScriptFire.remove, 1, 'remove_script_fire ${1}', {false})
-- INI: 0325=2,%2d% = create_car %1d% fire
Opcode.register(0x0325, SharedOpcodeScriptFire.createCarFire, 2, '${2} = start_car_fire ${1}', {false, true})
-- INI: 0326=2,%2d% = create_actor %1d% fire
Opcode.register(0x0326, SharedOpcodeScriptFire.createCharFire, 2, '${2} = start_char_fire ${1}', {false, true})
