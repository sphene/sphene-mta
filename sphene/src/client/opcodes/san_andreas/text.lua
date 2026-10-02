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


-- INI: 0303=7,text_4numbers_highpriority %1g% %2d% %3d% %4d% %5d% time %6d% %7d%
Opcode.register(0x0303, SanAndreasOpcodeText.printWith4NumbersNow, 7, 'print_with_4_numbers_now ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 0344=1,set_text_draw_linewidth %1d% for_centered_text
Opcode.register(0x0344, SanAndreasOpcodeText.setCenterSize, 1, 'set_text_centre_size ${1}', {false})
-- INI: 03E0=1,draw_text_behind_textures %1h%
Opcode.register(0x03e0, SanAndreasOpcodeText.setDrawBeforeFade, 1, 'set_text_draw_before_fade ${1}', {false})
-- INI: 0513=2,show_permanent_text_box_1number %1s% number %2d%
Opcode.register(0x0513, SanAndreasOpcodeText.printHelpForeverWithNumber, 2, 'print_help_forever_with_number ${1} ${2}', {false, false})
-- INI: 060D=5,draw_text_shadow %1h% rgba %2h% %3h% %4h% %5d%
Opcode.register(0x060d, SanAndreasOpcodeText.setDropshadow, 5, 'set_text_dropshadow ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 076F=0,  text_priority_displayed
Opcode.register(0x076f, SanAndreasOpcodeText.isMessageBeingDisplayed, 0, 'is_message_being_displayed', {})
-- INI: 07FC=5,text_draw_box_position_XY %1d% %2d% GXT_reference %3g% value %4d% flag %5h%
Opcode.register(0x07fc, SanAndreasOpcodeText.displayWithFloat, 5, 'display_text_with_float ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 081C=5,draw_text_outline %1h% RGBA %2h% %3h% %4h% %5d%
Opcode.register(0x081c, SanAndreasOpcodeText.setEdge, 5, 'set_text_edge ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 08FE=0,  text_box_displayed
Opcode.register(0x08fe, SanAndreasOpcodeText.isHelpMessageBeingDisplayed, 0, 'is_help_message_being_displayed', {})
-- INI: 0912=3,set_text_priority %1h% leftmargin %2d% maxwidth %3d%
Opcode.register(0x0912, SanAndreasOpcodeText.setMessageFormatting, 3, 'set_message_formatting ${1} ${2} ${3}', {false, false, false})
-- INI: 0989=1,set_text_boxes_width %1d%
Opcode.register(0x0989, SanAndreasOpcodeText.setHelpMessageBoxSize, 1, 'set_help_message_box_size ${1}', {false})
-- INI: 09A9=2,get_string %1h% CRC32_to %2d% ; 16-byte strings
Opcode.register(0x09a9, SanAndreasOpcodeText.getHashKey, 2, '${1} = get_hash_key ${2}', {false, false})
-- INI: 09C1=1,add_next_text_to_brief_history %1h%
Opcode.register(0x09c1, SanAndreasOpcodeText.addNextMessageToPreviousBriefs, 1, 'add_next_message_to_previous_briefs ${1}', {false})
-- INI: 09FD=2,get_gxt_string %1g% width_to %2d%
Opcode.register(0x09fd, SanAndreasOpcodeText.getStringWidth, 2, '${1} = get_string_width ${2}', {false, false})
-- INI: 0A08=3,get_gxt_string_1number %1g% number %2d% width_to %3d%
Opcode.register(0x0a08, SanAndreasOpcodeText.getStringWidthWithNumber, 3, '${3} = get_string_width_with_number ${1} ${2}', {false, false, true})
-- INI: 0A0E=1,disable_text_with_style %1h%
Opcode.register(0x0a0e, SanAndreasOpcodeText.clearThisPrintBigNow, 1, 'clear_this_print_big_now ${1}', {false})
-- INI: 0A19=1,display_zone_text %1g%
Opcode.register(0x0a19, SanAndreasOpcodeText.setAreaName, 1, 'set_area_name ${1}', {false})
-- INI: 0A2A=1,  text_box %1g% displayed
Opcode.register(0x0a2a, SanAndreasOpcodeText.isThisHelpMessageBeingDisplayed, 1, 'is_this_help_message_being_displayed ${1}', {false})
-- INI: 0A2C=1,hide_priority_text_while_fading %1h%
Opcode.register(0x0a2c, SanAndreasOpcodeText.drawSubtitlesBeforeFade, 1, 'draw_subtitles_before_fade ${1}', {false})
-- INI: 0A2D=1,hide_styled_text_while_fading %1h% ; works with 00BA
Opcode.register(0x0a2d, SanAndreasOpcodeText.drawOddjobTitleBeforeFade, 1, 'draw_oddjob_title_before_fade ${1}', {false})
-- INI: 0A44=1,override_text_block %1h%
Opcode.register(0x0a44, SanAndreasOpcodeText.displayNonMinigameHelpMessages, 1, 'display_non_minigame_help_messages ${1}', {false})
-- INI: 0AED=3,%3d% = float %1d% to_string_format %2d%
Opcode.register(0x0aed, SanAndreasOpcodeText.stringFloatFormat, 3, '${3} = string_float_format ${1} ${2}', {false, false, true})
-- INI: 0D4C=2,%2d% = string %1s% length
Opcode.register(0x0d4c, SanAndreasOpcodeText.getStringLength, 2, '${1} = get_string_length ${2}', {true, false})
-- INI: 0D4D=2,copy_string %1s% to %2s%
Opcode.register(0x0d4d, SanAndreasOpcodeText.copyString, 2, 'copy_string ${1} ${2}', {false, false})
-- INI: 0E62=8,print %1s% event %2d% at %3d% %4d% scale %5d% %6d% fixAR %7d% style %8d%
Opcode.register(0x0e62, SanAndreasOpcodeText.drawString, 8, 'draw_string ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0E63=27,print %1s% event %2d% at %3d% %4d% scale %5d% %6d% fixAR %7d% style %8d% prop %9d% align %10d% wrap %11d% justify %12d% color %13d% %14d% %15d% %16d% outline %17d% shadow %18d% dropColor %19d% %20d% %21d% %22d% background %23d% backColor %24d% %25d% %26d% %27d%
Opcode.register(0x0e63, SanAndreasOpcodeText.drawStringExt, 27, 'draw_string_ext ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} ${21} ${22} ${23} ${24} ${25} ${26} ${27}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0E80=5,is_string_equal %1s% %2s% max_size %3d% case_sensitive %4d% ignore_charactere %5s%
Opcode.register(0x0e80, SanAndreasOpcodeText.isStringEqual, 5, 'is_string_equal ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0E81=1,is_string_comment %1s%
Opcode.register(0x0e81, SanAndreasOpcodeText.isStringComment, 1, 'is_string_comment ${1}', {false})
-- INI: 0EC2=1,set_string_upper %1s%
Opcode.register(0x0ec2, SanAndreasOpcodeText.setStringUpper, 1, 'set_string_upper ${1}', {false})
-- INI: 0EC3=1,set_string_lower %1s%
Opcode.register(0x0ec3, SanAndreasOpcodeText.setStringLower, 1, 'set_string_lower ${1}', {false})
-- INI: 0EC4=4,string_find %1d% %2s% %3s% store_to %4d%
Opcode.register(0x0ec4, SanAndreasOpcodeText.stringFind, 4, '${4} = string_find ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0EC5=2,cut_string_at %1d% %2d%
Opcode.register(0x0ec5, SanAndreasOpcodeText.cutStringAt, 2, 'cut_string_at ${1} ${2}', {false, false})
-- INI: 0EC6=3,is_string_character_at %1d% character %2d% index %3d%
Opcode.register(0x0ec6, SanAndreasOpcodeText.isStringCharacterAt, 3, 'is_string_character_at ${1} ${2} ${3}', {false, false, false})
Opcode.register(0x2600, SanAndreasOpcodeText.isEmpty, 1, 'is_text_empty ${1}')
Opcode.register(0x2601, SanAndreasOpcodeText.isEqual, 3, 'is_text_equal ${1} ${2} ${3}')
Opcode.register(0x2602, SanAndreasOpcodeText.contains, 3, 'is_text_in_text ${1} ${2} ${3}')
Opcode.register(0x2603, SanAndreasOpcodeText.startsWith, 3, 'is_text_prefix ${1} ${2} ${3}')
Opcode.register(0x2604, SanAndreasOpcodeText.endsWith, 3, 'is_text_suffix ${1} ${2} ${3}')
Opcode.register(0x2605, SanAndreasOpcodeText.displayFormatted, -1, 'display_text_formatted ${1} ${2} ${3}')
Opcode.register(0x2606, SanAndreasOpcodeText.loadFxt, 1, 'load_fxt ${1}')
Opcode.register(0x2607, SanAndreasOpcodeText.unloadFxt, 1, 'unload_fxt ${1}')
Opcode.register(0x2608, SanAndreasOpcodeText.getLength, 2, '${1} = get_text_length ${2}')
