-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local SCREEN_WIDTH, SCREEN_HEIGHT = guiGetScreenSize()
local ANALOG_CONTROL_STATES = {
    'accelerate',
    'brake_reverse',
    'steer_forward',
    'steer_back',
    'vehicle_left',
    'vehicle_right',
    'special_control_left',
    'special_control_right',
    'special_control_up',
    'special_control_down',
    'forwards',
    'backwards',
    'right',
    'left',
}

local CONTROL_STATES = {
    'fire',
    'crouch',
    'aim_weapon',
    'next_weapon',
    'previous_weapon',
    'jump',
    'sprint',
    'look_behind',
    'action',
    'walk',
    'vehicle_fire',
    'vehicle_secondary_fire',
    'vehicle_look_left',
    'vehicle_look_right',
    'vehicle_look_behind',
    'handbrake',
    'horn',
    'sub_mission',
}

local players = {}
local swapScreenSource = dxCreateScreenSource(SCREEN_WIDTH, SCREEN_HEIGHT)
local swapCount = 0
local swapCallback = false

-----------------------------------
-- * Variables
-----------------------------------

PlayerElement = {
    elementTable = players
}

PlayerElement.localPlayer = nil

PlayerElement.__index = PlayerElement

-----------------------------------
-- * Functions
-----------------------------------

function PlayerElement:create(model, player)
    local mt = setmetatable({}, PlayerElement)

    PlayerElement.parent:create(model, player, mt)

    player = player or localPlayer

    if (player == localPlayer) then
        PlayerElement.localPlayer = mt
    end

    mt.__player = player
    mt.__localElement = createPed(0, 0, 0, -50)

    mt.element = player

    mt.clothes = {}
    mt.vehicleWasLoaded = false
    mt.preventActions = false
    mt.swap = false
    mt.exitingVehicle = false
    mt.networkingActive = false

    setElementAlpha(mt.__player, 255)
    setElementCollisionsEnabled(mt.__player, true)

    setElementAlpha(mt.__localElement, 0)
    setElementCollisionsEnabled(mt.__localElement, false)

    Logger.debug(string.upper(self:getType()), 'Defined PED with ID {} as player', mt.id)

    return mt
end

function PlayerElement:spawn(x, y, z)
    self.spawned = true

    ElementManager.addElementHandle(self.__localElement, self)
    ElementManager.addElementHandle(self.__player, self)

    setElementDimension(self.__localElement, getElementData(getElementParent(localPlayer), 'dimension'))

    self:setPosition(x, y, z)
end

function PlayerElement:warpIntoVehicle(vehicle, seat)
    self:swapToLocal(true)
    PlayerElement.parent.warpIntoVehicle(self, vehicle, seat)
end

function PlayerElement:removeFromVehicle()
    PlayerElement.parent.removeFromVehicle(self)
    self:swapToExternal(true)
end

function PlayerElement:setPosition(x, y, z, removeFromVehicle)
    removeFromVehicle = removeFromVehicle or false

    if not removeFromVehicle then
        return PlayerElement.parent.setPosition(self, x, y, z)
    end

    self:removeFromVehicle()
    PlayerElement.parent.setPosition(self, x, y, z)
end

function PlayerElement:setMoveable(moveable)
    Pad.setMoveable(moveable)
end

function PlayerElement:enterVehicle(vehicle, seat)
    self.swap = "local"

    if self.element == self.__localElement then
        PlayerElement.parent.enterVehicle(self, vehicle, seat)
    else
        swapCallback = function()
            PlayerElement.parent.enterVehicle(self, vehicle, seat)
        end
    end
end

function PlayerElement:exitVehicle()
    if self:isInVehicle() then
        self.exitingVehicle = true
        PlayerElement.parent.exitVehicle(self)
        return
    end
end

function PlayerElement:destroy()
    Logger.error('PLAYER', 'Player cannot be destroyed')
end

function PlayerElement:rebuild()
    for bodyPart, clothesData in pairs(self.clothes) do
        addPedClothes(self.element, clothesData[1], clothesData[2], bodyPart)
    end
end

function PlayerElement:giveWeapon(weapon, ammo)
    if self.element == self.__player then
        TaskHandler.sendTask(nil, TaskCode.GIVE_WEAPON, self.__player, weapon, ammo)
    end
end

function PlayerElement:removeWeapon(weapon)
    if self.element == self.__player then
        TaskHandler.sendTask(nil, TaskCode.REMOVE_WEAPON, self.__player, weapon)
    end
end

function PlayerElement:setAnalogControlState(control, state)
    setAnalogControlState(control, state)
end

function PlayerElement:setClothes(texture, model, bodyPart)
    self.clothes[bodyPart] = {texture, model}
end

