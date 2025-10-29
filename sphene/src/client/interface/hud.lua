-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local HUD_ID_TO_COMPONENT = {
    [3] = "armour",
    [4] = "health",
    [8] = "radar",
    [10] = "breath"
}

local flashData = {}

-----------------------------------
-- * Variables
-----------------------------------

Hud = {}
Hud.__index = Hud

-----------------------------------
-- * Functions
-----------------------------------

function Hud.flash(component)
    flashData[component] = {
        nextflashTick = getTickCount() + 500,
        flashes = 0,
        stage = 0
    }
end

function Hud.setComponentVisible(component, visible)
    component = HUD_ID_TO_COMPONENT[component]

    if (component == nil) then
        return
    end

    setPlayerHudComponentVisible(component, visible)
end

function Hud.onRender()
    for component, data in pairs(flashData) do
        if (data.nextflashTick == -1) then
            data.nextflashTick = getTickCount() + 500
        end

        if (data.flashes > 3) then
            flashData[component] = nil
        else
            if (data.nextflashTick < getTickCount()) then
                data.nextflashTick = -1

                if (data.stage == 1) then
                    Hud.setComponentVisible(component, true)
                    data.flashes = data.flashes + 1
                    data.stage = 0
                else
                    Hud.setComponentVisible(component, false)
                    data.stage = 1
                end
            end
        end
    end
end