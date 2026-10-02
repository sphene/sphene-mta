SanAndreasOpcodeFs = {}
SanAndreasOpcodeFs.__index = SanAndreasOpcodeFs

-- Opcode: 0x0AE4
-- Instruction: does_directory_exist {path} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AE4
function SanAndreasOpcodeFs.doesDirectoryExist(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AE5
-- Instruction: create_directory {path} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AE5
function SanAndreasOpcodeFs.createDirectory(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2303
-- Instruction: [var resolved: string] = resolve_filepath {path} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2303
function SanAndreasOpcodeFs.resolvePath()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2304
-- Instruction: [var filenameOrPath: string] = get_script_filename {address} [int] {fullPath} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2304
function SanAndreasOpcodeFs.getScriptFilename()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2305
-- Instruction: [var year: int], [var month: int], [var day: int], [var hour: int], [var minute: int], [var second: int], [var milisecond: int] = get_file_write_time {fileName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2305
function SanAndreasOpcodeFs.getFileWriteTime()
   return Script.setOpcodeUnimplemented()
end


-- INI: 0AE4=1,  does_directory_exist %1d%
Opcode.register(0x0ae4, SanAndreasOpcodeFs.doesDirectoryExist, 1, 'does_directory_exist ${1}', {false})
-- INI: 0AE5=1,create_directory %1d% ; IF and SET
Opcode.register(0x0ae5, SanAndreasOpcodeFs.createDirectory, 1, 'create_directory ${1}', {false})
Opcode.register(0x2303, SanAndreasOpcodeFs.resolvePath, 2, '${1} = resolve_filepath ${2}')
Opcode.register(0x2304, SanAndreasOpcodeFs.getScriptFilename, 3, '${1} = get_script_filename ${2} ${3}')
Opcode.register(0x2305, SanAndreasOpcodeFs.getFileWriteTime, 8, '${1}, ${2}, ${3}, ${4}, ${5}, ${6}, ${7} = get_file_write_time ${8}')
