-----------------------------------
-- * Variables
-----------------------------------

ElementWrapper = {}
ElementWrapper.__index = ElementWrapper

-----------------------------------
-- * Functions
-----------------------------------

function ElementWrapper:create()
    self.element = false

    self.dependsOnElement = false
    self.attachedToDependingElement = false
    self.attachOffset = {}
    self.dependantElements = {}
    self.data = {}
    self.id = ''

    self.model = 0

    self.loading = false
    self.destroyed = false
    self.collidables = {}

    self:generateIdAndStore()

    Logger.debug(string.upper(self:getType()), 'Creating element with ID {}', self.id)
end

function ElementWrapper:destroy()
    Logger.debug(string.upper(self:getType()), 'Destroying element {} with ID {}', self:getModel() or 'UNKNOWN', self.id)

    if (self.dependsOnElement) then
        self.dependsOnElement:removeDependant(self)
    end

    for _, element in pairs(self.dependantElements) do
        element:destroy()
    end

    self.dependsOnElement = false
    self.attachedToDependingElement = false
    self.attachOffset = {}
    self.dependantElements = {}
    self.data = {}

    if self.element then
        ElementManager.removeElementHandle(self.element)
    end

    self.destroyed = true
    self.elementTable[tostring(self.id)] = nil

    if self.element and isElement(self.element) then
        destroyElement(self.element)
    end

    self.element = false
    self.scheduledAdjustment = false
end

function ElementWrapper:setModel(model)
    self.model = model
    setElementModel(self.element, model)
end

function ElementWrapper:setPosition(x, y, z, internal)
    if (self:getType() ~= 'marker') then
        Logger.debug(string.upper(self:getType()), 'Setting position to {} {} {} for model {} and ID {}', x, y, z, self:getModel(), self.id)
    end

    setElementPosition(self.element, x, y, z)
end

function ElementWrapper:setRotation(x, y, z, internal)
    if (self:getType() ~= 'marker') then
        Logger.debug(string.upper(self:getType()), 'Setting rotation to {} {} {} for model {} and ID {}', x, y, z, self:getModel(), self.id)
    end

    setElementRotation(self.element, x, y, z)
end

function ElementWrapper:setVelocity(x, y, z, internal)
    if (self:getType() ~= 'marker') then
        Logger.debug(string.upper(self:getType()), 'Setting velocity to {} {} {} for model {} and ID {}', x, y, z, self:getModel(), self.id)
    end

    setElementVelocity(self.element, x, y, z)
end

function ElementWrapper:setAngularVelocity(x, y, z, internal)
    setElementAngularVelocity(self.element, x, y, z)
end

function ElementWrapper:setInterior(interior, internal)
    setElementInterior(self.element, interior)
end

function ElementWrapper:setAlpha(alpha)
    setElementAlpha(self.element, alpha)
end

function ElementWrapper:setCollisionsEnabled(enabled)
    setElementCollisionsEnabled(self.element, enabled)
end

function ElementWrapper:setCollidableWith(element, enabled)
    self.collidables[element] = enabled
end

function ElementWrapper:setDimension(dimension)
    setElementDimension(self.element, dimension)
end

function ElementWrapper:setFrozen(frozen)
    setElementFrozen(self.element, frozen)
end

function ElementWrapper:setHealth(health)
    setElementHealth(self.element, health)
end

function ElementWrapper:setData(key, value)
    self.data[key] = value
end

function ElementWrapper:setSpeed(speed, unit)
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)

    local x, y, z = self:getVelocity()
    local currentSpeed = (Vector3(x, y, z) * mult).length

    local diff = speed / currentSpeed

    if (diff ~= diff) then
        return false
    end

    self:setVelocity(x * diff, y * diff, z * diff)

    return true
end

