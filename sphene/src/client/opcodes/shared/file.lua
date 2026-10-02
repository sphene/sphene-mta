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


-- INI: 0A9A=3,%3d% = open_file %1s% mode %2d% ; IF and SET
Opcode.register(0x0a9a, SharedOpcodeFile.open, 3, '${3} = open_file ${1} ${2}', {false, false, true})
-- INI: 0A9B=1,close_file %1d%
Opcode.register(0x0a9b, SharedOpcodeFile.close, 1, 'close_file ${1}', {false})
-- INI: 0A9C=2,%2d% = file %1d% size
Opcode.register(0x0a9c, SharedOpcodeFile.getSize, 2, '${1} = get_file_size ${2}', {true, false})
-- INI: 0A9D=3,read_file %1d% size %2d% to %3d%
Opcode.register(0x0a9d, SharedOpcodeFile.read, 3, '${3} = read_from_file ${1} ${2}', {false, false, true})
-- INI: 0A9E=3,write_file %1d% size %2d% from %3d%
Opcode.register(0x0a9e, SharedOpcodeFile.write, 3, 'write_to_file ${1} ${2} ${3}', {false, false, false})
-- INI: 0AD5=3,file %1d% seek %2d% from_origin %3d% // IF and SET
Opcode.register(0x0ad5, SharedOpcodeFile.seek, 3, 'file_seek ${1} ${2} ${3}', {false, false, false})
-- INI: 0AD6=1,  is_end_of_file_reached %1d%
Opcode.register(0x0ad6, SharedOpcodeFile.isEndReached, 1, 'is_end_of_file_reached ${1}', {false})
-- INI: 0AD7=3,read_string_from_file %1d% to %2d% size %3d% // IF and SET
Opcode.register(0x0ad7, SharedOpcodeFile.readString, 3, 'read_string_from_file ${1} ${2} ${3}', {false, false, false})
-- INI: 0AD8=2,write_string_to_file %1d% from %2d% // IF and SET
Opcode.register(0x0ad8, SharedOpcodeFile.writeString, 2, 'write_string_to_file ${1} ${2}', {false, false})
Opcode.register(0x0ad9, SharedOpcodeFile.writeFormattedString, -1, 'write_formatted_string_to_file [File] ${1}', {})
Opcode.register(0x0ada, SharedOpcodeFile.scan, -1, '${1}, ${2} = scan_file [File] ${3}', {3})
