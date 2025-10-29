-----------------------------------
-- * Variables
-----------------------------------

Audio = {}
Audio.__index = Audio

Audio.wavData = {}
Audio.soundtrackData = {}

-----------------------------------
-- * Functions
-----------------------------------

function Audio.loadWav(id, soundId)
    if (Audio.wavData[id] ~= nil) then
        if (Audio.wavData[id]['sound'] ~= false and isElement(Audio.wavData[id]['sound'])) then
            destroyElement(Audio.wavData[id]['sound'])
        end

        Audio.wavData[id] = nil
    end

    local bank = math.floor((soundId - 2000) / 200)
    local slot = ((soundId - 2000) % 200)

    Audio.wavData[id] = {
        ['sound'] = false,
        ['bank'] = bank,
        ['slot'] = slot,
        ['playing'] = false
    }
end

function Audio.loadSoundTrack(id)
    if (Audio.soundtrackData ~= nil) then
        if (Audio.soundtrackData.sound ~= false
            and isElement(Audio.soundtrackData.sound)) then
            destroyElement(Audio.soundtrackData.sound)
        end

        Audio.soundtrackData = {
            ["id"] = false,
            ["sound"] = false,
            ["playing"] = false
        }
    end

    if id <= 23 then
        Audio.soundtrackData = {
            ["id"] = id,
            ["sound"] = false,
            ["playing"] = false
        }

        return true
    end

    return false
end

function Audio.unloadWav(id)
    if (Audio.wavData[id] ~= nil) then
        if (Audio.wavData[id]['sound'] ~= false and isElement(Audio.wavData[id]['sound'])) then
            destroyElement(Audio.wavData[id]['sound'])
        end

        Audio.wavData[id] = nil

        return true
    end

    return false
end

function Audio.playWav(id)
    if (Audio.wavData[id] ~= nil) then
        local sfx = playSFX("script", Audio.wavData[id]['bank'], Audio.wavData[id]['slot'], false)

        if (sfx) then
            setSoundVolume(sfx, 1.0)

            Audio.wavData[id]['sound'] = sfx
            Audio.wavData[id]['playing'] = (sfx ~= false and sfx ~= nil)
        end

        return true
    end

    return false
end

function Audio.playSoundTrack()
    if (Audio.soundtrackData ~= nil) then
        if (Audio.soundtrackData.sound ~= false
            and isElement(Audio.soundtrackData.sound)) then
            destroyElement(Audio.soundtrackData.sound)
        end

        if (Audio.soundtrackData.id ~= false) then
            Audio.soundtrackData.sound =
                playSFX('radio', 'Beats', Audio.soundtrackData.id, false)
        end
    end
end

function Audio.stopSoundTrack()
    if (Audio.soundtrackData ~= nil) then
        if (Audio.soundtrackData.sound ~= false
            and isElement(Audio.soundtrackData.sound)) then
            destroyElement(Audio.soundtrackData.sound)
        end

        Audio.soundtrackData.sound = false
    end
end

function Audio.cleanup()
    for id, data in pairs(Audio.wavData) do
        if (data['sound'] ~= false and isElement(data['sound'])) then
            destroyElement(data['sound'])
        end
    end

    Audio.wavData = {}

    if (Audio.soundtrackData ~= nil) then
        if (Audio.soundtrackData.sound ~= false
            and isElement(Audio.soundtrackData.sound)) then
            destroyElement(Audio.soundtrackData.sound)
        end

        Audio.soundtrackData = {
            ["id"] = false,
            ["sound"] = false,
            ["playing"] = false
        }
    end
end

function Audio.isWavLoaded(id)
    return Audio.wavData[id] ~= nil
end

function Audio.hasWavEnded(id)
    if (Audio.wavData[id] ~= nil) then
        if (Audio.wavData[id]['playing'] == false or not isElement(Audio.wavData[id]['sound'])) then
            return true
        end

        return false
    end

    return true
end

function Audio.getSoundTrackStatus()
    if (Audio.soundtrackData.sound ~= false) then
        if (isElement(Audio.soundtrackData.sound)) then
            return 3
        else
            return 2
        end
    elseif (Audio.soundtrackData.id ~= false) then
        return 2
    end

    return 0
end