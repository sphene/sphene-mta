-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local trains = {}

-----------------------------------
-- * Variables
-----------------------------------

TrainElement = {
    elementTable = trains
}

TrainElement.__index = TrainElement

-----------------------------------
-- * Functions
-----------------------------------

function TrainElement:create(type)
    local trainConfiguration = getTrainConfiguration(type + 1)
    local mt = setmetatable(TrainElement.parent.create(mt, trainConfiguration[1]), TrainElement)

    mt.carriages = {}
    mt.direction = 0
    mt.cruiseSpeed = 0
    mt.speed = 0
    mt.generatedTick = getTickCount()

    Logger.debug('TRAIN', 'Train created with ID {} and {} carriages', mt.id, #trainConfiguration - 1)

    for i=2, #trainConfiguration do
        if (trainConfiguration[i]) then
            local carriage = TrainCarriageElement:create(trainConfiguration[i])

            if (#mt.carriages == 0) then
                carriage:attachTrailer(mt)
            else
                carriage:attachTrailer(mt.carriages[#mt.carriages])
            end

            mt.carriages[#mt.carriages + 1] = carriage
        end
    end

    return mt
end

function TrainElement:spawn(x, y, z, direction)
    TrainElement.parent.spawn(self, x, y, z)

    self.direction = (direction == 1)

    self:setDirection(self.direction)

    for _, carriage in pairs(self.carriages) do
        carriage:spawn(x, y, z, direction)
    end
end

function TrainElement:destroy()
    TrainElement.parent.destroy(self)

    TrainElement.elementTable[self.id] = nil
    VehicleElement.elementTable[self.id] = nil

    for _, carriage in pairs(self.carriages) do
        carriage:destroy()
    end
end

function TrainElement:setSpeed(speed)
    if (not self:getDirection()) then
        speed = -speed
    end

    if (self.element) then
        setTrainSpeed(self.element, speed)
    end

    self.speed = speed
end

function TrainElement:setDirection(direction)
    if (self.element) then
        setTrainDirection(self.element, direction)
    end

    self.direction = direction
end

function TrainElement:setCruiseSpeed(speed)
    self.cruiseSpeed = speed
end

function TrainElement:getLastCarriage()
    return self.carriages[#self.carriages]
end

function TrainElement:getCarriage(carriage)
    return self.carriages[tonumber(carriage)]
end

function TrainElement:getCarriages()
    return self.carriages
end

function TrainElement:getDirection()
    return self.direction
end

function TrainElement:getSpeed()
    if (self.element) then
        return getTrainSpeed(self.element, "km/h")
    end

    return self.speed
end

function TrainElement:isBlown()
    if (self.element) then
        return isTrainDerailed(self.element)
    end

    return false
end

function TrainElement:onPreFrame()
    TrainElement.parent.onPreFrame(self)

    if (self.element and (getTickCount() - self.generatedTick) > 15000) then
        local speed = math.abs(self:getSpeed())

        if (self.cruiseSpeed > speed) then
            speed = speed + 0.05
        end

        if (speed > self.cruiseSpeed) then
            speed = speed - 0.05
        end

        if (math.abs(speed - self.cruiseSpeed) < 0.05) then
            speed = self.cruiseSpeed
        end

        if (not self:getDirection()) then
            speed = -speed
        end

        self:setSpeed(speed)
    end
end

function TrainElement:getType()
    return 'train'
end

Core.mergeInto(TrainElement, VehicleElement)

-----------------------------------
-- * Events
-----------------------------------
