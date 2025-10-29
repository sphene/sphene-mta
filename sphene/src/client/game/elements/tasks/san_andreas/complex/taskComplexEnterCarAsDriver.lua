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

    return mt
end

function TaskComplexEnterCarAsDriver:process()
    if (TaskComplexEnterCarAsDriver.parent.process(self)) then
        if (not self:getPed():isInVehicle()) then
            local distance = self:getPed():getDistanceFromVehicleEntryPoint(self.car, 0)

            if (distance > 20) then
                self:setSubTask(TaskComplexGoToCarDoorAndStandStill:create(self:getPed(), self.car, 0))
            else
                self:getPed():enterVehicle(self.car, 0)
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

function TaskComplexEnterCarAsDriver:getName()
    return "TASK_COMPLEX_ENTER_CAR_AS_DRIVER"
end

Task.register(0x05CB, TaskComplexEnterCarAsDriver)

Core.mergeInto(TaskComplexEnterCarAsDriver, ComplexTask)
