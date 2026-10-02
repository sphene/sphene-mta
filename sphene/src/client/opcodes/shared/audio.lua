SharedOpcodeAudio = {}
SharedOpcodeAudio.__index = SharedOpcodeAudio

-- Opcode: 0x0394
-- Instruction: play_mission_passed_tune {soundId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0394
function SharedOpcodeAudio.playMissionPassedTune(music)
    -- Audio.playMusic(music)

    if (music == 1) then
        setAmbientSoundEnabled("general", false)
        setAmbientSoundEnabled("gunfire", false)

        local sound = playSFX('radio', 'Beats', 8 + (music - 1), false)

        addEventHandler("onClientSoundStopped", sound, function()
            resetAmbientSounds()
        end)

        return true
    end

    return false
end

-- Opcode: 0x03CF
-- Instruction: load_mission_audio {slotId} [MissionAudioSlot] {audioId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03CF
function SharedOpcodeAudio.loadMissionAudio(id, soundId)
    Audio.loadWav(id, soundId)
end

-- Opcode: 0x03D0
-- Instruction: has_mission_audio_loaded {slotId} [MissionAudioSlot]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03D0
function SharedOpcodeAudio.hasMissionAudioLoaded(id)
    return Audio.isWavLoaded(id)
end

-- Opcode: 0x03D1
-- Instruction: play_mission_audio {slotId} [MissionAudioSlot]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03D1
function SharedOpcodeAudio.playMissionAudio(id)
    Audio.playWav(id)
end

-- Opcode: 0x03D2
-- Instruction: has_mission_audio_finished {slotId} [MissionAudioSlot]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03D2
function SharedOpcodeAudio.hasMissionAudioFinished(id)
    return Audio.hasWavEnded(id)
end

-- Opcode: 0x03D7
-- Instruction: set_mission_audio_position {slotId} [MissionAudioSlot] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03D7
function SharedOpcodeAudio.setMissionAudioPosition(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x040D
-- Instruction: clear_mission_audio {slotId} [MissionAudioSlot]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/040D
function SharedOpcodeAudio.clearMissionAudio(id)
    Audio.unloadWav(id)
end

-- Opcode: 0x041E
-- Instruction: set_radio_channel {channel} [RadioChannel]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/041E
function SharedOpcodeAudio.setRadioChannel(radioStation)
    setRadioChannel(radioStation - 1)
    return true
end

-- Opcode: 0x043C
-- Instruction: set_music_does_fade {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/043C
function SharedOpcodeAudio.setMusicDoesFade(_)
   return Script.setOpcodePartiallyImplemented()
end


-- INI: 0394=1,play_music %1d%
Opcode.register(0x0394, SharedOpcodeAudio.playMissionPassedTune, 1, 'play_mission_passed_tune ${1}', {false})
-- INI: 03cf=2,load_wav %2s% as %1d%
Opcode.register(0x03cf, SharedOpcodeAudio.loadMissionAudio, 2, 'load_mission_audio ${1} ${2}', {false, false})
-- INI: 03d0=1,  wav %1d% loaded
Opcode.register(0x03d0, SharedOpcodeAudio.hasMissionAudioLoaded, 1, 'has_mission_audio_loaded ${1}', {false})
-- INI: 03d1=1,play_wav %1d%
Opcode.register(0x03d1, SharedOpcodeAudio.playMissionAudio, 1, 'play_mission_audio ${1}', {false})
-- INI: 03d2=1,  wav %1d% ended
Opcode.register(0x03d2, SharedOpcodeAudio.hasMissionAudioFinished, 1, 'has_mission_audio_finished ${1}', {false})
-- INI: 03d7=4,set_wav %1h% location %2d% %3d% %4d%
Opcode.register(0x03d7, SharedOpcodeAudio.setMissionAudioPosition, 4, 'set_mission_audio_position ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 040d=1,unload_wav %1d%
Opcode.register(0x040d, SharedOpcodeAudio.clearMissionAudio, 1, 'clear_mission_audio ${1}', {false})
-- INI: 041e=2,set_radio_station %1d% %2d%
Opcode.register(0x041e, SharedOpcodeAudio.setRadioChannel, 1, 'set_radio_channel ${1}', {false})
-- INI: 043c=1,set_game_sounds_disable_on_fade %1d%
Opcode.register(0x043c, SharedOpcodeAudio.setMusicDoesFade, 1, 'set_music_does_fade ${1}', {false})
