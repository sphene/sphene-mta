-----------------------------------
-- * Variables
-----------------------------------

Game = {}
Game.__index = Game

Game.isRunning = false
Game.isSkipping = false

Game.startTick = 0
Game.missionFlag = 0
Game.maxWantedLevel = 6
Game.totalMissions = 0
Game.maxProgress = 0
Game.totalRespectPoints = 0

Game.runOnFrame = {}

Game.stats = {}

Game.screenWidth, Game.screenHeight = guiGetScreenSize()

-----------------------------------
-- * Functions
-----------------------------------

function Game.start(game)
    Game.isRunning = true
    Game.missionFlag = 0
    Game.maxWantedLevel = 6
    Game.totalMissions = 0
    Game.maxProgress = 0
    Game.totalRespectPoints = 0
    Game.stats = {}

    Game.hospitals = {}
    Game.policeStations = {}

    setPedTargetingMarkerEnabled(false)
    setPlayerHudComponentVisible('area_name', false)

    Pad.setMoveable(true)

    PlayerElement.localPlayer = false

    if (config('mode') ~= 'benchmark') then
        Script.start()
        Overlay.triggerEvent("onGameStarted")
    end

    Game.startTick = getTickCount()

    Game.createEvents()
    ElementManager.load()

    Discord.setState('Playing game', true)
end

function Game.stop()
    Game.isRunning = false
    Game.missionFlag = 0
    Game.maxWantedLevel = 6
    Game.totalMissions = 0
    Game.maxProgress = 0
    Game.totalRespectPoints = 0

    Game.hospitals = {}
    Game.policeStations = {}

    Game.removeEvents()

    ElementManager.unload()

    Script.stop()
    Script.unload()

    IPL.clear()
end

function Game.createEvents()
    addEventHandler("onClientPreRender", getRootElement(resourceRoot), Game.onPreRender)
    addEventHandler("onClientRender", getRootElement(resourceRoot), Game.onRender)
    addEventHandler("onClientHUDRender", getRootElement(resourceRoot), Game.onHudRender)
    addEventHandler("onClientPlayerWasted", getLocalPlayer(), Game.onPlayerWasted)
    addEventHandler("onClientKey", getRootElement(), Game.onClientKey)
    addEventHandler("onClientPlayerRadioSwitch", getRootElement(), Game.onPlayerRadioSwitch)
end

function Game.removeEvents()
    removeEventHandler("onClientPreRender", getRootElement(resourceRoot), Game.onPreRender)
    removeEventHandler("onClientRender", getRootElement(resourceRoot), Game.onRender)
    removeEventHandler("onClientHUDRender", getRootElement(resourceRoot), Game.onHudRender)
    removeEventHandler("onClientPlayerWasted", getLocalPlayer(), Game.onPlayerWasted)
    removeEventHandler("onClientKey", getRootElement(), Game.onClientKey)
    removeEventHandler("onClientPlayerRadioSwitch", getRootElement(), Game.onPlayerRadioSwitch)
end

function Game.addHospital(x, y, z, angle, town)
    Game.hospitals[#Game.hospitals + 1] = { x = x, y = y, z = z, angle = angle, town = town }
end

function Game.addPoliceStation(x, y, z, angle, town)
    Game.policeStations[#Game.policeStations + 1] = { x = x, y = y, z = z, angle = angle, town = town }
end

function Game.onRender()
    if (Game.isSkipping) then
        if Cutscene.skippable() or Cutscene.isPlaying() then
            Cutscene.skip()
        end

        Game.isSkipping = false
    end

    Thread.run()
    ElementManager.onFrame()

    Text.onRender()
    Enex.onRender()

    for callFunction, params in pairs(Game.runOnFrame) do
        if (params ~= nil and getTickCount() < params[3]) then
            _G[callFunction](unpack(params))
        elseif (params ~= nil and getTickCount() > params[3]) then
            Game.runOnFrame[callFunction] = nil
        end
    end

    if (Debug.isLoaded()) then
        Debug.render()
    end
end

function Game.onPreRender()
    if (Cutscene.isPlaying()) then
        Cutscene.run()
        return
    end

    Camera.onPreFrame()
    ElementManager.onPreFrame()
    Enex.onPreFrame()
end

function Game.onHudRender()
    if (Cutscene.isPlaying()) then
        Cutscene.run()
        return
    end

    Hud.onRender()
end

function Game.onPlayerWasted()
    local thread = Thread.threadTable

    while (thread ~= false) do
        if (thread:isMissionThread()) then
            thread:doReturn()
            return
        end

        thread = thread.next
    end
end

function Game.onClientKey(button, pressed)
    if (pressed and Pad.isKeyBoundToControl(button, "forwards")) then
        Menu.previousActiveRow()
    elseif (pressed and Pad.isKeyBoundToControl(button, "backwards")) then
        Menu.nextActiveRow()
    end

    Pad.onClientKey(button, pressed)

    if (button == "enter" and pressed == false) then
        if Cutscene.skippable() or Cutscene.isPlaying() then
            Game.isSkipping = true
        end
    end
end

function Game.onPlayerRadioSwitch(stationId)
    -- Game disables radio switching if cutscene is playing
    if (Cutscene.isPlaying() and stationId ~= 0) then
        cancelEvent()
    end
end

function Game.setMaxWantedLevel(maxWantedLevel)
    Game.maxWantedLevel = maxWantedLevel
end

function Game.setMissionFlag(flag)
    Game.missionFlag = flag
    Logger.info('GAME', 'Setting mission flag to {}', flag)
end

function Game.setTime(hour, minutes)
    Game.runOnFrame['setTime'] = { hour, minutes, getTickCount() + 1000 }
end

function Game.setStat(stat, value)
    Game.stats[stat] = value
end

function Game.setTotalMissions(totalMissions)
    Game.totalMissions = totalMissions
end

function Game.setTotalRespectPoints(totalRespectPoints)
    Game.totalRespectPoints = totalRespectPoints
end

function Game.setMaxProgress(maxProgress)
    Game.maxProgress = maxProgress
end

function Game.getMaxWantedLevel()
    return Game.maxWantedLevel
end

function Game.getTotalRespectPoints()
    return Game.totalRespectPoints
end

function Game.getMissionFlag()
    return Game.missionFlag
end

function Game.getStat(stat)
    return Game.stats[stat] or 0
end

function Game.getTime()
    local hour, minutes = getTime()

    return hour, minutes
end

function Game.getStartTick()
    return Game.startTick
end

function Game.running()
    return Game.isRunning
end