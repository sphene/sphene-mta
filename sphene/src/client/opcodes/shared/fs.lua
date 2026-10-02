SharedOpcodeFs = {}
SharedOpcodeFs.__index = SharedOpcodeFs

-- Opcode: 0x0A99
-- Instruction: set_current_directory {path} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A99
function SharedOpcodeFs.setCurrentDirectory(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AAB
-- Instruction: does_file_exist {path} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AAB
function SharedOpcodeFs.doesFileExist(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B00
-- Instruction: delete_file {path} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B00
function SharedOpcodeFs.deleteFile(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B01
-- Instruction: delete_directory {path} [string] {recursive} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B01
function SharedOpcodeFs.deleteDirectory(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B02
-- Instruction: move_file {fileName} [string] {newFileName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B02
function SharedOpcodeFs.moveFile(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B03
-- Instruction: move_directory {dirPath} [string] {newDirPath} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B03
function SharedOpcodeFs.moveDirectory(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B04
-- Instruction: copy_file {fileName} [string] {newFileName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B04
function SharedOpcodeFs.copyFile(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B05
-- Instruction: copy_directory {dirPath} [string] {newDirPath} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B05
function SharedOpcodeFs.copyDirectory(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0A99=1,set_current_directory %1buserdir/rootdir%
Opcode.register(0x0a99, SharedOpcodeFs.setCurrentDirectory, 1, 'set_current_directory ${1}', {false})
-- INI: 0AAB=1,  does_file_exist %1s%
Opcode.register(0x0aab, SharedOpcodeFs.doesFileExist, 1, 'does_file_exist ${1}', {false})
-- INI: 0B00=1,delete_file %1d% ;; IF and SET
Opcode.register(0x0b00, SharedOpcodeFs.deleteFile, 1, 'delete_file ${1}', {false})
-- INI: 0B01=2,delete_directory %1d% with_all_files_and_subdirectories %2d% ;; IF and SET
Opcode.register(0x0b01, SharedOpcodeFs.deleteDirectory, 2, 'delete_directory ${1} ${2}', {false, false})
-- INI: 0B02=2,move_file %1d% to %2d% ;; IF and SET
Opcode.register(0x0b02, SharedOpcodeFs.moveFile, 2, 'move_file ${1} ${2}', {false, false})
-- INI: 0B03=2,move_directory %1d% to %2d% ;; IF and SET
Opcode.register(0x0b03, SharedOpcodeFs.moveDirectory, 2, 'move_directory ${1} ${2}', {false, false})
-- INI: 0B04=2,copy_file %1d% to %2d% ;; IF and SET
Opcode.register(0x0b04, SharedOpcodeFs.copyFile, 2, 'copy_file ${1} ${2}', {false, false})
-- INI: 0B05=2,copy_directory %1d% to %2d% ;; IF and SET
Opcode.register(0x0b05, SharedOpcodeFs.copyDirectory, 2, 'copy_directory ${1} ${2}', {false, false})
