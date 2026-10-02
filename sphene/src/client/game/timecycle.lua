-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _math_floor = math.floor
local _math_min = math.min
local _math_fmod = math.fmod
local _math_modf = math.modf
local _string_find = string.find
local _string_match = string.match
local _string_sub = string.sub
local _tonumber = tonumber
local _unpack = unpack

-----------------------------------
-- * Variables
-----------------------------------

-- Currently, all TimeCycle slots are loaded, but only EXTRACOLOURS sections
-- from the timecyc.dat are used by Sphene for things like cutscenes, mission
-- scripts, etc. We will expand this class if there's ever a need for it.

TimeCycle = {}
TimeCycle.__index = TimeCycle

-- Time cycle has 8 slots (lines) per weather, one per time of day
TimeCycle.SLOTS_PER_WEATHER = 8
-- EXTRASUNNY_LA up to EXTRACOLOURS_2
TimeCycle.WEATHER_COUNT = 23
-- Weather start index of EXTRACOLOURS section
TimeCycle.FIRST_EXTRA_COLOR_WEATHER = 21
TimeCycle.LINE_FORMAT = "dddddddddddddddddddddfffdddfffddddddfffffffffffffddf"

-- timecyc.dat -> colorSets[weather][slot]
TimeCycle.colorSets = {}

TimeCycle.extraColorWeather = TimeCycle.FIRST_EXTRA_COLOR_WEATHER
TimeCycle.extraColorSlot = 1
TimeCycle.extraColorOn = false

TimeCycle.running = false
-- Whether Sphene's colors are currently pushed to the game
TimeCycle.overriding = false

-----------------------------------
-- * Functions
-----------------------------------

function TimeCycle.load(path)
    local file = fileOpen(path, true)

    if (not file) then
        Logger.error("TIMECYCLE", "Failed to open {}", path)
        return false
    end

    local contents = fileRead(file, fileGetSize(file))
    fileClose(file)

    local expectedLines = TimeCycle.WEATHER_COUNT * TimeCycle.SLOTS_PER_WEATHER
    local colorSets = {}
    local values = {}
    local lineCount = 0

    for i = 1, #TimeCycle.LINE_FORMAT do
        values[i] = 0
    end

    for line in (contents.."\n"):gmatch("([^\n]*)\n") do
        -- Control characters and commas become spaces, leading whitespace is skipped
        line = _string_match((line:gsub("[%z\1-\31,]", " ")), "^ *(.*)$")

        if (line ~= "" and _string_sub(line, 1, 1) ~= "/" and lineCount < expectedLines) then
            local weather = _math_floor(lineCount / TimeCycle.SLOTS_PER_WEATHER)
            local slot = lineCount % TimeCycle.SLOTS_PER_WEATHER + 1

            colorSets[weather] = colorSets[weather] or {}

            TimeCycle.scanLine(line, values)
            colorSets[weather][slot] = TimeCycle.createColorSet(values)

            lineCount = lineCount + 1
        end
    end

    if (lineCount < expectedLines) then
        Logger.error(
            "TIMECYCLE",
            "{} has {} data lines, expected {}",
            path, lineCount, expectedLines
        )
        return false
    end

    TimeCycle.colorSets = colorSets

    Logger.info("TIMECYCLE", "Loaded {} color sets from {}", expectedLines, path)

    return true
end

function TimeCycle.scanLine(line, values)
    local format = TimeCycle.LINE_FORMAT
    local position = 1

    for i = 1, #format do
        local pattern = (_string_sub(format, i, i) == "d") and "^%s*([%+%-]?%d+)()" or "^%s*([%+%-]?%d*%.?%d*)()"
        local text, nextPosition = _string_match(line, pattern, position)

        if (not text or not _string_find(text, "%d")) then
            return
        end

        values[i] = _tonumber(text)
        position = nextPosition
    end
end

function TimeCycle.createColorSet(values)
    return {
        ambient = { values[1], values[2], values[3] },
        ambientObj = { values[4], values[5], values[6] },
        -- The game reads the "Dir" color but never stores or uses it
        directional = { values[7], values[8], values[9] },
        skyTop = { values[10], values[11], values[12] },
        skyBottom = { values[13], values[14], values[15] },
        sunCore = { values[16], values[17], values[18] },
        sunCorona = { values[19], values[20], values[21] },
        sunSize = values[22],
        spriteSize = values[23],
        spriteBrightness = values[24],
        shadowStrength = values[25],
        poleShadowStrength = values[27],
        farClip = values[28],
        fogStart = values[29],
        lightsOnGround = values[30],
        lowClouds = { values[31], values[32], values[33] },
        bottomClouds = { values[34], values[35], values[36] },
        -- The game doubles the post fx alphas when it loads them
        postFx1 = { values[42], values[43], values[44], values[41] * 2 },
        postFx2 = { values[46], values[47], values[48], values[45] * 2 },
        cloudAlpha = values[49],
    }
end

function TimeCycle.resetSky()
    resetSkyGradient()
    resetSunColor()
    resetSunSize()
    resetWorldProperty("LowCloudsColor")
    resetWorldProperty("BottomCloudsColor")
end

