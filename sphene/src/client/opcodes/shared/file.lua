SharedOpcodeFile = {}
SharedOpcodeFile.__index = SharedOpcodeFile

-- Opcode: 0x0A9A
-- Instruction: [var handle: File] = open_file {filePathName} [string] {mode} [FileMode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A9A
function SharedOpcodeFile.open(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A9B
-- Instruction: close_file [File]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A9B
function SharedOpcodeFile.close(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A9C
-- Instruction: [var size: int] = get_file_size [File]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A9C
function SharedOpcodeFile.getSize(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A9D
-- Instruction: [var destination: int] = read_from_file [File] {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A9D
function SharedOpcodeFile.read(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A9E
-- Instruction: write_to_file [File] {size} [int] {var_source} [var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A9E
function SharedOpcodeFile.write(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AD5
-- Instruction: file_seek [File] {offset} [int] {origin} [SeekOrigin]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AD5
function SharedOpcodeFile.seek(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AD6
-- Instruction: is_end_of_file_reached [File]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AD6
function SharedOpcodeFile.isEndReached(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AD7
-- Instruction: read_string_from_file [File] {storeTo} [string] {maxLength} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AD7
function SharedOpcodeFile.readString(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AD8
-- Instruction: write_string_to_file [File] {source} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AD8
function SharedOpcodeFile.writeString(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AD9
-- Instruction: write_formatted_string_to_file [File] {format} [string] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AD9
function SharedOpcodeFile.writeFormattedString()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ADA
-- Instruction: [var nValues: int], [var values: arguments] = scan_file [File] {format} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ADA
function SharedOpcodeFile.scan()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0a9a, SharedOpcodeFile.open, '[var handle: File] = open_file {filePathName} [string] {mode} [FileMode]')
Opcode.register(0x0a9b, SharedOpcodeFile.close, 'close_file [File]')
Opcode.register(0x0a9c, SharedOpcodeFile.getSize, '[var size: int] = get_file_size [File]')
Opcode.register(0x0a9d, SharedOpcodeFile.read, '[var destination: int] = read_from_file [File] {size} [int]')
Opcode.register(0x0a9e, SharedOpcodeFile.write, 'write_to_file [File] {size} [int] {var_source} [var int]')
Opcode.register(0x0ad5, SharedOpcodeFile.seek, 'file_seek [File] {offset} [int] {origin} [SeekOrigin]')
Opcode.register(0x0ad6, SharedOpcodeFile.isEndReached, 'is_end_of_file_reached [File]')
Opcode.register(0x0ad7, SharedOpcodeFile.readString, 'read_string_from_file [File] {storeTo} [string] {maxLength} [int]')
Opcode.register(0x0ad8, SharedOpcodeFile.writeString, 'write_string_to_file [File] {source} [string]')
Opcode.register(0x0ad9, SharedOpcodeFile.writeFormattedString, 'write_formatted_string_to_file [File] {format} [string] {args} [arguments]')
Opcode.register(0x0ada, SharedOpcodeFile.scan, '[var nValues: int], [var values: arguments] = scan_file [File] {format} [string]')
