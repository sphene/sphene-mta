ViceCityOpcodeText = {}
ViceCityOpcodeText.__index = ViceCityOpcodeText

-- Opcode: 0x0608
-- Instruction: display_text_string {screenX} [float] {screenY} [float] {text} [string]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0608
function ViceCityOpcodeText.displayString()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0609
-- Instruction: display_text_formatted {screenX} [float] {screenY} [float] {text} [string] [arguments]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0609
function ViceCityOpcodeText.displayFormatted()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0608, ViceCityOpcodeText.displayString, 'display_text_string {screenX} [float] {screenY} [float] {text} [string]')
Opcode.register(0x0609, ViceCityOpcodeText.displayFormatted, 'display_text_formatted {screenX} [float] {screenY} [float] {text} [string] [arguments]')
