-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local searchLights = {}

-----------------------------------
-- * Variables
-----------------------------------

SearchLightElement = {
    elementTable = searchLights
}

SearchLightElement.__index = SearchLightElement

-----------------------------------
-- * Functions
-----------------------------------

function SearchLightElement:create(startX, startY, startZ, endX, endY, endZ, startRadius, endRadius, renderSpot)
    local mt = setmetatable({}, SearchLightElement)

    SearchLightElement.parent.create(mt)

    Logger.debug('SEARCH LIGHT', 'Creating searchlight with ID {}', mt.id)

    local searchLight = createSearchLight(startX, startY, startZ, endX, endY, endZ, startRadius, endRadius, renderSpot)

    mt.startX = startX
    mt.startY = startY
    mt.startZ = startZ
    mt.endX = endX
    mt.endY = endY
    mt.endZ = endZ
    mt.startRadius = startRadius
    mt.endRadius = endRadius
    mt.renderSpot = renderSpot

    mt.element = searchLight
    mt.spawned = true

    ElementManager.addElementHandle(mt.element, mt)

    return mt
end

function SearchLightElement:destroy()
    self.spawned = false

    if (isElement(self.element)) then
        self.element:destroy()
    end

    SearchLightElement.parent.destroy(self)
end

function SearchLightElement:hasSpotted(element)
    --local x, y, z = element:getPosition()

    return false
end

function SearchLightElement:getType()
    return 'searchlight'
end

Core.mergeInto(SearchLightElement, ElementWrapper)

-----------------------------------
-- * Events
-----------------------------------
