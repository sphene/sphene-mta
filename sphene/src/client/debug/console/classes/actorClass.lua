-----------------------------------
-- * Variables
-----------------------------------

ActorClass = {}
ActorClass.__index = ActorClass

-----------------------------------
-- * Functions
-----------------------------------

function ActorClass.create(runtime, model, x, y, z, rotX, rotY, rotZ)
    local mt = setmetatable({}, ActorClass)

    mt.runtime = runtime

    if (mt:__instanceof(x, Vector3Class)) then
        if (mt:__instanceof(y, Vector3Class)) then
            local vector = y
            rotX = vector:getX(runtime).value
            rotY = vector:getY(runtime).value
            rotZ = vector:getZ(runtime).value
        end

        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value
    else
        if (mt:__instanceof(rotX, Vector3Class)) then
            local vector = rotX
            rotX = vector:getX(runtime).value
            rotY = vector:getY(runtime).value
            rotZ = vector:getZ(runtime).value
        end
    end

    mt.actor = ActorElement:create(model)
    mt.actor:spawn(x, y, z, rotX, rotY, rotZ)

    mt:__initializeProperties()

    return mt.runtime:returnObject(mt)
end

function ActorClass.__createFromPointer(runtime, pointer)
    local mt = setmetatable({}, ActorClass)

    mt.runtime = runtime
    mt.actor = pointer

    mt:__initializeProperties()

    return mt.runtime:returnObject(mt)
end

function ActorClass.__createFromPlayer(runtime, player)
    return ActorClass.__createFromPointer(runtime, player).object
end

function ActorClass:__initializeProperties()
    self.properties = {
        model = 'getModel',
        position = 'getPosition',
        rotation = 'getRotation',
        matrix = 'getMatrix',
        vehicle = 'getVehicle',
        moveable = 'isMoveable',
        frozen = 'isFrozen'
    }
end

function ActorClass:setPosition(runtime, x, y, z)
    if (self:__instanceof(x, Vector3Class)) then
        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value
    end

    self.actor:setPosition(x, y, z)
end

function ActorClass:setRotation(runtime, x, y, z)
    if (self:__instanceof(x, Vector3Class)) then
        local vector = x
        x = vector:getX(runtime).value
        y = vector:getY(runtime).value
        z = vector:getZ(runtime).value
    end

    self.actor:setRotation(x, y, z)
end

function ActorClass:setModel(_, model)
    self.actor:setModel(model)
end

function ActorClass:setInterior(_, interior)
    self.actor:setInterior(interior)
end

function ActorClass:setActiveInteriorName(_, name)
    self.actor:setActiveInteriorName(name)
end

function ActorClass:setMoveable(_, moveable)
    self.actor:setMoveable(moveable)
end

function ActorClass:setFrozen(_, frozen)
    self.actor:setFrozen(frozen)
end

function ActorClass:warpInto(_, vehicle, seat)
    if (self:__instanceof(vehicle, VehicleClass)) then
        self.actor:warpIntoVehicle(vehicle.vehicle, seat)
    elseif (self:__instanceof(vehicle, TrainClass)) then
        self.actor:warpIntoVehicle(vehicle.train, seat)
    end
end

function ActorClass:enterVehicle(_, vehicle, seat)
    if (self:__instanceof(vehicle, VehicleClass)) then
        self.actor:enterVehicle(vehicle.vehicle, seat)
    elseif (self:__instanceof(vehicle, TrainClass)) then
        self.actor:enterVehicle(vehicle.train, seat)
    end
end

function ActorClass:removeFromVehicle(_)
    self.actor:removeFromVehicle()
end

function ActorClass:exitVehicle(_)
    self.actor:exitVehicle()
end

function ActorClass:driveTo(_, vehicle, x, y, z, speed, speed2, model, drivingStyle)
    if (self:__instanceof(vehicle, VehicleClass)) then
        self.actor:clearTasks()

        local task = TaskComplexCarDriveToPoint:create(self.actor, vehicle, x, y, z, speed, speed2, model, drivingStyle)

        self.actor:addScriptedTask(task, 1, "TASK_PRIORITY_PRIMARY")
    end
end

function ActorClass:walkTo(_, x, y, z)
    self.actor:clearTasks()

    local task = TaskSimpleGoToPoint:create(self.actor, x, y, z)

    self.actor:addScriptedTask(task, 1, "TASK_PRIORITY_PRIMARY")
end

function ActorClass:giveWeapon(_, weapon, ammo)
    self.actor:giveWeapon(weapon, ammo)
end

function ActorClass:destroy(_)
    self.actor:destroy()
end

function ActorClass:getModel(_)
    return self.runtime:returnNumber(self.actor:getModel())
end

function ActorClass:getPosition(_)
    return Vector3Class.create(self.runtime, self.actor:getPosition())
end

function ActorClass:getRotation(_)
    return Vector3Class.create(self.runtime, self.actor:getRotation())
end

function ActorClass:getMatrix(_)
    return MatrixClass.create(self.runtime, self:getPosition():getObject(), self:getRotation():getObject())
end

function ActorClass:isMoveable(_)
    return self.runtime:returnBoolean(self.actor:isMoveable())
end

function ActorClass:isFrozen(_)
    return self.runtime:returnBoolean(self.actor:isFrozen())
end

function ActorClass:getVehicle(_)
    local vehicle = self.actor:getOccupiedVehicle()

    if (vehicle) then
        return VehicleClass.__createFromPointer(self.runtime, vehicle)
    end

    return self.runtime:returnBoolean(false)
end

function ActorClass:__tostring()
    local x, y, z = self.actor:getPosition()
    local model = self.actor:getModel()

    return "Actor<"..tostring(model)..", "..tostring(x)..", "..tostring(y)..", "..tostring(z)..">"
end

function ActorClass.__preinit(_)

end

Core.mergeInto(ActorClass, AbstractClass)