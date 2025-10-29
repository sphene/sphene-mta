ViceCityOpcodeGlobal = {}
ViceCityOpcodeGlobal.__index = ViceCityOpcodeGlobal

-- Opcode: 0x004C
-- Instruction: goto_if_true @label
-- https://library.sannybuilder.com/#/vc/script/extensions/default/004C
function ViceCityOpcodeGlobal.gotoIfTrue(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05DF
-- Instruction: write_memory {address} [int] {size} [int] {value} [any] {vp} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05DF
function ViceCityOpcodeGlobal.writeMemory(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05E0
-- Instruction: [var result: any] = read_memory {address} [int] {size} [int] {vp} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05E0
function ViceCityOpcodeGlobal.readMemory(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05E1
-- Instruction: call_function {address} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05E1
function ViceCityOpcodeGlobal.callFunction()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05E3
-- Instruction: call_method {address} [int] {struct} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05E3
function ViceCityOpcodeGlobal.callMethod()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05E4
-- Instruction: [var funcRet: any] = call_method_return {address} [int] {struct} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05E4
function ViceCityOpcodeGlobal.callMethodReturn()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05E6
-- Instruction: [var address: int] = get_ped_pointer {char} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05E6
function ViceCityOpcodeGlobal.getPedPointer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05E7
-- Instruction: [var address: int] = get_vehicle_pointer {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05E7
function ViceCityOpcodeGlobal.getVehiclePointer(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05E8
-- Instruction: [var address: int] = get_object_pointer {object} [Object]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05E8
function ViceCityOpcodeGlobal.getObjectPointer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05E9
-- Instruction: [var handle: Char] = get_ped_ref {address} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05E9
function ViceCityOpcodeGlobal.getPedRef(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05EA
-- Instruction: [var handle: Car] = get_vehicle_ref {address} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05EA
function ViceCityOpcodeGlobal.getVehicleRef(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05EF
-- Instruction: [var handle: Char] = get_random_char_in_sphere_no_save_recursive {x} [float] {y} [float] {z} [float] {radius} [float] {findNext} [bool] {skipDead} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05EF
function ViceCityOpcodeGlobal.getRandomCharInSphereNoSaveRecursive(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05F0
-- Instruction: [var handle: Car] = get_random_car_in_sphere_no_save_recursive {x} [float] {y} [float] {z} [float] {radius} [float] {findNext} [bool] {skipWrecked} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05F0
function ViceCityOpcodeGlobal.getRandomCarInSphereNoSaveRecursive(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x7AAA
-- Instruction: play_mod_music {filename} [string]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/7AAA
function ViceCityOpcodeGlobal.playModMusic()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x7AAB
-- Instruction: stop_mod_music
-- https://library.sannybuilder.com/#/vc/script/extensions/default/7AAB
function ViceCityOpcodeGlobal.stopModMusic()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x7AAC
-- Instruction: play_audio_stream_2channel {filename} [string] {loop} [bool] {volume} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/7AAC
function ViceCityOpcodeGlobal.opcode7AAC()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x7ABB
-- Instruction: set_mod_position {order} [int] {row} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/7ABB
function ViceCityOpcodeGlobal.setModPosition()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x7ABC
-- Instruction: set_audio_stream_1channel_playing_mode {mode} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/7ABC
function ViceCityOpcodeGlobal.opcode7ABC()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x004c, ViceCityOpcodeGlobal.gotoIfTrue, 'goto_if_true @label')
Opcode.register(0x05df, ViceCityOpcodeGlobal.writeMemory, 'write_memory {address} [int] {size} [int] {value} [any] {vp} [bool]')
Opcode.register(0x05e0, ViceCityOpcodeGlobal.readMemory, '[var result: any] = read_memory {address} [int] {size} [int] {vp} [bool]')
Opcode.register(0x05e1, ViceCityOpcodeGlobal.callFunction, 'call_function {address} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]')
Opcode.register(0x05e3, ViceCityOpcodeGlobal.callMethod, 'call_method {address} [int] {struct} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]')
Opcode.register(0x05e4, ViceCityOpcodeGlobal.callMethodReturn, '[var funcRet: any] = call_method_return {address} [int] {struct} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]')
Opcode.register(0x05e6, ViceCityOpcodeGlobal.getPedPointer, '[var address: int] = get_ped_pointer {char} [Char]')
Opcode.register(0x05e7, ViceCityOpcodeGlobal.getVehiclePointer, '[var address: int] = get_vehicle_pointer {vehicle} [Car]')
Opcode.register(0x05e8, ViceCityOpcodeGlobal.getObjectPointer, '[var address: int] = get_object_pointer {object} [Object]')
Opcode.register(0x05e9, ViceCityOpcodeGlobal.getPedRef, '[var handle: Char] = get_ped_ref {address} [int]')
Opcode.register(0x05ea, ViceCityOpcodeGlobal.getVehicleRef, '[var handle: Car] = get_vehicle_ref {address} [int]')
Opcode.register(0x05ef, ViceCityOpcodeGlobal.getRandomCharInSphereNoSaveRecursive, '[var handle: Char] = get_random_char_in_sphere_no_save_recursive {x} [float] {y} [float] {z} [float] {radius} [float] {findNext} [bool] {skipDead} [bool]')
Opcode.register(0x05f0, ViceCityOpcodeGlobal.getRandomCarInSphereNoSaveRecursive, '[var handle: Car] = get_random_car_in_sphere_no_save_recursive {x} [float] {y} [float] {z} [float] {radius} [float] {findNext} [bool] {skipWrecked} [bool]')
Opcode.register(0x7aaa, ViceCityOpcodeGlobal.playModMusic, 'play_mod_music {filename} [string]')
Opcode.register(0x7aab, ViceCityOpcodeGlobal.stopModMusic, 'stop_mod_music')
Opcode.register(0x7aac, ViceCityOpcodeGlobal.opcode7AAC, 'play_audio_stream_2channel {filename} [string] {loop} [bool] {volume} [float]')
Opcode.register(0x7abb, ViceCityOpcodeGlobal.setModPosition, 'set_mod_position {order} [int] {row} [int]')
Opcode.register(0x7abc, ViceCityOpcodeGlobal.opcode7ABC, 'set_audio_stream_1channel_playing_mode {mode} [int]')
