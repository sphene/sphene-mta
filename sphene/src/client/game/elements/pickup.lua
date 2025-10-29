-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local pickups = {}
local weaponModelsToId = {
    [331] = 1, -- Brassknuckle
    [333] = 2, -- Golfclub
    [334] = 3, -- Nightstick
    [335] = 4, -- Knife
    [336] = 5, -- Bat
    [337] = 6, -- Shovel
    [338] = 7, -- Poolstick
    [339] = 8, -- Katana
    [341] = 9, -- Chainsaw
    [346] = 22, -- Colt 45
    [347] = 23, -- Silenced
    [348] = 24, -- Deagle
    [349] = 25, -- Shotgun
    [350] = 26, -- Sawed-off
    [351] = 27, -- Combat Shotgun
    [352] = 28, -- Uzi
    [353] = 29, -- MP5
    [372] = 32, -- Tec-9
    [355] = 30, -- AK-47
    [356] = 31, -- M4
    [357] = 33, -- Rifle
    [358] = 34, -- Sniper
    [359] = 35, -- Rocket Launcher
    [360] = 36, -- Rocket Launcher HS
    [361] = 37, -- Flamethrower
    [362] = 38, -- Minigun
    [342] = 16, -- Grenade
    [343] = 17, -- Teargas
    [344] = 18, -- Molotov
    [363] = 39, -- Satchel
    [365] = 41, -- Spraycan
    [366] = 42, -- Fire Extinguisher
    [367] = 43, -- Camera
    [321] = 10, -- Dildo
    [322] = 11, -- Dildo
    [323] = 12, -- Vibrator
    [325] = 14, -- Flower
    [326] = 15, -- Cane
    [368] = 44, -- Nightvision
    [369] = 45, -- Infrared
    [371] = 46, -- Parachute
    [364] = 40, -- Bomb
}

-----------------------------------
-- * Variables
-----------------------------------

PickupElement = {
    elementTable = pickups
}

PickupElement.__index = PickupElement

-----------------------------------
-- * Functions
-----------------------------------

function PickupElement:create(type, model, skipConversion)
    local mt = setmetatable({}, PickupElement)

    PickupElement.parent.create(mt)

    if (not (skipConversion or false)) then
        if (type == 2) then
            model = weaponModelsToId[model] or model
        else
            local pickupName = Script.objectsById[math.abs(model - 1)]

            if (pickupName) then
                model = engineGetModelIDFromName(pickupName)
                Logger.debug('PICKUP', 'Retrieved pickup model {} from name {}', model, pickupName)
            else
                Logger.warning('PICKUP', "Tried to create pickup ({}) but couldn't find it! Setting to default model.", model)
                model = 1314 -- When a 2-player icon is seen, it means the pickup is missing.
            end

            type = 3
        end

        if (model == 370) then
            type = 3
        end
    end

    Logger.debug('PICKUP', 'Creating pickup with type {} and model {}', type, model)

    mt.spawned = false

    mt.alpha = 255
    mt.type = type
    mt.model = model
    mt.pickedUp = false
    mt.disabled = false
    mt.hideInMission = false
    mt.innerElement = false

    return mt
end

function PickupElement:spawn(x, y, z)
    Logger.debug('PICKUP', 'Spawning pickup with type {} and model {}', self.type, self.model)

    local pickup = createPickup(x or 0, y or 0, z or 0, self.type, self.model)

    self.element = pickup
    self.spawned = true

    ElementManager.addElementHandle(self.element, self)

    if (self.element) then
        self:setAlpha(self.alpha)

        local dimension = getElementData(getElementParent(localPlayer), 'dimension')
        Logger.debug('PICKUP', 'Setting dimension to {} for pickup with ID {}', dimension, self.id)
        setElementDimension(self.element, dimension)
    else
        Logger.error('PICKUP', 'Failed to create pickup with type {} and model {}', self.type, self.model)
    end
end

function PickupElement:destroy()
    self.spawned = false

    if (isElement(self.element)) then
        self.element:destroy()
    end

    PickupElement.parent.destroy(self)
end

function PickupElement:setAlpha(alpha)
    self.alpha = alpha

    if (self.element) then
        if (alpha == 0) then
            setElementDimension(self.element, 65534)
        else
            setElementDimension(self.element, getElementData(getElementParent(localPlayer), 'dimension'))
        end
    end
end

function PickupElement:setHiddenInMission(hide)
    self.hideInMission = hide
end

function PickupElement:getRotation()
    return 0, 0, 0
end

function PickupElement:isPickedUp()
    return self.pickedUp
end

function PickupElement:isHiddenInMission()
    return self.hideInMission
end

function PickupElement:onPreFrame()
    if (self.element) then
        if (self.hideInMission and Game.getMissionFlag() == 1) then
            if (getElementDimension(self.element) ~= 65534) then
                Logger.debug('PICKUP', 'Hiding pickup with ID {} in mission', self.id)
                setElementDimension(self.element, 65534)
            end

            return
        elseif (self.alpha > 0 and (getElementDimension(self.element) or -1) == 65534) then
            Logger.debug('PICKUP', 'Showing pickup with ID {}', self.id)
            setElementDimension(self.element, getElementData(getElementParent(localPlayer), 'dimension'))
        end
    end

    if (self.disabled) then
        return
    end

    -- Very early limited pickup behavior. Handle temporary removal and respawn etc.
    local _localPlayer = PlayerElement.getLocalPlayer()

    if (self.element and _localPlayer and self:getDistanceToElement(_localPlayer) < 1.5) then
        Logger.debug('PICKUP', 'Player {} picked up pickup with ID {}', _localPlayer.id, self.id)
        self.pickedUp = true
        self.disabled = true
        self:setAlpha(0)
    end
end

function PickupElement:getType()
    return 'pickup'
end

Core.mergeInto(PickupElement, ElementWrapper)

-----------------------------------
-- * Events
-----------------------------------
