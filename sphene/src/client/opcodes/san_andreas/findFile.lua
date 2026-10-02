SanAndreasOpcodeFindFile = {}
SanAndreasOpcodeFindFile.__index = SanAndreasOpcodeFindFile

-- Opcode: 0x0AE6
-- Instruction: [var handle: FindFile], [var fileName: string] = find_first_file {searchMask} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AE6
function SanAndreasOpcodeFindFile.first(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AE7
-- Instruction: [var fileName: string] = find_next_file [FindFile]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AE7
function SanAndreasOpcodeFindFile.next(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AE8
-- Instruction: find_close [FindFile]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AE8
function SanAndreasOpcodeFindFile.close(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0AE6=3,%2d% = find_first_file %1d% get_filename_to %3d% ; IF and SET
Opcode.register(0x0ae6, SanAndreasOpcodeFindFile.first, 3, '${1}, ${2} = find_first_file ${3}', {false, true, false})
-- INI: 0AE7=2,%2d% = find_next_file %1d% ; IF and SET
Opcode.register(0x0ae7, SanAndreasOpcodeFindFile.next, 2, '${1} = find_next_file ${2}', {true, false})
-- INI: 0AE8=1,find_close %1d%
Opcode.register(0x0ae8, SanAndreasOpcodeFindFile.close, 1, 'find_close ${1}', {false})
