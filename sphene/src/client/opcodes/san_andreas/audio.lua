SanAndreasOpcodeAudio = {}
SanAndreasOpcodeAudio.__index = SanAndreasOpcodeAudio

-- Opcode: 0x051E
-- Instruction: [var channel: RadioChannel] = get_radio_channel
-- https://library.sannybuilder.com/#/sa/script/extensions/default/051E
function SanAndreasOpcodeAudio.getRadioChannel(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07B1
-- Instruction: [var _p2: int], [var _p3: int], [var _p4: int] = get_beat_proximity {_p1} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07B1
function SanAndreasOpcodeAudio.getBeatProximity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0949
-- Instruction: attach_mission_audio_to_char {slotId} [MissionAudioSlot] {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0949
function SanAndreasOpcodeAudio.attachMissionAudioToChar(id, actor)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0952
-- Instruction: preload_beat_track {trackId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0952
function SanAndreasOpcodeAudio.preloadBeatTrack(id)
    Audio.loadSoundTrack(id)
end

-- Opcode: 0x0953
-- Instruction: [var status: int] = get_beat_track_status
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0953
function SanAndreasOpcodeAudio.getBeatTrackStatus(_)
    return Audio.getSoundTrackStatus()
end

-- Opcode: 0x0954
-- Instruction: play_beat_track
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0954
function SanAndreasOpcodeAudio.playBeatTrack()
    Audio.playSoundTrack()
end

-- Opcode: 0x0955
-- Instruction: stop_beat_track
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0955
function SanAndreasOpcodeAudio.stopBeatTrack()
    Audio.stopSoundTrack()
end

-- Opcode: 0x097A
-- Instruction: report_mission_audio_event_at_position {x} [float] {y} [float] {z} [float] {soundId} [ScriptSound]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/097A
function SanAndreasOpcodeAudio.reportMissionAudioEventAtPosition(posX, posY, posZ, soundId)
    local bank = math.floor((soundId - 2000) / 200)
    local slot = ((soundId - 2000) % 200)

    local sfx = playSFX3D("script", bank,
        slot, posX, posY, posZ, false)

    if (sfx) then
        setSoundVolume(sfx, 1.0)
    end

    return true
end

-- Opcode: 0x097B
-- Instruction: report_mission_audio_event_at_object {handle} [Object] {soundId} [ScriptSound]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/097B
function SanAndreasOpcodeAudio.reportMissionAudioEventAtObject(object, soundId)
    local posX, posY, posZ = object:getPosition()
    local bank = math.floor((soundId - 2000) / 200)
    local slot = ((soundId - 2000) % 200)

    local sfx = playSFX3D("script", bank,
        slot, posX, posY, posZ, false)

    if (sfx) then
        setSoundVolume(sfx, 1.0)
    end

    return true
end

-- Opcode: 0x097C
-- Instruction: attach_mission_audio_to_object {slotId} [MissionAudioSlot] {handle} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/097C
function SanAndreasOpcodeAudio.attachMissionAudioToObject(_, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0991
-- Instruction: pause_current_beat_track {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0991
function SanAndreasOpcodeAudio.pauseCurrentBeatTrack(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09F1
-- Instruction: report_mission_audio_event_at_char {handle} [Char] {soundId} [ScriptSound]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09F1
function SanAndreasOpcodeAudio.reportMissionAudioEventAtChar(actor, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09F7
-- Instruction: report_mission_audio_event_at_car {handle} [Car] {soundId} [ScriptSound]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09F7
function SanAndreasOpcodeAudio.reportMissionAudioEventAtCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A16
-- Instruction: attach_mission_audio_to_car {slotId} [MissionAudioSlot] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A16
function SanAndreasOpcodeAudio.attachMissionAudioToCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A26
-- Instruction: set_radio_to_players_favourite_station
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A26
function SanAndreasOpcodeAudio.setRadioToPlayersFavouriteStation()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E21
-- Instruction: [var volume: float] = get_audio_sfx_volume
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E21
function SanAndreasOpcodeAudio.getSfxVolume(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E22
-- Instruction: [var volume: float] = get_audio_radio_volume
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E22
function SanAndreasOpcodeAudio.getRadioVolume(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 051E=1,%1d% = get_current_radio_station
Opcode.register(0x051e, SanAndreasOpcodeAudio.getRadioChannel, 1, '${1} = get_radio_channel', {true})
-- INI: 07B1=4,unknown_get_dance_track %1h% store_to %2d% %3d% %4d%
Opcode.register(0x07b1, SanAndreasOpcodeAudio.getBeatProximity, 4, '${2}, ${3}, ${4} = get_beat_proximity ${1}', {false, true, true, true})
-- INI: 0949=2,link_wav %1d% to_actor %2d%
Opcode.register(0x0949, SanAndreasOpcodeAudio.attachMissionAudioToChar, 2, 'attach_mission_audio_to_char ${1} ${2}', {false, false})
-- INI: 0952=1,load_soundtrack %1h%
Opcode.register(0x0952, SanAndreasOpcodeAudio.preloadBeatTrack, 1, 'preload_beat_track ${1}', {false})
-- INI: 0953=1,get_soundtrack_status_to %1d%
Opcode.register(0x0953, SanAndreasOpcodeAudio.getBeatTrackStatus, 1, '${1} = get_beat_track_status', {true})
-- INI: 0954=0,start_playing_loaded_soundtrack
Opcode.register(0x0954, SanAndreasOpcodeAudio.playBeatTrack, 0, 'play_beat_track', {})
-- INI: 0955=0,end_playing_loaded_soundtrack
Opcode.register(0x0955, SanAndreasOpcodeAudio.stopBeatTrack, 0, 'stop_beat_track', {})
-- INI: 097A=4,play_audio_at %1d% %2d% %3d% event %4d%
Opcode.register(0x097a, SanAndreasOpcodeAudio.reportMissionAudioEventAtPosition, 4, 'report_mission_audio_event_at_position ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 097B=2,play_audio_at_object %1d% event %2d%
Opcode.register(0x097b, SanAndreasOpcodeAudio.reportMissionAudioEventAtObject, 2, 'report_mission_audio_event_at_object ${1} ${2}', {false, false})
-- INI: 097C=2,attach_wav %1h% to_object %2d%
Opcode.register(0x097c, SanAndreasOpcodeAudio.attachMissionAudioToObject, 2, 'attach_mission_audio_to_object ${1} ${2}', {false, false})
-- INI: 0991=1,set_soundtrack_paused %1h%
Opcode.register(0x0991, SanAndreasOpcodeAudio.pauseCurrentBeatTrack, 1, 'pause_current_beat_track ${1}', {false})
-- INI: 09F1=2,play_audio_at_actor %1d% event %2d%
Opcode.register(0x09f1, SanAndreasOpcodeAudio.reportMissionAudioEventAtChar, 2, 'report_mission_audio_event_at_char ${1} ${2}', {false, false})
-- INI: 09F7=2,play_audio_at_car %1d% event %2d%
Opcode.register(0x09f7, SanAndreasOpcodeAudio.reportMissionAudioEventAtCar, 2, 'report_mission_audio_event_at_car ${1} ${2}', {false, false})
-- INI: 0A16=2,link_wav %1h% to_car %2d%
Opcode.register(0x0a16, SanAndreasOpcodeAudio.attachMissionAudioToCar, 2, 'attach_mission_audio_to_car ${1} ${2}', {false, false})
-- INI: 0A26=0,set_radio_to_favorite_station
Opcode.register(0x0a26, SanAndreasOpcodeAudio.setRadioToPlayersFavouriteStation, 0, 'set_radio_to_players_favourite_station', {})
-- INI: 0E21=1,get_audio_sfx_volume %1d%
Opcode.register(0x0e21, SanAndreasOpcodeAudio.getSfxVolume, 1, '${1} = get_audio_sfx_volume', {true})
-- INI: 0E22=1,get_audio_radio_volume %1d%
Opcode.register(0x0e22, SanAndreasOpcodeAudio.getRadioVolume, 1, '${1} = get_audio_radio_volume', {true})
