SanAndreasOpcodeText = {}
SanAndreasOpcodeText.__index = SanAndreasOpcodeText

-- Opcode: 0x0303
-- Instruction: print_with_4_numbers_now {key} [gxt_key] {num1} [int] {num2} [int] {num3} [int] {num4} [int] {duration} [int] {style} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0303
function SanAndreasOpcodeText.printWith4NumbersNow(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0344
-- Instruction: set_text_centre_size {width} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0344
function SanAndreasOpcodeText.setCenterSize(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03E0
-- Instruction: set_text_draw_before_fade {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03E0
function SanAndreasOpcodeText.setDrawBeforeFade(state)
    TextDraw.setDrawBehindTextures(state == 1 or state == true)
end

-- Opcode: 0x0513
-- Instruction: print_help_forever_with_number {gxt} [gxt_key] {number} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0513
function SanAndreasOpcodeText.printHelpForeverWithNumber(label, number)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    text = text:gsub("~1~", tostring(math.floor(number)))

    Text.showPermanentBox(text)
end

-- Opcode: 0x060D
-- Instruction: set_text_dropshadow {intensity} [int] {red} [int] {green} [int] {blue} [int] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/060D
function SanAndreasOpcodeText.setDropshadow(weight, r, g, b, a)
    TextDraw.setShadow(weight, r, g, b, a)
end

-- Opcode: 0x076F
-- Instruction: is_message_being_displayed
-- https://library.sannybuilder.com/#/sa/script/extensions/default/076F
function SanAndreasOpcodeText.isMessageBeingDisplayed(_)
    for _, queue in pairs(Text.messageQueue) do
        if (#queue > 0) then
            return true
        end
    end

    return false
end

-- Opcode: 0x07FC
-- Instruction: display_text_with_float {leftTopX} [float] {leftTopY} [float] {key} [gxt_key] {value} [float] {precision} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07FC
function SanAndreasOpcodeText.displayWithFloat(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x081C
-- Instruction: set_text_edge {size} [int] {red} [int] {green} [int] {blue} [int] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/081C
function SanAndreasOpcodeText.setEdge(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08FE
-- Instruction: is_help_message_being_displayed
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08FE
function SanAndreasOpcodeText.isHelpMessageBeingDisplayed()
   return Text.isTextBoxDisplayed()
end

-- Opcode: 0x0912
-- Instruction: set_message_formatting {_p1} [bool] {margin} [int] {width} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0912
function SanAndreasOpcodeText.setMessageFormatting(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0989
-- Instruction: set_help_message_box_size {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0989
function SanAndreasOpcodeText.setHelpMessageBoxSize(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09A9
-- Instruction: [var hash: int] = get_hash_key {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09A9
function SanAndreasOpcodeText.getHashKey(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09C1
-- Instruction: add_next_message_to_previous_briefs {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09C1
function SanAndreasOpcodeText.addNextMessageToPreviousBriefs()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09FD
-- Instruction: [var width: int] = get_string_width {entry} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09FD
function SanAndreasOpcodeText.getStringWidth(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A08
-- Instruction: [var width: int] = get_string_width_with_number {gxtEntry} [gxt_key] {number} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A08
function SanAndreasOpcodeText.getStringWidthWithNumber(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A0E
-- Instruction: clear_this_print_big_now {textStyle} [TextStyle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A0E
function SanAndreasOpcodeText.clearThisPrintBigNow(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0A19
-- Instruction: set_area_name {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A19
function SanAndreasOpcodeText.setAreaName(_)
return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0A2A
-- Instruction: is_this_help_message_being_displayed {gxt} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A2A
function SanAndreasOpcodeText.isThisHelpMessageBeingDisplayed(label)
    for index,messageData in pairs(Text.messageQueue['textbox']) do
        if (messageData.label == label) then
            return true
        end
    end

    return false
end

-- Opcode: 0x0A2C
-- Instruction: draw_subtitles_before_fade {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A2C
function SanAndreasOpcodeText.drawSubtitlesBeforeFade(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A2D
-- Instruction: draw_oddjob_title_before_fade {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A2D
function SanAndreasOpcodeText.drawOddjobTitleBeforeFade(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A44
-- Instruction: display_non_minigame_help_messages {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A44
function SanAndreasOpcodeText.displayNonMinigameHelpMessages(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AED
-- Instruction: [var text: string] = string_float_format {number} [float] {format} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AED
function SanAndreasOpcodeText.stringFloatFormat(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D4C
-- Instruction: [var length: int] = get_string_length {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D4C
function SanAndreasOpcodeText.getStringLength(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D4D
-- Instruction: copy_string {string} [string] {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D4D
function SanAndreasOpcodeText.copyString(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E62
-- Instruction: draw_string {string} [string] {drawEvent} [DrawEvent] {posX} [float] {posY} [float] {sizeX} [float] {sizeY} [float] {fixAr} [bool] {font} [Font]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E62
function SanAndreasOpcodeText.drawString(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E63
-- Instruction: draw_string_ext {string} [string] {drawEvent} [DrawEvent] {posX} [float] {posY} [float] {sizeX} [float] {sizeY} [float] {fixAr} [bool] {font} [Font] {prop} [bool] {align} [Align] {wrap} [float] {justify} [bool] {red} [int] {green} [int] {blue} [int] {alpha} [int] {edge} [int] {shadow} [int] {dropRed} [int] {dropGreen} [int] {dropBlue} [int] {dropAlpha} [int] {background} [bool] {backRed} [int] {backGreen} [int] {backBlue} [int] {backAlpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E63
function SanAndreasOpcodeText.drawStringExt(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E80
-- Instruction: is_string_equal {string1} [string] {string2} [string] {maxSize} [int] {caseSensitive} [bool] {ignoreCharacter} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E80
function SanAndreasOpcodeText.isStringEqual(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E81
-- Instruction: is_string_comment {string} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E81
function SanAndreasOpcodeText.isStringComment(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EC2
-- Instruction: set_string_upper {stringAddress} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EC2
function SanAndreasOpcodeText.setStringUpper(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EC3
-- Instruction: set_string_lower {stringAddress} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EC3
function SanAndreasOpcodeText.setStringLower(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EC4
-- Instruction: [var index: int] = string_find {stringFind} [StringFind] {stringOrigin} [string] {strFind} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EC4
function SanAndreasOpcodeText.stringFind(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EC5
-- Instruction: cut_string_at {stringAddress} [int] {index} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EC5
function SanAndreasOpcodeText.cutStringAt(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EC6
-- Instruction: is_string_character_at {string} [string] {characters} [string] {index} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EC6
function SanAndreasOpcodeText.isStringCharacterAt(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2600
-- Instruction: is_text_empty {string} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2600
function SanAndreasOpcodeText.isEmpty()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2601
-- Instruction: is_text_equal {text} [string] {another} [string] {ignoreCase} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2601
function SanAndreasOpcodeText.isEqual()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2602
-- Instruction: is_text_in_text {text} [string] {subText} [string] {ignoreCase} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2602
function SanAndreasOpcodeText.contains()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2603
-- Instruction: is_text_prefix {text} [string] {prefix} [string] {ignoreCase} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2603
function SanAndreasOpcodeText.startsWith()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2604
-- Instruction: is_text_suffix {text} [string] {suffix} [string] {ignoreCase} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2604
function SanAndreasOpcodeText.endsWith()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2605
-- Instruction: display_text_formatted {offsetLeft} [float] {offsetTop} [float] {format} [string] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2605
function SanAndreasOpcodeText.displayFormatted()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2606
-- Instruction: load_fxt {filepath} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2606
function SanAndreasOpcodeText.loadFxt()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2607
-- Instruction: unload_fxt {filepath} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2607
function SanAndreasOpcodeText.unloadFxt()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2608
-- Instruction: [var length: int] = get_text_length {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2608
function SanAndreasOpcodeText.getLength()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0303, SanAndreasOpcodeText.printWith4NumbersNow, 'print_with_4_numbers_now {key} [gxt_key] {num1} [int] {num2} [int] {num3} [int] {num4} [int] {duration} [int] {style} [TextStyle]')
Opcode.register(0x0344, SanAndreasOpcodeText.setCenterSize, 'set_text_centre_size {width} [float]')
Opcode.register(0x03e0, SanAndreasOpcodeText.setDrawBeforeFade, 'set_text_draw_before_fade {state} [bool]')
Opcode.register(0x0513, SanAndreasOpcodeText.printHelpForeverWithNumber, 'print_help_forever_with_number {gxt} [gxt_key] {number} [int]')
Opcode.register(0x060d, SanAndreasOpcodeText.setDropshadow, 'set_text_dropshadow {intensity} [int] {red} [int] {green} [int] {blue} [int] {alpha} [int]')
Opcode.register(0x076f, SanAndreasOpcodeText.isMessageBeingDisplayed, 'is_message_being_displayed')
Opcode.register(0x07fc, SanAndreasOpcodeText.displayWithFloat, 'display_text_with_float {leftTopX} [float] {leftTopY} [float] {key} [gxt_key] {value} [float] {precision} [int]')
Opcode.register(0x081c, SanAndreasOpcodeText.setEdge, 'set_text_edge {size} [int] {red} [int] {green} [int] {blue} [int] {alpha} [int]')
Opcode.register(0x08fe, SanAndreasOpcodeText.isHelpMessageBeingDisplayed, 'is_help_message_being_displayed')
Opcode.register(0x0912, SanAndreasOpcodeText.setMessageFormatting, 'set_message_formatting {_p1} [bool] {margin} [int] {width} [int]')
Opcode.register(0x0989, SanAndreasOpcodeText.setHelpMessageBoxSize, 'set_help_message_box_size {size} [int]')
Opcode.register(0x09a9, SanAndreasOpcodeText.getHashKey, '[var hash: int] = get_hash_key {text} [string]')
Opcode.register(0x09c1, SanAndreasOpcodeText.addNextMessageToPreviousBriefs, 'add_next_message_to_previous_briefs {state} [bool]')
Opcode.register(0x09fd, SanAndreasOpcodeText.getStringWidth, '[var width: int] = get_string_width {entry} [gxt_key]')
Opcode.register(0x0a08, SanAndreasOpcodeText.getStringWidthWithNumber, '[var width: int] = get_string_width_with_number {gxtEntry} [gxt_key] {number} [any]')
Opcode.register(0x0a0e, SanAndreasOpcodeText.clearThisPrintBigNow, 'clear_this_print_big_now {textStyle} [TextStyle]')
Opcode.register(0x0a19, SanAndreasOpcodeText.setAreaName, 'set_area_name {name} [string]')
Opcode.register(0x0a2a, SanAndreasOpcodeText.isThisHelpMessageBeingDisplayed, 'is_this_help_message_being_displayed {gxt} [gxt_key]')
Opcode.register(0x0a2c, SanAndreasOpcodeText.drawSubtitlesBeforeFade, 'draw_subtitles_before_fade {state} [bool]')
Opcode.register(0x0a2d, SanAndreasOpcodeText.drawOddjobTitleBeforeFade, 'draw_oddjob_title_before_fade {state} [bool]')
Opcode.register(0x0a44, SanAndreasOpcodeText.displayNonMinigameHelpMessages, 'display_non_minigame_help_messages {state} [bool]')
Opcode.register(0x0aed, SanAndreasOpcodeText.stringFloatFormat, '[var text: string] = string_float_format {number} [float] {format} [string]')
Opcode.register(0x0d4c, SanAndreasOpcodeText.getStringLength, '[var length: int] = get_string_length {text} [string]')
Opcode.register(0x0d4d, SanAndreasOpcodeText.copyString, 'copy_string {string} [string] {address} [int]')
Opcode.register(0x0e62, SanAndreasOpcodeText.drawString, 'draw_string {string} [string] {drawEvent} [DrawEvent] {posX} [float] {posY} [float] {sizeX} [float] {sizeY} [float] {fixAr} [bool] {font} [Font]')
Opcode.register(0x0e63, SanAndreasOpcodeText.drawStringExt, 'draw_string_ext {string} [string] {drawEvent} [DrawEvent] {posX} [float] {posY} [float] {sizeX} [float] {sizeY} [float] {fixAr} [bool] {font} [Font] {prop} [bool] {align} [Align] {wrap} [float] {justify} [bool] {red} [int] {green} [int] {blue} [int] {alpha} [int] {edge} [int] {shadow} [int] {dropRed} [int] {dropGreen} [int] {dropBlue} [int] {dropAlpha} [int] {background} [bool] {backRed} [int] {backGreen} [int] {backBlue} [int] {backAlpha} [int]')
Opcode.register(0x0e80, SanAndreasOpcodeText.isStringEqual, 'is_string_equal {string1} [string] {string2} [string] {maxSize} [int] {caseSensitive} [bool] {ignoreCharacter} [string]')
Opcode.register(0x0e81, SanAndreasOpcodeText.isStringComment, 'is_string_comment {string} [string]')
Opcode.register(0x0ec2, SanAndreasOpcodeText.setStringUpper, 'set_string_upper {stringAddress} [int]')
Opcode.register(0x0ec3, SanAndreasOpcodeText.setStringLower, 'set_string_lower {stringAddress} [int]')
Opcode.register(0x0ec4, SanAndreasOpcodeText.stringFind, '[var index: int] = string_find {stringFind} [StringFind] {stringOrigin} [string] {strFind} [string]')
Opcode.register(0x0ec5, SanAndreasOpcodeText.cutStringAt, 'cut_string_at {stringAddress} [int] {index} [int]')
Opcode.register(0x0ec6, SanAndreasOpcodeText.isStringCharacterAt, 'is_string_character_at {string} [string] {characters} [string] {index} [int]')
Opcode.register(0x2600, SanAndreasOpcodeText.isEmpty, 'is_text_empty {string} [string]')
Opcode.register(0x2601, SanAndreasOpcodeText.isEqual, 'is_text_equal {text} [string] {another} [string] {ignoreCase} [bool]')
Opcode.register(0x2602, SanAndreasOpcodeText.contains, 'is_text_in_text {text} [string] {subText} [string] {ignoreCase} [bool]')
Opcode.register(0x2603, SanAndreasOpcodeText.startsWith, 'is_text_prefix {text} [string] {prefix} [string] {ignoreCase} [bool]')
Opcode.register(0x2604, SanAndreasOpcodeText.endsWith, 'is_text_suffix {text} [string] {suffix} [string] {ignoreCase} [bool]')
Opcode.register(0x2605, SanAndreasOpcodeText.displayFormatted, 'display_text_formatted {offsetLeft} [float] {offsetTop} [float] {format} [string] {args} [arguments]')
Opcode.register(0x2606, SanAndreasOpcodeText.loadFxt, 'load_fxt {filepath} [string]')
Opcode.register(0x2607, SanAndreasOpcodeText.unloadFxt, 'unload_fxt {filepath} [string]')
Opcode.register(0x2608, SanAndreasOpcodeText.getLength, '[var length: int] = get_text_length {text} [string]')
