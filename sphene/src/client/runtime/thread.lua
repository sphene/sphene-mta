-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _coroutine_create = coroutine.create
local _coroutine_resume = coroutine.resume
local _coroutine_status = coroutine.status
local _coroutine_yield = coroutine.yield
local _math_random = math.random
local _os_clock = os.clock
local _setmetatable = setmetatable
local _getTickCount = getTickCount
local _dxCreateRenderTarget = dxCreateRenderTarget
local _dxSetRenderTarget = dxSetRenderTarget
local _dxSetBlendMode = dxSetBlendMode
local _isElement = isElement
local _destroyElement = destroyElement
local _pairs = pairs
local _unpack = unpack
local _type = type
local _dxDrawImage = dxDrawImage

-----------------------------------
-- * Variables
-----------------------------------

Thread = {}
Thread.__index = Thread

Thread.threadTable = false
Thread.currentThread = nil
Thread.performStep = false
Thread.failSafeTick = 0
Thread.threadCount = 0

-----------------------------------
-- * Functions
-----------------------------------

function Thread:create(position, isMission, originalThread)
    isMission = isMission or false

    local mt = _setmetatable({}, Thread)
    mt.startPosition = position
    mt.position = position
    mt.shouldKeepAlive = true
    mt.insideIf = false
    mt.lastResult = nil
    mt.createdBy = false
    mt.name = "UNKNOWN"
    mt.externalScriptId = -1
    mt.sleeping = false
    mt.sleepEndTick = -1
    mt.endFrame = false
    mt.counter = 0
    mt.lastOpcode = 0
    mt.isMission = isMission
    mt.isMain = (Thread.threadTable == false) and true or false
    mt.lastTickUpdate = _getTickCount()
    mt.originalThread = originalThread
    mt.renderTarget = false
    mt.lastUpdateTick = 0
    mt.lastExecutionTime = 0
    mt.cleanupList = _setmetatable({}, {__len = function() return 200 end})
    mt.stack = _setmetatable({}, {__len = function() return 100 end})
    mt.frameElements = _setmetatable({}, {__len = function() return 33 end})
    mt.executeOpcode = false
    mt.prev = false
    mt.next = false

    mt.ifData = {
        ["ifType"] = 0,
        ["parameterCount"] = 0,
        ["paramData"] = _setmetatable({}, {__len = function() return 10 end})
    }

    mt.rand = _math_random()
    mt.localVars = _setmetatable({}, {__len = function() return 100 end})

    local startTick = 0

    mt.thread = _coroutine_create(function()
        Thread.yield()
        mt.lastTickUpdate = _getTickCount()
        mt:setLocalVar(32, 0)
        mt:setLocalVar(33, 0)
        startTick = _os_clock()

        local nextOpcode = Script.nextOpcode

        while (nextOpcode() and mt.shouldKeepAlive) do
            if (mt.executeOpcode ~= false) then
                opcodes[mt.executeOpcode["opcode"]](_unpack(mt.executeOpcode["params"]))
                mt.executeOpcode = false
            end

            if ((_getTickCount() - Thread.failSafeTick) > 10000) then
                Logger.error('THREAD', 'PANIC: Infinite loop detected in {}', mt:getName())
                local thread = Thread.threadTable

                while (thread ~= false) do
                    thread:sleep()
                    thread = thread.next
                end
                return
            end

            if (mt.endFrame or mt.sleeping or Thread.performStep) then
                mt.endFrame = false
                mt.counter = 0

                mt.lastExecutionTime = (_os_clock() - startTick) * 1000
                Thread.yield()

                FrameElement.endFrame(mt)

                startTick = _os_clock()
            end

            mt.counter = mt.counter + 1
            mt:setLocalVar(32, mt:getLocalVar(32) + (_getTickCount() - mt.lastTickUpdate))
            mt:setLocalVar(33, mt:getLocalVar(33) + (_getTickCount() - mt.lastTickUpdate))
            mt.lastTickUpdate = _getTickCount()
        end

        if (mt.externalScriptId ~= -1) then
            Logger.debug('THREAD', 'Thread with external script {} has finished', mt.externalScriptId)
        else
            Logger.debug('THREAD', 'Thread {} has finished', mt:getName())
        end

        FrameElement.destroyAll(mt)

        if (mt.prev) then
            mt.prev.next = mt.next
        end

        if (mt.next) then
            mt.next.prev = mt.prev
        end

        Thread.threadCount = Thread.threadCount - 1
    end)

    if (Thread.threadTable == false) then
        Thread.threadTable = mt
    else
        mt.next = Thread.threadTable

        Thread.threadTable.prev = mt
        Thread.threadTable = mt
    end

    Thread.threadCount = Thread.threadCount + 1

    return mt
end

function Thread:setPosition(position)
    self.position = position
end

function Thread:getPosition()
    return self.position
end

function Thread:setLastResult(lastResult)
    self.lastResult = lastResult
end

function Thread:getLastResult()
    return self.lastResult
end

function Thread:setKeepAlive(shouldKeepAlive)
    self.shouldKeepAlive = shouldKeepAlive
end

function Thread:setLocalVar(pointer, var)
    self.localVars[pointer] = var
end

function Thread:setName(name)
    self.name = name
end

function Thread:getLocalVar(pointer)
    if (self.localVars[pointer] == nil) then
        return 0
    end

    return self.localVars[pointer]
end

function Thread:getName()
    return self.name
end

function Thread:getThreadPointer()
    return self.thread
end

function Thread:getLastExecutionTime()
    return self.lastExecutionTime
end

function Thread:getLastOpcode()
    return self.lastOpcode
end

