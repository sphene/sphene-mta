-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local actors = {}
local specialActors = {}

local specialActorConversionTable = {
    TRUTH = "1",
    MACCER = "2",
    BARBARA = "190",
    HELENA = "191",
    MICHELLE = "192",
    KATIE = "193",
    MILLIE = "194",
    DENISE = "195",
    TENPEN = "265",
    PULASKI = "266",
    HERN = "267",
    DWAYNE = "268",
    SMOKE = "269",
    SWEET = "270",
    RYDER = "271",
    FORELLI = "272",
    ROSE = "290",
    PAUL = "291",
    CESAR = "292",
    OGLOC = "293",
    WUZIMU = "294",
    TORINO = "295",
    JIZZY = "296",
    MADDOGG = "297",
    CAT = "298",
    CLAUDE = "299",
    RYDER2 = "300",
    RYDER3 = "301",
    EMMET = "302",
    ANDRE = "303",
    KENDL = "304",
    JETHRO = "305",
    ZERO = "306",
    TBONE = "307",
    SINDACO = "308",
    JANITOR = "309",
    BBTHIN = "310",
    SMOKEV = "311",
    PSYCHO = "312",
}

-----------------------------------
-- * Variables
-----------------------------------

ActorElement = {
    elementTable = actors
}

ActorElement.__index = ActorElement

-----------------------------------
-- * Functions
-----------------------------------

function ActorElement:create(model, existingElement, parentMT)
    local mt

    if (existingElement and parentMT) then
        mt = parentMT
    else
        mt = setmetatable({}, ActorElement)
    end

    ActorElement.parent.create(mt)

    if (model >= 290) then
        local originalModel = model
        model = specialActors[tostring((model - 290) + 1)] or -1

        if (model == -1) then
            Script.panic("Invalid special ped model "..originalModel..".")
        end
    end

    mt.model = model
    mt.spawned = false
    mt.moveable = true
    mt.playerElement = false

    mt.vehicle = false
    mt.vehicleSeat = 0
    mt.wearingJetpack = false
    mt.canBeKnockedOffBikeFlag = true

    mt.enteringVehicle = false
    mt.enteringVehicleSeat = -1

    mt.networkSyncActive = false
    mt.updatedByEvent = false

    mt.syncData = {}
    mt.syncScheduled = false

    mt.pedType = 0
    mt.activeInteriorName = 'UNKNOWN'

    mt.activeEnex = false
    mt.teleportedToEnex = false

    mt.updatePositionAfterVehicleRemoval = false

    mt.activeSequence = false

    mt.scheduledAdjustment = false
    mt.avoidDuplicateAdjustment = false

    mt.taskSlots = {
        {
            TASK_PRIORITY_PHYSICAL_RESPONSE = false,
            TASK_PRIORITY_EVENT_RESPONSE_TEMP = false,
            TASK_PRIORITY_EVENT_RESPONSE_NONTEMP = false,
            TASK_PRIORITY_PRIMARY = false,
            TASK_PRIORITY_DEFAULT = false,
        },
        {
            TASK_SECONDARY_ATTACK = false,
            TASK_SECONDARY_DUCK = false,
            TASK_SECONDARY_SAY = false,
            TASK_SECONDARY_FACIAL_COMPLEX = false,
            TASK_SECONDARY_PARTIAL_ANIM = false,
            TASK_SECONDARY_IK = false,
        }
    }

    mt.controlStates = {}
    mt.analogControlStates = {}

    mt.trafficPath = false
    mt.animation = {}

    mt.weapons = {}
    mt.weaponSlot = 0
    mt.group = false
    mt.activeTasks = {}

    if (isElement(existingElement)) then
        mt.element = existingElement
        mt.playerElement = true
    end

    return mt
end

