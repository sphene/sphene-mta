-----------------------------------
-- * Variables
-----------------------------------

Loader = {}
Loader.__index = Loader

Loader.LOADER_DATA_FILE = "loader/loader.json"
Loader.CONCURRENT_REQUESTS = 10

Loader.fonts = {
    ["robotoBold"] = dxCreateFont("loader/fonts/Roboto-Bold.ttf", 20, true)
}

Loader.loadingScreenSound = false

Loader.prepareIndex = 1

Loader.files = {}
Loader.imgArchivesToExtract = {}
Loader.scripts = {}
Loader.replacements = {}

Loader.downloadInfo = {
    files = 0,
    filesDownloaded = 0,
    totalBytes = 0,
    bytesDownloaded = 0,
}

Loader.downloadStage = -1

Loader.downloadQueue = {}
Loader.activeDownloads = {}
Loader.validateQueue = {}
Loader.coroutines = {}

Loader.game = ""
Loader.active = false
Loader.timeSinceLastYield = 0

-----------------------------------
-- * Functions
-----------------------------------

function Loader.init(game)
    fadeCamera(false, 0)
    showChat(true)
    setElementFrozen(localPlayer, true)

    Loader.game = game

    requestBrowserDomains({config('cdn_url'), config('api_url')}, false, Loader.onUrlsRequestComplete)
end

