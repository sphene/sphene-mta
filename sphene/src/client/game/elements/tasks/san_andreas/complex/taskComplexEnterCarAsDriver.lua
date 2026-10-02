-----------------------------------
-- * Variables
-----------------------------------

TaskComplexEnterCarAsDriver = {}
TaskComplexEnterCarAsDriver.__index = TaskComplexEnterCarAsDriver

-----------------------------------
-- * Functions
-----------------------------------

function TaskComplexEnterCarAsDriver:create(ped, car)
    local mt = setmetatable({}, TaskComplexEnterCarAsDriver)

    mt.parent.create(mt, ped)
    mt.car = car
    mt.seat = 0

    return mt
end

function TaskComplexEnterCarAsDriver:createFirstSubTask()
    local ped = self:getPed()
    local vehicle = ped:getOccupiedVehicle()

    if (vehicle == self.car) then
        return false
    end

    if (vehicle) then
        return TaskComplexLeaveCar:create(ped)
    end

    return TaskComplexGoToCarDoorAndStandStill:create(ped, self.car, self.seat)
end

function TaskComplexEnterCarAsDriver:createNextSubTask()
    -- One attempt to enter the vehicle, like SA
    if (self:getSubTask():is(TaskSimpleEnterCar)) then
        return false
    end

    if (self:getSubTask():is(TaskComplexGoToCarDoorAndStandStill) and not self:getPed():isInVehicle()) then
        return TaskSimpleEnterCar:create(self:getPed(), self.car, self.seat)
    end

    return self:createFirstSubTask()
end

function TaskComplexEnterCarAsDriver:getName()
    return "TASK_COMPLEX_ENTER_CAR_AS_DRIVER"
end

Task.register(0x05CB, TaskComplexEnterCarAsDriver)

Core.mergeInto(TaskComplexEnterCarAsDriver, ComplexTask)
