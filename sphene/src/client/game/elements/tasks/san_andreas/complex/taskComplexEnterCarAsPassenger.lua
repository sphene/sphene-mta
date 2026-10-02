-----------------------------------
-- * Variables
-----------------------------------

TaskComplexEnterCarAsPassenger = {}
TaskComplexEnterCarAsPassenger.__index = TaskComplexEnterCarAsPassenger

-----------------------------------
-- * Functions
-----------------------------------

function TaskComplexEnterCarAsPassenger:create(ped, car, seat)
    local mt = setmetatable({}, TaskComplexEnterCarAsPassenger)

    mt.parent.create(mt, ped)
    mt.car = car
    mt.seat = seat

    return mt
end

function TaskComplexEnterCarAsPassenger:createFirstSubTask()
    local ped = self:getPed()
    local vehicle = ped:getOccupiedVehicle()

    if (self.seat == 0) then
        self.seat = self.car:getFreePassengerSeat() or 1
    end

    if (vehicle == self.car) then
        return false
    end

    if (vehicle) then
        return TaskComplexLeaveCar:create(ped)
    end

    return TaskComplexGoToCarDoorAndStandStill:create(ped, self.car, self.seat)
end

function TaskComplexEnterCarAsPassenger:createNextSubTask()
    -- One attempt to enter the vehicle, like SA
    if (self:getSubTask():is(TaskSimpleEnterCar)) then
        return false
    end

    if (self:getSubTask():is(TaskComplexGoToCarDoorAndStandStill) and not self:getPed():isInVehicle()) then
        return TaskSimpleEnterCar:create(self:getPed(), self.car, self.seat)
    end

    return self:createFirstSubTask()
end

function TaskComplexEnterCarAsPassenger:getName()
    return "TASK_COMPLEX_ENTER_CAR_AS_PASSENGER"
end

Task.register(0x05CA, TaskComplexEnterCarAsPassenger)

Core.mergeInto(TaskComplexEnterCarAsPassenger, ComplexTask)
