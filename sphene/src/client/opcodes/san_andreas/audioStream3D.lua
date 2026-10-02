SanAndreasOpcodeAudioStream3D = {}
SanAndreasOpcodeAudioStream3D.__index = SanAndreasOpcodeAudioStream3D

-- Opcode: 0x0AC1
-- Instruction: [var handle: AudioStream3D] = load_3d_audio_stream {audioFileName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AC1
function SanAndreasOpcodeAudioStream3D.load(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AC2
-- Instruction: set_play_3d_audio_stream_at_coords [AudioStream3D] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AC2
function SanAndreasOpcodeAudioStream3D.setPlayAtCoords(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AC3
-- Instruction: set_play_3d_audio_stream_at_object [AudioStream3D] {object} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AC3
function SanAndreasOpcodeAudioStream3D.setPlayAtObject(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AC4
-- Instruction: set_play_3d_audio_stream_at_char [AudioStream3D] {char} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AC4
function SanAndreasOpcodeAudioStream3D.setPlayAtChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AC5
-- Instruction: set_play_3d_audio_stream_at_car [AudioStream3D] {car} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AC5
function SanAndreasOpcodeAudioStream3D.setPlayAtCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2506
-- Instruction: set_audio_stream_source_size [AudioStream3D] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2506
function SanAndreasOpcodeAudioStream3D.setSourceSize()
   return Script.setOpcodeUnimplemented()
end


-- INI: 0AC1=2,%2d% = load_audio_stream_with_3d_support %1d% ; IF and SET
Opcode.register(0x0ac1, SanAndreasOpcodeAudioStream3D.load, 2, '${2} = load_3d_audio_stream ${1}', {false, true})
-- INI: 0AC2=4,link_3d_audio_stream %1d% at_coords %2d% %3d% %4d%
Opcode.register(0x0ac2, SanAndreasOpcodeAudioStream3D.setPlayAtCoords, 4, 'set_play_3d_audio_stream_at_coords ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0AC3=2,link_3d_audio_stream %1d% to_object %2d%
Opcode.register(0x0ac3, SanAndreasOpcodeAudioStream3D.setPlayAtObject, 2, 'set_play_3d_audio_stream_at_object ${1} ${2}', {false, false})
-- INI: 0AC4=2,link_3d_audio_stream %1d% to_actor %2d%
Opcode.register(0x0ac4, SanAndreasOpcodeAudioStream3D.setPlayAtChar, 2, 'set_play_3d_audio_stream_at_char ${1} ${2}', {false, false})
-- INI: 0AC5=2,link_3d_audio_stream %1d% to_car %2d%
Opcode.register(0x0ac5, SanAndreasOpcodeAudioStream3D.setPlayAtCar, 2, 'set_play_3d_audio_stream_at_car ${1} ${2}', {false, false})
Opcode.register(0x2506, SanAndreasOpcodeAudioStream3D.setSourceSize, 2, 'set_audio_stream_source_size [AudioStream3D] ${1}')