function ElementWrapper:attach(attachToElement, offsetX, offsetY, offsetZ, offsetRotX, offsetRotY, offsetRotZ)
    if (attachToElement == nil) then
        return false
    end

    self:depends(attachToElement)
    self.attachedToDependingElement = true
    self:setInterior(attachToElement:getInterior())

    self.attachOffset = {
        offsetX = offsetX or 0,
        offsetY = offsetY or 0,
        offsetZ = offsetZ or 0,
        offsetRotX = offsetRotX or 0,
        offsetRotY = offsetRotY or 0,
        offsetRotZ = offsetRotZ or 0
    }

    if self:getType() ~= 'marker' and self:getType() ~= 'blip' and self.element and attachToElement.element then
        attachElements(self.element, attachToElement.element, offsetX or 0, offsetY or 0, offsetZ or 0, offsetRotX or 0, offsetRotY or 0, offsetRotZ or 0)
    end

    return true
end

function ElementWrapper:detach()
    if (self.attachedToDependingElement) then
        self.attachedToDependingElement = false

        self.dependsOnElement:removeDependant(self)
        self.dependsOnElement = false
    end

    if self:getType() ~= 'marker' and self:getType() ~= 'blip' and self.element then
        detachElements(self.element)
    end
end

function ElementWrapper:depends(element)
    if (self.dependsOnElement == element) then
        return false
    end

    if (element == nil) then
        return false
    end

    if (self.dependsOnElement) then
        self:removeDependingElement(self.dependsOnElement)
    end

    element:dependant(self)
    self.dependsOnElement = element

    return true
end

function ElementWrapper:removeDependingElement(element)
    if (self.dependsOnElement == element) then
        self.dependsOnElement:removeDependant(self)
        self.dependsOnElement = false
        return true
    end

    return false
end

function ElementWrapper:dependant(element)
    for _, checkElement in pairs(self.dependantElements) do
        if (element == checkElement) then
            return false
        end
    end

    self.dependantElements[#self.dependantElements + 1] = element

    return true
end

function ElementWrapper:removeDependant(element)
    for index, checkElement in pairs(self.dependantElements) do
        if (element == checkElement) then
            self.dependantElements[index] = nil
            return true
        end
    end

    return false
end

function ElementWrapper:setMatrix(matrix, internal)
    setElementMatrix(self.element, matrix)

    local matrixPosition = matrix:getPosition()
    local matrixRotation = matrix:getRotation()

    setElementPosition(self.element, matrixPosition:getX(), matrixPosition:getY(), matrixPosition:getZ())
    setElementRotation(self.element, matrixRotation:getX(), matrixRotation:getY(), matrixRotation:getZ())
end

function ElementWrapper:getModel()
    return self.model
end

function ElementWrapper:getDimension()
    if (isElement(self.element)) then
        return getElementDimension(self.element)
    end

    return 0
end

function ElementWrapper:getPosition(internal)
    return getElementPosition(self.element)
end

function ElementWrapper:getRotation(internal)
    return getElementRotation(self.element)
end

function ElementWrapper:getSpeed(unit)
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)

    return (Vector3(self:getVelocity()) * mult).length
end

function ElementWrapper:getVelocity(internal)
    return getElementVelocity(self.element)
end

function ElementWrapper:getAngularVelocity(internal)
    return getElementAngularVelocity(self.element)
end

function ElementWrapper:getInterior(internal)
    return getElementInterior(self.element)
end

function ElementWrapper:getAlpha()
    return getElementAlpha(self.element)
end

function ElementWrapper:getCollisionsEnabled()
    return getElementCollisionsEnabled(self.element)
end

function ElementWrapper:getFrozen()
    return isElementFrozen(self.element)
end

function ElementWrapper:getHealth()
    if not isElement(self.element) then
        return 100
    end

    return getElementHealth(self.element)
end

function ElementWrapper:isWithinMarker(marker)
    return isElementWithinMarker(self.element, marker.element or marker)
end

