-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local objects = {}

-----------------------------------
-- * Variables
-----------------------------------

ObjectElement = {
    elementTable = objects
}

ObjectElement.__index = ObjectElement

-----------------------------------
-- * Functions
-----------------------------------

function ObjectElement:create(model, bypassModelCheck)
    bypassModelCheck = bypassModelCheck or false

    local mt = setmetatable({}, ObjectElement)

    ObjectElement.parent.create(mt)

    if (not bypassModelCheck) then
        local objectName = Script.objectsById[math.abs(model - 1)]

        if (objectName) then
            model = engineGetModelIDFromName(objectName)
        else
            Logger.error('OBJECT', 'Tried to create object ({}) but couldn\'t find it!', model)
            Script.panic("Tried to create object ("..model..") but couldn't find it!")
        end
    end

    Logger.debug('OBJECT', 'Creating object with model {}', model)

    mt.model = model
    mt.spawned = false
    mt.health = 10000

    mt.moving = false

    return mt
end

function ObjectElement:spawn(x, y, z, rotX, rotY, rotZ)
    Logger.debug('OBJECT', 'Spawning object with model {} at {} {} {} with rotation {} {} {}',
        self.model, x or 0, y or 0, z or 0, rotX or 0, rotY or 0, rotZ or 0)

    local object = createObject(self.model, x, y, z, rotX, rotY, rotZ)

    self.element = object
    self.spawned = true

    ElementManager.addElementHandle(self.element, self)

    if (self.element) then
        setElementDimension(self.element, getElementData(getElementParent(localPlayer), 'dimension'))
    end
end

function ObjectElement:destroy()
    self.spawned = false

    if (isElement(self.element)) then
        self.element:destroy()
    end

    ObjectElement.parent.destroy(self)
end

function ObjectElement:setBreakable(breakable)
    return setObjectBreakable(self.element, breakable)
end

function ObjectElement:setLowLODElement(element)
    return setLowLODElement(self.element, element.element)
end

function ObjectElement:isBreakable()
    return isObjectBreakable(self.element)
end

function ObjectElement:isDamaged()
    return getElementHealth(self.element) < 100
end

function ObjectElement:isBroken()
    return getElementHealth(self.element) <= 0
end

function ObjectElement:moveTo(destX, destY, destZ, speedX, speedY, speedZ, collisionCheck)
    local x, y, z = self:getPosition()

    self.moving = {
        startX = x,
        startY = y,
        startZ = z,
        destX = destX,
        destY = destY,
        destZ = destZ,
        speedX = speedX,
        speedY = speedY,
        speedZ = speedZ,
        collisionCheck = collisionCheck
    }
end

function ObjectElement:onPreFrame()
    if (self.moving) then
        local x, y, z = self:getPosition()

        local destX = self.moving.destX
        local destY = self.moving.destY
        local destZ = self.moving.destZ

        local speedX = self.moving.speedX
        local speedY = self.moving.speedY
        local speedZ = self.moving.speedZ

        local collisionCheck = self.moving.collisionCheck

        local xDiff = destX - x
        local yDiff = destY - y
        local zDiff = destZ - z

        local xDir = xDiff > 0 and 1 or -1
        local yDir = yDiff > 0 and 1 or -1
        local zDir = zDiff > 0 and 1 or -1

        local xSpeed = math.min(math.abs(xDiff), speedX) * xDir
        local ySpeed = math.min(math.abs(yDiff), speedY) * yDir
        local zSpeed = math.min(math.abs(zDiff), speedZ) * zDir

        local newX = x + xSpeed
        local newY = y + ySpeed
        local newZ = z + zSpeed

        if (collisionCheck) then
            local hit, _, _, _, _ = processLineOfSight(x, y, z, newX, newY, newZ, true, false, false, true, false, false, false, false)

            if (hit) then
                self.moving = false
                return
            end
        end

        self:setPosition(newX, newY, newZ)

        if (newX == destX and newY == destY and newZ == destZ) then
            self.moving = false
        end
    end
end

function ObjectElement:getType()
    return 'object'
end

Core.mergeInto(ObjectElement, ElementWrapper)

-----------------------------------
-- * Events
-----------------------------------