function ActorElement:spawn(x, y, z, rotX, rotY, rotZ)
    self.element = createPed(self.model, x, y, z, rotZ)

    ElementManager.addElementHandle(self.element, self)

    setElementDimension(self.element, getElementData(getElementParent(localPlayer), 'dimension'))

    self:setPosition(x or 0, y or 0, z or 0)
    self:setRotation(rotX or 0, rotY or 0, rotZ or 0)
    self:setInterior(getCameraInterior())

    self.spawned = true
end

function ActorElement:destroy(withFade)
    local element = self.element

    ActorElement.parent.destroy(self)

    if (self.vehicle) then
        self.vehicle:removeActorFromSeat(self)
    end

    if (isElement(element)) then
        self.element = false
    end
end

function ActorElement:adjustPosition()
    if self.avoidDuplicateAdjustment then
        return
    end

    local distanceCenter = getElementDistanceFromCentreOfMassToBaseOfModel(self.element)

    if not distanceCenter or distanceCenter == 0 then
        self.scheduledAdjustment = true
        return
    end

    self.avoidDuplicateAdjustment = true
    self.scheduledAdjustment = false

    if distanceCenter then
        local x, y, z = self:getPosition()

        enginePreloadWorldArea(x, y, z, 'collisions')

        local lowestPoint = getGroundPosition(x, y, z + distanceCenter)

        if (not lowestPoint or lowestPoint == 0) then
            lowestPoint = getGroundPosition(x, y, 1000)
        end

        if (lowestPoint and lowestPoint ~= 0) then
            if math.abs(z - lowestPoint) < distanceCenter then
                Logger.debug(string.upper(self:getType()), 'Adjusted position for element with model {} and ID {}', self:getModel(), self.id)
                self:setPosition(x, y, z + distanceCenter)
                self:setVelocity(0, 0, 0)
                self:setAngularVelocity(0, 0, 0)
            elseif z < lowestPoint then
                Logger.debug(string.upper(self:getType()), 'Element with model {} and ID {} is below ground, adjusting position', self:getModel(), self.id)
                self:setPosition(x, y, lowestPoint + distanceCenter)
                self:setVelocity(0, 0, 0)
                self:setAngularVelocity(0, 0, 0)
            else
                Logger.debug(string.upper(self:getType()), 'No adjustment needed for element with model {} and ID {}', self:getModel(), self.id)
                Logger.debug(string.upper(self:getType()), 'Z: {}, lowest point: {}, distance to center: {}', z, lowestPoint, distanceCenter)
            end
        end
    else
        Logger.debug(string.upper(self:getType()), 'No distance center for element with model {} and ID {}, cannot adjust position', self:getModel(), self.id)
    end

    self.avoidDuplicateAdjustment = false
end

function ActorElement:setMatrix(matrix)
    ActorElement.parent.setMatrix(self, matrix)
    self:adjustPosition()
end

function ActorElement:setMoveable(moveable)
    setElementFrozen(self.element, not moveable)
end

function ActorElement:setLookAt(x, y, z)
    setPedLookAt(self.element, x, y, z)
end

function ActorElement:clearTasks()
    self.taskSlots = {
        {
            TASK_PRIORITY_PHYSICAL_RESPONSE = false,
            TASK_PRIORITY_EVENT_RESPONSE_TEMP = false,
            TASK_PRIORITY_EVENT_RESPONSE_NONTEMP = false,
            TASK_PRIORITY_PRIMARY = false,
            TASK_PRIORITY_DEFAULT = false,
        },
        {
            TASK_SECONDARY_ATTACK = false,
            TASK_SECONDARY_DUCK = false,
            TASK_SECONDARY_SAY = false,
            TASK_SECONDARY_FACIAL_COMPLEX = false,
            TASK_SECONDARY_PARTIAL_ANIM = false,
            TASK_SECONDARY_IK = false,
        }
    }

    self.trafficPath = false
    self.wearingJetpack = false

    self:setAnimation()

    self:setControlState("jump", false)
    self:setControlState("fire", false)
    self:setControlState("walk", false)
    self:setControlState("sprint", false)
    self:setControlState("forwards", false)
    self:setControlState("accelerate", false)
    self:setControlState("brake_reverse", false)

    self:setAnalogControlState("accelerate", 0)
    self:setAnalogControlState("vehicle_right", 0)
    self:setAnalogControlState("vehicle_left", 0)
    self:setAnalogControlState("brake_reverse", 0)

    if (not self:isInVehicle()) then
        self.enteringVehicle = false
        self.enteringVehicleSeat = -1
    end
