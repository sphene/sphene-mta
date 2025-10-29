-----------------------------------
-- * Variables
-----------------------------------

Sandbox = {}
Sandbox.__index = Sandbox

-----------------------------------
-- * Functions
-----------------------------------

function Sandbox.load()
    Overlay.hideCursor()
    Loader.init(Core.game.SAN_ANDREAS)
end

function Sandbox.start()
    if (not Script.load("assets/sandbox/sandbox.scm")) then
        Logger.error('BENCHMARK', 'Failed to load sandbox script')
        return
    end

    Game.start(Core.game.SAN_ANDREAS)

    Discord.setState('Running sandbox')
    Discord.setMissionName()

    local enexGroup = EnexGroup.createGroup('sandbox')

    enexGroup:addEnex(Enex:create(1413.5642089844, 1463.3463134766, 10.8203125, 180, 1, 1, 1413.5642089844, 1463.3463134766, 10.82031255, 180, 0, 0, 0, 0, 0))
    enexGroup:addEnex(Enex:create(1397.5642089844, 1463.3463134766, 10.8203125, 180, 1, 1, 1397.5642089844, 1463.3463134766, 10.82031255, 180, 0, 0, 0, 0, 0))
    enexGroup:addEnex(Enex:create(1500.5642089844, 1400.3463134766, 10.8203125, 180, 1, 1, 1500.5642089844, 1400.3463134766, 10.8203125, 180, 0, 0, 0, 0, 0))

    local vehicle1 = VehicleElement:create(443)
    vehicle1:spawn(1434.0, 1480.0, 10.820300102234, 0, 0, 0)

    local vehicle2 = VehicleElement:create(411)
    vehicle2:spawn(1424.0, 1480.0, 10.820300102234, 0, 0, 0)

    local weaponPickup1 = PickupElement:create(2, 348)
    weaponPickup1:spawn(1432.0, 1440.0, 10.820300102234)

    local weaponPickup2 = PickupElement:create(2, 356)
    weaponPickup2:spawn(1434.0, 1432.0, 10.820300102234)

    setTimer(function()
        PlayerElement.getLocalPlayer():giveWeapon(30, 500)
        PlayerElement.getLocalPlayer():giveWeapon(34, 500)
        PlayerElement.getLocalPlayer():giveWeapon(35, 500)

        PlayerElement.getLocalPlayer():setWeapon(30)
    end, 1000, 1)
end
