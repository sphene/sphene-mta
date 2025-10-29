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


Opcode.register(0x0394, SharedOpcodeAudio.playMissionPassedTune, 'play_mission_passed_tune {soundId} [int]')
Opcode.register(0x03cf, SharedOpcodeAudio.loadMissionAudio, 'load_mission_audio {slotId} [MissionAudioSlot] {audioId} [int]')
Opcode.register(0x03d0, SharedOpcodeAudio.hasMissionAudioLoaded, 'has_mission_audio_loaded {slotId} [MissionAudioSlot]')
Opcode.register(0x03d1, SharedOpcodeAudio.playMissionAudio, 'play_mission_audio {slotId} [MissionAudioSlot]')
Opcode.register(0x03d2, SharedOpcodeAudio.hasMissionAudioFinished, 'has_mission_audio_finished {slotId} [MissionAudioSlot]')
Opcode.register(0x03d7, SharedOpcodeAudio.setMissionAudioPosition, 'set_mission_audio_position {slotId} [MissionAudioSlot] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x040d, SharedOpcodeAudio.clearMissionAudio, 'clear_mission_audio {slotId} [MissionAudioSlot]')
Opcode.register(0x041e, SharedOpcodeAudio.setRadioChannel, 'set_radio_channel {channel} [RadioChannel]')
Opcode.register(0x043c, SharedOpcodeAudio.setMusicDoesFade, 'set_music_does_fade {state} [bool]')
