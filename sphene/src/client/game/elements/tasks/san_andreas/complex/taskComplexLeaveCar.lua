-----------------------------------
-- * Variables
-----------------------------------

TaskComplexLeaveCar = {}
TaskComplexLeaveCar.__index = TaskComplexLeaveCar

-----------------------------------
-- * Functions
-----------------------------------

function TaskComplexLeaveCar:create(ped, force)
    local mt = setmetatable({}, TaskComplexLeaveCar)

    mt.parent.create(mt, ped)

    mt.force = force == true
    mt.exitStarted = false

    return mt
end

-- The game's own task has the subtasks, so the task manager runs this one like a simple task.
-- Not how GTA does it (see ComplexTask).
function TaskComplexLeaveCar:isSimple()
    return true
end

function TaskComplexLeaveCar:process()
    local ped = self:getPed()

    if not self:hasStarted() then
        self:setStarted()

        if ped:isInVehicle() then
            ped:exitVehicle(self.force)
            return false
        end
    end

    if not ped:isInVehicle() then
        return true
    end

    if isPedDoingTask(ped.element, "TASK_COMPLEX_LEAVE_CAR") then
        self.exitStarted = true
        return false
    end

    return self.exitStarted
end

function TaskComplexLeaveCar:getName()
    return "TASK_COMPLEX_LEAVE_CAR"
end

Core.mergeInto(TaskComplexLeaveCar, ComplexTask)
