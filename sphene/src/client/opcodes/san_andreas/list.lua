SanAndreasOpcodeList = {}
SanAndreasOpcodeList.__index = SanAndreasOpcodeList

-- Opcode: 0x0E72
-- Instruction: [var handle: List] = create_list {type} [ListType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E72
function SanAndreasOpcodeList.create(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E73
-- Instruction: delete_list [List]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E73
function SanAndreasOpcodeList.delete(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E74
-- Instruction: list_add [List] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E74
function SanAndreasOpcodeList.add(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E75
-- Instruction: list_remove_value [List] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E75
function SanAndreasOpcodeList.removeValue(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E76
-- Instruction: list_remove_index [List] {index} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E76
function SanAndreasOpcodeList.removeIndex(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E77
-- Instruction: [var entries: int] = get_list_size [List]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E77
function SanAndreasOpcodeList.getSize(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E78
-- Instruction: [var value: any] = get_list_value_by_index [List] {index} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E78
function SanAndreasOpcodeList.getValueByIndex(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E79
-- Instruction: reset_list [List]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E79
function SanAndreasOpcodeList.reset(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E7A
-- Instruction: [var string: string] = get_list_string_value_by_index [List] {index} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E7A
function SanAndreasOpcodeList.getStringValueByIndex(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E7B
-- Instruction: list_add_string [List] {string} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E7B
function SanAndreasOpcodeList.addString(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E7C
-- Instruction: list_remove_string_value [List] {string} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E7C
function SanAndreasOpcodeList.removeStringValue(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E7D
-- Instruction: list_remove_index_range [List] {start} [int] {stop} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E7D
function SanAndreasOpcodeList.removeIndexRange(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E7E
-- Instruction: reverse_list [List]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E7E
function SanAndreasOpcodeList.reverse(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F06
-- Instruction: replace_list_value_by_index [List] {index} [int] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F06
function SanAndreasOpcodeList.replaceValueByIndex()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F07
-- Instruction: replace_list_string_value_by_index [List] {index} [int] {string} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F07
function SanAndreasOpcodeList.replaceStringValueByIndex()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F08
-- Instruction: insert_list_value_by_index [List] {index} [int] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F08
function SanAndreasOpcodeList.insertValueByIndex()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F09
-- Instruction: insert_list_string_value_by_index [List] {index} [int] {string} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F09
function SanAndreasOpcodeList.insertStringValueByIndex()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0e72, SanAndreasOpcodeList.create, '[var handle: List] = create_list {type} [ListType]')
Opcode.register(0x0e73, SanAndreasOpcodeList.delete, 'delete_list [List]')
Opcode.register(0x0e74, SanAndreasOpcodeList.add, 'list_add [List] {value} [any]')
Opcode.register(0x0e75, SanAndreasOpcodeList.removeValue, 'list_remove_value [List] {value} [any]')
Opcode.register(0x0e76, SanAndreasOpcodeList.removeIndex, 'list_remove_index [List] {index} [int]')
Opcode.register(0x0e77, SanAndreasOpcodeList.getSize, '[var entries: int] = get_list_size [List]')
Opcode.register(0x0e78, SanAndreasOpcodeList.getValueByIndex, '[var value: any] = get_list_value_by_index [List] {index} [int]')
Opcode.register(0x0e79, SanAndreasOpcodeList.reset, 'reset_list [List]')
Opcode.register(0x0e7a, SanAndreasOpcodeList.getStringValueByIndex, '[var string: string] = get_list_string_value_by_index [List] {index} [int]')
Opcode.register(0x0e7b, SanAndreasOpcodeList.addString, 'list_add_string [List] {string} [string]')
Opcode.register(0x0e7c, SanAndreasOpcodeList.removeStringValue, 'list_remove_string_value [List] {string} [string]')
Opcode.register(0x0e7d, SanAndreasOpcodeList.removeIndexRange, 'list_remove_index_range [List] {start} [int] {stop} [int]')
Opcode.register(0x0e7e, SanAndreasOpcodeList.reverse, 'reverse_list [List]')
Opcode.register(0x0f06, SanAndreasOpcodeList.replaceValueByIndex, 'replace_list_value_by_index [List] {index} [int] {value} [any]')
Opcode.register(0x0f07, SanAndreasOpcodeList.replaceStringValueByIndex, 'replace_list_string_value_by_index [List] {index} [int] {string} [string]')
Opcode.register(0x0f08, SanAndreasOpcodeList.insertValueByIndex, 'insert_list_value_by_index [List] {index} [int] {value} [any]')
Opcode.register(0x0f09, SanAndreasOpcodeList.insertStringValueByIndex, 'insert_list_string_value_by_index [List] {index} [int] {string} [string]')
