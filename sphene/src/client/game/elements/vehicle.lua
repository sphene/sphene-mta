-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local vehicles = {}
local vehicleColorData = {}
local vehicleModelToId = {}
local vehicleIdToType = {}
local vehicleIdToClass = {}
local vehicleIdToPalettes = {}

local vehicleClassToIds = {}

-----------------------------------
-- * Variables
-----------------------------------

VehicleElement = {
    elementTable = vehicles
}

VehicleElement.__index = VehicleElement

-----------------------------------
-- * Functions
-----------------------------------

function VehicleElement:create(model)
    local mt = setmetatable({}, VehicleElement)

    VehicleElement.parent.create(mt)

    mt.model = model
    mt.spawned = false
    mt.color = {0, 0, 0, 0, 0, 0}
    mt.damageProof = false
    mt.assignedPath = false
    mt.assignedPathSpeed = 1
    mt.colorChanged = false
    mt.helicopterRotorSpeed = 0
    mt.paintjob = -1

    mt.trailerOf = false
    mt.trailer = false

    mt.seats = {}
    mt.doorRatios = {
        0, 0, 0, 0
    }

    mt.scheduledAdjustment = false
    mt.avoidDuplicateAdjustment = false

    mt.engineState = false

    for i=0, 3 do
        mt.seats[i] = false
    end

    Logger.debug('VEHICLE', 'Creating vehicle with model {} and ID {}', model, mt.id)

    return mt
end

function VehicleElement:spawn(x, y, z, rotX, rotY, rotZ)
    Logger.debug('VEHICLE', 'Spawning vehicle with model {} and ID {} at {} {} {} with rotation {} {} {}',
        self.model, self.id, x or 0, y or 0, z or 0, rotX or 0, rotY or 0, rotZ or 0)

    self.element = createVehicle(self.model, x or 0, y or 0, z or 0, rotX or 0, rotY or 0, rotZ or 0)

    setVehicleDamageProof(self.element, false)

    setElementDimension(self.element, getElementData(getElementParent(localPlayer), 'dimension'))

    self:setPosition(x or 0, y or 0, z or 0)
    self:setRotation(rotX or 0, rotY or 0, rotZ or 0)
    self:setInterior(getCameraInterior())

    ElementManager.addElementHandle(self.element, self)

    if not self.element then
        Logger.error('VEHICLE', 'Failed to create vehicle with model {} and ID {}', self.model, self.id)
        Script.panic('Failed to create vehicle element with model '..tostring(self.model)..' and ID '..tostring(self.id))
        return
    end

    self.spawned = true
end

function VehicleElement:destroy()
    self.destroyed = true

    Logger.debug('VEHICLE', 'Destroying vehicle with ID {}', self.id)

    if (self.trailerOf ~= false) then
        self:detachTrailer()
    end

    if (self.trailer ~= false) then
        self.trailer:detachTrailer()
    end

    for _, actor in pairs(self.seats) do
        if (actor ~= false) then
            actor:removeFromVehicle()
        end
    end

    VehicleElement.parent.destroy(self)
end

function VehicleElement:adjustPosition()
    if (not self.assignedPath) then
        if (self.element and self.trailerOf and self.trailerOf.element) then
            attachTrailerToVehicle(self.trailerOf.element, self.element)
        elseif (self.element and self.trailer and self.trailer.element) then
            attachTrailerToVehicle(self.element, self.trailer.element)
        end

        VehicleElement.parent.adjustPosition(self)
    end
end

function VehicleElement:setMatrix(matrix)
    VehicleElement.parent.setMatrix(self, matrix)

    if (not self.assignedPath) then
        self:adjustPosition()
    end
end

function VehicleElement:setPosition(x, y, z)
    VehicleElement.parent.setPosition(self, x, y, z)

    if (not self.assignedPath) then
        self:adjustPosition()
    end
end

