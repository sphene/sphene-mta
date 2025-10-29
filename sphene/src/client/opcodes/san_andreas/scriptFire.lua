SanAndreasOpcodeScriptFire = {}
SanAndreasOpcodeScriptFire.__index = SanAndreasOpcodeScriptFire

-- Opcode: 0x06F5
-- Instruction: [var x: float], [var y: float], [var z: float] = get_script_fire_coords [ScriptFire]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06F5
function SanAndreasOpcodeScriptFire.getCoords(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0973
-- Instruction: does_script_fire_exist {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0973
function SanAndreasOpcodeScriptFire.doesExist(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x06f5, SanAndreasOpcodeScriptFire.getCoords, '[var x: float], [var y: float], [var z: float] = get_script_fire_coords [ScriptFire]')
Opcode.register(0x0973, SanAndreasOpcodeScriptFire.doesExist, 'does_script_fire_exist {handle} [any]')