function TimeCycle.resetGame()
    local properties = {
        "AmbientColor", "AmbientObjColor", "DirectionalColor", "SpriteSize", "SpriteBrightness", "ShadowStrength",
        "PoleShadowStrength", "LightsOnGround", "CloudsAlpha",
    }

    for i = 1, #properties do
        resetWorldProperty(properties[i])
    end

    TimeCycle.resetSky()
    resetFarClipDistance()
    resetFogDistance()
    resetColorFilter()
end

function TimeCycle.applyColorSet(colorSet)
    setWorldProperty("AmbientColor", _unpack(colorSet.ambient))
    setWorldProperty("AmbientObjColor", _unpack(colorSet.ambientObj))
    setWorldProperty("DirectionalColor", _unpack(colorSet.ambient))

    -- A color set with sky top of 0, 0, 0 leaves sky, sun and cloud colors unchanged.
    if (colorSet.skyTop[1] == 0 and colorSet.skyTop[2] == 0 and colorSet.skyTop[3] == 0) then
        TimeCycle.resetSky()
    else
        setSkyGradient(
            colorSet.skyTop[1], colorSet.skyTop[2], colorSet.skyTop[3],
            colorSet.skyBottom[1], colorSet.skyBottom[2], colorSet.skyBottom[3]
        )
        setSunColor(
            colorSet.sunCore[1], colorSet.sunCore[2], colorSet.sunCore[3],
            colorSet.sunCorona[1], colorSet.sunCorona[2], colorSet.sunCorona[3]
        )
        setSunSize(colorSet.sunSize)
        setWorldProperty("LowCloudsColor", _unpack(colorSet.lowClouds))
        setWorldProperty("BottomCloudsColor", _unpack(colorSet.bottomClouds))
    end

    -- The game keeps these in tenths, MTA writes them unchanged
    setWorldProperty("SpriteSize", colorSet.spriteSize * 10)
    setWorldProperty("SpriteBrightness", colorSet.spriteBrightness * 10)
    setWorldProperty("LightsOnGround", colorSet.lightsOnGround * 10)

    setWorldProperty("ShadowStrength", colorSet.shadowStrength)
    setWorldProperty("PoleShadowStrength", colorSet.poleShadowStrength)
    setFarClipDistance(colorSet.farClip)
    setFogDistance(colorSet.fogStart)
    setWorldProperty("CloudsAlpha", colorSet.cloudAlpha)

    local postFx1, postFx2 = colorSet.postFx1, colorSet.postFx2

    -- Clamp alphas to 255 as they can go double that
    setColorFilter(
        postFx1[1], postFx1[2], postFx1[3], _math_min(postFx1[4], 255),
        postFx2[1], postFx2[2], postFx2[3], _math_min(postFx2[4], 255)
    )

    -- TODO: We are missing a few world properties that need MTA implementation:
    --   light shadow strength
    --   highlight intensity
    --   water color
    --   water fog alpha
end

function TimeCycle.refresh()
    local weatherColorSets = TimeCycle.colorSets[TimeCycle.extraColorWeather]
    local colorSet = TimeCycle.running and TimeCycle.extraColorOn and weatherColorSets and weatherColorSets[TimeCycle.extraColorSlot]

    if (colorSet) then
        TimeCycle.applyColorSet(colorSet)
        TimeCycle.overriding = true
    elseif (TimeCycle.overriding) then
        TimeCycle.resetGame()
        TimeCycle.overriding = false
    end
end

-- This function accepts only extra color slots from the timecycle.dat,
-- which is why we need to do some math to get the right one.
function TimeCycle.startExtraColor(color, fade)
    -- We need to use zero index for fmod function, game uses it that way
    local index = color - 1

    TimeCycle.extraColorWeather = TimeCycle.FIRST_EXTRA_COLOR_WEATHER + (_math_modf(index / TimeCycle.SLOTS_PER_WEATHER))
    TimeCycle.extraColorSlot = _math_fmod(index, TimeCycle.SLOTS_PER_WEATHER) + 1
    TimeCycle.extraColorOn = true

    -- Fade is not used at the moment, switches instantly
    TimeCycle.refresh()
end

function TimeCycle.stopExtraColor(fade)
    TimeCycle.extraColorOn = false

    -- Fade is not used at the moment, switches instantly
    TimeCycle.refresh()
end

function TimeCycle.onCutsceneLoaded(extraColor)
    TimeCycle.cutsceneRestoreColor = TimeCycle.extraColorSlot
    TimeCycle.cutsceneRestoreOn = TimeCycle.extraColorOn

    if (extraColor ~= 0) then
        TimeCycle.startExtraColor(extraColor, false)
    else
        TimeCycle.stopExtraColor(false)
    end
end

function TimeCycle.onCutsceneDeleted()
    if (TimeCycle.cutsceneRestoreOn) then
        TimeCycle.startExtraColor(TimeCycle.cutsceneRestoreColor, false)
    else
        TimeCycle.stopExtraColor(false)
    end
end

function TimeCycle.start()
    TimeCycle.extraColorOn = false

    TimeCycle.resetGame()
    TimeCycle.overriding = false
    TimeCycle.running = true

    return true
end

function TimeCycle.stop()
    if (not TimeCycle.running) then
        return
    end

    TimeCycle.running = false
    TimeCycle.overriding = false
    TimeCycle.resetGame()
end
