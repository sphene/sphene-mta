SanAndreasOpcodeMenu = {}
SanAndreasOpcodeMenu.__index = SanAndreasOpcodeMenu

-- Opcode: 0x08D4
-- Instruction: [var handle: Menu] = create_menu {header} [gxt_key] {topLeftX} [float] {topLeftY} [float] {width} [float] {numColumns} [int] {interactive} [bool] {background} [bool] {alignment} [Align]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08D4
function SanAndreasOpcodeMenu.create(title, x, y, width, columns, interactive, background, alignment)
    title = Text.getFormattedTextFromHash(CRC32.getKey(title))
    return Menu:create(title, x, y, width, columns, interactive == 1, background == 1, alignment)
end

-- Opcode: 0x08D6
-- Instruction: set_menu_column_orientation [Menu] {column} [int] {alignment} [Align]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08D6
function SanAndreasOpcodeMenu.setColumnOrientation(menu, column, alignment)
    return menu:setColumnAlignment(column, alignment)
end

-- Opcode: 0x08D7
-- Instruction: [var row: int] = get_menu_item_selected [Menu]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08D7
function SanAndreasOpcodeMenu.getItemSelected(menu, _)
    return menu:getActiveRow()
end

-- Opcode: 0x08D8
-- Instruction: [var row: int] = get_menu_item_accepted [Menu]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08D8
function SanAndreasOpcodeMenu.getItemAccepted(menu, _)
   return menu:getSelectedRow()
end

-- Opcode: 0x08D9
-- Instruction: activate_menu_item [Menu] {row} [int] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08D9
function SanAndreasOpcodeMenu.activateItem(menu, row, enabled)
   return menu:setRowEnabled(row, enabled == 1)
end

-- Opcode: 0x08DA
-- Instruction: delete_menu [Menu]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08DA
function SanAndreasOpcodeMenu.delete(menu)
    if (type(menu) == 'table') then
        return menu:destroy()
    end
end

-- Opcode: 0x08DB
-- Instruction: set_menu_column [Menu] {column} [int] {title} [gxt_key] {row0} [gxt_key] {row1} [gxt_key] {row2} [gxt_key] {row3} [gxt_key] {row4} [gxt_key] {row5} [gxt_key] {row6} [gxt_key] {row7} [gxt_key] {row8} [gxt_key] {row9} [gxt_key] {row10} [gxt_key] {row11} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08DB
function SanAndreasOpcodeMenu.setColumn(menu, column, header, row1, row2, row3, row4, row5, row6, row7, row8, row9, row10, row11, row12)
    header = Text.getFormattedTextFromHash(CRC32.getKey(header))
    row1 = Text.getFormattedTextFromHash(CRC32.getKey(row1))
    row2 = Text.getFormattedTextFromHash(CRC32.getKey(row2))
    row3 = Text.getFormattedTextFromHash(CRC32.getKey(row3))
    row4 = Text.getFormattedTextFromHash(CRC32.getKey(row4))
    row5 = Text.getFormattedTextFromHash(CRC32.getKey(row5))
    row6 = Text.getFormattedTextFromHash(CRC32.getKey(row6))
    row7 = Text.getFormattedTextFromHash(CRC32.getKey(row7))
    row8 = Text.getFormattedTextFromHash(CRC32.getKey(row8))
    row9 = Text.getFormattedTextFromHash(CRC32.getKey(row9))
    row10 = Text.getFormattedTextFromHash(CRC32.getKey(row10))
    row11 = Text.getFormattedTextFromHash(CRC32.getKey(row11))
    row12 = Text.getFormattedTextFromHash(CRC32.getKey(row12))

    return menu:setColumn(column, header, row1, row2, row3, row4, row5, row6, row7, row8, row9, row10, row11, row12)
end

-- Opcode: 0x08EE
-- Instruction: set_menu_item_with_number [Menu] {column} [int] {row} [int] {gxt} [gxt_key] {number} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08EE
function SanAndreasOpcodeMenu.setItemWithNumber(menu, column, row, label, number)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    text = text:gsub("~1~", tostring(math.floor(number)), 1)

    return menu:setRow(column, row, text)
end