end

function ActorElement:addScriptedTask(task, priority, slot)
    Logger.info(string.upper(self:getType()), 'Adding scripted task {} to slot {} with priority {} and ID {}',
        task:getName(), slot, priority, self.id)

    task:setScripted(true)
    self.taskSlots[priority][slot] = task
end

function ActorElement:removeTask(priority, slot)
    Logger.info(string.upper(self:getType()), 'Removing task from slot {} with priority {} for ID {}',
        slot, priority, self.id)

    self.taskSlots[priority][slot] = false
end

function ActorElement:registerTask(id, task)
    self.activeTasks[id] = task
end

function ActorElement:unregisterTask(id)
    self.activeTasks[id] = nil
end

function ActorElement:setActiveSequence(sequence)
    self.activeSequence = Sequence.copyForActor(sequence, self)
end

function ActorElement:markTaskFinished(task)
    Logger.info(string.upper(self:getType()), 'Marking task {} as finished for ID {}', task:getName(), self.id)

    for _, slots in pairs(self.taskSlots) do
        for slot, checkTask in pairs(slots) do
            if (checkTask == task) then
                slots[slot] = false
            end
        end
    end
end

function ActorElement:setPosition(x, y, z, removeFromVehicle)
    if removeFromVehicle then
        self:removeFromVehicle()
    end

    ActorElement.parent.setPosition(self, x, y, z)
    self:adjustPosition()
end

function ActorElement:setAnimation(block, anim, time, looped,
    locked, interruptable, freezeLastFrame, blendTime, retainPedState)

    setPedAnimation(self.element, block, anim, time, looped,
            locked, interruptable, freezeLastFrame, blendTime, retainPedState)

    if block == nil then
        Logger.info(string.upper(self:getType()), 'Clearing animation for ped with ID {}', self.id)
    else
        Logger.info(string.upper(self:getType()), 'Setting animation {}.{} for ped with ID {}', block, anim, self.id)
    end

    self.animation = {
        block = block,
        anim = anim,
        time = time,
        looped = looped,
        locked = locked,
        interruptable = interruptable,
        freezeLastFrame = freezeLastFrame,
        blendTime = blendTime,
        retainPedState = retainPedState
    }
end

function ActorElement:enterVehicle(vehicle, seat)
    if not self.element or self:getOccupiedVehicle() then
        return false
    end

    self.enteringVehicle = vehicle
    self.enteringVehicleSeat = seat
    self.updatedByEvent = true

    setPedEnterVehicle(self.element, vehicle.element, seat ~= 0)

    --Logger.info(string.upper(self:getType()), 'Ped with ID {} is entering vehicle with ID {} in seat {}', self.id, vehicle.id, seat)
end

function ActorElement:exitVehicle()
    if not self.element or not self:getOccupiedVehicle() then
        return false
    end

    self.exitingVehicleSeat = self.vehicleSeat
    self.updatedByEvent = true

    setPedExitVehicle(self.element)

    --Logger.info(string.upper(self:getType()), 'Ped with ID {} is exiting vehicle with ID {} from seat {}', self.id, self.vehicle.id, self.vehicleSeat)
end

function ActorElement:setControlState(control, state)
    setPedControlState(self.element, control, state)
end

function ActorElement:setAnalogControlState(control, state)
    setPedAnalogControlState(self.element, control, state)
end

function ActorElement:giveWeapon(weapon, ammo)
    givePedWeapon(self.element, weapon, ammo)
end

function ActorElement:setWeapon(weapon)
    local slot = getSlotFromWeapon(weapon)

    if (slot ~= false) then
        self:setWeaponSlot(slot)
    end
