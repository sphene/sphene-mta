SanAndreasOpcodeAudioStream = {}
SanAndreasOpcodeAudioStream.__index = SanAndreasOpcodeAudioStream

-- Opcode: 0x0E3B
-- Instruction: [var address: int] = get_audiostream_internal [AudioStream]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E3B
function SanAndreasOpcodeAudioStream.getInternal(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AAC
-- Instruction: [var handle: AudioStream] = load_audio_stream {audioFileName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AAC
function SanAndreasOpcodeAudioStream.load(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AAD
-- Instruction: set_audio_stream_state [AudioStream] {action} [AudioStreamAction]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AAD
function SanAndreasOpcodeAudioStream.setState(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AAE
-- Instruction: remove_audio_stream [AudioStream]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AAE
function SanAndreasOpcodeAudioStream.remove(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AAF
-- Instruction: [var length: int] = get_audio_stream_length [AudioStream]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AAF
function SanAndreasOpcodeAudioStream.getLength(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AB9
-- Instruction: [var state: AudioStreamState] = get_audio_stream_state [AudioStream]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AB9
function SanAndreasOpcodeAudioStream.getState(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ABB
-- Instruction: [var volume: float] = get_audio_stream_volume [AudioStream]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ABB
function SanAndreasOpcodeAudioStream.getVolume(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ABC
-- Instruction: set_audio_stream_volume [AudioStream] {volume} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ABC
function SanAndreasOpcodeAudioStream.setVolume(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AC0
-- Instruction: set_audio_stream_looped [AudioStream] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AC0
function SanAndreasOpcodeAudioStream.setLooped(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2500
-- Instruction: is_audio_stream_playing [AudioStream]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2500
function SanAndreasOpcodeAudioStream.isPlaying()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2501
-- Instruction: [var seconds: float] = get_audio_stream_duration [AudioStream]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2501
function SanAndreasOpcodeAudioStream.getDuration()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2502
-- Instruction: [var speed: float] = get_audio_stream_speed [AudioStream]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2502
function SanAndreasOpcodeAudioStream.getSpeed()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2503
-- Instruction: set_audio_stream_speed [AudioStream] {speed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2503
function SanAndreasOpcodeAudioStream.setSpeed()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2504
-- Instruction: set_audio_stream_volume_with_transition [AudioStream] {volume} [float] {timeMs} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2504
function SanAndreasOpcodeAudioStream.setVolumeWithTransition()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2505
-- Instruction: set_audio_stream_speed_with_transition [AudioStream] {speed} [float] {timeMs} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2505
function SanAndreasOpcodeAudioStream.setSpeedWithTransition()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2507
-- Instruction: [var progress: float] = get_audio_stream_progress [AudioStream]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2507
function SanAndreasOpcodeAudioStream.getProgress()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2508
-- Instruction: set_audio_stream_progress [AudioStream] {progress} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2508
function SanAndreasOpcodeAudioStream.setProgress()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2509
-- Instruction: [var type: AudioStreamType] = get_audio_stream_type [AudioStream]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2509
function SanAndreasOpcodeAudioStream.getType()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x250A
-- Instruction: set_audio_stream_type [AudioStream] {type} [AudioStreamType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/250A
function SanAndreasOpcodeAudioStream.setType()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0e3b, SanAndreasOpcodeAudioStream.getInternal, '[var address: int] = get_audiostream_internal [AudioStream]')
Opcode.register(0x0aac, SanAndreasOpcodeAudioStream.load, '[var handle: AudioStream] = load_audio_stream {audioFileName} [string]')
Opcode.register(0x0aad, SanAndreasOpcodeAudioStream.setState, 'set_audio_stream_state [AudioStream] {action} [AudioStreamAction]')
Opcode.register(0x0aae, SanAndreasOpcodeAudioStream.remove, 'remove_audio_stream [AudioStream]')
Opcode.register(0x0aaf, SanAndreasOpcodeAudioStream.getLength, '[var length: int] = get_audio_stream_length [AudioStream]')
Opcode.register(0x0ab9, SanAndreasOpcodeAudioStream.getState, '[var state: AudioStreamState] = get_audio_stream_state [AudioStream]')
Opcode.register(0x0abb, SanAndreasOpcodeAudioStream.getVolume, '[var volume: float] = get_audio_stream_volume [AudioStream]')
Opcode.register(0x0abc, SanAndreasOpcodeAudioStream.setVolume, 'set_audio_stream_volume [AudioStream] {volume} [float]')
Opcode.register(0x0ac0, SanAndreasOpcodeAudioStream.setLooped, 'set_audio_stream_looped [AudioStream] {state} [bool]')
Opcode.register(0x2500, SanAndreasOpcodeAudioStream.isPlaying, 'is_audio_stream_playing [AudioStream]')
Opcode.register(0x2501, SanAndreasOpcodeAudioStream.getDuration, '[var seconds: float] = get_audio_stream_duration [AudioStream]')
Opcode.register(0x2502, SanAndreasOpcodeAudioStream.getSpeed, '[var speed: float] = get_audio_stream_speed [AudioStream]')
Opcode.register(0x2503, SanAndreasOpcodeAudioStream.setSpeed, 'set_audio_stream_speed [AudioStream] {speed} [float]')
Opcode.register(0x2504, SanAndreasOpcodeAudioStream.setVolumeWithTransition, 'set_audio_stream_volume_with_transition [AudioStream] {volume} [float] {timeMs} [int]')
Opcode.register(0x2505, SanAndreasOpcodeAudioStream.setSpeedWithTransition, 'set_audio_stream_speed_with_transition [AudioStream] {speed} [float] {timeMs} [int]')
Opcode.register(0x2507, SanAndreasOpcodeAudioStream.getProgress, '[var progress: float] = get_audio_stream_progress [AudioStream]')
Opcode.register(0x2508, SanAndreasOpcodeAudioStream.setProgress, 'set_audio_stream_progress [AudioStream] {progress} [float]')
Opcode.register(0x2509, SanAndreasOpcodeAudioStream.getType, '[var type: AudioStreamType] = get_audio_stream_type [AudioStream]')
Opcode.register(0x250a, SanAndreasOpcodeAudioStream.setType, 'set_audio_stream_type [AudioStream] {type} [AudioStreamType]')
