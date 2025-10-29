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
    local status = Audio.getSoundTrackStatus()

    Script.storeValueAtIndex(1, status)
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


Opcode.register(0x051e, SanAndreasOpcodeAudio.getRadioChannel, '[var channel: RadioChannel] = get_radio_channel')
Opcode.register(0x07b1, SanAndreasOpcodeAudio.getBeatProximity, '[var _p2: int], [var _p3: int], [var _p4: int] = get_beat_proximity {_p1} [int]')
Opcode.register(0x0949, SanAndreasOpcodeAudio.attachMissionAudioToChar, 'attach_mission_audio_to_char {slotId} [MissionAudioSlot] {handle} [Char]')
Opcode.register(0x0952, SanAndreasOpcodeAudio.preloadBeatTrack, 'preload_beat_track {trackId} [int]')
Opcode.register(0x0953, SanAndreasOpcodeAudio.getBeatTrackStatus, '[var status: int] = get_beat_track_status')
Opcode.register(0x0954, SanAndreasOpcodeAudio.playBeatTrack, 'play_beat_track')
Opcode.register(0x0955, SanAndreasOpcodeAudio.stopBeatTrack, 'stop_beat_track')
Opcode.register(0x097a, SanAndreasOpcodeAudio.reportMissionAudioEventAtPosition, 'report_mission_audio_event_at_position {x} [float] {y} [float] {z} [float] {soundId} [ScriptSound]')
Opcode.register(0x097b, SanAndreasOpcodeAudio.reportMissionAudioEventAtObject, 'report_mission_audio_event_at_object {handle} [Object] {soundId} [ScriptSound]')
Opcode.register(0x097c, SanAndreasOpcodeAudio.attachMissionAudioToObject, 'attach_mission_audio_to_object {slotId} [MissionAudioSlot] {handle} [Object]')
Opcode.register(0x0991, SanAndreasOpcodeAudio.pauseCurrentBeatTrack, 'pause_current_beat_track {state} [bool]')
Opcode.register(0x09f1, SanAndreasOpcodeAudio.reportMissionAudioEventAtChar, 'report_mission_audio_event_at_char {handle} [Char] {soundId} [ScriptSound]')
Opcode.register(0x09f7, SanAndreasOpcodeAudio.reportMissionAudioEventAtCar, 'report_mission_audio_event_at_car {handle} [Car] {soundId} [ScriptSound]')
Opcode.register(0x0a16, SanAndreasOpcodeAudio.attachMissionAudioToCar, 'attach_mission_audio_to_car {slotId} [MissionAudioSlot] {handle} [Car]')
Opcode.register(0x0a26, SanAndreasOpcodeAudio.setRadioToPlayersFavouriteStation, 'set_radio_to_players_favourite_station')
Opcode.register(0x0e21, SanAndreasOpcodeAudio.getSfxVolume, '[var volume: float] = get_audio_sfx_volume')
Opcode.register(0x0e22, SanAndreasOpcodeAudio.getRadioVolume, '[var volume: float] = get_audio_radio_volume')