end

function ActorElement:setWeaponSlot(slot)
    setPedWeaponSlot(self.element, slot)
end

function ActorElement:removeWeapon(weapon)
    local slot = getSlotFromWeapon(weapon)

    if slot ~= false and self.weapons[slot] and self.weapons[slot].weapon == weapon then
        self.weapons[slot] = {}
    end
end

function ActorElement:setCanBeKnockedOffBike(canBeKnockedOffBikeFlag)
    setPedCanBeKnockedOffBike(self.element, canBeKnockedOffBikeFlag)
end

function ActorElement:setGroup(group)
    self.group = group
    return true
end

function ActorElement:setPedType(pedType)
    self.pedType = pedType
end

function ActorElement:setActiveInteriorName(name)
    self.activeInteriorName = string.upper(name)
end

function ActorElement:setActiveEnex(enex)
    self.activeEnex = enex
end

function ActorElement:setTeleportedToEnex(enex)
    self.teleportedToEnex = enex
end

function ActorElement:removeAllWeapons()
    for i=0, 12 do
        local weapon = getPedWeapon(self.element, i)

        if weapon then
            givePedWeapon(self.element, weapon, 0)
        end
    end
end

function ActorElement:warpIntoVehicle(vehicle, seat)
    if (self.vehicle) then
        self:removeFromVehicle()
    end

    self.vehicle = vehicle
    self.vehicleSeat = seat
    self.enteringVehicle = false
    self.enteringVehicleSeat = -1
    self.updatedByEvent = true

    self.scheduledAdjustment = false

    warpPedIntoVehicle(self.element, vehicle.element, seat)

    vehicle:assignActorToSeat(self, seat)
    vehicle:setEngineState(true)

    Logger.debug(string.upper(self:getType()), 'Warping ped with ID {} into vehicle with ID {} in seat {}', self.id, vehicle.id, seat)
end

function ActorElement:removeFromVehicle()
    if (not self.vehicle) then
        return false
    end

    Logger.debug(string.upper(self:getType()), 'Removing ped with ID {} from vehicle with ID {}', self.id, self.vehicle.id)

    removePedFromVehicle(self.element)
    self.vehicle:removeActorFromSeat(self)

    self.vehicle = false
    self.vehicleSeat = 0
    self.enteringVehicle = false
    self.enteringVehicleSeat = -1
    self.updatedByEvent = true
end

function ActorElement:giveJetpack()
    self.wearingJetpack = true
end

function ActorElement:isInAir()
    return not isPedOnGround(self.element)
end

function ActorElement:removeJetpack()
    self.wearingJetpack = false
end

function ActorElement:isMoveable()
    return self.moveable
end

function ActorElement:isPlayer()
    return self:getType() == 'player'
end

function ActorElement:hasSpawned()
    return self.spawned
end

function ActorElement:getAmmoForWeapon(weapon)
    local slot = getSlotFromWeapon(weapon)

    if slot then
        return getPedAmmoInClip(self.element, slot)
    end

    return 0
end

function ActorElement:isInVehicle()
    return self:getOccupiedVehicle() ~= false
end

function ActorElement:isDriving()
    return self:isInVehicle() and
        self:getOccupiedVehicle():getDriver() == self
end

function ActorElement:isLeavingCar()
    return self.exitingVehicle ~= false
end

function ActorElement:canBeKnockedOffBike()
    return canPedBeKnockedOffBike(self.element)
end

function ActorElement:hasWeapon(weaponId)
    for i=0, 12 do
        if self:getWeapon(i) == weaponId then
            return true
        end
    end

    return false
end

function ActorElement:isWearingJetpack()
    return self.wearingJetpack
end

function ActorElement:getAnimation()
    return getPedAnimation(self.element)
end

function ActorElement:getActiveEnex()
    return self.activeEnex
end

function ActorElement:getTeleportedToEnex()
    return self.teleportedToEnex
