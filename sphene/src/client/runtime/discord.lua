-----------------------------------
-- * Variables
-----------------------------------

Discord = {}
Discord.__index = Discord

Discord.richPresenceConnected = false
Discord.state = false
Discord.missionName = false

-----------------------------------
-- * Functions
-----------------------------------

function Discord.load()
    if (isDiscordRichPresenceConnected() and config('discord.app_id') ~= nil) then
        setDiscordApplicationID(config('discord.app_id'))

        local discordAsset = config('discord.asset')

        if (discordAsset) then
            setDiscordRichPresenceAsset(discordAsset, 'Sphene')
        end

        Discord.richPresenceConnected = true

        Discord.setState('Initializing', true)
        Discord.setMissionName()
    end
end

function Discord.setState(state, resetTime, disableTimer)
    disableTimer = disableTimer or false

    if (Discord.richPresenceConnected and isDiscordRichPresenceConnected() and state ~= Discord.state) then
        Logger.info('DISCORD', 'Setting state to {}', state)

        Discord.state = state

        setDiscordRichPresenceState(state)

        if (resetTime) then
            if (disableTimer) then
                setDiscordRichPresenceStartTime(0)
            else
                setDiscordRichPresenceStartTime(1)
            end
        end

        if (state ~= 'Playing game') then
            Discord.setMissionName()
        end
    end
end

function Discord.setMissionName(missionName)
    if (config('mode') == 'demo' and Discord.missionName == false) then
        setDiscordRichPresenceStartTime(1)

        Discord.missionName = ''
        setDiscordRichPresenceDetails('')
        return
    end

    if (Discord.richPresenceConnected and isDiscordRichPresenceConnected()) then
        if (missionName) then
            if (missionName ~= Discord.missionName) then
                Logger.info('DISCORD', 'Setting mission name to {}', missionName)

                setDiscordRichPresenceStartTime(1)

                Discord.missionName = missionName

                setDiscordRichPresenceDetails('Mission: '..missionName)
            end
        else
            if (Discord.missionName ~= '') then
                Logger.info('DISCORD', 'Resetting mission name')

                setDiscordRichPresenceStartTime(1)

                Discord.missionName = ''

                setDiscordRichPresenceDetails(Discord.state == 'Playing game' and 'Freeroaming' or '')
            end
        end
    end
end

-----------------------------------
-- * Events
-----------------------------------