function Thread:addToCleanupList(element)
    self.cleanupList[#self.cleanupList + 1] = element
end

function Thread:removeFromCleanupList(element)
    for index, checkElement in _pairs(self.cleanupList) do
        if (checkElement == element) then
            self.cleanupList[index] = nil
            return
        end
    end
end

function Thread:clearCleanupList()
    self.cleanupList = {}
end

function Thread:getCleanupList()
    return self.cleanupList
end

function Thread:isElementOnCleanupList(element)
    for index,checkElement in _pairs(self.cleanupList) do
        if (checkElement == element) then
            return true
        end
    end

    return false
end

function Thread.run()
    if (Thread.threadTable == false) then
        return
    end

    local thread = Thread.threadTable
    local getThreadPointer = Thread.getThreadPointer

    local activeMission = false

    while (thread ~= false) do
        local isMissionThread = thread.isMission
        local isMain = thread.isMain
        local isSleeping = thread.sleeping

        if (isMissionThread) then
            activeMission = thread
        end

        local threadPointer = getThreadPointer(thread)
        local coroutineStatus = _coroutine_status(threadPointer)

        if (isSleeping) then
            if (_getTickCount() > thread.sleepEndTick
                and thread.sleepEndTick ~= -1) then
                thread.sleeping = false
            end
        end

        if (coroutineStatus ~= "dead") then
            if (coroutineStatus ~= "running"
                and coroutineStatus ~= "normal"
                and isSleeping == false) then
                Thread.currentThread = thread

                if (isMissionThread or isMain) then
                    if (thread.renderTarget == false) then
                        thread.renderTarget = _dxCreateRenderTarget(Game.screenWidth,
                            Game.screenHeight, true)
                    end

                    if (thread.renderTarget) then
                        _dxSetRenderTarget(thread.renderTarget, true)
                        _dxSetBlendMode("modulate_add")
                    end
                end

                Thread.failSafeTick = _getTickCount()

                _coroutine_resume(threadPointer)

                if (isMissionThread or isMain) then
                    _dxSetBlendMode("blend")
                    _dxSetRenderTarget()
                    thread.lastTickUpdate = _getTickCount()
                end
            end
        end

        if (isMissionThread or isMain) then
            _dxDrawImage(0, 0, Game.screenWidth, Game.screenHeight, thread.renderTarget)
        end

        if (coroutineStatus == "dead" or (not thread:isSleeping() and not thread:keepAlive())) then
            FrameElement.destroyAll(thread)

            if (thread.prev) then
                thread.prev.next = thread.next
            end

            if (thread.next) then
                thread.next.prev = thread.prev
            end

            if (Thread.threadTable == thread) then
                Thread.threadTable = thread.next or false
            end

            Thread.currentThread = nil
        end

        thread = thread.next
    end

    if (config('mode') == 'benchmark') then
        Discord.setState('Benchmarking')
        Discord.setMissionName()
    elseif (config('mode') == 'sandbox') then
        Discord.setState('Running sandbox')
        Discord.setMissionName()
    else
        if (activeMission and threadToMission[activeMission.name:upper()]) then
            Discord.setMissionName(threadToMission[activeMission.name:upper()])
        else
            Discord.setMissionName()
        end
    end

    Thread.performStep = false
end

function Thread:yield()
    _coroutine_yield()
end

function Thread:isSleeping()
    if (_getTickCount() > self.sleepEndTick
        and self.sleepEndTick ~= -1) then
        self.sleeping = false
    end

    return self.sleeping
end

function Thread:isMissionThread()
    return self.isMission
end

function Thread:isExternalScript()
    return self.externalScriptId ~= -1
end

function Thread:sleep(sleepTime)
    sleepTime = sleepTime or -1

    self.sleeping = true

    if (sleepTime == -1) then
        self.sleepEndTick = -1
    else
        self.sleepEndTick = _getTickCount() + sleepTime

        if (sleepTime > 0) then
            if (_isElement(Thread.renderTarget)) then
                _destroyElement(Thread.renderTarget)
                Thread.renderTarget = false
            end
        end
    end
end

function Thread:wake()
    self.sleeping = false
end

function Thread:gosub(pointer)
    self.stack[#self.stack + 1] = self:getPosition()
    self:setPosition(pointer)
end

function Thread:doReturn()
    if (#self.stack > 0) then
        local position = self.stack[#self.stack]
        self.stack[#self.stack] = nil
        self:setPosition(position)
    end
end

function Thread:keepAlive()
    return self.shouldKeepAlive
end

function Thread.getThreadsFromName(name)
    local thread = Thread.threadTable
    local threads = {}

    while (thread ~= false) do
        if (_type(thread:getName()) == "string" and _type(name) == "string") then
            if (thread:getName():lower() == name:lower()) then
                if (thread:keepAlive() and _coroutine_status(thread:getThreadPointer()) ~= "dead") then
                    threads[#threads + 1] = thread
                end
            end
        end

        thread = thread.next
    end

    return threads
end

function Thread.getThreadsFromExternalScriptId(externalScriptId)
    local thread = Thread.threadTable
    local threads = {}

    while (thread ~= false) do
        if (thread.externalScriptId == externalScriptId) then
            if (thread:keepAlive() and _coroutine_status(thread:getThreadPointer()) ~= "dead") then
                threads[#threads + 1] = thread
            end
        end

        thread = thread.next
    end

    return threads
end

function Thread.onStartMission(_, mission)
    Thread.threadTable.executeOpcode = {
        ["opcode"] = 0x0417,
        ["params"] = {
            tonumber(mission)
        }
    }
end

-----------------------------------
-- * Events
-----------------------------------

addCommandHandler("startmission", Thread.onStartMission)