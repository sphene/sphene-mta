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


-- INI: 06F5=4,create_coordinate %2d% %3d% %4d% from_fire %1d%
Opcode.register(0x06f5, SanAndreasOpcodeScriptFire.getCoords, 4, '${2}, ${3}, ${4} = get_script_fire_coords ${1}', {false, true, true, true})
-- INI: 0973=1,  fire %1d% exists
Opcode.register(0x0973, SanAndreasOpcodeScriptFire.doesExist, 1, 'does_script_fire_exist ${1}', {false})
