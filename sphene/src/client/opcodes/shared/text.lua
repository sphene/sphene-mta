SharedOpcodeText = {}
SharedOpcodeText.__index = SharedOpcodeText

-- Opcode: 0x00BA
-- Instruction: print_big {key} [gxt_key] {time} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00BA
function SharedOpcodeText.printBig(label, time, style)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    return Text.addMessageToQueue(text, label, time, style)
end

-- Opcode: 0x00BB
-- Instruction: print {key} [gxt_key] {time} [int] {flag} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00BB
function SharedOpcodeText.print(label, time, _)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    return Text.addMessageToQueue(text, label, time, 1022)
end

-- Opcode: 0x00BC
-- Instruction: print_now {key} [gxt_key] {time} [int] {flag} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00BC
function SharedOpcodeText.printNow(label, time)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    return Text.addMessageToQueue(text, label, time, 1022, 2)
end

-- Opcode: 0x00BE
-- Instruction: clear_prints
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00BE
function SharedOpcodeText.clearPrints()
    Text.clearAllPrint()
end

-- Opcode: 0x01E3
-- Instruction: print_with_number_big {key} [gxt_key] {num} [int] {duration} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01E3
function SharedOpcodeText.printWithNumberBig(label, number, time, style)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    text = text:gsub("~1~", tostring(math.floor(number)))

    return Text.addMessageToQueue(text, label, time, style)
end

-- Opcode: 0x01E4
-- Instruction: print_with_number {key} [gxt_key] {num} [int] {duration} [int] {flag} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01E4
function SharedOpcodeText.printWithNumber(label, number, time, flag)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    text = text:gsub("~1~", tostring(math.floor(number)))

    return Text.addMessageToQueue(text, label, time, 1022)
end

-- Opcode: 0x01E5
-- Instruction: print_with_number_now {key} [gxt_key] {num} [int] {duration} [int] {flag} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01E5
function SharedOpcodeText.printWithNumberNow(label, number, time, flag)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    text = text:gsub("~1~", tostring(math.floor(number)))
    return Text.addMessageToQueue(text, label, time, 1022, 2)
end

