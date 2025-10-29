-----------------------------------
-- * Locals
-----------------------------------

local _setmetatable = setmetatable

-----------------------------------
-- * Variables
-----------------------------------

SCM = {}
SCM.__index = SCM

-----------------------------------
-- * Functions
-----------------------------------

function SCM:create(data)
    local mt = _setmetatable({}, SCM)

    mt.data = data
    mt.size = #data
    mt.position = 0

    return mt
end

function SCM:close()

end

function SCM:setOffset(offset)
    return self:setPos(self:getPos() + offset)
end

function SCM:setPos(position)
    if (position < 0) then
        return false
    end

    if (position > self.size) then
        position = self.size
    end

    self.position = position

    return true
end

function SCM:getPos()
    return self.position
end

function SCM:getSize()
    return self.size
end

function SCM:isEOF()
    if (self.position >= self.size) then
        return true
    end

    return false
end

function SCM:read(bytes)
    if (self.position + bytes > self.size) then
        bytes = self.size - self.position
    end

    local result = ""

    for i=1, bytes do
        result = result..string.char(self.data[self.position + i])
    end

    self:setOffset(bytes)

    return result
end