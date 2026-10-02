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


-- INI: 03aa=3,play_suspect_last_seen_at %1d% %2d% %3d%
Opcode.register(0x03aa, ViceCityOpcodeAudio.policeRadioMessage, 3, 'police_radio_message ${1} ${2} ${3}', {false, false, false})
-- INI: 043f=0,play_cutscene_music
Opcode.register(0x043f, ViceCityOpcodeAudio.playEndOfGameTune, 0, 'play_end_of_game_tune', {})
-- INI: 0440=0,stop_cutscene_music
Opcode.register(0x0440, ViceCityOpcodeAudio.stopEndOfGameTune, 0, 'stop_end_of_game_tune', {})
-- INI: 0451=0,load_end_of_game_audio
Opcode.register(0x0451, ViceCityOpcodeAudio.loadEndOfGameTune, 0, 'load_end_of_game_tune', {})
-- INI: 057d=1,play_bridge_status_mp3 %1h%
Opcode.register(0x057d, ViceCityOpcodeAudio.playAnnouncement, 1, 'play_announcement ${1}', {false})
