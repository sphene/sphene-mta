SanAndreasOpcodeMission = {}
SanAndreasOpcodeMission.__index = SanAndreasOpcodeMission

-- Opcode: 0x0E1D
-- Instruction: is_on_mission
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E1D
function SanAndreasOpcodeMission.isOn()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EB7
-- Instruction: is_on_scripted_cutscene
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EB7
function SanAndreasOpcodeMission.isOnScriptedCutscene()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0e1d, SanAndreasOpcodeMission.isOn, 'is_on_mission')
Opcode.register(0x0eb7, SanAndreasOpcodeMission.isOnScriptedCutscene, 'is_on_scripted_cutscene')
