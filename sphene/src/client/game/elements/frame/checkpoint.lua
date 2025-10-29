-----------------------------------
-- * Variables
-----------------------------------

CheckpointFrameElement = {}
CheckpointFrameElement.__index = CheckpointFrameElement

-----------------------------------
-- * Functions
-----------------------------------

function CheckpointFrameElement.draw(thread, x, y, z, size, r, g, b, alpha)
    x = x or 0
    y = y or 0
    z = z or 0
    size = size or 1
    r = r or 255
    g = g or 0
    b = b or 0
    alpha = alpha or 0xE4

    local identifier = "cylinder:"..x..":"..y..":"..z..":"..size..":"..r..":"..g..":"..b..":"..alpha
    local element = FrameElement.getElement(thread, identifier)

    if (element == nil) then
        element = MarkerElement:create(x, y, z, "cylinder", size, r, g, b)
        setElementAlpha(element.element, alpha)
    end

    FrameElement.draw(thread, identifier, element)
end


-----------------------------------
-- * Events
-----------------------------------