function VehicleElement:adjustPosition()
    if self.avoidDuplicateAdjustment then
        return
    end

    local x, y, z = self:getPosition()
    local distanceCenter = getElementDistanceFromCentreOfMassToBaseOfModel(self.element)

    if not distanceCenter or distanceCenter == 0 then
        self.scheduledAdjustment = true
        return
    end

    enginePreloadWorldArea(x, y, z, 'collisions')

    local _, _, frontWheelZ = getVehicleComponentPosition(self.element, 'wheel_lf_dummy')
    local _, _, rearWheelZ = getVehicleComponentPosition(self.element, 'wheel_lb_dummy')

    local offsetZ

    if frontWheelZ or rearWheelZ then
        local wheelZ = math.min(frontWheelZ or 0, rearWheelZ or 0)
        local axleSizes = getVehicleModelWheelSize(getElementModel(self.element), 'all_wheels')

        if axleSizes then
            local wheelSize = math.max(axleSizes.front_axle, axleSizes.rear_axle)

            offsetZ = math.abs(z - (z + (wheelZ - (wheelSize / 2))))
        else
            offsetZ = distanceCenter
        end
    else
        offsetZ = distanceCenter
    end

    local groundZ = getGroundPosition(x, y, z + distanceCenter + 1)

    if not groundZ then
        groundZ = getGroundPosition(x, y, 100)
    end

    if groundZ then
        if (z - offsetZ) < groundZ or z < groundZ then
            Logger.debug(string.upper(self:getType()), 'Element with model {} and ID {} is below ground, adjusting position', self:getModel(), self.id)

            self.avoidDuplicateAdjustment = true
            self:setPosition(x, y, groundZ + offsetZ)
            self:setVelocity(0, 0, 0)
            self:setAngularVelocity(0, 0, 0)
            self.avoidDuplicateAdjustment = false
        else
            Logger.debug(string.upper(self:getType()), 'No adjustment needed for element with model {} and ID {}', self:getModel(), self.id)
            Logger.debug(string.upper(self:getType()), 'Z: {}, lowest point: {}, groundZ: {}, offsetZ: {}', z, lowestPoint, groundZ, offsetZ)
        end
    end

    self.scheduledAdjustment = false
end

function VehicleElement:addComponent()

end

function VehicleElement:addUpgrade()

end

function VehicleElement:attachTrailer(attachToVehicle)
    if (self.trailerOf ~= false) then
        return false
    end

    Logger.debug('VEHICLE', 'Attaching trailer with ID {} to vehicle with ID {}', self.id, attachToVehicle.id)

    if (attachToVehicle.element and self.element) then
        attachTrailerToVehicle(attachToVehicle.element, self.element)
    end

    self.trailerOf = attachToVehicle
    attachToVehicle.trailer = self

    return true
end

function VehicleElement:detachTrailer()
    if (self.trailerOf == false) then
        return false
    end

    Logger.debug('VEHICLE', 'Detaching trailer with ID {} from vehicle with ID {}', self.id, self.trailerOf.id)

    if (self.trailerOf.element) then
        detachTrailerFromVehicle(self.element)
    end

    self.trailerOf.trailer = false
    self.trailerOf = false

    return true
end

function VehicleElement:blow(disableDamage)
    blowVehicle(self.element, not disableDamage)
end

function VehicleElement:setColor(r1, g1, b1, r2, g2, b2)
    Logger.debug('VEHICLE', 'Setting color of vehicle with ID {} to {} {} {} {} {} {}', self.id, r1, g1, b1, r2, g2, b2)

    self.colorChanged = true

    setVehicleColor(self.element, r1, g1, b1, r2, g2, b2)
end

function VehicleElement:setDamageProof(damageProof)
    setVehicleDamageProof(self.element, damageProof)
end

function VehicleElement:setPaintjob(paintjob)
    setVehiclePaintjob(self.element, paintjob)
end

function VehicleElement:setEngineState(state)
    setVehicleEngineState(self.element, state)
end

function VehicleElement:assignPath(pathId)
    if (not Carrec.isAvailable(pathId)) then
        return false
    end

    Logger.debug('VEHICLE', 'Assigning path {} to vehicle with ID {}', pathId, self.id)

    self.assignedPath = {
        pathId, 1, getTickCount(), false
    }

    return true
end

function VehicleElement:setAssignedPathSpeed(speed)
    self.assignedPathSpeed = speed
end

function VehicleElement:releaseFromPath()
    self.assignedPath = false
end

function VehicleElement:assignActorToSeat(actor, seat)
    if (self.seats[seat] == false) then
        Logger.debug('VEHICLE', 'Assigning actor {} to seat {}', actor:getId(), seat)
        self.seats[seat] = actor
        return true
    end

    return false
