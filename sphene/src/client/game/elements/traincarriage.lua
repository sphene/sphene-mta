-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local carriages = {}

-----------------------------------
-- * Variables
-----------------------------------

TrainCarriageElement = {
    elementTable = carriages
}

TrainCarriageElement.__index = TrainCarriageElement

-----------------------------------
-- * Functions
-----------------------------------

function TrainCarriageElement:create(model)
    local mt = setmetatable(TrainCarriageElement.parent.create(mt, model), TrainCarriageElement)

    Logger.debug('TRAINCARRIAGE', 'Train carriage created with ID {} and model {}', mt.id, model)

    return mt
end

function TrainCarriageElement:destroy()
    TrainCarriageElement.parent.destroy(self)

    TrainCarriageElement.elementTable[self.id] = nil
    VehicleElement.elementTable[self.id] = nil
end

function TrainCarriageElement:spawn(x, y, z, direction)
    TrainCarriageElement.parent.spawn(self, x, y, z)

    self.direction = (direction == 1)

    -- We always keep trains available in memory when spawned
    self:setDirection(self.direction)
end

function TrainCarriageElement:setDirection(direction)
    if (self.element) then
        setTrainDirection(self.element, direction)
    end

    self.direction = direction
end

function TrainCarriageElement:getDirection()
    return self.direction
end

function TrainCarriageElement:onPreFrame()
    TrainCarriageElement.parent.onPreFrame(self)

    if (self.trailerOf and self.element and self.trailerOf.element) then
        attachTrailerToVehicle(self.element, self.trailerOf.element)
    elseif (self.trailer and self.element and self.trailer.element) then
        attachTrailerToVehicle(self.trailer.element, self.element)
    end
end

function TrainCarriageElement:getType()
    return 'carriage'
end

Core.mergeInto(TrainCarriageElement, VehicleElement)

-----------------------------------
-- * Events
-----------------------------------
