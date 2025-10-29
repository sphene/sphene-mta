-----------------------------------
-- * Variables
-----------------------------------

TrainClass = {}
TrainClass.__index = TrainClass

-----------------------------------
-- * Functions
-----------------------------------

function TrainClass.create(runtime, type, x, y, z, direction)
    local mt = setmetatable({}, TrainClass)

    mt.runtime = runtime

    if (mt:__instanceof(x, Vector3Class)) then
        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value

        direction = y
    end

    mt.train = TrainElement:create(type)
    mt.train:spawn(x, y, z, direction)

    mt.properties = {
        model = 'getModel',
        position = 'getPosition',
        rotation = 'getRotation',
        matrix = 'getMatrix',
        speed = 'getSpeed',
        cruiseSpeed = 'getCruiseSpeed',
    }

    return mt.runtime:returnObject(mt)
end

function TrainClass:destroy(_)
    self.train:destroy()
end

function TrainClass:setPosition(runtime, x, y, z)
    if (self:__instanceof(x, Vector3Class)) then
        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value
    end

    self.train:setPosition(x, y, z)
end

function TrainClass:setRotation(runtime, x, y, z)
    if (self:instanceof(x, Vector3Class)) then
        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value
    end

    self.train:setRotation(x, y, z)
end

function TrainClass:setModel(_, model)
    self.train:setModel(model)
end

function TrainClass:setSpeed(_, speed)
    self.train:setSpeed(speed * 0.02)
end

function TrainClass:setCruiseSpeed(_, speed)
    self.train:setCruiseSpeed(speed * 0.02)
end

function TrainClass:getModel(_)
    return self.runtime:returnNumber(self.train:getModel())
end

function TrainClass:getPosition(_)
    return Vector3Class.create(self.runtime, self.train:getPosition())
end

function TrainClass:getRotation(_)
    return Vector3Class.create(self.runtime, self.train:getRotation())
end

function TrainClass:getMatrix(_)
    return MatrixClass.create(self.runtime, self:getPosition():getObject(), self:getRotation():getObject())
end

function TrainClass:getSpeed(_)
    return self.runtime:returnNumber(self.train:getSpeed() / 0.02)
end

function TrainClass:getCruiseSpeed(_)
    return self.runtime:returnNumber(self.train:getCruiseSpeed() / 0.02)
end

Core.mergeInto(TrainClass, AbstractClass)