end

function VehicleElement:removeActorFromSeat(actor)
    for i=0, 3 do
        if (self.seats[i] == actor) then
            Logger.debug('VEHICLE', 'Removing actor {} from seat {}', actor:getId(), i)
            self.seats[i] = false
            return true
        end
    end

    return false
end

function VehicleElement:setHelicopterRotorSpeed(speed)
    setHelicopterRotorSpeed(self.element, speed)
end

function VehicleElement:setDoorOpenRatio(door, ratio, time)
    setVehicleDoorOpenRatio(self.element, door, ratio, time)
end

function VehicleElement:setAirResistance(multiplier)
    setVehicleHandling(self.element, "dragCoeff", multiplier)
end

function VehicleElement:getColor()
    return unpack(self.color)
end

function VehicleElement:getDriver()
    if getVehicleOccupants(self.element)[0] == nil then
        return false
    end

    return ElementManager.getElementByHandle(getVehicleOccupants(self.element)[0]) or false
end

function VehicleElement:getOccupants()
    local occupants = getVehicleOccupants(self.element) or {}

    for i=0, 3 do
        if (occupants[i] == nil) then
            occupants[i] = false
        else
            occupants[i] = ElementManager.getElementByHandle(occupants[i]) or false
        end
    end

    return occupants
end

function VehicleElement:getOccupantInSeat(seat)
    local occupants = getVehicleOccupants(self.element) or {}

    if occupants[seat] == nil then
        return false
    end

    return ElementManager.getElementByHandle(occupants[seat]) or false
end

VehicleElement.getOccupant = VehicleElement.getOccupantInSeat

function VehicleElement:getPassengerCount()
    local counter = 0

    for seat, _ in pairs(self:getOccupants()) do
        if (seat ~= 0) then
            counter = counter + 1
        end
    end

    return counter
end

function VehicleElement:getMaxPassengers()
    return getVehicleMaxPassengers(self.model)
end

function VehicleElement:getHeliRotorSpeed()
    return getHelicopterRotorSpeed(self.element)
end

function VehicleElement:getDoorOpenRatio(door)
    return getVehicleDoorOpenRatio(self.element, door)
end

function VehicleElement:getPaintjob()
    return getVehiclePaintjob(self.element)
end

function VehicleElement:isDamageProof()
    return isVehicleDamageProof(self.element)
end

function VehicleElement:isBlown()
    return self.destroyed or isVehicleBlown(self.element) or self:getHealth() <= 0
end

function VehicleElement:isStopped()
    local velX, velY, velZ = self:getVelocity()

    if (velX == 0 and velY == 0 and velZ == 0) then
        return true
    end

    return false
end

function VehicleElement:inAir()
    if (isVehicleWheelOnGround(self.element, "front_left") or
        isVehicleWheelOnGround(self.element, "front_right") or
        isVehicleWheelOnGround(self.element, "rear_left") or
        isVehicleWheelOnGround(self.element, "rear_right")) then
        return false
    end

    return true
end

function VehicleElement:isFlipped()
    local rx, ry = self:getRotation()

    if (rx > 90 and rx < 270) or (ry > 90 and ry < 270) then
        return true
    end

    return false
end

function VehicleElement:areWheelsTouchingGround()
    if (isVehicleWheelOnGround(self.element, "front_left") and
        isVehicleWheelOnGround(self.element, "front_right") and
        isVehicleWheelOnGround(self.element, "rear_left") and
        isVehicleWheelOnGround(self.element, "rear_right")) then
        return true
    end

    return false
end

function VehicleElement:isSeatTaken(seat)
    return self.seats[seat] ~= false
end

function VehicleElement:isPerformingWheelie()
    if VehicleElement.getTypeFromModel(self:getModel()) == 'bike' then
        return isVehicleOnGround(self.element) and isVehicleWheelOnGround(self.element, "rear_left") and isVehicleWheelOnGround(self.element, "rear_right")
    end

    return false
end

function VehicleElement:isPerformingStoppie()
    if VehicleElement.getTypeFromModel(self:getModel()) == 'bike' then
        return isVehicleOnGround(self.element) and isVehicleWheelOnGround(self.element, "front_left") and isVehicleWheelOnGround(self.element, "front_right")
    end

    return false
