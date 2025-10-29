-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local markers = {}

-----------------------------------
-- * Variables
-----------------------------------

MarkerType = {}
MarkerType.CHECKPOINT = "checkpoint"
MarkerType.RING = "ring"
MarkerType.CYLINDER = "cylinder"
MarkerType.ARROW = "arrow"
MarkerType.CORONA = "corona"

MarkerElement = {
    elementTable = markers
}

MarkerElement.__index = MarkerElement

MarkerElement.ABOVE_ELEMENT_MARKER_SPEED = 2000

-----------------------------------
-- * Functions
-----------------------------------

function MarkerElement:create(x, y, z, type, size, r, g, b, a)
    local mt = setmetatable({}, MarkerElement)

    MarkerElement.parent.create(mt)

    mt.attachAnimation = {}
    mt.isMarkerEnabled = true
    mt.resetPosition = (z == nil)

    mt.position = {x, y, z}
    mt.type = type
    mt.size = size
    mt.color = {r or 255, g or 255, b or 255, a or 255}
    mt.assignedBlip = nil
    mt.hideInMission = false
    mt.alpha = a or 255

    mt.element = createMarker(x or 0, y or 0, z or 1000, type or MarkerType.CORONA, size or 1,
        r or 255, g or 0, b or 0, a or 0xE4)

    ElementManager.addElementHandle(mt.element, mt)

    Logger.debug('MARKER', 'Creating marker with type {}', type)

    mt:setInterior(getElementInterior(localPlayer))
    setElementDimension(mt.element, getElementData(getElementParent(localPlayer), 'dimension'))

    return mt
end

function MarkerElement:destroy()
    self.isMarkerEnabled = false

    if (isElement(self.element)) then
        self.element:destroy()
    end

    if (self.assignedBlip) then
        self.assignedBlip:destroy()
    end

    MarkerElement.parent.destroy(self)
end

function MarkerElement:setAlpha(alpha)
    self.alpha = alpha

    if (alpha == 0) then
        setElementDimension(self.element, 65534)
    else
        setElementDimension(self.element, getElementData(getElementParent(localPlayer), 'dimension'))
    end
end

function MarkerElement:setColor(color)
    for _, dependantElement in pairs(self.dependantElements) do
        dependantElement:setColor(color)
    end

    color = BlipElement.COLORS[color + 1] or {255, 255, 255, 255}
    self.color = color

    setMarkerColor(self.element, color[1], color[2], color[3], self.alpha)
end

function MarkerElement:setMode(mode)
    for _, dependantElement in pairs(self.dependantElements) do
        dependantElement:setMode(mode)
    end

    if (mode == 0) then
        self:setAlpha(0)
    elseif(mode == 1) then
        self:setAlpha(255)
    elseif(mode == 2) then
        self:setAlpha(0)
    elseif(mode == 3) then
        self:setAlpha(255)
    end
end

function MarkerElement:setCheckpointType(type)
    if (type == 0) then
        self.element:setIcon("arrow")
    elseif (type == 1) then
        self.element:setIcon("finish")
    elseif (type == 3) then
        self.element:setIcon("arrow")
        self.element:setType(MarkerType.RING)
    elseif (type == 4) then
        self.element:setIcon("finish")
        self.element:setType(MarkerType.RING)
    end
end

function MarkerElement:assignBlip(blip)
    self.assignedBlip = blip
end

function MarkerElement:attachAbove(attachToElement)
    self:attach(attachToElement)
    self.attachAnimation = {
        baseOffsetZ = 0,
        startTick = getTickCount(),
        endTick = getTickCount() + MarkerElement.ABOVE_ELEMENT_MARKER_SPEED
    }
end

function MarkerElement:detach()
    MarkerElement.parent.detach(self)
    self.attachAnimation = false
end

function MarkerElement:setSize(size)
    self.element:setSize(size)
end

function MarkerElement:setTarget(targetX, targetY, targetZ)
    self.element:setTarget(targetX, targetY, targetZ)
end

function MarkerElement:setHiddenInMission(hide, alpha)
    self.hideInMission = hide
end

function MarkerElement:setResetPosition()
    self.resetPosition = true
end

function MarkerElement:isEnabled()
    return self.isMarkerEnabled
end

function MarkerElement:getAssignedBlip()
    return self.assignedBlip
end

function MarkerElement:getAlpha()
    return self.alpha
end

function MarkerElement:getRotation()
    return 0, 0, 0
end

function MarkerElement:getModel()
    if (isElement(self.element)) then
        return getMarkerIcon(self.element)
    end

    return 0
end

function MarkerElement:isHiddenInMission()
    return self.hideInMission
end

function MarkerElement:onPreFrame()
    MarkerElement.parent.onPreFrame(self)

    if (self.element) then
        if (self.hideInMission and Game.getMissionFlag() == 1) then
            if (getElementDimension(self.element) ~= 65534) then
                Logger.debug('MARKER', 'Hiding marker with ID {} in mission', self.id)
                setElementDimension(self.element, 65534)
            end

            return
        elseif (self.alpha > 0 and (getElementDimension(self.element) or -1) == 65534) then
            Logger.debug('MARKER', 'Showing marker with ID  {}', self.id)
            setElementDimension(self.element, getElementData(getElementParent(localPlayer), 'dimension'))
        end
    end

    if (self.attachedToDependingElement and self.dependsOnElement and self.attachAnimation and self.dependsOnElement.element) then
        if (self.attachAnimation.baseOffsetZ == 0) then
            local _, _, _, _, _, maxZ = getElementBoundingBox(self.dependsOnElement.element)

            if (maxZ ~= nil) then
                self.attachAnimation.baseOffsetZ = maxZ + 1
            end
        end

        local minOffsetZ = self.attachAnimation.baseOffsetZ - 0.1
        local maxOffsetZ = self.attachAnimation.baseOffsetZ + 0.1
        local progress

        if (getTickCount() > self.attachAnimation.endTick) then
            progress = 1
            self.attachAnimation.startTick = getTickCount()
            self.attachAnimation.endTick = getTickCount() + MarkerElement.ABOVE_ELEMENT_MARKER_SPEED
        else
            progress = 1 / ((self.attachAnimation.endTick - self.attachAnimation.startTick) / (self.attachAnimation.endTick - getTickCount()))
        end

        local x, y, z = self.dependsOnElement:getPosition()

        if (progress < 0.5) then
            self:setPosition(x, y, z + minOffsetZ + ((maxOffsetZ - minOffsetZ) * (progress * 2)))
        else
            self:setPosition(x, y, z + minOffsetZ + ((maxOffsetZ - minOffsetZ) - ((maxOffsetZ - minOffsetZ) * ((progress - 0.5) * 2))))
        end
    elseif (self.resetPosition and self.element and getMarkerType(self.element) == MarkerType.CYLINDER) then
        local x, y, z = getElementPosition(self.element)
        enginePreloadWorldArea(x, y, z, "collisions")
        z = getGroundPosition(x, y, z)

        if (z ~= false and z ~= 0) then
            setElementPosition(self.element, x, y, z)
            self.resetPosition = false
        end
    end
end

function MarkerElement:getType()
    return 'marker'
end

Core.mergeInto(MarkerElement, ElementWrapper)

-----------------------------------
-- * Events
-----------------------------------
