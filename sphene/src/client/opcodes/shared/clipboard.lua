SharedOpcodeClipboard = {}
SharedOpcodeClipboard.__index = SharedOpcodeClipboard

-- Opcode: 0x0B20
-- Instruction: read_clipboard_data {address} [int] {number} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B20
function SharedOpcodeClipboard.readData(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B21
-- Instruction: write_clipboard_data {address} [int] {number} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B21
function SharedOpcodeClipboard.writeData(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0B20=2,read_clipboard_data %1d% size %2d%
Opcode.register(0x0b20, SharedOpcodeClipboard.readData, 2, 'read_clipboard_data ${1} ${2}', {false, false})
-- INI: 0B21=2,write_clipboard_data %1d% size %2d%
Opcode.register(0x0b21, SharedOpcodeClipboard.writeData, 2, 'write_clipboard_data ${1} ${2}', {false, false})
