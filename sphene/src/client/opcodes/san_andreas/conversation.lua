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


Opcode.register(0x0717, SanAndreasOpcodeConversation.startSettingUp, 'start_setting_up_conversation {handle} [Char]')
Opcode.register(0x0719, SanAndreasOpcodeConversation.finishSettingUp, 'finish_setting_up_conversation')
Opcode.register(0x071a, SanAndreasOpcodeConversation.isAtNode, 'is_conversation_at_node {handle} [Char] {speech} [gxt_key]')
Opcode.register(0x089b, SanAndreasOpcodeConversation.isPlayerInPosition, 'is_player_in_position_for_conversation {handle} [Char]')
Opcode.register(0x089c, SanAndreasOpcodeConversation.enable, 'enable_conversation {handle} [Char] {state} [bool]')
Opcode.register(0x08ed, SanAndreasOpcodeConversation.clearForChar, 'clear_conversation_for_char {handle} [Char]')
Opcode.register(0x09a4, SanAndreasOpcodeConversation.setUpNodeWithSpeech, 'set_up_conversation_node_with_speech {question} [gxt_key] {positiveAnswer} [gxt_key] {negativeAnswer} [gxt_key] {questionPhrase} [SpeechId] {positiveAnswerPhrase} [SpeechId] {negativeAnswerPhrase} [SpeechId]')
Opcode.register(0x09aa, SanAndreasOpcodeConversation.setUpEndNodeWithSpeech, 'set_up_conversation_end_node_with_speech {text} [gxt_key] {phrase} [SpeechId]')
Opcode.register(0x0a18, SanAndreasOpcodeConversation.setUpNodeWithScriptedSpeech, 'set_up_conversation_node_with_scripted_speech {question} [gxt_key] {positiveAnswer} [gxt_key] {negativeAnswer} [gxt_key] {questionSoundId} [int] {positiveAnswerSoundId} [int] {negativeAnswerSoundId} [int]')
Opcode.register(0x0a3c, SanAndreasOpcodeConversation.setUpEndNodeWithScriptedSpeech, 'set_up_conversation_end_node_with_scripted_speech {speech} [gxt_key] {speechSoundId} [int]')
Opcode.register(0x0a47, SanAndreasOpcodeConversation.finishSettingUpNoSubtitles, 'finish_setting_up_conversation_no_subtitles')
