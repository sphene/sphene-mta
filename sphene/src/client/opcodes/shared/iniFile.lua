SharedOpcodeIniFile = {}
SharedOpcodeIniFile.__index = SharedOpcodeIniFile

-- Opcode: 0x0AF0
-- Instruction: [var value: int] = read_int_from_ini_file {path} [string] {section} [string] {key} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AF0
function SharedOpcodeIniFile.readInt(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AF1
-- Instruction: write_int_to_ini_file {value} [int] {path} [string] {section} [string] {key} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AF1
function SharedOpcodeIniFile.writeInt(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AF2
-- Instruction: [var value: float] = read_float_from_ini_file {path} [string] {section} [string] {key} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AF2
function SharedOpcodeIniFile.readFloat(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AF3
-- Instruction: write_float_to_ini_file {value} [float] {path} [string] {section} [string] {key} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AF3
function SharedOpcodeIniFile.writeFloat(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AF4
-- Instruction: [var value: string] = read_string_from_ini_file {path} [string] {section} [string] {key} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AF4
function SharedOpcodeIniFile.readString(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AF5
-- Instruction: write_string_to_ini_file {value} [string] {path} [string] {section} [string] {key} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AF5
function SharedOpcodeIniFile.writeString(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0af0, SharedOpcodeIniFile.readInt, '[var value: int] = read_int_from_ini_file {path} [string] {section} [string] {key} [string]')
Opcode.register(0x0af1, SharedOpcodeIniFile.writeInt, 'write_int_to_ini_file {value} [int] {path} [string] {section} [string] {key} [string]')
Opcode.register(0x0af2, SharedOpcodeIniFile.readFloat, '[var value: float] = read_float_from_ini_file {path} [string] {section} [string] {key} [string]')
Opcode.register(0x0af3, SharedOpcodeIniFile.writeFloat, 'write_float_to_ini_file {value} [float] {path} [string] {section} [string] {key} [string]')
Opcode.register(0x0af4, SharedOpcodeIniFile.readString, '[var value: string] = read_string_from_ini_file {path} [string] {section} [string] {key} [string]')
Opcode.register(0x0af5, SharedOpcodeIniFile.writeString, 'write_string_to_ini_file {value} [string] {path} [string] {section} [string] {key} [string]')
