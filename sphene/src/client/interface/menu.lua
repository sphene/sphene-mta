-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local menuHandles = {}

-----------------------------------
-- * Variables
-----------------------------------

Menu = {}
Menu.__index = Menu

-----------------------------------
-- * Functions
-----------------------------------

function Menu:create(title, x, y, width, columns, interactive, background, alignment)
    local mt = setmetatable({}, Menu)

    local id = createRandomHash(8)

    while (menuHandles[id] ~= nil) do
        id = createRandomHash(8)
    end

    menuHandles[id] = mt

    mt.id = id
    mt.activeRow = 0
    mt.interactive = interactive
    mt.columnCount = columns
    mt.columns = {}

    for i = 1, columns do
        mt.columns[i] = {
            {}
        }
    end

    Overlay.triggerEvent('onCreateMenu', mt.id, title, x, y, width, columns, background, alignment)

    return mt
end

function Menu:destroy()
    if (menuHandles[self.id]) then
        Overlay.triggerEvent('onDestroyMenu', self.id)

        menuHandles[self.id] = nil
    end
end

function Menu:setColumn(column, header, row1, row2, row3, row4, row5, row6, row7, row8, row9, row10, row11, row12)
    if (column >= #self.columns) then
        return
    end

    self.columns[column + 1][1].header = header
    self.columns[column + 1][2] = row1
    self.columns[column + 1][3] = row2
    self.columns[column + 1][4] = row3
    self.columns[column + 1][5] = row4
    self.columns[column + 1][6] = row5
    self.columns[column + 1][7] = row6
    self.columns[column + 1][8] = row7
    self.columns[column + 1][9] = row8
    self.columns[column + 1][10] = row9
    self.columns[column + 1][11] = row10
    self.columns[column + 1][12] = row11
    self.columns[column + 1][13] = row12

    for i = #self.columns[column + 1], 2, -1 do
        if (self.columns[column + 1][i] == nil or self.columns[column + 1][i] == "") then
            table.remove(self.columns[column + 1], i)
        else
            break
        end
    end

    local columns = {}

    for i = 1, #self.columns do
        columns[i] = {
            self.columns[i][1] or ""
        }

        for j = 2, #self.columns[i] do
            if (i == 1 or (j <= #columns[1])) then
                columns[i][j] = self.columns[i][j]
            end
        end
    end

    Overlay.triggerEvent('onMenuUpdateColumns', self.id, columns)
end

function Menu:setColumnAlignment(column, alignment)
    if (column >= #self.columns) then
        return
    end

    self.columns[column + 1][1].alignment = alignment

    Overlay.triggerEvent('onMenuUpdateColumns', self.id, self.columns)
end

function Menu:setColumnWidth(column, width)
    if (column >= #self.columns) then
        return
    end

    self.columns[column + 1][1].width = width

    Overlay.triggerEvent('onMenuUpdateColumns', self.id, self.columns)
end

function Menu:setActiveRow(row)
    self.activeRow = row

    Overlay.triggerEvent('onMenuSetActiveRow', self.id, self.activeRow)
end

function Menu:setRowEnabled(row, enabled)
    --[[if (row >= #self.columns[1]) then
        return
    end

    self.columns[1][row + 2].enabled = enabled

    Overlay.triggerEvent('onMenuUpdateColumns', self.id, self.columns)]]
end

function Menu:setRow(column, row, value)
    if (column >= #self.columns) then
        return
    end

    for i=2, row + 1 do
        if (self.columns[column + 1][i] == nil) then
            self.columns[column + 1][i] = ""
        end
    end

    self.columns[column + 1][row + 2] = value

    Overlay.triggerEvent('onMenuUpdateColumns', self.id, self.columns)
end

function Menu:getActiveRow()
    return self.activeRow
end

function Menu.nextActiveRow()
    for id, menu in pairs(menuHandles) do
        if (menu.interactive) then
            local maxRow = (#menu.columns[1] - 2)
            local currentRow = menu.activeRow

            repeat
                menu.activeRow = menu.activeRow + 1

                if (menu.activeRow > maxRow) then
                    menu.activeRow = 0
                end
            until (menu.columns[1][menu.activeRow + 2] ~= "" or menu.activeRow == currentRow)

            Overlay.triggerEvent('onMenuSetActiveRow', menu.id, menu.activeRow)
        end
    end
end

function Menu.previousActiveRow()
    for id, menu in pairs(menuHandles) do
        if (menu.interactive) then
            local maxRow = (#menu.columns[1] - 2)
            local currentRow = menu.activeRow

            repeat
                menu.activeRow = menu.activeRow - 1

                if (menu.activeRow < 0) then
                    menu.activeRow = maxRow
                end
            until (menu.columns[1][menu.activeRow + 2] ~= "" or menu.activeRow == currentRow)

            Overlay.triggerEvent('onMenuSetActiveRow', menu.id, menu.activeRow)
        end
    end
end

function Menu.clear()
    for id, menu in pairs(menuHandles) do
        menu:destroy()
        menuHandles[id] = nil
    end
end

-----------------------------------
-- * Events
-----------------------------------