end

function ActorElement:isDead()
    return self:getHealth() <= 0
end

function ActorElement:getControlState(control)
    return getPedControlState(self.element, control)
end

function ActorElement:getAnalogControlState(control)
    return getPedAnalogControlState(self.element, control)
end

function ActorElement:getWeapon(slot)
    return getPedWeapon(self.element, slot)
end

function ActorElement:getWeaponSlot()
    return getPedWeaponSlot(self.element)
end

function ActorElement:getTasks(priority)
    return self.taskSlots[priority]
end

function ActorElement:getOccupiedVehicle()
    local vehicle = getPedOccupiedVehicle(self.element)

    if vehicle then
        return ElementManager.getElementByHandle(vehicle) or false
    end

    return false
end

function ActorElement:getDistanceFromVehicleEntryPoint(vehicle, entryPoint)
    local entryPoints = getVehicleEntryPoints(vehicle.element or vehicle)

    if (entryPoints) then
        entryPoint = entryPoints[entryPoint + 1]

        return getDistanceBetweenPoints3D(entryPoint[1], entryPoint[2], entryPoint[3], self:getPosition())
    end

    return 0
end

function ActorElement:getVehicleBeingEntered()
    if (isElement(self.element)) then
        local task1, _, _, _ = getPedTask(self.element, 'primary', 3)

        -- If task1 lowercase starts with task_complex_enter
        if (task1 and task1:sub(1, 19):lower() == 'task_complex_enter') then
            return self.enteringVehicle
        end

        return false
    end

    return self.enteringVehicle
end

function ActorElement:getActiveInteriorName()
    return self.activeInteriorName
end

function ActorElement:getSequenceProgress()
    if self.activeSequence then
        return self.activeSequence:getProgress()
    end

    return 0
end

function ActorElement:isStopped()
    local velX, velY, velZ = self:getVelocity()

    if (velX == 0 and velY == 0 and velZ == 0) then
        return true
    end

    return false
end

function ActorElement:isPerformingAnimation(animation)
    if isElement(self.element) then
        local _, anim = getPedAnimation(self.element)

        if anim == animation then
            return true
        end
    end

    return self.animation.anim == animation
end

function ActorElement:isInGroup()
    -- @TODO: Implement
    return true
end

function ActorElement.loadSpecialActor(actorName, slot)
    if slot < 1 or slot > 10 then
        return false
    end

    specialActors[tostring(slot)] = (specialActorConversionTable[actorName:upper()])
    return true
end

function ActorElement.unloadSpecialActor(slot)
    if slot < 1 or slot > 10 then
        return false
    end

    specialActors[tostring(slot)] = nil
    return true
end

function ActorElement.isSpecialActorSlotUsed(slot)
    return specialActors[tostring(slot)] ~= nil
end

function ActorElement:onPreFrame()
    ActorElement.parent.onPreFrame(self)

    if self.scheduledAdjustment then
        self:adjustPosition()
    end

    if self.activeSequence then
        self.activeSequence:process()

        if self.activeSequence.finished then
            self.activeSequence = false
        end
    end

    for _, taskSlot in pairs(self.taskSlots) do
        for _, task in pairs(taskSlot) do
            if (task) then
                task:process()
            end
        end
    end
end

function ActorElement:getTaskStatus(taskId)
    if self.activeTasks[taskId] then
        return self.activeTasks[taskId]:getStatus()
    end

    if taskId == 2066 then
        local block = getPedAnimation(self.element)

        if block then
            return Task.PERFORMING
        end

        return Task.FINISHED
    end

    return Task.FINISHED
end

function ActorElement:getType()
    return 'ped'
end

function ActorElement.getActorInSphere(x, y, z, radius)
    for _, actor in pairs(actors) do
        if (actor:isInSphere(x, y, z, radius)) then
            return actor
        end
    end

    return false
end

Core.mergeInto(ActorElement, ElementWrapper)

-----------------------------------
-- * Events
-----------------------------------