function Loader.onUrlsRequestComplete(wasAccepted)
    if (not wasAccepted) then
        outputChatBox("Sphene does not work if you do not accept the CDN and API subdomains.", 255, 0, 0)
        requestBrowserDomains({config('cdn_url'), config('api_url')}, false, Loader.onUrlsRequestComplete)
        return
    else
        if (isBrowserDomainBlocked(config('cdn_url')) or isBrowserDomainBlocked(config('api_url'))) then
            outputChatBox("Sphene does not work if you do not accept the CDN and API subdomains.", 255, 0, 0)
            requestBrowserDomains({config('cdn_url'), config('api_url')}, false, Loader.onUrlsRequestComplete)
            return
        end
    end

    showChat(false)

    Loader.active = true

    Overlay.triggerEvent("onLoadStart", Loader.game:lower():gsub("_", "-"))

    Discord.setState('Preparing data', true)
    Discord.setMissionName('')

    removeEventHandler("onClientRender", root, Loader.onRender)
    addEventHandler("onClientRender", root, Loader.onRender)

    local loaderFile = fileOpen(Loader.LOADER_DATA_FILE, true)
    local loadDataJson = fromJSON(fileRead(loaderFile, fileGetSize(loaderFile)))
    fileClose(loaderFile)

    local globalLoadData = loadDataJson['GLOBAL']

    local loadData = loadDataJson[Loader.game]

    if (loadData.files == nil) then
        loadData.files = {}
    end

    if (globalLoadData and globalLoadData.files) then
        for _, file in pairs(globalLoadData.files) do
            loadData.files[#loadData.files + 1] = file
        end
    end

    if (config('mode') == 'benchmark') then
        local benchmarkLoadData = loadDataJson['BENCHMARK']

        if (benchmarkLoadData and benchmarkLoadData.files) then
            for _, file in pairs(benchmarkLoadData.files) do
                loadData.files[#loadData.files + 1] = file
            end
        end
    end

    for _, file in pairs(loadData.files) do
        local splitFileName = split(file, ":")

        for i=2, #splitFileName do
            if (splitFileName[i] == 'extract') then
                Loader.imgArchivesToExtract[#Loader.imgArchivesToExtract + 1] = splitFileName[1]
            end
        end

        file = splitFileName[1]

        local matches = {file:match(".+%[(%d+)%-(%d+)%].+")}

        if (#matches > 0) then
            for i=tonumber(matches[1]), tonumber(matches[2]) do
                local tmpFile = file:gsub("(.+)%[%d+%-%d+%](.+)", "%1"..i.."%2")

                Loader.files[#Loader.files + 1] = {
                    file = tmpFile
                }
            end
        else
            Loader.files[#Loader.files + 1] = {
                file = file
            }
        end
    end

    if (globalLoadData and globalLoadData.scripts) then
        for _, script in pairs(globalLoadData.scripts) do
            Loader.scripts[#Loader.scripts + 1] = {
                script = script
            }
        end
    end

    if (loadData.scripts) then
        for _, script in pairs(loadData.scripts) do
            Loader.scripts[#Loader.scripts + 1] = {
                script = script
            }
        end
    end

    Loader.replacements = loadData.replacements or {}

    if (Loader.game == Core.game.SAN_ANDREAS and (config('mode') ~= 'benchmark' or math.random(1, 2) == 1)) then
        Loader.loadingScreenSound = playSFX('radio', 'Beats', 2, true)
    elseif (Loader.game == Core.game.VICE_CITY or config('mode') == 'benchmark') then
        Loader.loadingScreenSound = playSound("https://cdn.sphene.dev/data/game/vice_city/sound/loading_screen.mp3", true)
    end

    setTimer(function()
        if config('skip_api_load') == 1 then
            if #Loader.imgArchivesToExtract > 0 then
                Loader.extractImgArchives()
            else
                Loader.prepareScripts()
            end
        else
            Loader.prepareFiles()
        end
    end, 1000, 1)
end

function Loader.yieldIfRequired()
    if (coroutine.running() == nil) then
        return
    end

    if (Loader.coroutines[coroutine.running()] == nil) then
        return
    end

    if (getTickCount() - Loader.timeSinceLastYield > 75) then
        if (Loader.coroutines[coroutine.running()] >= 1) then
            Loader.coroutines[coroutine.running()] = 0
            coroutine.yield()
        else
            Loader.coroutines[coroutine.running()] = Loader.coroutines[coroutine.running()] + 1
        end

        Loader.timeSinceLastYield = getTickCount()
    end
end

function Loader.prepareFiles()
    Overlay.triggerEvent("onLoadStateChange", {
        state = 0,
        message = "Preparing data"
    })

    local parsedFiles = 0
    local filesString = ""

    if (#Loader.files > 0) then
        Logger.info('LOADER', 'Preparing next batch of files...')

        for i=Loader.prepareIndex, #Loader.files do
            Loader.yieldIfRequired()

            Logger.info('LOADER', 'Preparing file {}', Loader.files[i].file)

            if (filesString == "") then
                filesString = Loader.files[i].file
            else
                filesString = filesString..","..Loader.files[i].file
            end

            parsedFiles = parsedFiles + 1
            Loader.prepareIndex = i + 1

            if (parsedFiles == 15 or i == #Loader.files) then
                Logger.info('LOADER', 'Sending file data to server...')

                fetchRemote(config('api_url')..'/file/info?files='..filesString, {
                    connectTimeout = 60000
                }, Loader.onReceivedFileInfo)

                return
            end
        end
    else
        if (#Loader.imgArchivesToExtract > 0) then
            Loader.extractImgArchives()
        else
            Loader.prepareScripts()
        end
    end
end

function Loader.onReceivedFileInfo(data, info)
    if (not Loader.active) then
        return
    end

    if (info.statusCode ~= 200) then
        Logger.error('LOADER', 'Failed to receive file data from server, failing...')
        Loader.onFailedDownload()
        return
    end

    local thread

    Logger.info('LOADER', 'Received file data from server...')

    thread = coroutine.create(function()
        data = fromJSON(data)

        for fileName, fileData in pairs(data) do
            if (not fileData.found) then
                Logger.error('LOADER', 'File {} not found on server, failing...', fileName)
                Loader.onFailedDownload()
                return
            end

            Loader.yieldIfRequired()

            local originalFileName = fileName

            for pattern, replacement in pairs(Loader.replacements) do
                fileName = fileName:gsub(pattern, replacement)
            end

            if (fileExists(fileName)) then
                local file = fileOpen(fileName, true)

                if (file) then
                    local hash = fileGetHash(file, "sha256")

                    fileClose(file)

                    if (fileData['hash'] ~= hash) then
                        Logger.info('LOADER', 'Hash mismatch for {}, downloading again', fileName)
                        Logger.debug('LOADER', 'Expected hash: {}, got hash: {}', fileData['hash'], hash)

                        Loader.downloadQueue[#Loader.downloadQueue + 1] = {
                            path = originalFileName,
                            fileName = fileName,
                            type = "cdn",
                            size = fileData.size,
                            hash = fileData.hash,
                            currentRequest = false,
                            currentPartInRange = 0
                        }
                    else
                        Logger.info('LOADER', 'Hash match for {}', fileName)
                    end
                else
                    Logger.info('LOADER', 'File {} doesn\'t open, downloading again', fileName)

                    Loader.downloadQueue[#Loader.downloadQueue + 1] = {
                        path = originalFileName,
                        fileName = fileName,
                        type = "cdn",
                        size = fileData.size,
                        hash = fileData.hash,
                        currentRequest = false,
                        currentPartInRange = 0
                    }
                end
            else
                Logger.info('LOADER', 'File {} doesn\'t exist, downloading', fileName)

                Loader.downloadQueue[#Loader.downloadQueue + 1] = {
                    path = originalFileName,
                    fileName = fileName,
                    type = "cdn",
                    size = fileData.size,
                    hash = fileData.hash,
                    currentRequest = false,
                    currentPartInRange = 0
                }
            end
        end

        if (Loader.prepareIndex <= #Loader.files) then
            Loader.prepareFiles()
        else
            local totalBytes = 0

            for _, fileData in pairs(Loader.downloadQueue) do
                Loader.yieldIfRequired()
                totalBytes = totalBytes + fileData.size
            end

            Loader.downloadInfo = {
                files = #Loader.downloadQueue,
                filesDownloaded = 0,
                totalBytes = totalBytes,
                bytesDownloaded = 0
            }

            Overlay.triggerEvent("onLoadStateChange", {
                state = 1,
                resourceType = "file",
                currentDownloaded = 0,
                totalDownload = #Loader.downloadQueue,
                bytesDownloaded = 0,
                bytesTotal = totalBytes,
            })

            Loader.downloadStage = 1

            for i=1, Loader.CONCURRENT_REQUESTS do
                Loader.yieldIfRequired()
                Loader.downloadNextFileInQueue()
            end
        end
    end)

    Loader.coroutines[thread] = 0
end

function Loader.downloadNextFileInQueue()
    if (not Loader.active) then
        return
    end

    if (#Loader.downloadQueue > 0) then
        local file = table.remove(Loader.downloadQueue, 1)

        if (fileExists(file.fileName)) then
            if (not fileDelete(file.fileName)) then
                Logger.error('LOADER', 'Failed to delete file {}, failing...', file.fileName)
                Loader.onFailedDownload()
                return
            end
        end

        local fileHandle = fileCreate(file.fileName)

        if (not fileHandle) then
            Logger.error('LOADER', 'Failed to create file {}, failing...', file.fileName)
            Loader.onFailedDownload()
            return
        end

        file.handle = fileHandle
        Loader.activeDownloads[#Loader.activeDownloads + 1] = file

        Loader.downloadNextFilePart(file)
    elseif (#Loader.activeDownloads == 0 and Loader.downloadStage == 1) then
        if (#Loader.validateQueue > 0) then
            setTimer(function()
                Loader.downloadStage = -1
                Loader.validateFiles()
            end, 2000, 1)
        else
            Loader.downloadStage = -1

            if (#Loader.imgArchivesToExtract > 0) then
                Loader.extractImgArchives()
            else
                Loader.prepareScripts()
            end
        end
    end
end

function Loader.downloadNextFilePart(file)
    if (not Loader.active) then
        return
    end

    local rangeStart = file.currentPartInRange
    local rangeEnd = rangeStart + 10485760

    if (rangeEnd > file.size) then
        rangeEnd = file.size
    end

    file.currentRequest = fetchRemote(config('cdn_url')..'/'..file.path, {
        connectTimeout = 90000000,
        headers = {
            Range="bytes="..rangeStart.."-"..rangeEnd
        }
    }, Loader.onReceivedFilePart, {
        file = file
    })
end

function Loader.onReceivedFilePart(data, info, file)
    if (not Loader.active) then
        return
    end

    if (info.statusCode ~= 200 and info.statusCode ~= 206) then
        Logger.error('LOADER', 'Failed to download file part {}, failing...', file.fileName)
        Loader.onFailedDownload()
        return
    end

    local headers = info.headers
    local contentRange = headers['Content-Range'] or headers['content-range']
    local currentRangeMax

    if (contentRange == nil) then
        currentRangeMax = file.size
    else
        currentRangeMax = tonumber(contentRange:match("bytes.%d+%-(%d+)/%d") or file.size) + 1
    end

    fileWrite(file.handle, data)

    if (currentRangeMax >= file.size) then
        file.currentRequest = false
        file.currentPartInRange = 0
        Loader.downloadInfo.bytesDownloaded = Loader.downloadInfo.bytesDownloaded + tonumber(headers['Content-Length'] or file.size)

        if (#Loader.activeDownloads > 1) then
            Loader.downloadInfo.filesDownloaded = Loader.downloadInfo.filesDownloaded + 1
        end

        for index, activeFileData in pairs(Loader.activeDownloads) do
            if (activeFileData.path == file.path) then
                table.remove(Loader.activeDownloads, index)
                break
            end
        end

        fileClose(file.handle)

        Loader.validateQueue[#Loader.validateQueue + 1] = {
            path = file.fileName,
            hash = file.hash
        }

        Loader.downloadNextFileInQueue()
    else
        Loader.downloadInfo.bytesDownloaded = Loader.downloadInfo.bytesDownloaded + tonumber(headers['Content-Length'])
        file.currentPartInRange = currentRangeMax
        Loader.downloadNextFilePart(file)
    end
end

function Loader.validateFiles()
    if (not Loader.active) then
        return
    end

    Overlay.triggerEvent("onLoadStateChange", {
        state = 0,
        message = "Validating files"
    })

    Discord.setState('Validating files', true)

    local thread

    thread = coroutine.create(function()
        for _, fileData in pairs(Loader.validateQueue) do
            if (fileExists(fileData.path)) then
                local file = fileOpen(fileData.path, true)

                if (file) then
                    if (not file) then
                        Loader.onFailedValidation()
                        return
                    end

                    local hash = fileGetHash(file, "sha256")

                    fileClose(file)

                    if (fileData.hash ~= hash) then
                        Loader.onFailedValidation()
                        return
                    end
                else
                    Logger.error('LOADER', 'Failed to open file {} for validation', fileData.path)
                    Loader.onFailedValidation()
                    return
                end
            else
                Loader.onFailedValidation()
                return
            end
        end

        Loader.validateQueue = {}

        if (#Loader.imgArchivesToExtract > 0) then
            Loader.extractImgArchives()
        else
            Loader.prepareScripts()
        end
    end)

    Loader.coroutines[thread] = 0
end

function Loader.extractImgArchives()
    Overlay.triggerEvent("onLoadStateChange", {
        state = 0,
        message = "Extracting IMG archives"
    })

    Discord.setState('Extracting IMG archives', true)

    local thread

    thread = coroutine.create(function()
        for _, imgArchive in pairs(Loader.imgArchivesToExtract) do
            imgArchive = ImgArchive:create(imgArchive)

            if (not imgArchive:extract(nil)) then
                Overlay.triggerEvent("onLoadStateChange", {
                    state = 2,
                    message = "Failed to extract IMG archives! Contact a developer."
                })

                imgArchive:close()
                Loader.cleanupLoader()
                return
            end

            imgArchive:close()
            Loader.yieldIfRequired()
        end

        Loader.prepareScripts()
    end)

    Loader.coroutines[thread] = 0
end

function Loader.prepareScripts()
    triggerServerEvent("sphene:loader:onRequestScriptsInfo", resourceRoot, Loader.game)
end

function Loader.onRetrieveScriptsInfo(scriptsSize)
    Loader.downloadQueue = {}

    if (scriptsSize > 0) then
        Loader.downloadInfo = {
            files = 0,
            filesDownloaded = 0,
            totalBytes = scriptsSize,
            bytesDownloaded = 0
        }

        Overlay.triggerEvent("onLoadStateChange", {
            state = 1,
            resourceType = "scripts",
            currentDownloaded = 0,
            totalDownload = 0,
            bytesDownloaded = 0,
            bytesTotal = totalBytes,
        })

        Loader.downloadStage = 2

        Loader.activeDownloads[1] = {
            type = "script",
            size = scriptsSize,
            startBytes = getNetworkStats().bytesReceived
        }

        triggerServerEvent("sphene:loader:onRequestScripts", resourceRoot, Loader.game)
    else
        Loader.downloadStage = -1

        setTimer(function()
            Loader.loadScripts(nil)
        end, 2000, 1)
    end
end

function Loader.onRetrieveScripts(scriptsData)
    Loader.downloadStage = -1
    Loader.activeDownloads = {}

    setTimer(function()
        Loader.loadScripts(scriptsData)
    end, 2000, 1)
end

function Loader.loadScripts(scriptsData)
    local thread = false

    Discord.setState('Loading game', true)

    Overlay.triggerEvent("onLoadStateChange", {
        state = 0,
        message = "Unpacking scripts"
    })

    setTimer(function()
        thread = coroutine.create(function()
            if (scriptsData ~= nil and #scriptsData > 0) then
                local scriptsCount = string.byte(scriptsData, 1) + string.byte(scriptsData, 2) * 256 + string.byte(scriptsData, 3) * 65536 + string.byte(scriptsData, 4) * 16777216
                --local scriptListSize = string.byte(scriptsData, 5) + string.byte(scriptsData, 6) * 256 + string.byte(scriptsData, 7) * 65536 + string.byte(scriptsData, 8) * 16777216
                local scriptsOffset = string.byte(scriptsData, 9) + string.byte(scriptsData, 10) * 256 + string.byte(scriptsData, 11) * 65536 + string.byte(scriptsData, 12) * 16777216

                local currentOffset = 13

                for i=1, scriptsCount do
                    local scriptName = ""

                    while (string.byte(scriptsData, currentOffset) ~= 0) do
                        scriptName = scriptName..string.char(string.byte(scriptsData, currentOffset))
                        currentOffset = currentOffset + 1
                        Loader.yieldIfRequired()
                    end

                    local scriptLen = string.byte(scriptsData, currentOffset + 1) + string.byte(scriptsData, currentOffset + 2) * 256 + string.byte(scriptsData, currentOffset + 3) * 65536 + string.byte(scriptsData, currentOffset + 4) * 16777216
                    local scriptOffset = string.byte(scriptsData, currentOffset + 5) + string.byte(scriptsData, currentOffset + 6) * 256 + string.byte(scriptsData, currentOffset + 7) * 65536 + string.byte(scriptsData, currentOffset + 8) * 16777216

                    currentOffset = currentOffset + 9

                    local scriptData = scriptsData:sub(scriptsOffset + scriptOffset + 1, scriptsOffset + scriptOffset + scriptLen)

                    local call, _ = assert(loadstring("--[["..scriptName.."]]"..scriptData))

                    local status = xpcall(call, function(error)
                        error = error:gsub("%[string.+%]", "")
                        error = error:gsub("^( )+","")

                        if (error:match("^:[0-9]+") ~= nil) then
                            Logger.error('LOADER', 'Failed to load {}: {}', scriptName, error)
                        else
                            Logger.error('LOADER', 'Failed to load {} = {}', scriptName, error)
                        end
                    end)

                    if(status == false) then
                        Logger.error('LOADER', 'Failed to load {}', scriptName)

                        Overlay.triggerEvent("onLoadStateChange", {
                            state = 2,
                            message = "Failed to load! Contact a developer."
                        })

                        Discord.setState('Failed to load', true, true)

                        Loader.cleanupLoader()

                        return
                    end

                    Logger.debug('LOADER', 'Loaded {}', scriptName)
                    Loader.yieldIfRequired()
                end

                Loader.yieldIfRequired()
            end

            setTimer(function()
                Overlay.triggerEvent("onLoadStateChange", {
                    state = 0,
                    message = "Loading path nodes"
                })

                stateThread = coroutine.create(function()
                    TrafficArea.load()

                    Overlay.triggerEvent("onLoadStateChange", {
                        state = 0,
                        message = "Loading"
                    })

                    if (config('mode') ~= 'benchmark') then
                        if (Loader.game == Core.game.VICE_CITY) then
                            Overlay.triggerEvent("onLoadStateChange", {
                                state = 0,
                                message = "Loading opcode table"
                            })

                            loadOpcodeTable("assets/opcodes/VCSCM.ini")
                        elseif (Loader.game == Core.game.SAN_ANDREAS) then
                            Overlay.triggerEvent("onLoadStateChange", {
                                state = 0,
                                message = "Loading opcode table"
                            })

                            loadOpcodeTable("assets/opcodes/SASCM.ini")

                            Overlay.triggerEvent("onLoadStateChange", {
                                state = 0,
                                message = "Loading text data"
                            })

                            if (config('mode') == 'demo') then
                                Text.loadGXT("assets/demo/demo.gxt")
                            else
                                Text.loadGXT("data/game/san_andreas/text/american.gxt")
                            end

                            Overlay.triggerEvent("onLoadStateChange", {
                                state = 0,
                                message = "Loading vehicle data"
                            })

                            VehicleElement.loadData("data/game/san_andreas")

                            Overlay.triggerEvent("onLoadStateChange", {
                                state = 0,
                                message = "Loading IPL data"
                            })

                            IPL.load("data/game/san_andreas/data/maps/LA/LAn.ipl")
                            IPL.load("data/game/san_andreas/data/maps/LA/LAn2.ipl")
                            IPL.load("data/game/san_andreas/data/maps/LA/LAs.ipl")
                            IPL.load("data/game/san_andreas/data/maps/LA/LAs2.ipl")
                            IPL.load("data/game/san_andreas/data/maps/LA/LAe.ipl")
                            IPL.load("data/game/san_andreas/data/maps/LA/LAe2.ipl")
                            IPL.load("data/game/san_andreas/data/maps/LA/LAw.ipl")
                            IPL.load("data/game/san_andreas/data/maps/LA/LaWn.ipl")
                            IPL.load("data/game/san_andreas/data/maps/LA/LAw2.ipl")
                            IPL.load("data/game/san_andreas/data/maps/LA/LAhills.ipl")
                            IPL.load("data/game/san_andreas/data/maps/SF/SFn.ipl")
                            IPL.load("data/game/san_andreas/data/maps/SF/SFs.ipl")
                            IPL.load("data/game/san_andreas/data/maps/SF/SFSe.ipl")
                            IPL.load("data/game/san_andreas/data/maps/SF/SFe.ipl")
                            IPL.load("data/game/san_andreas/data/maps/SF/SFw.ipl")
                            IPL.load("data/game/san_andreas/data/maps/vegas/vegasN.ipl")
                            IPL.load("data/game/san_andreas/data/maps/vegas/vegasS.ipl")
                            IPL.load("data/game/san_andreas/data/maps/vegas/vegasE.ipl")
                            IPL.load("data/game/san_andreas/data/maps/vegas/vegasW.ipl")
                            IPL.load("data/game/san_andreas/data/maps/country/countryN.ipl")
                            IPL.load("data/game/san_andreas/data/maps/country/countn2.ipl")
                            IPL.load("data/game/san_andreas/data/maps/country/countryS.ipl")
                            IPL.load("data/game/san_andreas/data/maps/country/countrye.ipl")
                            IPL.load("data/game/san_andreas/data/maps/country/countryw.ipl")

                            IPL.load("data/game/san_andreas/data/maps/interior/int_LA.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/int_SF.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/int_veg.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/int_cont.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/gen_int1.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/gen_int2.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/gen_intb.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/gen_int3.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/gen_int4.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/gen_int5.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/stadint.ipl")
                            IPL.load("data/game/san_andreas/data/maps/interior/savehous.ipl")

                            --[[Overlay.triggerEvent("onLoadStateChange", {
                                state = 0,
                                message = "Loading textures"
                            })

                            local hudTxd = Txd.load(BitStream:create("data/game/san_andreas/models/hud.txd", true))]]
                        else
                            return
                        end
                    end

                    Overlay.triggerEvent("onLoadStateChange", {
                        state = 0,
                        message = "Initializing session"
                    })

                    Discord.setState('Initializing session', true)

                    triggerServerEvent("sphene:core:player:finishedLoading", resourceRoot)
                end)

                Loader.coroutines[stateThread] = 0
            end, 100, 1)
        end)

        Loader.coroutines[thread] = 0
    end, 100, 1)
end

function Loader.onLobbyReady(dimension)
    local thread = coroutine.create(function()
        if (config('mode') ~= 'benchmark' and config('mode') ~= 'sandbox') then
            Logger.debug('LOADER', 'Mode is not benchmark or sandbox, loading game...')
            Discord.setState('Starting game', true)

            if (Loader.game == Core.game.VICE_CITY) then
                Logger.info('LOADER', 'Loading Vice City...')

                Overlay.triggerEvent("onLoadStateChange", {
                    state = 0,
                    message = "Loading script"
                })

                if (not Script.load("data/game/vice_city/data/main.scm", nil)) then
                    Logger.error('LOADER', 'Failed to load script')

                    Overlay.triggerEvent("onLoadStateChange", {
                        state = 2,
                        message = "Unable to load script"
                    })

                    Loader.cleanupLoader()
                    return
                end
            elseif (Loader.game == Core.game.SAN_ANDREAS) then
                Logger.info('LOADER', 'Loading San Andreas...')

                Overlay.triggerEvent("onLoadStateChange", {
                    state = 0,
                    message = "Loading script"
                })

                local scriptPath = "data/game/san_andreas/data/script/main.scm"
                local scriptImgPath = "data/game/san_andreas/data/script/script.img"

                if (config('mode') == 'demo') then
                    Logger.info('LOADER', 'Loading demo script...')
                    scriptPath = "assets/demo/demo.scm"
                end

                if (not Script.load(scriptPath, scriptImgPath)) then
                    Logger.error('LOADER', 'Failed to load script')

                    Overlay.triggerEvent("onLoadStateChange", {
                        state = 2,
                        message = "Unable to load script"
                    })

                    Loader.cleanupLoader()
                    return
                end
            else
                return
            end
        end

        Loader.cleanupLoader()

        setTimer(function()
            Core.onLoadFinished()
        end, 100, 1)
    end)

    Loader.coroutines[thread] = 0
end

function Loader.onCrash(customMessage)
    Overlay.triggerEvent("onLoadStateChange", {
        state = 2,
        message = customMessage or "A critical error happened while loading. Please contact a developer."
    })

    Discord.setState('Critical error', true, true)

    Loader.cleanupLoader()
end

function Loader.onFailedDownload()
    Overlay.triggerEvent("onLoadStateChange", {
        state = 2,
        message = "Failed to download! Contact a developer."
    })

    Discord.setState('Failed to download', true, true)

    Loader.cleanupLoader()
end

function Loader.onFailedLoad()
    Overlay.triggerEvent("onLoadStateChange", {
        state = 2,
        message = "Failed to load! Contact a developer."
    })

    Discord.setState('Failed to load', true, true)

    Loader.cleanupLoader()
end

function Loader.onFailedValidation()
    Overlay.triggerEvent("onLoadStateChange", {
        state = 2,
        message = "File validation failed! Retrying..."
    })

    Loader.prepareIndex = 1

    Discord.setState('File validation failed', true, true)

    setTimer(Loader.prepareFiles, 5000, 1)
end

function Loader.onRender()
    if (not Loader.active) then
        return
    end

    if (Loader.downloadStage == 1) then
        local activeBytesDownloaded = 0

        for _, fileData in pairs(Loader.activeDownloads) do
            if (fileData.currentRequest ~= false) then
                local requestInfo = getRemoteRequestInfo(fileData.currentRequest)

                if (requestInfo ~= false) then
                    activeBytesDownloaded = activeBytesDownloaded + requestInfo['bytesReceived']
                end
            end
        end

        Overlay.triggerEvent("onLoadStateChange", {
            state = 1,
            resourceType = "file",
            currentDownloaded = Loader.downloadInfo.filesDownloaded + 1,
            totalDownload = Loader.downloadInfo.files,
            bytesDownloaded = Loader.downloadInfo.bytesDownloaded + activeBytesDownloaded,
            bytesTotal = Loader.downloadInfo.totalBytes,
        })

        Discord.setState('Downloading files', true)
    elseif (Loader.downloadStage == 2) then
        local activeBytesDownloaded = 0

        if (Loader.activeDownloads[1]) then
            activeBytesDownloaded = getNetworkStats().bytesReceived - Loader.activeDownloads[1].startBytes
        end

        if (Loader.downloadInfo.bytesDownloaded + activeBytesDownloaded > Loader.downloadInfo.totalBytes) then
            Loader.downloadInfo.bytesDownloaded = Loader.downloadInfo.totalBytes
            activeBytesDownloaded = 0
        end

        Overlay.triggerEvent("onLoadStateChange", {
            state = 1,
            resourceType = "scripts",
            currentDownloaded = 0,
            totalDownload = 0,
            bytesDownloaded = Loader.downloadInfo.bytesDownloaded + activeBytesDownloaded,
            bytesTotal = Loader.downloadInfo.totalBytes,
        })

        Discord.setState('Downloading scripts', true)
    end
end

function Loader.tryLoadCached(path)
    skipIfNotExists = skipIfNotExists or false

    local pathHashed = 'cache/'..hash("sha256", path)

    if (not fileExists(pathHashed)) then
        return false
    end

    local file = fileOpen(path, true)

    if (file) then
        local hash = fileGetHash(file, "sha256"):sub(1, 16)

        fileClose(file)

        file = fileOpen(pathHashed, true)

        if (file == false) then
            return false
        end

        local iv = fileRead(file, 16)
        local encryptedData = fileRead(file, fileGetSize(file) - 16)

        fileClose(file)

        if (encryptedData == false) then
            return false
        end

        local data = decodeString('aes128', encryptedData, {key = hash, iv = iv})

        if (data:sub(1, 16) ~= hash) then
            return false
        end

        data = data:sub(17)

        if (data:sub(1, 1) == '{' or data:sub(1, 1) == '[') then
            Loader.yieldIfRequired()
            tblData = fromJSON(data)

            if (tblData) then
                data = tblData
            end
        end

        return data
    end
end

function Loader.saveToCache(path, data)
    local pathHashed = 'cache/'..hash("sha256", path)

    if (fileExists(pathHashed)) then
        fileDelete(pathHashed)
    end

    local file = fileOpen(path, true)

    if (file) then
        if (type(data) == "table") then
            Loader.yieldIfRequired()
            data = toJSON(data)
        end

        local hash = fileGetHash(file, "sha256"):sub(1, 16)

        fileClose(file)

        -- This is NOT an anti-tampering method. Merely a way to easily check if this was file parsed against the file with the intended checksum.
        -- Methods to prevent tampering are not implemented yet but may never unless any form of competition is introduced within Sphene.
        local encryptedData, iv = encodeString('aes128', hash..data, {key = hash})

        if (encryptedData == false) then
            return false
        end

        file = fileCreate(pathHashed)

        if (file == false) then
            return false
        end

        fileWrite(file, iv)
        fileWrite(file, encryptedData)
        fileClose(file)

        return true
    end

    return false
end

function Loader.handleLoaderSwap()
    for thread, _ in pairs(Loader.coroutines) do
        if (coroutine.status(thread) == "suspended") then
            coroutine.resume(thread)
        end
    end
end

function Loader.cleanupLoader()
    Loader.downloadQueue = {}
    Loader.validateQueue = {}

    Loader.files = {}
    Loader.scripts = {}

    Loader.downloadQueue = {}
    Loader.activeDownloads = {}
    Loader.validateQueue = {}
    Loader.coroutines = {}

    Loader.prepareIndex = 1
    Loader.active = false

    for _, activeDownload in pairs(Loader.activeDownloads) do
        if (activeDownload.currentRequest ~= false) then
            abortRemoteRequest(activeDownload.currentRequest)
        end

        if (activeDownload.handle ~= nil) then
            fileClose(activeDownload.handle)
        end
    end

    if (isElement(Loader.loadingScreenSound) and config('mode') ~= 'benchmark') then
        Loader.loadingScreenSound:destroy()
    end
end

-----------------------------------
-- * Events
-----------------------------------

addEvent("sphene:loader:onRetrieveScriptsInfo", true)
addEventHandler("sphene:loader:onRetrieveScriptsInfo", resourceRoot, Loader.onRetrieveScriptsInfo)

addEvent("sphene:loader:onRetrieveScripts", true)
addEventHandler("sphene:loader:onRetrieveScripts", resourceRoot, Loader.onRetrieveScripts)

addEvent("sphene:loader:onFailedDownload", true)
addEventHandler("sphene:loader:onFailedDownload", resourceRoot, Loader.onFailedDownload)

addEvent("sphene:core:lobby:ready", true)
addEventHandler("sphene:core:lobby:ready", resourceRoot, Loader.onLobbyReady)

setTimer(Loader.handleLoaderSwap, 50, 0)