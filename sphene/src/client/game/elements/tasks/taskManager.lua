-----------------------------------
-- * Variables
-----------------------------------

TaskManager = {}
TaskManager.__index = TaskManager

TaskManager.TREE_FINISHED = 0   -- no task left to run, the top-level task is done
TaskManager.TREE_RUNNING = 1    -- the simple task at the bottom is still running
TaskManager.TREE_ADVANCED = 2   -- the simple task finished and the next one is set up, it can run in the same frame

TaskManager.PRIMARY = 1
TaskManager.SECONDARY = 2

-- GTA ePrimaryTasks, from most to least important.
TaskManager.PRIMARY_SLOTS = {
    "TASK_PRIORITY_PHYSICAL_RESPONSE",
    "TASK_PRIORITY_EVENT_RESPONSE_TEMP",
    "TASK_PRIORITY_EVENT_RESPONSE_NONTEMP",
    "TASK_PRIORITY_PRIMARY",
    "TASK_PRIORITY_DEFAULT",
}

-- GTA eSecondaryTask. These all run, next to the primary task.
TaskManager.SECONDARY_SLOTS = {
    "TASK_SECONDARY_ATTACK",
    "TASK_SECONDARY_DUCK",
    "TASK_SECONDARY_SAY",
    "TASK_SECONDARY_FACIAL_COMPLEX",
    "TASK_SECONDARY_PARTIAL_ANIM",
    "TASK_SECONDARY_IK",
}

-- CTaskManager::ManageTasks (0x681C10) runs at most this many simple tasks of the primary task per frame.
-- 0x681C88 checks for 10, but the pass that goes over still runs, hence 11.
TaskManager.MAX_PASSES_PER_FRAME = 11

-----------------------------------
-- * Functions
-----------------------------------

function TaskManager:create(ped)
    local mt = setmetatable({}, TaskManager)

    mt.ped = ped
    mt:flush()

    return mt
end

-- Empties every slot. Empty ones are kept as false, so getTasks lists them all.
function TaskManager:flush()
    self.slots = {
        [TaskManager.PRIMARY] = {},
        [TaskManager.SECONDARY] = {},
    }

    for _, slot in ipairs(TaskManager.PRIMARY_SLOTS) do
        self.slots[TaskManager.PRIMARY][slot] = false
    end

    for _, slot in ipairs(TaskManager.SECONDARY_SLOTS) do
        self.slots[TaskManager.SECONDARY][slot] = false
    end
end

function TaskManager:getTasks(priority)
    return self.slots[priority]
end

function TaskManager:setTask(task, priority, slot)
    local slots = self.slots[priority]

    if not slots or slots[slot] == nil then
        Logger.error("TASK_MANAGER", "Unknown task slot {} with priority {}", tostring(slot), tostring(priority))
        return
    end

    if slots[slot] == task then
        return
    end

    local replacedTask = slots[slot]

    slots[slot] = task or false

    -- The replaced task is gone, so its script task status must read as finished
    if replacedTask and not replacedTask:hasFinished() then
        replacedTask:setFinished()
    end

    if not task then
        return
    end

    self:addSubTasks(task)

    -- The tree doesn't end in a simple task, so there's nothing to run
    if slots[slot] == task and not TaskManager.getSimplestTask(task):isSimple() then
        self:removeTask(task)
    end
end

function TaskManager:removeTask(task)
    for _, slots in pairs(self.slots) do
        for slot, slotTask in pairs(slots) do
            if slotTask == task then
                slots[slot] = false
            end
        end
    end

    if not task:hasFinished() then
        task:setFinished()
    end
end

function TaskManager:getActivePrimarySlot()
    local slots = self.slots[TaskManager.PRIMARY]

    for _, slot in ipairs(TaskManager.PRIMARY_SLOTS) do
        if slots[slot] then
            return slot
        end
    end

    return false
end

function TaskManager.getSimplestTask(task)
    while task:getSubTask() do
        task = task:getSubTask()
    end

    return task
