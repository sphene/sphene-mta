-----------------------------------
-- * Variables
-----------------------------------

TaskComplexGoToCarDoorAndStandStill = {}
TaskComplexGoToCarDoorAndStandStill.__index = TaskComplexGoToCarDoorAndStandStill

TaskComplexGoToCarDoorAndStandStill.WALK_TO_DOOR_DISTANCE = 20

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

function TaskComplexGoToCarDoorAndStandStill:createFirstSubTask()
    local ped = self:getPed()
    local walkToDoorDistance = TaskComplexGoToCarDoorAndStandStill.WALK_TO_DOOR_DISTANCE

    if (ped:isInVehicle() or ped:getDistanceFromVehicleEntryPoint(self.car, self.seat) < walkToDoorDistance) then
        return false
    end

    local x, y, z = self.car:getEntryPoint(self.seat)

    -- TODO: Use desired move state instead of hardcoding RUN state
    return TaskSimpleGoToPoint:create(ped, ActorElement.MoveState.RUN, x, y, z, walkToDoorDistance)
end

function TaskComplexGoToCarDoorAndStandStill:createNextSubTask()
    return false
end

function TaskComplexGoToCarDoorAndStandStill:getName()
    return "TASK_COMPLEX_GO_TO_CAR_DOOR_AND_STAND_STILL"
end

Core.mergeInto(TaskComplexGoToCarDoorAndStandStill, ComplexTask)
