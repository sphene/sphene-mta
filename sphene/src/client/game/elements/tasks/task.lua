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

-----------------------------------
-- * Functions
-----------------------------------

function Task:create(ped)
    self.scripted = false
    self.started = false
    self.finished = false
    self.ped = ped

    if tasksToIds[self] ~= nil and ped then
        ped:registerTask(tasksToIds[self], self)
    end

    Logger.info("TASK", "Task {} created", self:getName())
end

function Task:process()
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

    if self.ped and tasksToIds[self] then
        self.ped:unregisterTask(tasksToIds[self])
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
    return {
        {
            name = "ped",
            type = "element:ped",
        }
    }
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