end

-- Adds subtasks down to a simple task
function TaskManager:addSubTasks(task)
    while task and not task:isSimple() do
        task:setStarted()

        local subTask = task:createFirstSubTask() or false

        if subTask then
            task:setSubTask(subTask)
        else
            -- Nothing to do, so it's done and the parent moves on
            task:setFinished()
            self:setNextSubTask(task:getParent())
        end

        task = subTask
    end
end

-- The task's subtask finished: asks it for the next one.
-- If there's none it finishes too, and so on up the tree.
function TaskManager:setNextSubTask(task)
    while task do
        local subTask = task:createNextSubTask() or false

        if subTask then
            task:setSubTask(subTask)
            self:addSubTasks(subTask)
            return
        end

        task:setSubTask(false)

        if not task:hasFinished() then
            task:setFinished()
        end

        task = task:getParent()
    end
end

-- Asks each complex task, top down, which subtask it wants,
-- the first change gets a new branch and ends the pass.
function TaskManager:controlSubTasks(task)
    while task and not task:isSimple() do
        local subTask = task:getSubTask()

        -- No subtask to control, processTaskTree handles a tree that doesn't end in a simple task
        if not subTask then
            return
        end

        local newSubTask = task:controlSubTask() or false

        if newSubTask ~= subTask then
            -- SA ignores the answer too, controlSubTask has to ask before switching
            subTask:makeAbortable(Task.ABORT_PRIORITY_URGENT)

            task:setSubTask(newSubTask)
            self:addSubTasks(newSubTask)
            return
        end

        task = subTask
    end
end

-- One pass over a task tree:
--   1. parents swap subtasks
--   2. the simplest task runs
--   3. once it's done, the next one is set up (the caller runs it in another pass)
function TaskManager:processTaskTree(root, isPrimary)
    self:controlSubTasks(root)

    local task = TaskManager.getSimplestTask(root)

    -- A complex task at the bottom had no subtask.
    -- A primary task asks the parent for the next one once more,
    -- otherwise the tree just finishes.
    if not task:isSimple() then
        if not isPrimary then
            return TaskManager.TREE_FINISHED
        end

        self:setNextSubTask(task:getParent())
        task = TaskManager.getSimplestTask(root)

        if not task:isSimple() then
            return TaskManager.TREE_FINISHED
        end
    end

    -- Task process returns true when the task is done
    if not task:process() then
        return TaskManager.TREE_RUNNING
    end

    task:setFinished()
    self:setNextSubTask(task:getParent())

    -- Nothing left under the root: the tree is done (or the root was the simple task itself)
    if not root:getSubTask() then
        return TaskManager.TREE_FINISHED
    end

    return TaskManager.TREE_ADVANCED
end

-- Every frame, process the active primary task tree, then every secondary task
function TaskManager:manageTasks()
    local slot = self:getActivePrimarySlot()

    if slot then
        local task = self.slots[TaskManager.PRIMARY][slot]

        -- Nothing to run: remove the task and, like SA, the secondary tasks wait until the next frame
        if not TaskManager.getSimplestTask(task):isSimple() then
            self:removeTask(task)
            return
        end

        for _ = 1, TaskManager.MAX_PASSES_PER_FRAME do
            local result = self:processTaskTree(task, true)

            if result == TaskManager.TREE_FINISHED then
                self:removeTask(task)
            end

            if result ~= TaskManager.TREE_ADVANCED then
                break
            end
        end
    end

    local secondarySlots = self.slots[TaskManager.SECONDARY]

    for _, secondarySlot in ipairs(TaskManager.SECONDARY_SLOTS) do
        local task = secondarySlots[secondarySlot]

        if task then
            local result

            -- GTA has no limit here
            repeat
                result = self:processTaskTree(task, false)
            until result ~= TaskManager.TREE_ADVANCED

            if result == TaskManager.TREE_FINISHED then
                self:removeTask(task)
            end
        end
    end
end

-----------------------------------
-- * Events
-----------------------------------
