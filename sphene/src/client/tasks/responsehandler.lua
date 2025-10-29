-----------------------------------
-- * Variables
-----------------------------------

ResponseHandler = {}
ResponseHandler.__index = ResponseHandler
ResponseHandler.lastTask = 0

-----------------------------------
-- * Functions
-----------------------------------

function ResponseHandler.retry(failureState)
    taskId = ResponseHandler.lastTask

    if (TaskHandler.tasks[taskId] == nil) then
        return false
    end

    local task = TaskHandler.tasks[taskId].task

    if (TaskHandler.tasks[taskId].retries >= TaskHandler.tasks[taskId].maxRetries) then
        Logger.error('RESPONSE HANDLER', 'Task {} with ID {} for thread {} has failed. Pausing all threads.', task, taskId, TaskHandler.tasks[taskId].thread)

        if (failureState ~= nil) then
            Logger.error('RESPONSE HANDLER', failureState.message)
        end

        Core.stop()

        return false
    end

    TaskHandler.tasks[taskId].retrying = true

    if (TaskHandler.tasks[taskId].thread) then
        Logger.error('RESPONSE HANDLER', 'Task {} with ID {} for thread {} has failed. Retrying [{} of {}].', task, taskId, TaskHandler.tasks[taskId].thread, TaskHandler.tasks[taskId].retries + 1, TaskHandler.tasks[taskId].maxRetries)

        if (failureState ~= nil) then
            Logger.error('RESPONSE HANDLER', failureState.message)
        end

        TaskHandler.tasks[taskId].retries = TaskHandler.tasks[taskId].retries + 1

        setTimer(function()
            if (TaskHandler.tasks[taskId] ~= nil) then
                triggerServerEvent("sphene:task", resourceRoot, task, taskId,
                    unpack(TaskHandler.tasks[taskId].params))
                TaskHandler.tasks[taskId].retrying = false
            end
        end, 500, 1)
    end

    return true
end

function ResponseHandler.onHandleResponse(taskId, failureState, ...)
    taskId = tostring(taskId)

    if (Game.running()) then
        if (TaskHandler.tasks[taskId] == nil) then
            Logger.error('RESPONSE HANDLER', 'Task with ID {}.', taskId)
            return
        end

        ResponseHandler.lastTask = taskId

        TaskHandler.tasks[taskId].retrying = false

        if (failureState.failed) then
            ResponseHandler.retry(failureState)
            return
        end

        local callback = TaskHandler.tasks[taskId].callback

        if (callback ~= nil) then
            callback(taskId, unpack(arg))

            if (TaskHandler.tasks[taskId].retrying) then
                TaskHandler.tasks[taskId].retrying = false
                return
            end
        end
    end

    TaskHandler.tasks[taskId] = nil
end

-----------------------------------
-- * Events
-----------------------------------

addEvent("sphene:task:response", true)
addEventHandler("sphene:task:response", resourceRoot, ResponseHandler.onHandleResponse)