-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local taskIds = {}
local tasksToIds = {}

-----------------------------------
-- * Variables
-----------------------------------

Task = {
    WAITING = 0,
    PERFORMING = 1,
    DORMANT = 2,
    VACANT = 3,
    GROUP = 4,
    ATTRACTOR = 5,
    SECONDARY = 6,
    FINISHED = 7,
}

Task.__index = Task

-- GTA eAbortPriority, how badly the caller needs a task to stop (see makeAbortable)
Task.ABORT_PRIORITY_LEISURE = 0
Task.ABORT_PRIORITY_URGENT = 1
Task.ABORT_PRIORITY_IMMEDIATE = 2

-----------------------------------
-- * Functions
-----------------------------------

function Task:create(ped)
    self.scripted = false
    self.started = false
    self.finished = false
    self.ped = ped

    self.parentTask = false

    local id = tasksToIds[getmetatable(self)]

    if id ~= nil and ped then
        ped:registerTask(id, self)
    end

    Logger.info("TASK", "Task {} created", self:getName())
end

-- Called every frame by the task manager for the simple task at the bottom of the tree.
-- Returns true when done and the task manager finishes it.
function Task:process()
    return true
end

-- Simple tasks do the work themselves. Complex tasks return false and give the task manager subtasks instead.
function Task:isSimple()
    return true
end

function Task:getSubTask()
    return false
end

-- The complex task this one is a subtask of, false for a top-level task.
function Task:getParent()
    return self.parentTask
end

-- Asked before the task is replaced.
-- Return false to keep running (never for ABORT_PRIORITY_IMMEDIATE),
-- true after cleaning up (controls, anims).
function Task:makeAbortable(priority)
    return true
end

function Task:setScripted(scripted)
    self.scripted = scripted
end

function Task:setStarted()
    self.started = true
end

function Task:setFinished()
    Logger.info("TASK", "Task {} finished", self:getName())
    self.finished = true
    self.ped:markTaskFinished(self)

    local id = tasksToIds[getmetatable(self)]

    if self.ped and id then
        self.ped:unregisterTask(id, self)
    end
end

function Task:hasStarted()
    return self.started
end

function Task:hasFinished()
    return self.finished
end

function Task:getPed()
    return self.ped
end

function Task:is(class)
    return getmetatable(self) == class
end

function Task:getStatus()
    if self:hasFinished() then
        return Task.FINISHED
    end

    if self:hasStarted() then
        return Task.PERFORMING
    end

    return Task.WAITING
end

function Task:getName()
    return 'TASK_UNKNOWN'
end

function Task:getDebugParameters()
    return {}
end

function Task.register(id, class)
    taskIds[id] = class
    tasksToIds[class] = id
end

function Task.getById(id)
    return taskIds[id]
end

-----------------------------------
-- * Events
-----------------------------------
