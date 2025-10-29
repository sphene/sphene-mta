-----------------------------------
-- * Locals (for perfomance)
-----------------------------------


-----------------------------------
-- * Variables
-----------------------------------

ComplexTask = {}
ComplexTask.__index = ComplexTask

-----------------------------------
-- * Functions
-----------------------------------

function ComplexTask:create(ped)
    Task.create(self, ped)

    self.subTask = false
end

function ComplexTask:setSubTask(subTask)
    Logger.debug("COMPLEX_TASK", "Setting subtask {} for task {}", subTask:getName(), self:getName())
    self.subTask = subTask
end

function ComplexTask:removeSubTask()
    Logger.debug("COMPLEX_TASK", "Removing subtask for task {}", self:getName())
    self.subTask = false
end

function ComplexTask:getSubTask()
    return self.subTask
end

function ComplexTask:process()
    if (self.subTask) then
        if (self.subTask:hasFinished()) then
            self.subTask = false
        else
            self.subTask:process()
            return false
        end
    end

    return ComplexTask.parent.process(self)
end

function ComplexTask:getStatus()
    if self.subTask and not self.subTask:hashFinished() then
        return Task.SECONDARY
    end

    return ComplexTask.parent.getStatus(self)
end

Core.mergeInto(ComplexTask, Task)

-----------------------------------
-- * Events
-----------------------------------
