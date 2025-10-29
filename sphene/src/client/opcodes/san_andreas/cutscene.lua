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


Opcode.register(0x06b9, SanAndreasOpcodeCutscene.hasLoaded, 'has_cutscene_loaded')
Opcode.register(0x08d1, SanAndreasOpcodeCutscene.getOffset, '[var xOffset: float], [var yOffset: float], [var zOffset: float] = get_cutscene_offset')
Opcode.register(0x08f0, SanAndreasOpcodeCutscene.appendToNext, 'append_to_next_cutscene {_p1} [string] {_p2} [string]')
Opcode.register(0x0e25, SanAndreasOpcodeCutscene.isOn, 'is_on_cutscene')