function PlayerElement:swapToLocal(skipCamera)
    if self.element == self.__localElement then
        return
    end

    skipCamera = skipCamera or false

    if getCameraTarget() ~= self.__player then
        skipCamera = true
    end

    local matrix = getElementMatrix(self.__player)
    local velocityX, velocityY, velocityZ = getElementVelocity(self.__player)
    local model = getElementModel(self.__player)

    local worldX, worldY, worldZ = getWorldFromScreenPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 200)
    local cameraRot = getPedCameraRotation(self.__player)

    setElementAlpha(self.__localElement, 255)
    setElementCollisionsEnabled(self.__localElement, true)

    setElementMatrix(self.__localElement, matrix)
    setElementHealth(self.__localElement, getElementHealth(self.__player))
    setElementInterior(self.__localElement, getElementInterior(self.__player))
    setElementFrozen(self.__localElement, isElementFrozen(self.__player))

    for i=0, 12 do
        local weapon = getPedWeapon(self.__localElement, i)
        local playerWeapon = getPedWeapon(self.__player, i)
        local playerWeaponAmmo = getPedTotalAmmo(self.__player, i)

        if weapon then
            givePedWeapon(self.__localElement, weapon, 0)
        end

        if playerWeapon then
            givePedWeapon(self.__localElement, playerWeapon, playerWeaponAmmo)
        end
    end

    if not skipCamera then
        dxUpdateScreenSource(swapScreenSource)

        setCameraTarget(self.__localElement)
        setPedCameraRotation(self.__localElement, cameraRot)

        swapCount = 1

        setTimer(function()
            setCameraTarget(worldX, worldY, worldZ)
            swapCount = 2
        end, 0, 1)
    else
        if getCameraTarget() == self.__player then
            setCameraTarget(self.__localElement)
            setPedCameraRotation(self.__localElement, cameraRot)
        end

        swapCount = 0

        if swapCallback then
            swapCallback()
            swapCallback = false
        end
    end

    setElementPosition(self.__player, 0, 0, -50)

    setElementAlpha(self.__player, 0)
    setElementCollisionsEnabled(self.__player, false)

    setElementVelocity(self.__localElement, velocityX, velocityY, velocityZ)
    setElementModel(self.__localElement, model)

    for i=0, 17 do
        local clothesTexture, clothesModel = getPedClothes(self.__player, i)

        if clothesTexture then
            addPedClothes(self.__localElement, clothesTexture, clothesModel, i)
        else
            removePedClothes(self.__localElement, i)
        end
    end

    self.element = self.__localElement

    self.networkingActive = true

    TaskHandler.sendTask(function()
        self.networkingActive = false
    end, TaskCode.PLAYER_ADD_TO_VEHICLE)
end

function PlayerElement:swapToExternal(skipCamera)
    if self.element == self.__player then
        return
    end

    skipCamera = skipCamera or false

    if getCameraTarget() ~= self.__localElement then
        skipCamera = true
    end

    self.swap = "paused"
    self.networkingActive = true

    TaskHandler.sendTask(function()
        setTimer(function()
            self.networkingActive = false

            local matrix = getElementMatrix(self.__localElement)
            local velocityX, velocityY, velocityZ = getElementVelocity(self.__localElement)
            local model = getElementModel(self.__localElement)

            local worldX, worldY, worldZ = getWorldFromScreenPosition(SCREEN_WIDTH / 2, SCREEN_HEIGHT / 2, 200)
            local cameraRot = getPedCameraRotation(self.__localElement)

            removePedFromVehicle(self.__localElement)

            setElementAlpha(self.__player, 255)
            setElementCollisionsEnabled(self.__player, true)

            setElementMatrix(self.__player, matrix)
            setElementHealth(self.__player, getElementHealth(self.__localElement))
            setElementInterior(self.__player, getElementInterior(self.__localElement))
            setElementFrozen(self.__player, isElementFrozen(self.__localElement))

            if not skipCamera then
                dxUpdateScreenSource(swapScreenSource)

                setCameraTarget(self.__player)
                setPedCameraRotation(self.__player, cameraRot)

                swapCount = 1

                setTimer(function()
                    setCameraTarget(worldX, worldY, worldZ)
                    swapCount = 2
                end, 0, 1)
            else
                if type(getCameraTarget()) == "userdata" then
                    setCameraTarget(self.__player)
                    setPedCameraRotation(self.__player, cameraRot)
                end

                swapCount = 0

                if swapCallback then
                    swapCallback()
                    swapCallback = false
                end
            end

            setElementPosition(self.__localElement, 0, 0, -50)

            setElementAlpha(self.__localElement, 0)
            setElementCollisionsEnabled(self.__localElement, false)

            setElementVelocity(self.__player, velocityX, velocityY, velocityZ)
            setElementModel(self.__player, model)

            for i=0, 17 do
                local clothesTexture, clothesModel = getPedClothes(self.__localElement, i)

                if clothesTexture then
                    addPedClothes(self.__player, clothesTexture, clothesModel, i)
                else
                    removePedClothes(self.__player, i)
                end
            end

            self.element = self.__player
            self.swap = false
        end, 0, 1)
    end, TaskCode.PLAYER_REMOVE_FROM_VEHICLE)
