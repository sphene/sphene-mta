SanAndreasOpcodeFile = {}
SanAndreasOpcodeFile.__index = SanAndreasOpcodeFile

-- Opcode: 0x2300
-- Instruction: [var position: int] = get_file_position [File]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2300
function SanAndreasOpcodeFile.getPosition()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2301
-- Instruction: read_block_from_file [File] {size} [int] {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2301
function SanAndreasOpcodeFile.readBlock()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2302
-- Instruction: write_block_to_file [File] {size} [int] {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2302
function SanAndreasOpcodeFile.writeBlock()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x2300, SanAndreasOpcodeFile.getPosition, '[var position: int] = get_file_position [File]')
Opcode.register(0x2301, SanAndreasOpcodeFile.readBlock, 'read_block_from_file [File] {size} [int] {address} [int]')
Opcode.register(0x2302, SanAndreasOpcodeFile.writeBlock, 'write_block_to_file [File] {size} [int] {address} [int]')
