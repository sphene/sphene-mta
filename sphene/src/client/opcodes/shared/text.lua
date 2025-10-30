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


Opcode.register(0x00ba, SharedOpcodeText.printBig, 'print_big {key} [gxt_key] {time} [int] {style} [TextStyle]')
Opcode.register(0x00bb, SharedOpcodeText.print, 'print {key} [gxt_key] {time} [int] {flag} [int]')
Opcode.register(0x00bc, SharedOpcodeText.printNow, 'print_now {key} [gxt_key] {time} [int] {flag} [int]')
Opcode.register(0x00be, SharedOpcodeText.clearPrints, 'clear_prints')
Opcode.register(0x01e3, SharedOpcodeText.printWithNumberBig, 'print_with_number_big {key} [gxt_key] {num} [int] {duration} [int] {style} [TextStyle]')
Opcode.register(0x01e4, SharedOpcodeText.printWithNumber, 'print_with_number {key} [gxt_key] {num} [int] {duration} [int] {flag} [int]')
Opcode.register(0x01e5, SharedOpcodeText.printWithNumberNow, 'print_with_number_now {key} [gxt_key] {num} [int] {duration} [int] {flag} [int]')
Opcode.register(0x0217, SharedOpcodeText.printBigQ, 'print_big_q {key} [gxt_key] {duration} [int] {style} [TextStyle]')
Opcode.register(0x02fd, SharedOpcodeText.printWith2NumbersNow, 'print_with_2_numbers_now {key} [gxt_key] {num1} [int] {num2} [int] {duration} [int] {style} [TextStyle]')
Opcode.register(0x02ff, SharedOpcodeText.printWith3Numbers, 'print_with_3_numbers {key} [gxt_key] {num1} [int] {num2} [int] {num3} [int] {duration} [int] {style} [TextStyle]')
Opcode.register(0x0302, SharedOpcodeText.printWith4Numbers, 'print_with_4_numbers {key} [gxt_key] {num1} [int] {num2} [int] {num3} [int] {num4} [int] {duration} [int] {style} [TextStyle]')
Opcode.register(0x0308, SharedOpcodeText.printWith6Numbers, 'print_with_6_numbers {key} [gxt_key] {num1} [int] {num2} [int] {num3} [int] {num4} [int] {num5} [int] {num6} [int] {duration} [int] {style} [TextStyle]')
Opcode.register(0x033e, SharedOpcodeText.display, 'display_text {offsetLeft} [float] {offsetTop} [float] {key} [gxt_key]')
Opcode.register(0x033f, SharedOpcodeText.setScale, 'set_text_scale {widthScale} [float] {heightScale} [float]')
Opcode.register(0x0340, SharedOpcodeText.setColor, 'set_text_colour {red} [int] {green} [int] {blue} [int] {alpha} [int]')
Opcode.register(0x0341, SharedOpcodeText.setJustify, 'set_text_justify {state} [bool]')
Opcode.register(0x0342, SharedOpcodeText.setCenter, 'set_text_centre {state} [bool]')
Opcode.register(0x0343, SharedOpcodeText.setWrapX, 'set_text_wrapx {width} [float]')
Opcode.register(0x0345, SharedOpcodeText.setBackground, 'set_text_background {state} [bool]')
Opcode.register(0x0348, SharedOpcodeText.setProportional, 'set_text_proportional {state} [bool]')
Opcode.register(0x0349, SharedOpcodeText.setFont, 'set_text_font {font} [Font]')
Opcode.register(0x036d, SharedOpcodeText.printWith2NumbersBig, 'print_with_2_numbers_big {key} [gxt_key] {num1} [int] {num2} [int] {duration} [int] {style} [TextStyle]')
Opcode.register(0x0384, SharedOpcodeText.printStringInStringNow, 'print_string_in_string_now {templateKey} [gxt_key] {replacementKey} [gxt_key] {duration} [int] {style} [TextStyle]')
Opcode.register(0x03d5, SharedOpcodeText.clearThisPrint, 'clear_this_print {key} [gxt_key]')
Opcode.register(0x03d6, SharedOpcodeText.clearThisBigPrint, 'clear_this_big_print {key} [gxt_key]')
Opcode.register(0x03e4, SharedOpcodeText.setRightJustify, 'set_text_right_justify {state} [bool]')
Opcode.register(0x03e5, SharedOpcodeText.printHelp, 'print_help {key} [gxt_key]')
Opcode.register(0x03e6, SharedOpcodeText.clearHelp, 'clear_help')
Opcode.register(0x03eb, SharedOpcodeText.clearSmallPrints, 'clear_small_prints')
Opcode.register(0x03f0, SharedOpcodeText.useCommands, 'use_text_commands {state} [bool]')
Opcode.register(0x045a, SharedOpcodeText.displayWithNumber, 'display_text_with_number {offsetLeft} [float] {offsetTop} [float] {key} [gxt_key] {num} [int]')
Opcode.register(0x045b, SharedOpcodeText.displayWith2Numbers, 'display_text_with_2_numbers {offsetLeft} [float] {offsetTop} [float] {key} [gxt_key] {num1} [int] {num2} [int]')
Opcode.register(0x0512, SharedOpcodeText.printHelpForever, 'print_help_forever {key} [gxt_key]')
Opcode.register(0x054c, SharedOpcodeText.loadMissionText, 'load_mission_text {tableName} [string]')
Opcode.register(0x0aca, SharedOpcodeText.printHelpString, 'print_help_string {text} [string]')
Opcode.register(0x0acb, SharedOpcodeText.printBigString, 'print_big_string {text} [string] {time} [int] {style} [TextStyle]')
Opcode.register(0x0acc, SharedOpcodeText.printString, 'print_string {text} [string] {time} [int]')
Opcode.register(0x0acd, SharedOpcodeText.printStringNow, 'print_string_now {text} [string] {time} [int]')
Opcode.register(0x0ace, SharedOpcodeText.printHelpFormatted, 'print_help_formatted {text} [string] {args} [arguments]')
Opcode.register(0x0acf, SharedOpcodeText.printBigFormatted, 'print_big_formatted {format} [string] {time} [int] {style} [TextStyle] {args} [arguments]')
Opcode.register(0x0ad0, SharedOpcodeText.printFormatted, 'print_formatted {format} [string] {time} [int] {args} [arguments]')
Opcode.register(0x0ad1, SharedOpcodeText.printFormattedNow, 'print_formatted_now {format} [string] {time} [int] {args} [arguments]')
Opcode.register(0x0ad3, SharedOpcodeText.stringFormat, 'string_format {buffer} [int] {format} [string] {args} [arguments]')
Opcode.register(0x0ad4, SharedOpcodeText.scanString, '[var nValues: int], [var values: arguments] = scan_string {string} [string] {format} [string]')
Opcode.register(0x0ade, SharedOpcodeText.getLabelString, '[var text: string] = get_text_label_string {key} [gxt_key]')
Opcode.register(0x0adf, SharedOpcodeText.addLabel, 'add_text_label {dynamicKey} [gxt_key] {text} [string]')
Opcode.register(0x0ae0, SharedOpcodeText.removeLabel, 'remove_text_label {key} [gxt_key]')