function ElementWrapper:isInRectangle(cornerAX, cornerAY, cornerBX, cornerBY)
    local x, y, _ = self:getPosition()

    if ((x > cornerAX and x < cornerBX) or (x > cornerBX and x < cornerAX)) then
        if ((y > cornerAY and y < cornerBY) or (y > cornerBY and y < cornerAY)) then
            return true
        end
    end

    Logger.debug(self:getType():upper(), 'Element {} is not in rectangle ({}, {}) - ({}, {}). Position is in: {} {}', self.id, cornerAX, cornerAY, cornerBX, cornerBY, x, y)

    return false
end

function ElementWrapper:isInCube(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ)
    local x, y, z = self:getPosition()

    if ((x > cornerAX and x < cornerBX) or (x > cornerBX and x < cornerAX)) then
        if ((y > cornerAY and y < cornerBY) or (y > cornerBY and y < cornerAY)) then
            if ((z > cornerAZ and z < cornerBZ) or (z > cornerBZ and z < cornerAZ)) then
                return true
            end
        end
    end

    Logger.debug(self:getType():upper(), 'Element {} is not in cube ({}, {}, {}) - ({}, {}, {}). Position is in: {} {} {}', self.id, cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ, x, y, z)

    return false
end

function ElementWrapper:isInWater()
    return isElementInWater(self.element)
end

function ElementWrapper:isFrozen()
    return isElementFrozen(self.element)
end

function ElementWrapper:getData(key)
    return self.data[key] or false
end

function ElementWrapper:getMatrix()
    return self.element:getMatrix()
end

function ElementWrapper:getDistanceToElement(element)
    local x, y, z = self:getPosition()
    local elX, elY, elZ = element:getPosition()

    return getDistanceBetweenPoints3D(x, y, z, elX, elY, elZ)
end

function ElementWrapper:isInSphere(x, y, z, radius)
    local elX, elY, elZ = self:getPosition()

    return getDistanceBetweenPoints3D(x, y, z, elX, elY, elZ) <= radius
end

function ElementWrapper:distanceTo(x, y, z)
    local elX, elY, elZ = self:getPosition()

    return getDistanceBetweenPoints3D(x, y, z, elX, elY, elZ)
end

function ElementWrapper:generateIdAndStore()
    local id = createRandomHash(8)

    while (self.elementTable[id] ~= nil) do
        id = createRandomHash(8)
    end

    self.id = id
    self.elementTable[id] = self
end

function ElementWrapper:getSpeed(_)
    unit = unit == nil and 0 or ((not tonumber(unit)) and unit or tonumber(unit))
    local mult = (unit == 0 or unit == "m/s") and 50 or ((unit == 1 or unit == "km/h") and 180 or 111.84681456)

    return (Vector3(self:getVelocity()) * mult).length

end

function ElementWrapper:getElement()
    return self.element
end

function ElementWrapper:all()
    return self.elementTable
end

function ElementWrapper:getId()
    return self.id
end

function ElementWrapper:getType()
    return "unknown"
end

function ElementWrapper:onPreFrame()
    if self.element then
        ElementManager.runExternalScriptsForElement(self)
    end

    if (self.attachedToDependingElement and self.dependsOnElement) then
        local offset = self.attachOffset
        local dX, dY, dZ = self.dependsOnElement:getPosition()
        local dRotX, dRotY, dRotZ = self.dependsOnElement:getRotation()

        self:setPosition(dX + offset.offsetX, dY + offset.offsetY, dZ + offset.offsetZ)
        self:setRotation(dRotX + offset.offsetRotX, dRotY + offset.offsetRotY, dRotZ + offset.offsetRotZ)
    elseif (self.innerElement) then
        detachElements(self.innerElement)
    end

    for element, enabled in pairs(self.collidables) do
        if (self.element and element.element) then
            setElementCollidableWith(self.element, element.element, enabled)
        end
    end
end

function ElementWrapper:onFrame()

end

-----------------------------------
-- * Events
-----------------------------------
