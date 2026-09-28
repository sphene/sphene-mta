-----------------------------------
-- * Variables
-----------------------------------

TaskSimpleEnterCar = {}
TaskSimpleEnterCar.__index = TaskSimpleEnterCar

-----------------------------------
-- * Functions
-----------------------------------

function TaskSimpleEnterCar:create(ped, car, seat)
    local mt = setmetatable({}, TaskSimpleEnterCar)

    mt.parent.create(mt, ped)

    mt.car = car
    mt.seat = seat
    mt.enterStarted = false

    return mt
end

function TaskSimpleEnterCar:process()
    local ped = self:getPed()

    if not self:hasStarted() then
        self:setStarted()

        if not ped:isInVehicle() then
            ped:stopMoving()
        end
    end

    if ped:getOccupiedVehicle() == self.car then
        return true
    end

    if ped:getVehicleBeingEntered() then
        self.enterStarted = true
    elseif self.enterStarted then
        -- The game's task ended with the ped still outside, the parent task decides what's next
        return true
    else
        ped:enterVehicle(self.car, self.seat)
    end

    return false
end

function TaskSimpleEnterCar:getName()
    return "TASK_SIMPLE_ENTER_CAR"
end

Core.mergeInto(TaskSimpleEnterCar, SimpleTask)