end

function PlayerElement:isBusted()
    return false
end

function PlayerElement:isDead()
    return self:getHealth() <= 0
end

function PlayerElement:isPerformingWheelie()
    local vehicle = self:getOccupiedVehicle()

    if (not vehicle) then
        return false
    end

    return vehicle:isPerformingWheelie()
end

function PlayerElement:isPerformingStoppie()
    local vehicle = self:getOccupiedVehicle()

    if (not vehicle) then
        return false
    end

    return vehicle:isPerformingStoppie()
end

function PlayerElement:getAnalogControlState(control)
    if (isElement(self.element)) then
        return getAnalogControlState(control)
    end

    return self.analogControlStates[control] or 0
end

function PlayerElement:getWantedLevel()
    return getPlayerWantedLevel(self.element)
end

function PlayerElement.getLocalPlayer()
    return PlayerElement.localPlayer
end

function PlayerElement:getType()
    return 'player'
end

function PlayerElement:onPreFrame()
    PlayerElement.parent.onPreFrame(self)

    if self.swap == "local" then
        self:swapToLocal()
        self.swap = false
    elseif self.swap == "external" then
        self:swapToExternal()
        self.swap = false
    end

    if self.exitingVehicle and not self:isInVehicle() then
        self:swapToExternal()
        self.swap = false
        self.exitingVehicle = false
    end

    if self.element == self.__localElement then
        local cameraRot = getPedCameraRotation(self.__player)

        for _, control in ipairs(ANALOG_CONTROL_STATES) do
            local controlState = getControlState(control)

            setPedControlState(self.element, control, controlState)

            if controlState then
                local state = getAnalogControlState(control)
                setPedAnalogControlState(self.element, control, state)
            end
        end

        for _, control in ipairs(CONTROL_STATES) do
            local controlState = getControlState(control)

            if control == 'sub_mission' then
                local vehicle = self:getOccupiedVehicle()
                local vehicleType = vehicle and vehicle:getVehicleType() or false

                if vehicle and vehicle:inAir() and (vehicleType == 'heli' or vehicleType == 'plane') then
                    if controlState and getPedControlState(self.element, control) ~= controlState then
                        setVehicleLandingGearDown(vehicle.element, not getVehicleLandingGearDown(vehicle.element))
                    end
                end
            end

            setPedControlState(self.element, control, controlState)
        end

        local vehicle = self:getOccupiedVehicle()

        if not vehicle and getCameraTarget() ~= self.element and getCameraTarget() == self.__player then
            setCameraTarget(self.element)
        elseif vehicle and getCameraTarget() == self.__localElement and self.element == self.__localElement then
            setCameraTarget(vehicle.element)
        end

        setPedCameraRotation(self.element, cameraRot)

        local x, y, z = getElementPosition(self.element)

        setElementPosition(self.__player, x, y, z - 200)

        if not self.networkingActive and getPedOccupiedVehicle(self.__localElement) and not getPedOccupiedVehicle(self.__player) then
            self.networkingActive = true

            TaskHandler.sendTask(function()
                self.networkingActive = false
            end, TaskCode.PLAYER_ADD_TO_VEHICLE)
        end
    else
        local x, y, z = getElementPosition(self.element)

        setElementPosition(self.__localElement, x, y, z - 200)

        if not self.networkingActive and not getPedOccupiedVehicle(self.__localElement) and getPedOccupiedVehicle(self.__player) then
            self.networkingActive = true

            TaskHandler.sendTask(function()
                self.networkingActive = false
            end, TaskCode.PLAYER_REMOVE_FROM_VEHICLE)
        end
    end
end

function PlayerElement:onFrame()
    PlayerElement.parent.onFrame(self)

    if swapCount > 0 then
        dxDrawImage(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT, swapScreenSource)

        if swapCount == 2 then
            if swapCallback then
                swapCallback()
                swapCallback = false
            end

            swapCount = 0
        end
    end
end

Core.mergeInto(PlayerElement, ActorElement)

-----------------------------------
-- * Events
-----------------------------------

bindKey('f', 'up', function()
    local player = PlayerElement.getLocalPlayer()

    if player.swap == 'paused' then
        return
    end

    if player:isInVehicle() then
        player:exitVehicle()
        return
    end

    local closestVehicle = false
    local closestDistance = -1

    for _, vehicle in pairs(VehicleElement:all()) do
        local distance = player:getDistanceToElement(vehicle)

        if not closestVehicle or distance < closestDistance then
            closestVehicle = vehicle
            closestDistance = distance
        end
    end

    if closestVehicle and closestDistance < 20 then
        player:enterVehicle(closestVehicle, 0)
    end
end)