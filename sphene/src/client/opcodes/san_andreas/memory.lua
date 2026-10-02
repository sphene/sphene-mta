SanAndreasOpcodeMemory = {}
SanAndreasOpcodeMemory.__index = SanAndreasOpcodeMemory

-- Opcode: 0x0D37
-- Instruction: write_struct_param {address} [int] {index} [int] {value} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D37
function SanAndreasOpcodeMemory.writeStructParam(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D38
-- Instruction: [var value: arguments] = read_struct_param {address} [int] {index} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D38
function SanAndreasOpcodeMemory.readStructParam(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D4E
-- Instruction: [var result: any] = read_struct_offset {address} [int] {offset} [int] {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D4E
function SanAndreasOpcodeMemory.readStructOffset(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E28
-- Instruction: write_struct_offset {address} [int] {offset} [int] {size} [int] {value} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E28
function SanAndreasOpcodeMemory.writeStructOffset(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E6A
-- Instruction: make_nop {address} [int] {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E6A
function SanAndreasOpcodeMemory.makeNop(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E70
-- Instruction: [var address: int] = get_last_created_custom_script
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E70
function SanAndreasOpcodeMemory.getLastCreatedCustomScript(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EE2
-- Instruction: [var results: arguments] = read_struct_offset_multi {address} [int] {offset} [int] {count} [int] {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EE2
function SanAndreasOpcodeMemory.readStructOffsetMulti()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EE3
-- Instruction: write_struct_offset_multi {address} [int] {offset} [int] {count} [int] {size} [int] {params} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EE3
function SanAndreasOpcodeMemory.writeStructOffsetMulti()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2400
-- Instruction: copy_memory {src} [int] {dest} [int] {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2400
function SanAndreasOpcodeMemory.copy()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2401
-- Instruction: [var result: int] = read_memory_with_offset {address} [int] {offset} [int] {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2401
function SanAndreasOpcodeMemory.readWithOffset()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2402
-- Instruction: write_memory_with_offset {address} [int] {offset} [int] {size} [int] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2402
function SanAndreasOpcodeMemory.writeWithOffset()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2403
-- Instruction: forget_memory {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2403
function SanAndreasOpcodeMemory.forget()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2404
-- Instruction: [var address: int] = get_script_struct_just_created
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2404
function SanAndreasOpcodeMemory.getScriptStructJustCreated()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2405
-- Instruction: is_script_running {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2405
function SanAndreasOpcodeMemory.isScriptRunning()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2407
-- Instruction: is_memory_equal {addressA} [int] {addressB} [int] {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2407
function SanAndreasOpcodeMemory.isEqual()
   return Script.setOpcodeUnimplemented()
end


-- INI: 0D37=3,struct %1d% param %2d% = %3d%
Opcode.register(0x0d37, SanAndreasOpcodeMemory.writeStructParam, 3, 'write_struct_param ${1} ${2} ${3}', {true, true, false})
-- INI: 0D38=3,%3d% = struct %1d% param %2d%
Opcode.register(0x0d38, SanAndreasOpcodeMemory.readStructParam, 3, '${3} = read_struct_param ${1} ${2}', {false, false, true})
-- INI: 0D4E=4,%4d% = struct %1d% offset %2d% size %3d%
Opcode.register(0x0d4e, SanAndreasOpcodeMemory.readStructOffset, 4, '${4} = read_struct_offset ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0E28=4,write_struct %1d% offset %2d% size %3d% value %4d%
Opcode.register(0x0e28, SanAndreasOpcodeMemory.writeStructOffset, -1, 'write_struct_offset ${1} ${2} ${3}', {})
-- INI: 0E6A=2,make_nop %1d% size %2d%
Opcode.register(0x0e6a, SanAndreasOpcodeMemory.makeNop, 2, 'make_nop ${1} ${2}', {false, false})
-- INI: 0E70=1,get_last_created_custom_script %1d%
Opcode.register(0x0e70, SanAndreasOpcodeMemory.getLastCreatedCustomScript, 1, '${1} = get_last_created_custom_script', {false})
Opcode.register(0x0ee2, SanAndreasOpcodeMemory.readStructOffsetMulti, -1, '${1} = read_struct_offset_multi ${2} ${3} ${4} ${5}', {})
Opcode.register(0x0ee3, SanAndreasOpcodeMemory.writeStructOffsetMulti, -1, 'write_struct_offset_multi ${1} ${2} ${3} ${4}', {})
Opcode.register(0x2400, SanAndreasOpcodeMemory.copy, 3, 'copy_memory ${1} ${2} ${3}')
Opcode.register(0x2401, SanAndreasOpcodeMemory.readWithOffset, 4, '${1} = read_memory_with_offset ${2} ${3} ${4}')
Opcode.register(0x2402, SanAndreasOpcodeMemory.writeWithOffset, 4, 'write_memory_with_offset ${1} ${2} ${3} ${4}')
Opcode.register(0x2403, SanAndreasOpcodeMemory.forget, 1, 'forget_memory ${1}')
Opcode.register(0x2404, SanAndreasOpcodeMemory.getScriptStructJustCreated, 1, '${1} = get_script_struct_just_created')
Opcode.register(0x2405, SanAndreasOpcodeMemory.isScriptRunning, 1, 'is_script_running ${1}')
Opcode.register(0x2407, SanAndreasOpcodeMemory.isEqual, 3, 'is_memory_equal ${1} ${2} ${3}')
