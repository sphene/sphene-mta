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

-- Complex tasks work like GTA's CTaskComplex: the task manager always asks them for subtasks, they don't run themselves.
--
-- NOTE: A complex task that does the work itself (like TaskComplexLeaveCar) returns true from isSimple and uses process.
-- GTA never does this (CTaskComplex::IsSimpleTask 0x4211A0 is always false).
-- Such tasks are triggered and handled by MTA/GTA and we only extend upon it.

function ComplexTask:create(ped)
    Task.create(self, ped)

    self.subTask = false
end

function ComplexTask:isSimple()
    return false
end

function ComplexTask:getSubTask()
    return self.subTask
end

-- Called by the task manager only. Tasks pick their subtask by returning it from createFirstSubTask, createNextSubTask
-- or controlSubTask, not by calling this.
function ComplexTask:setSubTask(subTask)
    self.subTask = subTask or false

    if subTask then
        subTask.parentTask = self
    end
end

-- Called when the task starts.
-- Returns the subtask to run first, or false if there's nothing to do (the task finishes).
-- Every complex task must define it.
-- Complex tasks with "isSimple" set are an exception - they do not get called by the task manager.
function ComplexTask:createFirstSubTask()
    error(string.format("%s doesn't define createFirstSubTask", self:getName()), 2)
end

-- Called when the current subtask finishes.
-- Returns the subtask to run next, or false to finish the task.
-- Every complex task must define it.
-- Complex tasks with "isSimple" set are an exception - they do not get called by the task manager.
function ComplexTask:createNextSubTask()
    error(string.format("%s doesn't define createNextSubTask", self:getName()), 2)
end

-- Called every frame.
-- Returns the current subtask to keep it, or a new one to replace it. Before replacing, check
-- subTask:makeAbortable() and keep the current one if it refuses.
function ComplexTask:controlSubTask()
    return self.subTask
end

-- Called when something wants this task to stop.
-- Passes the question to the current subtask, since it's the one doing the work.
-- Without a subtask it always agrees.
function ComplexTask:makeAbortable(priority)
    if self.subTask then
        return self.subTask:makeAbortable(priority)
    end

    return true
end

function ComplexTask:getStatus()
    if self.subTask and not self.subTask:hasFinished() then
        return Task.SECONDARY
    end

    return ComplexTask.parent.getStatus(self)
end

Core.mergeInto(ComplexTask, Task)

-----------------------------------
-- * Events
-----------------------------------
