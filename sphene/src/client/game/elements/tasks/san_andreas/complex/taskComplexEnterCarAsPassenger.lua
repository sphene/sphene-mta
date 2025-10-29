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

function TaskComplexEnterCarAsPassenger:process()
    if (TaskComplexEnterCarAsPassenger.parent.process(self)) then
        if (not self:getPed():isInVehicle()) then
            local distance = self:getPed():getDistanceFromVehicleEntryPoint(self.car, self.seat)

            if (distance >= 1) then
                self:setSubTask(TaskComplexGoToCarDoorAndStandStill:create(self:getPed(), self.car, self.seat))
            else
                self:getPed():enterVehicle(self.car, self.seat)
            end
        elseif (self:getPed():getOccupiedVehicle() ~= self.car) then
            if (not self:getPed():isLeavingCar()) then
                self:setSubTask(TaskComplexLeaveCar:create(self:getPed()))
            end
        else
            self:setFinished()
        end
    end
end

function TaskComplexEnterCarAsPassenger:getName()
    return "TASK_COMPLEX_ENTER_CAR_AS_PASSENGER"
end

Task.register(0x05CB, TaskComplexEnterCarAsPassenger)

Core.mergeInto(TaskComplexEnterCarAsPassenger, ComplexTask)
