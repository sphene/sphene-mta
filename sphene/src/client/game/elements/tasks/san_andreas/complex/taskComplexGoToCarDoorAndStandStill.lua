-----------------------------------
-- * Variables
-----------------------------------

TaskComplexGoToCarDoorAndStandStill = {}
TaskComplexGoToCarDoorAndStandStill.__index = TaskComplexGoToCarDoorAndStandStill

-----------------------------------
-- * Functions
-----------------------------------

function TaskComplexGoToCarDoorAndStandStill:create(ped, car, seat)
    local mt = setmetatable({}, TaskComplexGoToCarDoorAndStandStill)

    mt.parent.create(mt, ped)
    mt.car = car
    mt.seat = seat

    return mt
end

function TaskComplexGoToCarDoorAndStandStill:process()
    if (TaskComplexGoToCarDoorAndStandStill.parent.process(self)) then
        if (self:getPed():isInVehicle()) then
            self:setFinished()
        end

        local distance = self:getPed():getDistanceFromVehicleEntryPoint(self.car, self.seat)

        if (distance < 1) then
            self:setFinished()
        else
            local x, y, z = self.car:getEntryPoint(self.seat)

            self:setSubTask(TaskSimpleGoToPoint:create(self:getPed(), x, y, z))
        end
    end
end

function TaskComplexGoToCarDoorAndStandStill:getName()
    return "TASK_COMPLEX_GO_TO_CAR_DOOR_AND_STAND_STILL"
end

Core.mergeInto(TaskComplexGoToCarDoorAndStandStill, ComplexTask)
