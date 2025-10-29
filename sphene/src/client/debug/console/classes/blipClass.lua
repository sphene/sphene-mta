-----------------------------------
-- * Variables
-----------------------------------

BlipClass = {}
BlipClass.__index = BlipClass

-----------------------------------
-- * Functions
-----------------------------------

function BlipClass.create(runtime, x, y, z, icon, size, r, g, b, a)
    local mt = setmetatable({}, BlipClass)

    mt.runtime = runtime

    if (mt:__instanceof(x, Vector3Class)) then
        a = g
        b = r
        g = size
        r = icon
        size = z
        icon = y

        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value
    end

    mt.blip = BlipElement:create(x, y, z, icon, size, r, g, b, a)

    mt:__initializeProperties()

    return mt.runtime:returnObject(mt)
end

function BlipClass.__createFromPointer(runtime, blipPointer)
    local mt = setmetatable({}, BlipClass)

    mt.runtime = runtime
    mt.blip = blipPointer

    mt:__initializeProperties()

    return mt.runtime:returnObject(mt)
end

function BlipClass:__initializeProperties()
    self.properties = {
        position = 'getPosition',
        icon = 'getIcon',
        size = 'getSize',
    }
end

function BlipClass:setPosition(runtime, x, y, z)
    if (self:__instanceof(x, Vector3Class)) then
        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value
    end

    self.blip:setPosition(x, y, z)
end

function BlipClass:setIcon(_, icon)
    self.blip:setIcon(icon)
end

function BlipClass:setSize(_, size)
    self.blip:setSize(size)
end

function BlipClass:destroy(_)
    self.blip:destroy()
end

function BlipClass:getPosition(_)
    return Vector3Class.create(self.runtime, self.blip:getPosition())
end

function BlipClass:getIcon(_)
    return self.runtime:returnNumber(self.blip:getIcon())
end

function BlipClass:getSize(_)
    return self.runtime:returnNumber(self.blip:getSize())
end

function BlipClass:__tostring()
    local x, y, z = self.blip:getPosition()

    return "Blip<"..tostring(x)..", "..tostring(y)..", "..tostring(z)..">"
end

function BlipClass.__preinit(runtime)

end

Core.mergeInto(BlipClass, AbstractClass)