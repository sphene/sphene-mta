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


-- INI: 0608=3, show_text_position %1d% %2d% text %3d%
Opcode.register(0x0608, ViceCityOpcodeText.displayString, 3, 'display_text_string ${1} ${2} ${3}', {false, false, false})
-- INI: 0609=0,NOP
Opcode.register(0x0609, ViceCityOpcodeText.displayFormatted, -1, 'display_text_formatted ${1} ${2} ${3}', {})
