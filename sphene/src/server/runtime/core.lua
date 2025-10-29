-----------------------------------
-- * Variables
-----------------------------------

Core = {}
Core.__index = Core

Core.players = {}
Core.lobbyElements = {}
Core.dimensions = {}

-----------------------------------
-- * Functions
-----------------------------------

function Core.load()
    for i=1, 60000 do
        Core.dimensions[i] = false
    end

    for _,player in pairs(getElementsByType("player")) do
        player:setHealth(100)
        player:setMoney(0)
        setPedStat(player, 230, 0)
        spawnPlayer(player, 0, 0, 6)
    end

    local glitches = {"quickreload", "fastmove", "fastfire", "crouchbug", "highcloserangedamage", "hitanim", "fastsprint", "baddrivebyhitbox", "quickstand"}
    for _, glitch in pairs(glitches) do
        setGlitchEnabled(glitch, true)
    end

    setFPSLimit(0)
    setGameType("Sphene")
    setMapName("San Andreas")
end

function Core.playerStart(loadedResource)
    if (loadedResource == resource) then
        local player = Player:create(source)

        Core.players[source] = player

        source:setHealth(100)
        spawnPlayer(source, 0, 0, 6)

        triggerClientEvent(source, "sphene:core:start", resourceRoot, getConfigOptions())
    end
end

function Core.playerFinishedLoading()
    client:setHealth(100)
    client:setMoney(0)
    setPedStat(client, 230, 0)
    spawnPlayer(client, 0, 0, 6)

    setTimer(function(player)
        local lobby = Lobby:create(Core.assignDimension())

        Logger.info('CORE', 'Creating lobby in dimension {}', lobby:getDimension())
        Logger.info('CORE', 'Player {} has finished loading. Joining lobby in dimension {}', getPlayerName(player), lobby:getDimension())

        lobby:join(player)

        Core.lobbyElements[#Core.lobbyElements + 1] = lobby
    end, 1000, 1, client)
end

function Core.playerQuit()
    Logger.info('CORE', 'Player {} has quit the game. Cleaning up elements...', getPlayerName(source))

    local lobbyElement = getElementParent(source)

    if (lobbyElement and getElementType(lobbyElement) ~= "root") then
        local elementsDestroyed = 0

        for _,element in pairs(getElementChildren(lobbyElement)) do
            elementsDestroyed = elementsDestroyed + 1
            destroyElement(element)
        end

        Logger.info('CORE', 'Destroyed {} elements.', elementsDestroyed)

        for i=1, #Core.lobbyElements do
            if (Core.lobbyElements[i] == lobbyElement) then
                Logger.debug('CORE', 'Removing lobby element from lobbyElements table.')
                table.remove(Core.lobbyElements, i)
                break
            end
        end

        Core.releaseDimension(getElementData(lobbyElement, 'dimension'))
        destroyElement(lobbyElement)
    end

    if Core.players[source] then
        Core.players[source]:destroy()
        Core.players[source] = nil
    end
end

function Core.assignDimension()
    for i=1, #Core.dimensions do
        if (Core.dimensions[i] == false) then
            Logger.info('CORE', 'Assigning dimension {}', i)
            Core.dimensions[i] = true
            return i
        end
    end
end

function Core.releaseDimension(dimension)
    Logger.info('CORE', 'Releasing dimension {}', dimension)
    Core.dimensions[dimension] = false
end

function Core.mergeInto(mergeIntoClass, mergeFromClass)
    mergeIntoClass.parent = {}

    for key, value in pairs(mergeFromClass) do
        if (key ~= "__index" and key ~= "parent") then
            if (mergeIntoClass[key] ~= nil) then
                mergeIntoClass.parent[key] = value
            else
                mergeIntoClass[key] = value
            end
        end
    end
end

-----------------------------------
-- * Events
-----------------------------------

addEventHandler("onResourceStart", resourceRoot, Core.load)
addEventHandler("onPlayerWasted", getRootElement(), function() -- Temporary, needs to be communicated with the client
    setTimer(function(player)
        local x,y,z = getElementPosition(player)
        setPedStat(player, 229, 0)
        spawnPlayer(player, x, y, z)

        local lobbyElement = getElementParent(player)

        setElementDimension(player, getElementData(lobbyElement, 'dimension'))
    end, 1000, 1, source)
end)

addEventHandler("onPlayerResourceStart", root, Core.playerStart)
addEventHandler("onPlayerQuit", root, Core.playerQuit)

addEvent("sphene:core:player:finishedLoading", true)
addEventHandler("sphene:core:player:finishedLoading", root, Core.playerFinishedLoading)