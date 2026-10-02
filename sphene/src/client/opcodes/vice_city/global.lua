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


Opcode.register(0x004c, ViceCityOpcodeGlobal.gotoIfTrue, 1, 'goto_if_true ${1}', {false})
-- INI: 05df=4,write_memory %1d% size %2d% value %3d% virtual_protect %4d%
Opcode.register(0x05df, ViceCityOpcodeGlobal.writeMemory, 4, 'write_memory ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 05e0=4,%4d% = read_memory %1d% size %2d% virtual_protect %3d%
Opcode.register(0x05e0, ViceCityOpcodeGlobal.readMemory, 4, '${4} = read_memory ${1} ${2} ${3}', {false, false, false, true})
Opcode.register(0x05e1, ViceCityOpcodeGlobal.callFunction, -1, 'call_function ${1} ${2} ${3}', {})
Opcode.register(0x05e3, ViceCityOpcodeGlobal.callMethod, -1, 'call_method ${1} ${2} ${3} ${4}', {})
Opcode.register(0x05e4, ViceCityOpcodeGlobal.callMethodReturn, -1, '${1} = call_method_return ${2} ${3} ${4} ${5}', {})
-- INI: 05e6=2,%2d% = ped %1h% struct
Opcode.register(0x05e6, ViceCityOpcodeGlobal.getPedPointer, 2, '${2} = get_ped_pointer ${1}', {false, true})
-- INI: 05e7=2,%2d% = vehicle %1h% struct
Opcode.register(0x05e7, ViceCityOpcodeGlobal.getVehiclePointer, 1, '${2} = get_vehicle_pointer ${1}', {false, true})
-- INI: 05e8=2,%2d% = object %1h% struct
Opcode.register(0x05e8, ViceCityOpcodeGlobal.getObjectPointer, 2, '${2} = get_object_pointer ${1}', {false, true})
-- INI: 05e9=2,%2h% = ped_struct %1d% handle
Opcode.register(0x05e9, ViceCityOpcodeGlobal.getPedRef, 2, '${2} = get_ped_ref ${1}', {false, true})
-- INI: 05ea=2,%2h% = vehicle_struct %1d% handle
Opcode.register(0x05ea, ViceCityOpcodeGlobal.getVehicleRef, 2, '${2} = get_vehicle_ref ${1}', {false, true})
-- INI: 05ef=7,%7d% = random_actor_near_point %1d% %2d% %3d% in_radius %4d% find_next %5h% pass_deads %6h% //IF and SET
Opcode.register(0x05ef, ViceCityOpcodeGlobal.getRandomCharInSphereNoSaveRecursive, 7, '${7} = get_random_char_in_sphere_no_save_recursive ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 05f0=7,%7d% = random_vehicle_near_point %1d% %2d% %3d% in_radius %4d% find_next %5h% pass_wrecked %6h% //IF and SET
Opcode.register(0x05f0, ViceCityOpcodeGlobal.getRandomCarInSphereNoSaveRecursive, 7, '${7} = get_random_car_in_sphere_no_save_recursive ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
Opcode.register(0x7aaa, ViceCityOpcodeGlobal.playModMusic, 1, 'play_mod_music ${1}')
Opcode.register(0x7aab, ViceCityOpcodeGlobal.stopModMusic, 0, 'stop_mod_music')
Opcode.register(0x7aac, ViceCityOpcodeGlobal.opcode7AAC, 3, 'play_audio_stream_2channel ${1} ${2} ${3}')
Opcode.register(0x7abb, ViceCityOpcodeGlobal.setModPosition, 2, 'set_mod_position ${1} ${2}')
Opcode.register(0x7abc, ViceCityOpcodeGlobal.opcode7ABC, 1, 'set_audio_stream_1channel_playing_mode ${1}')
