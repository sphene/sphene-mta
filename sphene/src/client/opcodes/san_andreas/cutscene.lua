SanAndreasOpcodeCutscene = {}
SanAndreasOpcodeCutscene.__index = SanAndreasOpcodeCutscene

-- Opcode: 0x06B9
-- Instruction: has_cutscene_loaded
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06B9
function SanAndreasOpcodeCutscene.hasLoaded()
    return Cutscene.isLoaded()
end

-- Opcode: 0x08D1
-- Instruction: [var xOffset: float], [var yOffset: float], [var zOffset: float] = get_cutscene_offset
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08D1
function SanAndreasOpcodeCutscene.getOffset(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08F0
-- Instruction: append_to_next_cutscene {_p1} [string] {_p2} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08F0
function SanAndreasOpcodeCutscene.appendToNext(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E25
-- Instruction: is_on_cutscene
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E25
function SanAndreasOpcodeCutscene.isOn()
   return Script.setOpcodeUnimplemented()
end


-- INI: 06B9=0,  cutscene_data_loaded
Opcode.register(0x06b9, SanAndreasOpcodeCutscene.hasLoaded, 0, 'has_cutscene_loaded', {})
-- INI: 08D1=3,store_cutscene_pos_to %1d% %2d% %3d%
Opcode.register(0x08d1, SanAndreasOpcodeCutscene.getOffset, 3, '${1}, ${2}, ${3} = get_cutscene_offset', {true, true, true})
-- INI: 08F0=2,set_cutscene_model %1g% texture %2g% ; 8-byte strings
Opcode.register(0x08f0, SanAndreasOpcodeCutscene.appendToNext, 2, 'append_to_next_cutscene ${1} ${2}', {false, false})
-- INI: 0E25=0,is_on_cutscene
Opcode.register(0x0e25, SanAndreasOpcodeCutscene.isOn, 0, 'is_on_cutscene', {})
