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


Opcode.register(0x0d37, SanAndreasOpcodeMemory.writeStructParam, 'write_struct_param {address} [int] {index} [int] {value} [arguments]')
Opcode.register(0x0d38, SanAndreasOpcodeMemory.readStructParam, '[var value: arguments] = read_struct_param {address} [int] {index} [int]')
Opcode.register(0x0d4e, SanAndreasOpcodeMemory.readStructOffset, '[var result: any] = read_struct_offset {address} [int] {offset} [int] {size} [int]')
Opcode.register(0x0e28, SanAndreasOpcodeMemory.writeStructOffset, 'write_struct_offset {address} [int] {offset} [int] {size} [int] {value} [arguments]')
Opcode.register(0x0e6a, SanAndreasOpcodeMemory.makeNop, 'make_nop {address} [int] {size} [int]')
Opcode.register(0x0e70, SanAndreasOpcodeMemory.getLastCreatedCustomScript, '[var address: int] = get_last_created_custom_script')
Opcode.register(0x0ee2, SanAndreasOpcodeMemory.readStructOffsetMulti, '[var results: arguments] = read_struct_offset_multi {address} [int] {offset} [int] {count} [int] {size} [int]')
Opcode.register(0x0ee3, SanAndreasOpcodeMemory.writeStructOffsetMulti, 'write_struct_offset_multi {address} [int] {offset} [int] {count} [int] {size} [int] {params} [arguments]')
Opcode.register(0x2400, SanAndreasOpcodeMemory.copy, 'copy_memory {src} [int] {dest} [int] {size} [int]')
Opcode.register(0x2401, SanAndreasOpcodeMemory.readWithOffset, '[var result: int] = read_memory_with_offset {address} [int] {offset} [int] {size} [int]')
Opcode.register(0x2402, SanAndreasOpcodeMemory.writeWithOffset, 'write_memory_with_offset {address} [int] {offset} [int] {size} [int] {value} [any]')
Opcode.register(0x2403, SanAndreasOpcodeMemory.forget, 'forget_memory {address} [int]')
Opcode.register(0x2404, SanAndreasOpcodeMemory.getScriptStructJustCreated, '[var address: int] = get_script_struct_just_created')
Opcode.register(0x2405, SanAndreasOpcodeMemory.isScriptRunning, 'is_script_running {address} [int]')
Opcode.register(0x2407, SanAndreasOpcodeMemory.isEqual, 'is_memory_equal {addressA} [int] {addressB} [int] {size} [int]')