-- Opcode: 0x0217
-- Instruction: print_big_q {key} [gxt_key] {duration} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0217
function SharedOpcodeText.printBigQ(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02FD
-- Instruction: print_with_2_numbers_now {key} [gxt_key] {num1} [int] {num2} [int] {duration} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02FD
function SharedOpcodeText.printWith2NumbersNow(label, number1, number2, time, flag)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    text = text:gsub("~1~", tostring(math.floor(number1)), 1)
    text = text:gsub("~1~", tostring(math.floor(number2)), 1)

    return Text.addMessageToQueue(text, label, time, 1022)
end

-- Opcode: 0x02FF
-- Instruction: print_with_3_numbers {key} [gxt_key] {num1} [int] {num2} [int] {num3} [int] {duration} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02FF
function SharedOpcodeText.printWith3Numbers(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0302
-- Instruction: print_with_4_numbers {key} [gxt_key] {num1} [int] {num2} [int] {num3} [int] {num4} [int] {duration} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0302
function SharedOpcodeText.printWith4Numbers(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0308
-- Instruction: print_with_6_numbers {key} [gxt_key] {num1} [int] {num2} [int] {num3} [int] {num4} [int] {num5} [int] {num6} [int] {duration} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0308
function SharedOpcodeText.printWith6Numbers(label, number1, number2, number3, number4, number5, number6, time, flag)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    text = text:gsub("~1~", tostring(math.floor(number1)), 1)
    text = text:gsub("~1~", tostring(math.floor(number2)), 1)
    text = text:gsub("~1~", tostring(math.floor(number3)), 1)
    text = text:gsub("~1~", tostring(math.floor(number4)), 1)
    text = text:gsub("~1~", tostring(math.floor(number5)), 1)
    text = text:gsub("~1~", tostring(math.floor(number6)), 1)

    return Text.addMessageToQueue(text, label, time, 1022)
end

-- Opcode: 0x033E
-- Instruction: display_text {offsetLeft} [float] {offsetTop} [float] {key} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/033E
function SharedOpcodeText.display(posX, posY, text)
    TextDraw.drawText(Text.getFormattedTextFromHash(CRC32.getKey(text)), posX, posY)
end

-- Opcode: 0x033F
-- Instruction: set_text_scale {widthScale} [float] {heightScale} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/033F
function SharedOpcodeText.setScale(width, height)
    TextDraw.setLetterSize(width, height)
end

-- Opcode: 0x0340
-- Instruction: set_text_colour {red} [int] {green} [int] {blue} [int] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0340
function SharedOpcodeText.setColor(r, g, b, a)
    TextDraw.setColor(r, g, b, a)
end

-- Opcode: 0x0341
-- Instruction: set_text_justify {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0341
function SharedOpcodeText.setJustify(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0342
-- Instruction: set_text_centre {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0342
function SharedOpcodeText.setCenter(centered)
    TextDraw.setAlignment(centered == 1 and TextDraw.ALIGNMENT.CENTER or TextDraw.ALIGNMENT.LEFT)
end

-- Opcode: 0x0343
-- Instruction: set_text_wrapx {width} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0343
function SharedOpcodeText.setWrapX(width)
    TextDraw.setLineWidth(width * (Game.screenWidth / 640))
end

-- Opcode: 0x0345
-- Instruction: set_text_background {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0345
function SharedOpcodeText.setBackground(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0348
-- Instruction: set_text_proportional {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0348
function SharedOpcodeText.setProportional(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0349
-- Instruction: set_text_font {font} [Font]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0349
function SharedOpcodeText.setFont(fontId)
    TextDraw.setFont(fontId)
end

-- Opcode: 0x036D
-- Instruction: print_with_2_numbers_big {key} [gxt_key] {num1} [int] {num2} [int] {duration} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/036D
function SharedOpcodeText.printWith2NumbersBig(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0384
-- Instruction: print_string_in_string_now {templateKey} [gxt_key] {replacementKey} [gxt_key] {duration} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0384
function SharedOpcodeText.printStringInStringNow(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03D5
-- Instruction: clear_this_print {key} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03D5
function SharedOpcodeText.clearThisPrint(label)
    for index,messageData in pairs(Text.messageQueue['textbox']) do
        if (messageData.label == label) then
            table.remove(Text.messageQueue, index)
        end
    end

    return true
end

-- Opcode: 0x03D6
-- Instruction: clear_this_big_print {key} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03D6
function SharedOpcodeText.clearThisBigPrint(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03E4
-- Instruction: set_text_right_justify {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03E4
function SharedOpcodeText.setRightJustify(alignRight)
    TextDraw.setAlignment(alignRight == 1 and TextDraw.ALIGNMENT.RIGHT or TextDraw.ALIGNMENT.LEFT)
end

-- Opcode: 0x03E5
-- Instruction: print_help {key} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03E5
function SharedOpcodeText.printHelp(label)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    Text.addMessageToQueue(text, label, 0, -1)
    return true
end

-- Opcode: 0x03E6
-- Instruction: clear_help
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03E6
function SharedOpcodeText.clearHelp()
    Text.removeTextBox()
    return true
end

-- Opcode: 0x03EB
-- Instruction: clear_small_prints
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03EB
function SharedOpcodeText.clearSmallPrints()
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03F0
-- Instruction: use_text_commands {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03F0
function SharedOpcodeText.useCommands(state)
    TextDraw.setEnabled(state == 1)
end

-- Opcode: 0x045A
-- Instruction: display_text_with_number {offsetLeft} [float] {offsetTop} [float] {key} [gxt_key] {num} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/045A
function SharedOpcodeText.displayWithNumber(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x045B
-- Instruction: display_text_with_2_numbers {offsetLeft} [float] {offsetTop} [float] {key} [gxt_key] {num1} [int] {num2} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/045B
function SharedOpcodeText.displayWith2Numbers(posX, posY, label, number1, number2)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    text = text:gsub("~1~", tostring(math.floor(number1)), 1)
    text = text:gsub("~1~", tostring(math.floor(number2)), 1)

    TextDraw.drawText(text, posX, posY)
end

-- Opcode: 0x0512
-- Instruction: print_help_forever {key} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0512
function SharedOpcodeText.printHelpForever(label)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    Text.showPermanentBox(text, label)
    return true
end

-- Opcode: 0x054C
-- Instruction: load_mission_text {tableName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/054C
function SharedOpcodeText.loadMissionText(table)
    Text.setGXTTable(table)
end

-- Opcode: 0x0ACA
-- Instruction: print_help_string {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ACA
function SharedOpcodeText.printHelpString(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ACB
-- Instruction: print_big_string {text} [string] {time} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ACB
function SharedOpcodeText.printBigString(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ACC
-- Instruction: print_string {text} [string] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ACC
function SharedOpcodeText.printString(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ACD
-- Instruction: print_string_now {text} [string] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ACD
function SharedOpcodeText.printStringNow(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ACE
-- Instruction: print_help_formatted {text} [string] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ACE
function SharedOpcodeText.printHelpFormatted()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ACF
-- Instruction: print_big_formatted {format} [string] {time} [int] {style} [TextStyle] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ACF
function SharedOpcodeText.printBigFormatted()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AD0
-- Instruction: print_formatted {format} [string] {time} [int] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AD0
function SharedOpcodeText.printFormatted()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AD1
-- Instruction: print_formatted_now {format} [string] {time} [int] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AD1
function SharedOpcodeText.printFormattedNow()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AD3
-- Instruction: string_format {buffer} [int] {format} [string] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AD3
function SharedOpcodeText.stringFormat()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AD4
-- Instruction: [var nValues: int], [var values: arguments] = scan_string {string} [string] {format} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AD4
function SharedOpcodeText.scanString()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ADE
-- Instruction: [var text: string] = get_text_label_string {key} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ADE
function SharedOpcodeText.getLabelString(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ADF
-- Instruction: add_text_label {dynamicKey} [gxt_key] {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ADF
function SharedOpcodeText.addLabel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AE0
-- Instruction: remove_text_label {key} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AE0
function SharedOpcodeText.removeLabel(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 00ba=3,text_styled %1g% %2d% ms %3d%
Opcode.register(0x00ba, SharedOpcodeText.printBig, 3, 'print_big ${1} ${2} ${3}', {false, false, false})
-- INI: 00bb=3,text_lowpriority %1g% time %2d% %3d%
Opcode.register(0x00bb, SharedOpcodeText.print, 3, 'print ${1} ${2} ${3}', {false, false, false})
-- INI: 00bc=3,text_highpriority %1g% time %2d% %3d%
Opcode.register(0x00bc, SharedOpcodeText.printNow, 3, 'print_now ${1} ${2} ${3}', {false, false, false})
-- INI: 00be=0,text_clear_all
Opcode.register(0x00be, SharedOpcodeText.clearPrints, 0, 'clear_prints', {})
-- INI: 01e3=4,text_1number_styled %1g% number %2d% time %3d% style %4d%
Opcode.register(0x01e3, SharedOpcodeText.printWithNumberBig, 4, 'print_with_number_big ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 01e4=4,text_1number_lowpriority %1g% %2d% time %3d% %4d%
Opcode.register(0x01e4, SharedOpcodeText.printWithNumber, 4, 'print_with_number ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 01e5=4,text_1number_highpriority %1g% %2d% time %3d% %4d%
Opcode.register(0x01e5, SharedOpcodeText.printWithNumberNow, 4, 'print_with_number_now ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0217=3,text_styled %1g% time %2d% style %3d%
Opcode.register(0x0217, SharedOpcodeText.printBigQ, 3, 'print_big_q ${1} ${2} ${3}', {false, false, false})
-- INI: 02fd=5,text_2numbers_highpriority %1g% %2d% %3d% time %4d% %5d%
Opcode.register(0x02fd, SharedOpcodeText.printWith2NumbersNow, 5, 'print_with_2_numbers_now ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 02ff=6,text_3numbers_lowpriority %1g% %2d% %3d% %4d% time time %5d% %6h%
Opcode.register(0x02ff, SharedOpcodeText.printWith3Numbers, 6, 'print_with_3_numbers ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0302=7,text_4numbers_lowpriority %1g% %2d% %3d% %4d% %5d% time %6d% %7d%
Opcode.register(0x0302, SharedOpcodeText.printWith4Numbers, 7, 'print_with_4_numbers ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 0308=9,text_6numbers_lowpriority %1g% %2d% %3d% %4d% %5d% %6d% %7d% time %8d% %9d%
Opcode.register(0x0308, SharedOpcodeText.printWith6Numbers, 9, 'print_with_6_numbers ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 033e=3,text_draw %1d% %2d% %3g%
Opcode.register(0x033e, SharedOpcodeText.display, 3, 'display_text ${1} ${2} ${3}', {false, false, false})
-- INI: 033f=2,set_text_draw_letter_width_height %1d% %2d%
Opcode.register(0x033f, SharedOpcodeText.setScale, 2, 'set_text_scale ${1} ${2}', {false, false})
-- INI: 0340=4,set_text_draw_color %1d% %2d% %3d% %4d%
Opcode.register(0x0340, SharedOpcodeText.setColor, 4, 'set_text_colour ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0341=1,set_text_draw_align_justify %1d%
Opcode.register(0x0341, SharedOpcodeText.setJustify, 1, 'set_text_justify ${1}', {false})
-- INI: 0342=1,set_text_draw_centered %1d%
Opcode.register(0x0342, SharedOpcodeText.setCenter, 1, 'set_text_centre ${1}', {false})
-- INI: 0343=1,set_text_linewidth %1d%
Opcode.register(0x0343, SharedOpcodeText.setWrapX, 1, 'set_text_wrapx ${1}', {false})
-- INI: 0345=1,set_text_draw_in_box %1d%
Opcode.register(0x0345, SharedOpcodeText.setBackground, 1, 'set_text_background ${1}', {false})
-- INI: 0348=1,set_text_draw_proportional %1d%
Opcode.register(0x0348, SharedOpcodeText.setProportional, 1, 'set_text_proportional ${1}', {false})
-- INI: 0349=1,text_draw_style = %1d%
Opcode.register(0x0349, SharedOpcodeText.setFont, 1, 'set_text_font ${1}', {false})
-- INI: 036d=5,text_2numbers_styled %1g% numbers %2d% %3d% time %4d% style %5d%
Opcode.register(0x036d, SharedOpcodeText.printWith2NumbersBig, 5, 'print_with_2_numbers_big ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0384=4,text_1string_highpriority %1g% %2g% time %3d% %4d%
Opcode.register(0x0384, SharedOpcodeText.printStringInStringNow, 4, 'print_string_in_string_now ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 03d5=1,remove_text %1g%
Opcode.register(0x03d5, SharedOpcodeText.clearThisPrint, 1, 'clear_this_print ${1}', {false})
-- INI: 03d6=1,remove_styled_text %1g%
Opcode.register(0x03d6, SharedOpcodeText.clearThisBigPrint, 1, 'clear_this_big_print ${1}', {false})
-- INI: 03e4=1,set_text_draw_align_right %1h%
Opcode.register(0x03e4, SharedOpcodeText.setRightJustify, 1, 'set_text_right_justify ${1}', {false})
-- INI: 03e5=1,text_box %1g%
Opcode.register(0x03e5, SharedOpcodeText.printHelp, 1, 'print_help ${1}', {false})
-- INI: 03e6=0,remove_text_box
Opcode.register(0x03e6, SharedOpcodeText.clearHelp, 0, 'clear_help', {})
-- INI: 03eb=0,clear_small_messages_only
Opcode.register(0x03eb, SharedOpcodeText.clearSmallPrints, 0, 'clear_small_prints', {})
-- INI: 03f0=1,enable_text_draw %1d%
Opcode.register(0x03f0, SharedOpcodeText.useCommands, 1, 'use_text_commands ${1}', {false})
-- INI: 045a=4,text_draw_1number %1d% %2d% %3g% %4d%
Opcode.register(0x045a, SharedOpcodeText.displayWithNumber, 4, 'display_text_with_number ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 045b=5,text_draw_2numbers %1d% %2d% %3g% %4d% %5d%
Opcode.register(0x045b, SharedOpcodeText.displayWith2Numbers, 5, 'display_text_with_2_numbers ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0512=1,show_permanent_text_box %1s%
Opcode.register(0x0512, SharedOpcodeText.printHelpForever, 1, 'print_help_forever ${1}', {false})
-- INI: 054c=1,use_GXT_table %1s%
Opcode.register(0x054c, SharedOpcodeText.loadMissionText, 1, 'load_mission_text ${1}', {false})
-- INI: 0ACA=1,show_text_box %1s%
Opcode.register(0x0aca, SharedOpcodeText.printHelpString, 1, 'print_help_string ${1}', {false})
-- INI: 0ACB=3,show_styled_text %1s% time %2d% style %3d%
Opcode.register(0x0acb, SharedOpcodeText.printBigString, 3, 'print_big_string ${1} ${2} ${3}', {false, false, false})
-- INI: 0ACC=2,show_text_lowpriority %1s% time %2d%
Opcode.register(0x0acc, SharedOpcodeText.printString, 2, 'print_string ${1} ${2}', {false, false})
-- INI: 0ACD=2,show_text_highpriority %1s% time %2d%
Opcode.register(0x0acd, SharedOpcodeText.printStringNow, 2, 'print_string_now ${1} ${2}', {false, false})
Opcode.register(0x0ace, SharedOpcodeText.printHelpFormatted, -1, 'print_help_formatted ${1}', {})
Opcode.register(0x0acf, SharedOpcodeText.printBigFormatted, -1, 'print_big_formatted ${1} ${2} ${3}', {})
Opcode.register(0x0ad0, SharedOpcodeText.printFormatted, -1, 'print_formatted ${1} ${2}', {})
Opcode.register(0x0ad1, SharedOpcodeText.printFormattedNow, -1, 'print_formatted_now ${1} ${2}', {})
Opcode.register(0x0ad3, SharedOpcodeText.stringFormat, -1, 'string_format ${1} ${2}', {1})
Opcode.register(0x0ad4, SharedOpcodeText.scanString, -1, '${1}, ${2} = scan_string ${3} ${4}', {3})
-- INI: 0ADE=2,%2d% = text_label_string %1d%
Opcode.register(0x0ade, SharedOpcodeText.getLabelString, 2, '${1} = get_text_label_string ${2}', {true, false})
-- INI: 0ADF=2,add_text_label %1d% text %2d%
Opcode.register(0x0adf, SharedOpcodeText.addLabel, 2, 'add_text_label ${1} ${2}', {false, false})
-- INI: 0AE0=1,remove_text_label %1d%
Opcode.register(0x0ae0, SharedOpcodeText.removeLabel, 1, 'remove_text_label ${1}', {false})
