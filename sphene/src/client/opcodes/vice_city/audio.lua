ViceCityOpcodeAudio = {}
ViceCityOpcodeAudio.__index = ViceCityOpcodeAudio

-- Opcode: 0x03AA
-- Instruction: police_radio_message {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03AA
function ViceCityOpcodeAudio.policeRadioMessage(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x043F
-- Instruction: play_end_of_game_tune
-- https://library.sannybuilder.com/#/vc/script/extensions/default/043F
function ViceCityOpcodeAudio.playEndOfGameTune()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0440
-- Instruction: stop_end_of_game_tune
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0440
function ViceCityOpcodeAudio.stopEndOfGameTune()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0451
-- Instruction: load_end_of_game_tune
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0451
function ViceCityOpcodeAudio.loadEndOfGameTune()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x057D
-- Instruction: play_announcement {track} [AnnouncementTrack]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/057D
function ViceCityOpcodeAudio.playAnnouncement(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x03aa, ViceCityOpcodeAudio.policeRadioMessage, 'police_radio_message {x} [float] {y} [float] {z} [float]')
Opcode.register(0x043f, ViceCityOpcodeAudio.playEndOfGameTune, 'play_end_of_game_tune')
Opcode.register(0x0440, ViceCityOpcodeAudio.stopEndOfGameTune, 'stop_end_of_game_tune')
Opcode.register(0x0451, ViceCityOpcodeAudio.loadEndOfGameTune, 'load_end_of_game_tune')
Opcode.register(0x057d, ViceCityOpcodeAudio.playAnnouncement, 'play_announcement {track} [AnnouncementTrack]')
