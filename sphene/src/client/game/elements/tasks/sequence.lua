-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local activeSequence = nil

-----------------------------------
-- * Variables
-----------------------------------

Sequence = {}
Sequence.__index = Sequence

-----------------------------------
-- * Functions
-----------------------------------

function Sequence:create(actor)
    local mt = setmetatable({}, Sequence)

    mt.tasks = {}
    mt.actor = actor or false
    mt.shouldRepeat = false

    mt.activeTaskIndex = 1
    mt.activeTask = false
    mt.finished = false

    return mt
end

function Sequence:close()
    if activeSequence == self then
        activeSequence = nil
    end
end

function Sequence:clear()
    self.tasks = {}
    self.actor = false
end

function Sequence:registerTask(task, parameters, priority, slot)
    self.tasks[#self.tasks + 1] = {task = task, parameters = parameters, priority = priority, slot = slot}
end

function Sequence:setShouldRepeat(shouldRepeat)
    self.shouldRepeat = shouldRepeat
end

function Sequence:startNextTask()
    if not self.actor then
        return
    end

    if not self.activeTask then
        self.activeTaskIndex = 1

        if #self.tasks == 0 then
            self.finished = true
            return
        end
    end

    self.activeTaskIndex = self.activeTaskIndex + 1

    if self.activeTaskIndex > #self.tasks then
        if self.shouldRepeat then
            self.activeTaskIndex = 1
        else
            self.finished = true
            return
        end
    end

    local task = self.tasks[self.activeTaskIndex]

    self.activeTask = task.task:create(self.actor, unpack(task.parameters))
    self.actor:addScriptedTask(self.activeTask, task.priority, task.slot)
end

function Sequence:process()
    if not self.actor then
        return
    end

    if self.finished then
        return
    end

    if not self.activeTask then
        self:startNextTask()
        return
    end

    if self.activeTask:hasFinished() then
        self:startNextTask()
        return
    end
end

function Sequence:getStatus()
    if self.finished then
        return Task.FINISHED
    end

    if self.activeTask then
        return Task.PERFORMING
    end

    return Task.WAITING
end

function Sequence:getProgress()
    if self.finished then
        return 100
    end

    if not self.activeTask then
        return 0
    end

    return math.abs(100 * (self.activeTaskIndex / #self.tasks))
end

function Sequence.createSequence()
    local sequence = Sequence:create()

    activeSequence = sequence

    return sequence
end

function Sequence.copyForActor(sequence, actor)
    local newSequence = Sequence:create(actor)

    for i, task in ipairs(sequence.tasks) do
        newSequence.tasks[#newSequence.tasks + 1] = task
    end

    newSequence.shouldRepeat = sequence.shouldRepeat

    return newSequence
end

function Sequence.getActiveSequence()
    return activeSequence
end

-----------------------------------
-- * Events
-----------------------------------
