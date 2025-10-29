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


Opcode.register(0x08d4, SanAndreasOpcodeMenu.create, '[var handle: Menu] = create_menu {header} [gxt_key] {topLeftX} [float] {topLeftY} [float] {width} [float] {numColumns} [int] {interactive} [bool] {background} [bool] {alignment} [Align]')
Opcode.register(0x08d6, SanAndreasOpcodeMenu.setColumnOrientation, 'set_menu_column_orientation [Menu] {column} [int] {alignment} [Align]')
Opcode.register(0x08d7, SanAndreasOpcodeMenu.getItemSelected, '[var row: int] = get_menu_item_selected [Menu]')
Opcode.register(0x08d8, SanAndreasOpcodeMenu.getItemAccepted, '[var row: int] = get_menu_item_accepted [Menu]')
Opcode.register(0x08d9, SanAndreasOpcodeMenu.activateItem, 'activate_menu_item [Menu] {row} [int] {state} [bool]')
Opcode.register(0x08da, SanAndreasOpcodeMenu.delete, 'delete_menu [Menu]')
Opcode.register(0x08db, SanAndreasOpcodeMenu.setColumn, 'set_menu_column [Menu] {column} [int] {title} [gxt_key] {row0} [gxt_key] {row1} [gxt_key] {row2} [gxt_key] {row3} [gxt_key] {row4} [gxt_key] {row5} [gxt_key] {row6} [gxt_key] {row7} [gxt_key] {row8} [gxt_key] {row9} [gxt_key] {row10} [gxt_key] {row11} [gxt_key]')
Opcode.register(0x08ee, SanAndreasOpcodeMenu.setItemWithNumber, 'set_menu_item_with_number [Menu] {column} [int] {row} [int] {gxt} [gxt_key] {number} [int]')
Opcode.register(0x08ef, SanAndreasOpcodeMenu.setItemWith2Numbers, 'set_menu_item_with_2_numbers [Menu] {column} [int] {row} [int] {gxt} [gxt_key] {number1} [int] {number2} [int]')
Opcode.register(0x090e, SanAndreasOpcodeMenu.setActiveItem, 'set_active_menu_item [Menu] {row} [int]')
Opcode.register(0x09db, SanAndreasOpcodeMenu.setColumnWidth, 'set_menu_column_width [Menu] {column} [int] {width} [int]')
Opcode.register(0x0a22, SanAndreasOpcodeMenu.changeCarColor, 'change_car_colour_from_menu [Menu] {vehicle} [Car] {colorSlot} [int] {row} [int]')
Opcode.register(0x0a23, SanAndreasOpcodeMenu.highlightItem, 'highlight_menu_item [Menu] {row} [int] {state} [bool]')
