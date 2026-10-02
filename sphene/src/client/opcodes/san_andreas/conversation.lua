SanAndreasOpcodeConversation = {}
SanAndreasOpcodeConversation.__index = SanAndreasOpcodeConversation

-- Opcode: 0x0717
-- Instruction: start_setting_up_conversation {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0717
function SanAndreasOpcodeConversation.startSettingUp(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0719
-- Instruction: finish_setting_up_conversation
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0719
function SanAndreasOpcodeConversation.finishSettingUp()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x071A
-- Instruction: is_conversation_at_node {handle} [Char] {speech} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/071A
function SanAndreasOpcodeConversation.isAtNode(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x089B
-- Instruction: is_player_in_position_for_conversation {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/089B
function SanAndreasOpcodeConversation.isPlayerInPosition(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x089C
-- Instruction: enable_conversation {handle} [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/089C
function SanAndreasOpcodeConversation.enable(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08ED
-- Instruction: clear_conversation_for_char {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08ED
function SanAndreasOpcodeConversation.clearForChar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09A4
-- Instruction: set_up_conversation_node_with_speech {question} [gxt_key] {positiveAnswer} [gxt_key] {negativeAnswer} [gxt_key] {questionPhrase} [SpeechId] {positiveAnswerPhrase} [SpeechId] {negativeAnswerPhrase} [SpeechId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09A4
function SanAndreasOpcodeConversation.setUpNodeWithSpeech(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09AA
-- Instruction: set_up_conversation_end_node_with_speech {text} [gxt_key] {phrase} [SpeechId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09AA
function SanAndreasOpcodeConversation.setUpEndNodeWithSpeech(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A18
-- Instruction: set_up_conversation_node_with_scripted_speech {question} [gxt_key] {positiveAnswer} [gxt_key] {negativeAnswer} [gxt_key] {questionSoundId} [int] {positiveAnswerSoundId} [int] {negativeAnswerSoundId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A18
function SanAndreasOpcodeConversation.setUpNodeWithScriptedSpeech(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A3C
-- Instruction: set_up_conversation_end_node_with_scripted_speech {speech} [gxt_key] {speechSoundId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A3C
function SanAndreasOpcodeConversation.setUpEndNodeWithScriptedSpeech(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A47
-- Instruction: finish_setting_up_conversation_no_subtitles
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A47
function SanAndreasOpcodeConversation.finishSettingUpNoSubtitles()
   return Script.setOpcodeUnimplemented()
end


-- INI: 0717=1,assign_actor %1d% to_dialogue_mode
Opcode.register(0x0717, SanAndreasOpcodeConversation.startSettingUp, 1, 'start_setting_up_conversation ${1}', {false})
-- INI: 0719=0,enable_dialogue_mode
Opcode.register(0x0719, SanAndreasOpcodeConversation.finishSettingUp, 0, 'finish_setting_up_conversation', {})
-- INI: 071A=2,  actor %1d% current_dialogue_text == %2g%
Opcode.register(0x071a, SanAndreasOpcodeConversation.isAtNode, 2, 'is_conversation_at_node ${1} ${2}', {true, false})
-- INI: 089B=1,  unknown_is_actor_in_dialogue_mode %1d%
Opcode.register(0x089b, SanAndreasOpcodeConversation.isPlayerInPosition, 1, 'is_player_in_position_for_conversation ${1}', {false})
-- INI: 089C=2,unknown_actor %1d% unknown_check %2h%
Opcode.register(0x089c, SanAndreasOpcodeConversation.enable, 2, 'enable_conversation ${1} ${2}', {false, false})
-- INI: 08ED=1,remove_actor %1d% from_dialogue_mode
Opcode.register(0x08ed, SanAndreasOpcodeConversation.clearForChar, 1, 'clear_conversation_for_char ${1}', {false})
-- INI: 09A4=6,set_dialogue_classB_question_GXT %1g% answer_Y_GXT %2g% answer_N_GXT %3g% question_WAV %4d% answer_Y_WAV %5d% answer_N_WAV %6d%
Opcode.register(0x09a4, SanAndreasOpcodeConversation.setUpNodeWithSpeech, 6, 'set_up_conversation_node_with_speech ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 09AA=2,set_dialogue_classB_end_GXT %1g% WAV %2d%
Opcode.register(0x09aa, SanAndreasOpcodeConversation.setUpEndNodeWithSpeech, 2, 'set_up_conversation_end_node_with_speech ${1} ${2}', {false, false})
-- INI: 0A18=6,set_dialogue_classA_question_GXT %1g% answer_yes_GXT %2g% answer_no_GXT %3g% question_WAV %4d% answer_yes_WAV %5d% answer_no_WAV %6d%
Opcode.register(0x0a18, SanAndreasOpcodeConversation.setUpNodeWithScriptedSpeech, 6, 'set_up_conversation_node_with_scripted_speech ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0A3C=2,set_dialogue_classA_end_GXT %1g% WAV %2d%
Opcode.register(0x0a3c, SanAndreasOpcodeConversation.setUpEndNodeWithScriptedSpeech, 2, 'set_up_conversation_end_node_with_scripted_speech ${1} ${2}', {false, false})
-- INI: 0A47=0,set_dialogue_mode_enabled_without_GXT
Opcode.register(0x0a47, SanAndreasOpcodeConversation.finishSettingUpNoSubtitles, 0, 'finish_setting_up_conversation_no_subtitles', {})
