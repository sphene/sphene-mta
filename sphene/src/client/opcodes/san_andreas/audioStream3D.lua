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


Opcode.register(0x0ac1, SanAndreasOpcodeAudioStream3D.load, '[var handle: AudioStream3D] = load_3d_audio_stream {audioFileName} [string]')
Opcode.register(0x0ac2, SanAndreasOpcodeAudioStream3D.setPlayAtCoords, 'set_play_3d_audio_stream_at_coords [AudioStream3D] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0ac3, SanAndreasOpcodeAudioStream3D.setPlayAtObject, 'set_play_3d_audio_stream_at_object [AudioStream3D] {object} [Object]')
Opcode.register(0x0ac4, SanAndreasOpcodeAudioStream3D.setPlayAtChar, 'set_play_3d_audio_stream_at_char [AudioStream3D] {char} [Char]')
Opcode.register(0x0ac5, SanAndreasOpcodeAudioStream3D.setPlayAtCar, 'set_play_3d_audio_stream_at_car [AudioStream3D] {car} [Car]')
Opcode.register(0x2506, SanAndreasOpcodeAudioStream3D.setSourceSize, 'set_audio_stream_source_size [AudioStream3D] {radius} [float]')
