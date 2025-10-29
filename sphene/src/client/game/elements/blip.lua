-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local blips = {}

-----------------------------------
-- * Variables
-----------------------------------

BlipElement = {
    elementTable = blips
}

BlipElement.__index = BlipElement

BlipElement.COLORS = {
    {196, 48, 51, 255}, -- red
    {0, 0, 0, 255}, -- green
    {43, 32, 150, 255}, -- blue
    {255, 255, 255, 255}, -- white
    {220, 184, 101, 255}, -- yellow
    {0, 0, 0, 255}, -- purple
    {0, 0, 0, 255}, -- cyan
    {196, 48, 51, 255}, -- threat
    {220, 184, 101, 255}, -- destination
}

-----------------------------------
-- * Functions
-----------------------------------

function BlipElement:create(x, y, z, icon, size, r, g, b, a)
    local mt = setmetatable({}, BlipElement)

    BlipElement.parent.create(mt)

    mt.icon = icon
    mt.size = size
    mt.color = {r or 255, g or 255, b or 255, a or 255}
    mt.type = 0
    mt.visibleDistance = 175
    mt.alphaVisibleDistance = -1
    mt.isBlipEnabled = true
    mt.hideInMission = false
    mt.alpha = a or 255

    mt.element = createBlip(x or 0, y or 0, z or 0, icon or 0, size or 1, r or 255, g or 255, b or 255, a or 255, 0, mt.visibleDistance)
    mt:setPosition(x, y, z)

    ElementManager.addElementHandle(mt.element, mt)

    Logger.debug('BLIP', 'Blip created with ID {} and icon {}', mt.id, mt.icon)

    if (mt.element) then
        setElementDimension(mt.element, getElementData(getElementParent(localPlayer), 'dimension'))
    end

    return mt
end

function BlipElement:destroy()
    self.isBlipEnabled = false

    if (isElement(self.element)) then
        destroyElement(self.element)
    end

    BlipElement.parent.destroy(self)
end

function BlipElement:isEnabled()
    return self.isBlipEnabled
end

function BlipElement:setSize(size)
    self.element:setSize(size)
end

function BlipElement:setIcon(icon)
    self.icon = icon

    Logger.debug('BLIP', 'Setting icon to {} for blip with ID {}', icon, self.id)

    setBlipIcon(self.element, icon)
end

function BlipElement:setColor(color)
    color = BlipElement.COLORS[color + 1] or {255, 255, 255, 255}
    self.color = color

    setBlipColor(self.element, color[1], color[2], color[3], self.alpha)
end

function BlipElement:setMode(mode)
    if (mode == 0) then
        self:setAlpha(0)
    elseif(mode == 1) then
        self:setAlpha(0)
    elseif(mode == 2) then
        self:setAlpha(255)
    elseif(mode == 3) then
        self:setAlpha(255)
    end
end

function BlipElement:setAlpha(alpha)
    self.alpha = alpha

    Logger.debug('BLIP', 'Setting alpha to {} for blip with ID {}', alpha, self.id)

    setBlipColor(self.element, self.color[1], self.color[2], self.color[3], alpha)

    if (alpha == 0) then
        Logger.debug('BLIP', 'Alpha is 0, setting visible distance to 0 for blip with ID {}', self.id)
        setBlipVisibleDistance(self.element, 0)
    else
        Logger.debug('BLIP', 'Alpha is not 0, setting visible distance to {} for blip with ID {}', self.visibleDistance, self.id)
        setBlipVisibleDistance(self.element, self.visibleDistance)
    end
end

function BlipElement:setHiddenInMission(hide)
    self.hideInMission = hide

    Logger.debug('BLIP', 'Setting hidden in mission to {} for blip with ID {}', hide, self.id)
end

function BlipElement:setVisibleDistance(visibleDistance)
    self.visibleDistance = visibleDistance

    Logger.debug('BLIP', 'Setting visible distance to {} for blip with ID {}', visibleDistance, self.id)

    if ((self.alpha or 255) == 0) then
        return setBlipVisibleDistance(self.element, 0)
    end

    return setBlipVisibleDistance(self.element, visibleDistance)
end

function BlipElement:setType(type)
    self.type = type
end

function BlipElement:getIcon()
    return self.icon
end

function BlipElement:isHiddenInMission()
    return self.hideInMission
end

function BlipElement:onPreFrame()
    if (self.element) then
        if (self.type == 0) then
            setBlipColor(self.element, self.color[1], self.color[2], self.color[3], self.alpha)
        elseif (self.type == 1) then
            local color = BlipElement.COLORS[3]
            setBlipColor(self.element, color[1], color[2], color[3], self.alpha)
        elseif (self.type == 2) then
            local color = BlipElement.COLORS[8]
            setBlipColor(self.element, color[1], color[2], color[3], self.alpha)
        end

        if (self.hideInMission and Game.getMissionFlag() == 1) then
            if (getBlipVisibleDistance(self.element) > 0) then
                Logger.debug('BLIP', 'Hiding blip with ID {} in mission', self.id)
                setBlipVisibleDistance(self.element, 0)
            end
        elseif (self.alpha > 0 and self.visibleDistance > 0 and getBlipVisibleDistance(self.element) == 0) then
            Logger.debug('BLIP', 'Showing blip with ID  {}', self.id)
            setBlipVisibleDistance(self.element, self.visibleDistance)
        end

        if (self.dependsOnElement) then
            self:setPosition(self.dependsOnElement:getPosition())
        end
    end
end

function BlipElement:getType()
    return 'blip'
end

Core.mergeInto(BlipElement, ElementWrapper)

-----------------------------------
-- * Events
-----------------------------------
