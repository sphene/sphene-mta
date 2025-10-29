SharedOpcodeCutscene = {}
SharedOpcodeCutscene.__index = SharedOpcodeCutscene

-- Opcode: 0x0244
-- Instruction: set_cutscene_offset {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0244
function SharedOpcodeCutscene.setOffset(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02E4
-- Instruction: load_cutscene {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02E4
function SharedOpcodeCutscene.load(cutscene)
    Cutscene.load(cutscene)
end

-- Opcode: 0x02E7
-- Instruction: start_cutscene
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02E7
function SharedOpcodeCutscene.start()
    Cutscene.startScene()
end

-- Opcode: 0x02E8
-- Instruction: [var time: int] = get_cutscene_time
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02E8
function SharedOpcodeCutscene.getTime(_)
    return getTickCount() - Cutscene.startTick
end

-- Opcode: 0x02E9
-- Instruction: has_cutscene_finished
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02E9
function SharedOpcodeCutscene.hasFinished()
    return Cutscene.hasReachedEnd()
end

-- Opcode: 0x02EA
-- Instruction: clear_cutscene
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02EA
function SharedOpcodeCutscene.clear()
    Cutscene.endScene()
end

-- Opcode: 0x056A
-- Instruction: was_cutscene_skipped
-- https://library.sannybuilder.com/#/sa/script/extensions/default/056A
function SharedOpcodeCutscene.wasSkipped()
    return Cutscene.hasSkipped()
end


Opcode.register(0x0244, SharedOpcodeCutscene.setOffset, 'set_cutscene_offset {x} [float] {y} [float] {z} [float]')
Opcode.register(0x02e4, SharedOpcodeCutscene.load, 'load_cutscene {name} [string]')
Opcode.register(0x02e7, SharedOpcodeCutscene.start, 'start_cutscene')
Opcode.register(0x02e8, SharedOpcodeCutscene.getTime, '[var time: int] = get_cutscene_time')
Opcode.register(0x02e9, SharedOpcodeCutscene.hasFinished, 'has_cutscene_finished')
Opcode.register(0x02ea, SharedOpcodeCutscene.clear, 'clear_cutscene')
Opcode.register(0x056a, SharedOpcodeCutscene.wasSkipped, 'was_cutscene_skipped')
