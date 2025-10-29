-----------------------------------
-- * Variables
-----------------------------------

TaskHandler = {}
TaskHandler.__index = TaskHandler

TaskHandler.tasks = {}

-----------------------------------
-- * Functions
-----------------------------------

function TaskHandler.sendTask(callback, task, ...)
    local taskId = createRandomHash(8)

    while (TaskHandler.tasks[taskId] ~= nil) do
        taskId = createRandomHash(8)
    end

    local thread = false

    if (Thread.currentThread) then
        thread = Thread.currentThread:getName()
    end

    TaskHandler.tasks[taskId] = {
        ["callback"] = callback,
        ["task"] = task,
        ["retries"] = 0,
        ["maxRetries"] = 5,
        ["params"] = {unpack(arg)},
        ["timeout"] = -1,
        ["retrying"] = false,
        ["thread"] = thread
    }

    Logger.debug('TASK HANDLER', 'Task {} with ID {} created.', task, taskId)

    triggerServerEvent("sphene:task", resourceRoot, task, taskId, unpack(arg))
    return taskId
end

function TaskHandler.sendTaskAndYield(callback, task, timeout, ...)
    local responseReceived = false
    local args = {}
    local tick = getTickCount()
    local originalThread = Thread.currentThread

    timeout = timeout * 1000

    local responseHandler = function(taskId, ...)
        args = {unpack(arg)}

        TaskHandler.tasks[taskId].retrying = false

        if (callback ~= nil) then
            callback(unpack(args))
        end

        if (TaskHandler.tasks[taskId] ~= nil) then
            if (TaskHandler.tasks[taskId].retrying) then
                return
            end
        end

        responseReceived = true
    end

    local taskId = TaskHandler.sendTask(responseHandler, task, unpack(arg))

    TaskHandler.tasks[taskId]["timeout"] = timeout

    while (((not responseReceived and ((getTickCount() < (tick + timeout)) or timeout == 0))
        or Thread.currentThread ~= originalThread)
        and TaskHandler.getTaskFromId(taskId) ~= nil) do
        Thread.yield()
    end

    if ((getTickCount() < (tick + timeout))) then
        Logger.error('TASK HANDLER', 'Task {} timed out! Pausing all threads.', taskId)
        Core.stop()
    end

    TaskHandler.tasks[taskId] = nil

    return responseReceived
end

function TaskHandler.getTasks()
    return TaskHandler.tasks
end

function TaskHandler.getTaskFromId(taskId)
    return TaskHandler.tasks[taskId]
end