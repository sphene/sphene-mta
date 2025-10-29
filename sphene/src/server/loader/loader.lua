-----------------------------------
-- * Variables
-----------------------------------

Loader = {}
Loader.__index = Loader

Loader.LOADER_DATA_FILE = "loader/loader.json"

Loader.scripts = {}

-----------------------------------
-- * Functions
-----------------------------------

function Loader.init()
    local loaderFile = fileOpen(Loader.LOADER_DATA_FILE, true)
    local loadFileData = fromJSON(fileRead(loaderFile, fileGetSize(loaderFile)))
    fileClose(loaderFile)

    local h1, h2, h3 = debug.gethook()
    debug.sethook(nil)

    Logger.info('LOADER', 'Loading script data...')

    local scriptsTable = {}

    for game, loadData in pairs(loadFileData) do
        scriptsTable[game] = {}

        if (loadData.scripts) then
            for _, script in pairs(loadData.scripts) do
                if (fileExists(script)) then
                    local scriptFile = fileOpen(script)

                    if (scriptFile) then
                        local fileSize = fileGetSize(scriptFile)
                        local scriptData = fileRead(scriptFile, fileSize)

                        scriptsTable[game][#scriptsTable[game] + 1] = {
                            name = script,
                            data = scriptData,
                            size = fileSize
                        }

                        fileClose(scriptFile)
                    end
                end
            end
        end
    end

    Logger.info('LOADER', 'Loaded script data!')
    Logger.info('LOADER', 'Squashing script data for faster download...')

    for game, scriptsLoadData in pairs(scriptsTable) do
        if (game ~= "GLOBAL") then
            local gameScriptData = {}

            Logger.info('LOADER', 'Squashing script data for {}...', game)

            --- Add global scripts
            for _, globalScriptData in pairs(scriptsTable['GLOBAL'] or {}) do
                gameScriptData[#gameScriptData + 1] = globalScriptData
            end

            if (config('mode') == 'benchmark') then
                for _, globalScriptData in pairs(scriptsTable['BENCHMARK'] or {}) do
                    gameScriptData[#gameScriptData + 1] = globalScriptData
                end
            end

            --- Add game scripts
            for _, scriptData in pairs(scriptsLoadData) do
                gameScriptData[#gameScriptData + 1] = scriptData
            end

            local scriptList = ""
            local scripts = ""

            local currentLen = 0

            for _, scriptData in pairs(gameScriptData) do
                local scriptName = scriptData.name.."\0"

                local scriptLenInBytes = string.char(#scriptData.data % 256, math.floor(#scriptData.data / 256) % 256, math.floor(#scriptData.data / 65536) % 256, math.floor(#scriptData.data / 16777216) % 256)
                local scriptOffsetInBytes = string.char(currentLen % 256, math.floor(currentLen / 256) % 256, math.floor(currentLen / 65536) % 256, math.floor(currentLen / 16777216) % 256)

                scriptList = scriptList..scriptName..scriptLenInBytes..scriptOffsetInBytes
                scripts = scripts..scriptData.data

                currentLen = currentLen + #scriptData.data
            end

            local scriptsCountInBytes = string.char(#gameScriptData % 256, math.floor(#gameScriptData / 256) % 256, math.floor(#gameScriptData / 65536) % 256, math.floor(#gameScriptData / 16777216) % 256)
            local scriptListSizeInBytes = string.char(#scriptList % 256, math.floor(#scriptList / 256) % 256, math.floor(#scriptList / 65536) % 256, math.floor(#scriptList / 16777216) % 256)

            local scriptOffset = 12 + #scriptList
            local scriptsOffsetInBytes = string.char(scriptOffset % 256, math.floor(scriptOffset / 256) % 256, math.floor(scriptOffset / 65536) % 256, math.floor(scriptOffset / 16777216) % 256)
            local header = scriptsCountInBytes..scriptListSizeInBytes..scriptsOffsetInBytes

            Loader.scripts[game] = header..scriptList..scripts
        end
    end

    Logger.info('LOADER', 'Squashed script data!')

    debug.sethook(_, h1, h2, h3)
end

function Loader.yieldIfRequired()
    return
end

function Loader.onRequestScriptsInfo(game)
    triggerClientEvent(client, "sphene:loader:onRetrieveScriptsInfo", resourceRoot, #Loader.scripts[game] or "")
end

function Loader.onRequestScripts(game)
    if (Loader.scripts[game] == nil) then
        triggerClientEvent(client, "sphene:load:onFailedDownload", resourceRoot)
        return
    end

    triggerClientEvent(client, "sphene:loader:onRetrieveScripts", resourceRoot, Loader.scripts[game])
end

-----------------------------------
-- * Events
-----------------------------------

addEventHandler("onResourceStart", resourceRoot, Loader.init)

addEvent("sphene:loader:onRequestScriptsInfo", true)
addEventHandler("sphene:loader:onRequestScriptsInfo", resourceRoot, Loader.onRequestScriptsInfo)

addEvent("sphene:loader:onRequestScripts", true)
addEventHandler("sphene:loader:onRequestScripts", resourceRoot, Loader.onRequestScripts)