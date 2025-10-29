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


Opcode.register(0x02cf, SharedOpcodeScriptFire.start, '[var handle: ScriptFire] = start_script_fire {x} [float] {y} [float] {z} [float] {propagation} [int] {size} [int]')
Opcode.register(0x02d0, SharedOpcodeScriptFire.isExtinguished, 'is_script_fire_extinguished [ScriptFire]')
Opcode.register(0x02d1, SharedOpcodeScriptFire.remove, 'remove_script_fire [ScriptFire]')
Opcode.register(0x0325, SharedOpcodeScriptFire.createCarFire, '[var handle: ScriptFire] = start_car_fire {vehicle} [Car]')
Opcode.register(0x0326, SharedOpcodeScriptFire.createCharFire, '[var handle: ScriptFire] = start_char_fire {char} [Char]')
