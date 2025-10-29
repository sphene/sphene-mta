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


Opcode.register(0x0ae6, SanAndreasOpcodeFindFile.first, '[var handle: FindFile], [var fileName: string] = find_first_file {searchMask} [string]')
Opcode.register(0x0ae7, SanAndreasOpcodeFindFile.next, '[var fileName: string] = find_next_file [FindFile]')
Opcode.register(0x0ae8, SanAndreasOpcodeFindFile.close, 'find_close [FindFile]')