-- Opcode: 0x08EF
-- Instruction: set_menu_item_with_2_numbers [Menu] {column} [int] {row} [int] {gxt} [gxt_key] {number1} [int] {number2} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08EF
function SanAndreasOpcodeMenu.setItemWith2Numbers(menu, column, row, label, number1, number2)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label))
    text = text:gsub("~1~", tostring(math.floor(number1)), 1)
    text = text:gsub("~1~", tostring(math.floor(number2)), 1)

    return menu:setRow(column, row, text)
end

-- Opcode: 0x090E
-- Instruction: set_active_menu_item [Menu] {row} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/090E
function SanAndreasOpcodeMenu.setActiveItem(menu, row)
   return menu:setActiveRow(row)
end

-- Opcode: 0x09DB
-- Instruction: set_menu_column_width [Menu] {column} [int] {width} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09DB
function SanAndreasOpcodeMenu.setColumnWidth(menu, column, width)
   return menu:setColumnWidth(column, width)
end

-- Opcode: 0x0A22
-- Instruction: change_car_colour_from_menu [Menu] {vehicle} [Car] {colorSlot} [int] {row} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A22
function SanAndreasOpcodeMenu.changeCarColor(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A23
-- Instruction: highlight_menu_item [Menu] {row} [int] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A23
function SanAndreasOpcodeMenu.highlightItem(_, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 08D4=9,%9d% = create_panel_with_title %1g% position %2d% %3d% width %4d% columns %5h% interactive %6h% background %7h% alignment %8h%
Opcode.register(0x08d4, SanAndreasOpcodeMenu.create, 9, '${9} = create_menu ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false, true})
-- INI: 08D6=3,set_panel %1d% column %2h% alignment %3h%
Opcode.register(0x08d6, SanAndreasOpcodeMenu.setColumnOrientation, 3, 'set_menu_column_orientation ${1} ${2} ${3}', {false, false, false})
-- INI: 08D7=2,%2d% = panel %1d% active_row
Opcode.register(0x08d7, SanAndreasOpcodeMenu.getItemSelected, 2, '${1} = get_menu_item_selected ${2}', {true, false})
-- INI: 08D8=2,%2d% = panel %1d% selected_row
Opcode.register(0x08d8, SanAndreasOpcodeMenu.getItemAccepted, 2, '${1} = get_menu_item_accepted ${2}', {true, false})
-- INI: 08D9=3,set_panel %1d% row %2d% enable %3h%
Opcode.register(0x08d9, SanAndreasOpcodeMenu.activateItem, 3, 'activate_menu_item ${1} ${2} ${3}', {false, false, false})
-- INI: 08DA=1,remove_panel %1d%
Opcode.register(0x08da, SanAndreasOpcodeMenu.delete, 1, 'delete_menu ${1}', {false})
-- INI: 08DB=15,set_panel %1d% column %2h% header %3g% data %4g% %5g% %6g% %7g% %8g% %9g% %10g% %11g% %12g% %13g% %14g% %15g%
Opcode.register(0x08db, SanAndreasOpcodeMenu.setColumn, 15, 'set_menu_column ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 08EE=5,set_panel %1d% column %2h% row %3d% text_1number GXT %4g% number %5d%
Opcode.register(0x08ee, SanAndreasOpcodeMenu.setItemWithNumber, 5, 'set_menu_item_with_number ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 08EF=6,set_panel %1d% column %2h% row %3d% text_2numbers GXT %4g% numbers %5d% %6d%
Opcode.register(0x08ef, SanAndreasOpcodeMenu.setItemWith2Numbers, 6, 'set_menu_item_with_2_numbers ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 090E=2,set_panel %1d% active_row %2d%
Opcode.register(0x090e, SanAndreasOpcodeMenu.setActiveItem, 2, 'set_active_menu_item ${1} ${2}', {false, false})
-- INI: 09DB=3,set_panel %1d% column %2h% width %3d%
Opcode.register(0x09db, SanAndreasOpcodeMenu.setColumnWidth, 3, 'set_menu_column_width ${1} ${2} ${3}', {false, false, false})
-- INI: 0A22=4,set_car_color_to_panel_color_panelID %1d% car %2d% colorslot %3h% active_row %4d%
Opcode.register(0x0a22, SanAndreasOpcodeMenu.changeCarColor, 4, 'change_car_colour_from_menu ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0A23=3,set_panel %1d% row %2d% shopping_item_bought %3h%
Opcode.register(0x0a23, SanAndreasOpcodeMenu.highlightItem, 3, 'highlight_menu_item ${1} ${2} ${3}', {false, false, false})
