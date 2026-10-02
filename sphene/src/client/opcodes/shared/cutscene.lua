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
    return Cutscene.getTime()
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


-- INI: 0244=3,set_cutscene_pos %1d% %2d% %3d%
Opcode.register(0x0244, SharedOpcodeCutscene.setOffset, 3, 'set_cutscene_offset ${1} ${2} ${3}', {false, false, false})
-- INI: 02e4=1,load_cutscene_data %1s%
Opcode.register(0x02e4, SharedOpcodeCutscene.load, 1, 'load_cutscene ${1}', {false})
-- INI: 02e7=0,start_cutscene
Opcode.register(0x02e7, SharedOpcodeCutscene.start, 0, 'start_cutscene', {})
-- INI: 02e8=1,%1d% = cutscenetime
Opcode.register(0x02e8, SharedOpcodeCutscene.getTime, 1, '${1} = get_cutscene_time', {true})
-- INI: 02e9=0,cutscene_reached_end
Opcode.register(0x02e9, SharedOpcodeCutscene.hasFinished, 0, 'has_cutscene_finished', {})
-- INI: 02ea=0,end_cutscene
Opcode.register(0x02ea, SharedOpcodeCutscene.clear, 0, 'clear_cutscene', {})
-- INI: 056a=0,  has_cutscene_been_interrupted
Opcode.register(0x056a, SharedOpcodeCutscene.wasSkipped, 0, 'was_cutscene_skipped', {})