end

function VehicleElement:getAssignedPath()
    if (self.assignedPath == false) then
        return false
    end

    return self.assignedPath[1]
end

function VehicleElement:getEngineState()
    return getVehicleEngineState(self.element)
end

function VehicleElement:hasSpawned()
    return self.spawned
end

function VehicleElement:onPreFrame()
    VehicleElement.parent.onPreFrame(self)

    if self.scheduledAdjustment then
        self:adjustPosition()
    end

    local assignedPath = self.assignedPath

    if (assignedPath ~= false) then
        local pathId = assignedPath[1]
        local carrecData = Carrec.get(pathId)

        if (carrecData ~= nil) then
            local currentNode = assignedPath[2]

            if (currentNode > #carrecData) then
                currentNode = #carrecData
            end

            local assignedPathStartTick = assignedPath[3]

            for i=currentNode, #carrecData do
                local nodeData = carrecData[i]
                if nodeData.time > (getTickCount() - assignedPathStartTick) then
                    break
                end

                assignedPath[2] = i

                local velX, velY, velZ = nodeData.velX, nodeData.velY, nodeData.velZ
                local matrix = self:getMatrix()
                local right = Vector3(nodeData.rightX * 0.0078740157, nodeData.rightY * 0.0078740157,  nodeData.rightZ * 0.0078740157)
                local forward = Vector3(nodeData.topX * 0.0078740157, nodeData.topY * 0.0078740157, nodeData.topZ * 0.0078740157)
                local up = right:cross(forward)
                local gasPaddlePower = nodeData.gasPaddlePower
                local brakePaddlePower = nodeData.brakePaddlePower
                local steeringAngle = nodeData.steeringAngle
                local handbrakeUsed = nodeData.handbrakeUsed

                matrix:setPosition(nodeData.posX, nodeData.posY, nodeData.posZ)

                if (carrecData[i + 1] ~= nil) then
                    if (
                        nodeData.posX ~= carrecData[i + 1].posX or
                        nodeData.posY ~= carrecData[i + 1].posY or
                        nodeData.posZ ~= carrecData[i + 1].posZ
                    ) then
                        local correctedTick = (getTickCount() - assignedPathStartTick)
                        local progress = 1 / ((carrecData[i + 1].time - nodeData.time) / (correctedTick - nodeData.time))

                        local nextRight = Vector3(carrecData[i + 1].rightX * 0.0078740157,
                            carrecData[i + 1].rightY * 0.0078740157,  carrecData[i + 1].rightZ * 0.0078740157)
                        local nextForward = Vector3(carrecData[i + 1].topX * 0.0078740157,
                            carrecData[i + 1].topY * 0.0078740157, carrecData[i + 1].topZ * 0.0078740157)
                        local nextUp = nextRight:cross(nextForward)

                        right = right + ((nextRight - right) * progress)
                        forward = forward + ((nextForward - forward) * progress)
                        up = up + ((nextUp - up) * progress)
                        gasPaddlePower = gasPaddlePower + ((carrecData[i + 1].gasPaddlePower - gasPaddlePower) * progress)
                        brakePaddlePower = brakePaddlePower + ((carrecData[i + 1].brakePaddlePower - brakePaddlePower) * progress)
                        steeringAngle = steeringAngle + ((carrecData[i + 1].steeringAngle - steeringAngle) * progress)

                        velX = velX + ((carrecData[i + 1].velX - velX) * progress)
                        velY = velY + ((carrecData[i + 1].velY - velY) * progress)
                        velZ = velZ + ((carrecData[i + 1].velZ - velZ) * progress)

                        matrix:setPosition(nodeData.posX + ((carrecData[i + 1].posX - nodeData.posX) * progress)
                        , nodeData.posY + ((carrecData[i + 1].posY - nodeData.posY) * progress)
                        , nodeData.posZ + ((carrecData[i + 1].posZ - nodeData.posZ) * progress))
                    end
                end

                local driver = self:getDriver()

                if (driver ~= false) then
                    driver:setAnalogControlState("accelerate", gasPaddlePower)
                    driver:setAnalogControlState("brake_reverse", brakePaddlePower)
                    driver:setAnalogControlState("vehicle_right", (1 / (45 / steeringAngle)))
                    driver:setControlState("handbrake", (handbrakeUsed == 1))
                end

                matrix:setRight(right)
                matrix:setUp(up)
                matrix:setForward(forward)

                self:setMatrix(matrix)
                self:setVelocity(velX, velY, velZ)

                if (i == #carrecData) then
                    self:setCollisionsEnabled(true)
                    self:setVelocity(0, 0, 0)
                    self:setAngularVelocity(0, 0, 0)

                    self.assignedPath = false

                    driver = self:getDriver()

                    if (driver ~= false) then
                        driver:setAnalogControlState("accelerate", 0)
                        driver:setAnalogControlState("brake_reverse", 0)
                        driver:setAnalogControlState("vehicle_left", 0)
                        driver:setAnalogControlState("vehicle_right", 0)
                        driver:setControlState("handbrake", false)
                    end
                end
            end
        end

        if (self.trailerOf and self.trailerOf.element) then
            attachTrailerToVehicle(self.trailerOf.element, self.element)
        end
    end
end

function VehicleElement:getEntryPoint(entryPoint)
    local entryPoints = getVehicleEntryPoints(self)

    if not entryPoints then
        return false
    end

    return unpack(entryPoints[entryPoint + 1])
end

function VehicleElement:getVehicleType()
    return VehicleElement.getTypeFromModel(self:getModel())
end

function VehicleElement:getVehicleClass()
    return VehicleElement.getClassFromModel(self:getModel())
end

function VehicleElement:getType()
    return 'vehicle'
end

function VehicleElement.loadData(dataPath)
    if (dataPath:sub(-1) == '/') then
        dataPath = dataPath:sub(1, -2)
    end

    VehicleElement.loadIDEData(dataPath..'/data/vehicles.ide')
    VehicleElement.loadColorData(dataPath..'/data/carcols.dat')
end

function VehicleElement.loadColorData(path)
    local data = Loader.tryLoadCached(path)

    if (data == false) then
        if (File.exists(path)) then
            local colorFile = File.open(path, true)

            if (colorFile) then
                Logger.info('VEHICLE', 'Loading color data...')

                local buffer = ""
                local inColorSection = false
                local inCarSection = false
                local inComment = false

                while (not colorFile:isEOF()) do
                    local char = colorFile:read(1)

                    if (char == '\n') then
                        inComment = false
                        buffer = buffer:gsub(" *(.+) *", "%1")

                        if (buffer == "col") then
                            inColorSection = true
                        elseif (buffer == 'car') then
                            inCarSection = true
                        elseif (buffer == "end") then
                            if (inColorSection) then
                                inColorSection = false
                            elseif (inCarSection) then
                                inCarSection = false
                            end
                        elseif (inColorSection) then
                            local spl = split(buffer, ",")

                            if (#spl == 3) then
                                Logger.debug('VEHICLE', 'Color loaded: {}', buffer)

                                vehicleColorData[#vehicleColorData + 1] = {
                                    ["r"] = tonumber(spl[1]),
                                    ["g"] = tonumber(spl[2]),
                                    ["b"] = tonumber(spl[3])
                                }
                            end
                        elseif (inCarSection) then
                            local spl = split(buffer, ",")

                            if (#spl > 1) then
                                local model = spl[1]
                                local modelId = vehicleModelToId[model]

                                if (modelId) then
                                    local variants = {}

                                    for i=2, #spl, 2 do
                                        if (spl[i] and spl[i + 1]) then
                                            local primaryColor = tonumber(spl[i])
                                            local secondaryColor = tonumber(spl[i + 1])

                                            if (primaryColor and secondaryColor) then
                                                variants[#variants + 1] = {
                                                    ["primary"] = primaryColor,
                                                    ["secondary"] = secondaryColor
                                                }

                                                Logger.debug('VEHICLE', 'Color variant loaded: {} {} for model {}', primaryColor, secondaryColor, model)
                                            end
                                        end

                                        Loader.yieldIfRequired()
                                    end

                                    vehicleIdToPalettes[modelId] = variants

                                    Logger.debug('VEHICLE', 'Loaded {} color variant(s) for model {}', #variants, model)
                                end
                            end
                        end

                        buffer = ""
                    elseif (char ~= '\r') then
                        if (inComment == false) then
                            if (char == "#") then
                                inComment = true
                            else
                                buffer = buffer..char
                            end
                        end
                    end

                    Loader.yieldIfRequired()
                end

                colorFile:close()
            end
        end

        Loader.saveToCache(path, {
            colorData = vehicleColorData,
            idToPalettes = vehicleIdToPalettes
        })
    else
        vehicleColorData = {}
        vehicleIdToPalettes = {}

        for key, value in pairs(data.colorData) do
            vehicleColorData[tonumber(key)] = value
        end

        for key, value in pairs(data.idToPalettes) do
            vehicleIdToPalettes[tonumber(key)] = value
        end

        Logger.info('VEHICLE', 'Loaded color data from cache...')
    end
end

function VehicleElement.loadIDEData(path)
    local data = Loader.tryLoadCached(path)

    if (data == false) then
        if (File.exists(path)) then
            local vehiclesFile = File.open(path, true)

            if (vehiclesFile) then
                Logger.info('VEHICLE', 'Loading vehicles IDE data...')

                local buffer = ""
                local inCarsSection = false

                while (not vehiclesFile:isEOF()) do
                    local char = vehiclesFile:read(1)

                    if (char == '\n') then
                        inComment = false
                        buffer = buffer:gsub(" *(.+) *", "%1")

                        if (buffer == "cars") then
                            inCarsSection = true
                        elseif (buffer == "end") then
                            if (inCarsSection) then
                                inCarsSection = false
                            end
                        elseif (inCarsSection) then
                            local spl = split(buffer, ",")

                            if (#spl >= 8) then
                                local modelId = tonumber(spl[1])
                                local modelName = spl[2]:gsub('[ %\t]', '')
                                local vehicleType = spl[4]:gsub('[ %\t]', '')
                                local vehicleClass = spl[8]:gsub('[ %\t]', '')

                                if (modelId and modelName and vehicleType) then
                                    Logger.debug('VEHICLE', 'IDE Data loaded: ID: {}, Model: {}, Type: {}, Class: {}', modelId, modelName, vehicleType, vehicleClass)

                                    vehicleModelToId[modelName] = modelId
                                    vehicleIdToType[modelId] = vehicleType
                                    vehicleIdToClass[modelId] = vehicleClass

                                    if (vehicleClassToIds[vehicleClass] == nil) then
                                        vehicleClassToIds[vehicleClass] = {}
                                    end

                                    vehicleClassToIds[vehicleClass][#vehicleClassToIds[vehicleClass] + 1] = modelId
                                end
                            end
                        end

                        buffer = ""
                    elseif (char ~= '\r') then
                        if (inComment == false) then
                            if (char == "#") then
                                inComment = true
                            else
                                buffer = buffer..char
                            end
                        end
                    end

                    Loader.yieldIfRequired()
                end

                vehiclesFile:close()
            end
        end

        Loader.saveToCache(path, {
            modelToId = vehicleModelToId,
            idToType = vehicleIdToType,
            idToClass = vehicleIdToClass,
            classToIds = vehicleClassToIds
        })
    else
        vehicleModelToId = data.modelToId
        vehicleIdToType = {}
        vehicleIdToClass = {}
        vehicleClassToIds = data.classToIds

        for key, value in pairs(data.idToType) do
            vehicleIdToType[tonumber(key)] = value
        end

        for key, value in pairs(data.idToClass) do
            vehicleIdToClass[tonumber(key)] = value
        end

        Logger.info('VEHICLE', 'Loaded IDE data from cache...')
    end
end

function VehicleElement.getColorFromPalette(palette)
    return vehicleColorData[palette + 1] or false
end

function VehicleElement.getTypeFromModel(model)
    return vehicleIdToType[model] or 'car'
end

function VehicleElement.getClassFromModel(model)
    if (model == 596
        or model == 598
        or model == 599
        or model == 597
        or model == 490
        or model == 427
        or model == 528
        or model == 432) then
        return 'police_car'
    end

    return vehicleIdToClass[model] or 'car'
end

Core.mergeInto(VehicleElement, ElementWrapper)

-----------------------------------
-- * Events
-----------------------------------
