-----------------------------------
-- * Locals
-----------------------------------

-----------------------------------
-- * Variables
-----------------------------------

SaveState = {}
SaveState.__index = SaveState

function SaveState.save(slot)
    local saveStatePath = 'saveState' .. slot .. '.json'

    if fileExists(saveStatePath) then
        fileDelete(saveStatePath)
    end

    local tableContainer = {}

    local file = fileCreate(saveStatePath)

    if file then
        fileWrite(file, toJSON({
            tables = tableContainer,
            thread = SaveState.serializeTable(tableContainer, Thread),
            game = SaveState.serializeTable(tableContainer, Game),
            script = SaveState.serializeTable(tableContainer, Script),
            hud = SaveState.serializeTable(tableContainer, Hud),
            menu = SaveState.serializeTable(tableContainer, Menu),
            text = SaveState.serializeTable(tableContainer, Text),
            textdraw = SaveState.serializeTable(tableContainer, TextDraw),
            cutscene = SaveState.serializeTable(tableContainer, Cutscene),
            audio = SaveState.serializeTable(tableContainer, Audio),
            camera = SaveState.serializeTable(tableContainer, Camera),
            ipl = SaveState.serializeTable(tableContainer, IPL),
            pad = SaveState.serializeTable(tableContainer, Pad),
        }, false, 'spaces'))
        fileClose(file)
    end
end

function SaveState.load(slot)

end

function SaveState.serializeTable(tableContainer, tbl)
    local tableIdentifier = split(tostring(tbl), ':')[2]

    tableIdentifier = "__table:"..string.sub(tableIdentifier, 2, #tableIdentifier)

    if tableContainer[tableIdentifier] then
        return tableIdentifier
    end

    local serializedTable = {}
    local mt = getmetatable(tbl)

    if mt then
        for key, value in pairs(_G) do
            if (value == mt) then
                serializedTable.__metatable = key
                break
            end
        end
    end

    tableContainer[tableIdentifier] = serializedTable

    for key, value in pairs(tbl) do
        if (type(value) == 'table') then
            serializedTable[key] = SaveState.serializeTable(tableContainer, value)
        elseif (type(value) == 'userdata') then
            -- Ignore userdata
        elseif (type(value) == 'function') then
            -- Ignore functions
        else
            serializedTable[key] = value
        end
    end

    return tableIdentifier
end