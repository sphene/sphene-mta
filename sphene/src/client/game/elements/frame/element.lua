-----------------------------------
-- * Variables
-----------------------------------

FrameElement = {}
FrameElement.__index = FrameElement

-----------------------------------
-- * Functions
-----------------------------------

function FrameElement.draw(thread, identifier, element)
    element:setDimension(getElementData(getElementParent(localPlayer), 'dimension'))
    element:setInterior(getElementInterior(localPlayer))

    local frameElement = thread.frameElements[identifier] or nil

    if (frameElement ~= nil) then
        frameElement.drawn = true
    else
        thread.frameElements[identifier] = {
            drawn = true,
            element = element
        }
    end
end

function FrameElement.endFrame(thread)
    for key, element in pairs(thread.frameElements) do
        if (element.drawn == false) then
            element.element:destroy()
            thread.frameElements[key] = nil
        else
            element.drawn = false
            element.element:setDimension(65534)
        end
    end
end

function FrameElement.destroyAll(thread)
    if (thread) then
        for key, element in pairs(thread.frameElements) do
            element.element:destroy()
            thread.frameElements[key] = nil
        end
    else
        thread = Thread.threadTable

        while (thread ~= false) do
            for key, element in pairs(thread.frameElements) do
                element.element:destroy()
                thread.frameElements[key] = nil
            end

            thread = thread.next
        end
    end
end

function FrameElement.getElement(thread, identifier)
    local frameElement = thread.frameElements[identifier]

    if (frameElement ~= nil) then
        return frameElement.element
    end

    return nil
end

function FrameElement.getFrameElement(thread, identifier)
    return thread.frameElements[identifier] or nil
end

-----------------------------------
-- * Events
-----------------------------------
