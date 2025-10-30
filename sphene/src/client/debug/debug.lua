-----------------------------------
-- * Locals
-----------------------------------

local screenWidth, _ = guiGetScreenSize()

local _nextOpcode = false
local _getTickCount = false
local _recording = false
local _threadRun = false

local ctrlHold = false
local threadsFile = false
local tickDifference = 0
local pauseTickStart = 0
local pauseData = {}
local frameCount = 1

local frames = {}
local opcodes = {}
local elements = {}

local previewElements = {}

local cameraTarget = false

-----------------------------------
-- * Variables
-----------------------------------

Debug = {}
Debug.__index = Debug

Debug.paused = false
Debug.stepFrame = false
Debug.loaded = false
Debug.infoShowing = true

-----------------------------------
-- * Functions
-----------------------------------

function Debug.start()
    addEventHandler('onClientKey', root, Debug.onKey)

    _getTickCount = getTickCount
    getTickCount = Debug.getTickCount

    Debug.loaded = true

    Console.setup()
end

function Debug.scriptLoaded()
    if (_nextOpcode ~= false) then
        return
    end

    if (Script.nextOpcode) then
        _nextOpcode = Script.nextOpcode
        Script.nextOpcode = Debug.nextOpcode
    end

    if (Thread.run) then
        _threadRun = Thread.run
        Thread.run = Debug.onThreadRun
    end
end

function Debug.stop()
    removeEventHandler('onClientKey', root, Debug.onKey)

    Debug.stopRecord()

    getTickCount = _getTickCount

    if (_nextOpcode) then
        Script.nextOpcode = _nextOpcode
        _nextOpcode = false
    end

    if (_threadRun) then
        Thread.run = _threadRun
        _threadRun = false
    end

    Debug.loaded = false
end

function Debug.record()
    if (_recording) then
        return
    end

    _recording = true

    frames = {}
    frameCount = 1
    opcodes = {}

    Debug.setupFrameData(frameCount)

    Overlay.triggerEvent('onDebugStatusUpdate', { recording = _recording })

    if (fileExists('threads.txt')) then
        fileDelete('threads.txt')
    end

    threadsFile = fileCreate('threads.txt')
end

function Debug.stopRecord()
    if (not _nextOpcode or not _recording) then
        return
    end

    Thread.newFrameCallback = false

    fileClose(threadsFile)

    _recording = false

    Overlay.triggerEvent('onDebugStatusUpdate', { recording = _recording })
    Debug.pause()
end

function Debug.onThreadRun()
    if not _threadRun or not Thread.threadTable then
        return
    end

    _threadRun()

    local frame = frames[frameCount]

    if not frame then
        return
    end

    for _, vehicle in pairs(VehicleElement:all()) do
        local model = vehicle:getModel()

        if model > -1 then
            frame.elements[vehicle.id] = {
                type = 'vehicle',
                model = model,
                position = { vehicle:getPosition() },
                rotation = { vehicle:getRotation() },
            }
        end
    end

    for _, actor in pairs(ActorElement:all()) do
        local model = actor:getModel()

        if type(model) == 'number' and model > -1 then
            frame.elements[actor.id] = {
                type = 'actor',
                model = model,
                position = { actor:getPosition() },
                rotation = { actor:getRotation() },
                animation = { actor:getAnimation() },
            }
        end
    end

    frameCount = frameCount + 1

    Debug.setupFrameData(frameCount)
end

function Debug.setupFrameData(frame)
    frames[frame] = {
        elements = {}
    }
end

function Debug.prettifyTable(tbl)
    if tbl.getId == nil or tbl.getType == nil then
        return tbl
    end

    return string.upper(tbl:getType())..":"..tbl:getId()
end

function Debug.nextOpcode()
    if (not _recording) then
        return _nextOpcode()
    end

    if (not _nextOpcode) then
        return
    end

    local currentThread = Thread.currentThread
    local position = currentThread.position

    if (position == nil or Script.getMainOffset() == nil) then
        _nextOpcode()

        return true
    end

    local opcode = Script.getOptimizedScript()[(position - Script.getMainOffset()) + 1]

    if (opcode and opcode.debug.paramString) then
        local parameters = {}

        for i, param in ipairs(opcode.debug.paramString()) do
            local opcodeParam = opcode.debug.paramsData[i]

            if (type(opcodeParam.value) == 'string') then
                parameters[i] = {
                    type = 'string',
                    value = opcodeParam.value,
                }
            else
                parameters[i] = {
                    type = 'number',
                    value = param,
                }
            end
        end

        local opcodeData = {
            thread = currentThread.name,
            frame = frameCount,
            opcode = opcode.opcode,
            example = opcode.debug.example:gsub('%%(%d+)([a-z])%%', '$%1'),
            parameters = parameters,
        }

        --[[if (threadsFile) then
            fileWrite(threadsFile, toJSON(opcodeData, false, 'spaces').."\n")
        end]]

        opcodes[#opcodes + 1] = opcodeData
    end

    if (opcode and opcode.debug.paramString) then
        local opcodeString = opcode.debug.example

        for i, param in ipairs(opcode.debug.paramString()) do
            local opcodeParam = opcode.debug.paramsData[i]

            if type(param) == 'table' then
                param = Debug.prettifyTable(param)
            end

            if (type(opcodeParam.value) == "table" and opcodeParam.value.pointer ~= nil) then
                if ((opcodeParam.value.type or -1) == 0) then
                    if (opcodeParam.value.pointer < 0) then
                        param = '$'..(-opcodeParam.value.pointer)..'('..tostring(param)..')'
                    else
                        param = '$'..opcodeParam.value.pointer..'('..tostring(param)..')'
                    end
                else
                    param = opcodeParam.value.pointer..'@('..tostring(param)..')'
                end
            elseif (type(opcodeParam.value) == "table" and opcodeParam.value.index ~= nil) then
                local indexParam

                if (opcodeParam.value.flags >= 0 and opcodeParam.value.flags <= 0x3) then
                    indexParam = opcodeParam.value.index.."@"
                elseif (opcodeParam.value.flags >= 0x80 and opcodeParam.value.flags <= 0x83) then
                    if (opcodeParam.value.index < 0) then
                        indexParam = "$"..(-opcodeParam.value.index)
                    else
                        indexParam = "$"..opcodeParam.value.index
                    end
                else
                    indexParam = opcodeParam.value.index
                end

                if ((opcodeParam.value.type or -1) == 0) then
                    if (opcodeParam.value.offset < 0) then
                        param = '$'..(-opcodeParam.value.offset)..'['..indexParam..']('..tostring(param)..')'
                    else
                        param = '$'..opcodeParam.value.offset..'['..indexParam..']('..tostring(param)..')'
                    end
                else
                    param = opcodeParam.value.offset..'@['..indexParam..']('..tostring(param)..')'
                end
            elseif (type(opcodeParam.value) == 'string') then
                param = '\''..opcodeParam.value..'\''
            elseif (type(opcodeParam.value) == 'number') then
                if (currentThread:isMissionThread() or currentThread:isExternalScript()) then
                    opcodeString = opcodeString:gsub('%%'..i..'p%%', '@'..currentThread.name..'_'..(-param))
                else
                    opcodeString = opcodeString:gsub('%%'..i..'p%%', '@'..currentThread.name..'_'..(param - currentThread.startPosition))
                end

                opcodeString = opcodeString:gsub('%%'..i..'o%%', '#'..(Script.objectsById[math.abs(opcodeParam.value - 1)] or 'UNKNOWN'))
                opcodeString = opcodeString:gsub('%%'..i..'m%%', '#'..(Script.objectsById[math.abs(opcodeParam.value - 1)] or 'UNKNOWN'))
            end

            opcodeString = opcodeString:gsub('%%'..i..'[a-z]%%', param)
        end

        local _partiallyImplemented = Script.setOpcodePartiallyImplemented
        local _unimplemented = Script.setOpcodeUnimplemented

        local implementationStatus = 0

        Script.setOpcodePartiallyImplemented = function()
            implementationStatus = 1
            return _partiallyImplemented()
        end

        Script.setOpcodeUnimplemented = function()
            implementationStatus = 2
            return _unimplemented()
        end

        _nextOpcode()

        local result = currentThread:getLastResult()
        local resultLine = ""

        if (#Thread.currentThread.ifData["paramData"] > 0) then
            result = Thread.currentThread.ifData["paramData"][#Thread.currentThread.ifData["paramData"]]
        end

        Script.setOpcodePartiallyImplemented = _partiallyImplemented
        Script.setOpcodeUnimplemented = _unimplemented

        if (result ~= nil) then
            resultLine = "(return: "..tostring(result)..") "
        end

        if (implementationStatus == 1) then
            resultLine = "(PARTIALLY IMPLEMENTED) "..resultLine
        elseif (implementationStatus == 2) then
            resultLine = "(UNIMPLEMENTED) "..resultLine
        end

        fileWrite(threadsFile, "["..(currentThread.name or 'UNKNOWN').."]: "..resultLine..string.format("%.4X", opcode.opcode)..": "..opcodeString.."\n")

        return true
    end

    return _nextOpcode()
end

function Debug.pause()
    if (Debug.paused) then
        return
    end

    Logger.info('DEBUG', 'Pausing')

    pauseTickStart = _getTickCount()

    pauseData.functions = {
        Game = {
            render = Game.render,
            preRender = Game.preRender,
            hudRender = Game.hudRender,
        },
        Script = {
            nextOpcode = Script.nextOpcode,
        },
    }

    Game.removeEvents()

    for className, functions in pairs(pauseData.functions) do
        for name, func in pairs(functions) do
            _G[className][name] = function() end
        end
    end

    elements = {}

    for _, element in ipairs(getElementsByType('vehicle')) do
        elements[#elements + 1] = {
            element = element,
            frozen = isElementFrozen(element),
            collisionsEnabled = getElementCollisionsEnabled(element),
            velocity = { getElementVelocity(element) },
            turnVelocity = { getElementAngularVelocity(element) },
            position = { getElementPosition(element) },
            rotation = { getElementRotation(element) },
        }

        setElementFrozen(element, true)
    end

    for _, element in ipairs(getElementsByType('actor')) do
        elements[#elements + 1] = {
            element = element,
            frozen = isElementFrozen(element),
            collisionsEnabled = getElementCollisionsEnabled(element),
            velocity = { getElementVelocity(element) },
            turnVelocity = { getElementAngularVelocity(element) },
            position = { getElementPosition(element) },
            rotation = { getElementRotation(element) },
        }

        setElementFrozen(element, true)
    end

    Debug.paused = true

    addEventHandler("onClientPreRender", getRootElement(resourceRoot), Debug.preRender)
    addEventHandler("onClientHUDRender", getRootElement(resourceRoot), Debug.hudRender)
    addEventHandler("onClientRender", getRootElement(resourceRoot), Debug.render)

    cameraTarget = getCameraTarget()

    Freecam.enable()

    Logger.debug('DEBUG', 'Pausing')

    Overlay.triggerEvent('onDebugStatusUpdate', { paused = Debug.paused })
end

function Debug.resume()
    if (not Debug.paused) then
        return
    end

    Logger.info('DEBUG', 'Resuming')

    Freecam.disable()

    removeEventHandler("onClientPreRender", getRootElement(resourceRoot), Debug.preRender)
    removeEventHandler("onClientHUDRender", getRootElement(resourceRoot), Debug.hudRender)
    removeEventHandler("onClientRender", getRootElement(resourceRoot), Debug.render)

    Logger.debug('DEBUG', 'Resuming')
    tickDifference = tickDifference + (_getTickCount() - pauseTickStart)

    for className, functions in pairs(pauseData.functions) do
        for name, func in pairs(functions) do
            _G[className][name] = func
        end
    end

    Game.createEvents()

    for _, element in ipairs(elements) do
        setElementFrozen(element.element, element.frozen)
        setElementCollisionsEnabled(element.element, element.collisionsEnabled)
        setElementVelocity(element.element, unpack(element.velocity))
        setElementAngularVelocity(element.element, unpack(element.turnVelocity))
        setElementPosition(element.element, unpack(element.position))
        setElementRotation(element.element, unpack(element.rotation))
    end

    elements = {}

    setCameraTarget(cameraTarget)

    Debug.paused = false

    Overlay.triggerEvent('onDebugStatusUpdate', { paused = Debug.paused })
end

function Debug.render()
    if (Debug.infoShowing and not _recording) then
        if (TrafficArea) then
            --TrafficArea.debugRenderVehiclePaths()
            --TrafficArea.debugRenderPedPaths()
            --TrafficArea.debugRenderNaviNodes()
        end

        Debug.vehicleDebugRender()
        Debug.actorDebugRender()

        if (Debug.paused and Debug.stepFrame) then
            Logger.debug('DEBUG', 'Stepping frame')
            Debug.loaded = false
            Game.onRender()
            Debug.loaded = true
            Debug.stepFrame = false
        end
    end
end

function Debug.preRender()
    if (Debug.paused and Debug.stepFrame) then
        Game.onPreRender()
    end
end

function Debug.hudRender()
    if (Debug.paused and Debug.stepFrame) then
        Game.onHudRender()
    end
end

function Debug.vehicleDebugRender()
    local px, py, pz = getElementPosition(getCamera())

    for _, vehicle in pairs(VehicleElement:all()) do
        local vx, vy, vz = vehicle:getPosition()
        local distance = getDistanceBetweenPoints3D(px, py, pz, vx, vy, vz)

        if ((distance or 999999) < 80) then
            local maxZ = 0

            if (isElement(vehicle.element)) then
                _, _, _, _, _, maxZ = getElementBoundingBox(vehicle.element)
            end

            if (maxZ) then
                vz = vz + maxZ + 0.2

                local sx, sy = getScreenFromWorldPosition(vx, vy, vz, 152)

                if sx and sy then
                    dxDrawLine(sx, sy, sx + 150 * (1920 / screenWidth), sy, tocolor(255, 255, 255, 255), 2 * (1920 / screenWidth), false)
                    dxDrawLine(sx, sy, sx - 20 * (1920 / screenWidth), sy + 40 * (1920 / screenWidth), tocolor(255, 255, 255, 255), 2 * (1920 / screenWidth), false)

                    local vehicleName = getVehicleNameFromModel(vehicle:getModel())
                    local vehicleErrored = false

                    if (vehicleName == false) then
                        vehicleName = 'UNKNOWN - ERROR'
                        vehicleErrored = true
                    end

                    vehicleName = vehicleName.." ("..vehicle.id..") ("..vehicle:getType()..")"

                    dxDrawText(vehicleName, sx, sy - 28 * (1920 / screenWidth), sx + 152 * (1920 / screenWidth), sy - 28 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "center", "top", false, false, false, true)

                    if (vehicleErrored) then
                        dxDrawText(vehicleName, sx, sy - 30 * (1920 / screenWidth), sx + 150 * (1920 / screenWidth), sy - 30 * (1920 / screenWidth),
                            tocolor(255, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "center", "top", false, false, false, true)
                    else
                        dxDrawText(vehicleName, sx, sy - 30 * (1920 / screenWidth), sx + 150 * (1920 / screenWidth), sy - 30 * (1920 / screenWidth),
                            tocolor(21, 163, 111, 255), 1.6 * (1920 / screenWidth), "default", "center", "top", false, false, false, true)
                    end

                    local infoYPosition = sy + 10 * (1920 / screenWidth)

                    local occupants = vehicle:getOccupants()
                    local occupantString = "NONE"
                    local occupantCount = 0

                    for seat, occupant in pairs(occupants) do
                        if (occupant) then
                            occupantCount = occupantCount + 1

                            if (occupantString ~= "NONE") then
                                if (seat == 0) then
                                    occupantString = occupantString..", "..occupant.id.." (driver)"
                                else
                                    occupantString = occupantString..", "..occupant.id
                                end
                            else
                                if (seat == 0) then
                                    occupantString = occupant.id.." (driver)"
                                else
                                    occupantString = occupant.id
                                end
                            end
                        end
                    end

                    dxDrawText("Loading: "..tostring(vehicle.loading or false), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Loading: "..tostring(vehicle.loading or false), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    dxDrawText("Occupants ("..occupantCount.."): "..occupantString, sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Occupants ("..occupantCount.."): "..occupantString, sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    local engineState = vehicle:getEngineState() and "ON" or "OFF"

                    dxDrawText("Engine: "..engineState, sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Engine: "..engineState, sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    local x, y, z = vehicle:getPosition()
                    local rotX, rotY, rotZ = vehicle:getRotation()
                    local velX, velY, velZ = vehicle:getVelocity()

                    dxDrawText("Position: "..tostring(x)..", "..tostring(y)..", "..tostring(z), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Position: "..tostring(x)..", "..tostring(y)..", "..tostring(z), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    dxDrawText("Rotation: "..tostring(rotX)..", "..tostring(rotY)..", "..tostring(rotZ), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Rotation: "..tostring(rotX)..", "..tostring(rotY)..", "..tostring(rotZ), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    dxDrawText("Velocity: "..tostring(velX)..", "..tostring(velY)..", "..tostring(velZ), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Velocity: "..tostring(velX)..", "..tostring(velY)..", "..tostring(velZ), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    if (vehicle.trailer) then
                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        dxDrawText("Trailer: "..(vehicle.trailer.id or 'UNKNOWN'), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Trailer: "..(vehicle.trailer.id or 'UNKNOWN'), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)
                    end

                    if (vehicle.trailerOf) then
                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        dxDrawText("Trailer of: "..(vehicle.trailerOf.id or 'UNKNOWN'), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Trailer of: "..(vehicle.trailerOf.id or 'UNKNOWN'), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)
                    end

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    dxDrawText("Frozen: "..tostring(vehicle:isFrozen()), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Frozen: "..tostring(vehicle:isFrozen()), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    if (vehicle:getType() == 'train') then
                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        dxDrawText("Direction: "..tostring(vehicle.direction), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Direction: "..tostring(vehicle.direction), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        dxDrawText("Speed: "..tostring(vehicle.speed), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Speed: "..tostring(vehicle.speed), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        dxDrawText("Cruise speed: "..tostring(vehicle.cruiseSpeed), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Cruise speed: "..tostring(vehicle.cruiseSpeed), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        dxDrawText("Carriages: "..#vehicle.carriages, sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Carriages: "..#vehicle.carriages, sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)
                    end
                end
            end
        end
    end
end

function Debug.actorDebugRender()
    local px, py, pz = getElementPosition(getCamera())

    local actorElements = {}

    for _, actor in pairs(ActorElement:all()) do
        if (actor.element) then
            actorElements[#actorElements + 1] = actor
        end
    end

    for _, player in pairs(PlayerElement:all()) do
        actorElements[#actorElements + 1] = player
    end

    for _, actor in pairs(actorElements) do
        local ax, ay, az = actor:getPosition()
        local distance = getDistanceBetweenPoints3D(px, py, pz, ax, ay, az)

        if (distance < 80) then
            local maxZ = 0

            if (isElement(actor.element)) then
                _, _, _, _, _, maxZ = getElementBoundingBox(actor.element)
            end

            if (maxZ) then
                az = az + maxZ + 0.1

                local sx, sy = getScreenFromWorldPosition(ax, ay, az, 152)

                if sx and sy then
                    dxDrawLine(sx, sy, sx + 150 * (1920 / screenWidth), sy, tocolor(255, 0, 255, 255), 2, false)
                    dxDrawLine(sx, sy, sx - 20 * (1920 / screenWidth), sy + 40 * (1920 / screenWidth), tocolor(255, 0, 255, 255), 2, false)

                    local actorId = actor.id.." ("..actor:getType()..") ["..actor:getDistanceToElement(Camera.getAsElement()).."]"

                    dxDrawText(actorId, sx, sy - 28 * (1920 / screenWidth), sx + 152 * (1920 / screenWidth), sy - 28 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "center", "top", false, false, false, true)

                    dxDrawText(actorId, sx, sy - 30 * (1920 / screenWidth), sx + 150 * (1920 / screenWidth), sy - 30 * (1920 / screenWidth),
                        tocolor(255, 0, 255, 255), 1.6 * (1920 / screenWidth), "default", "center", "top", false, false, false, true)

                    local infoYPosition = sy + 10 * (1920 / screenWidth)

                    dxDrawText("Running tasks", sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Running tasks", sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 0, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    local priority1Tasks = actor:getTasks(1)

                    for slotName, task in pairs(priority1Tasks) do
                        if (task) then
                            local taskName = task:getName()

                            dxDrawText(taskName, sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                                infoYPosition + 2 * (1920 / screenWidth),
                                tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                            dxDrawText(taskName, sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                                tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                            infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                            local subTask = task.getSubTask and task:getSubTask()

                            while (subTask) do
                                local subTaskName = subTask:getName()

                                dxDrawText("- "..subTaskName, sx + 20 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                                    infoYPosition + 2 * (1920 / screenWidth),
                                    tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                                dxDrawText("- "..subTaskName, sx + 20 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                                    tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                                subTask = subTask.getSubTask and subTask:getSubTask()

                                infoYPosition = infoYPosition + 28 * (1920 / screenWidth)
                            end

                            local debugParams = task:getDebugParameters()

                            if next(debugParams) ~= nil then
                                for property, param in pairs(debugParams) do
                                    if type(param) == 'table' then
                                        param = Debug.prettifyTable(param)
                                    end

                                    dxDrawText("    "..property..": "..param, sx + 20 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                                        infoYPosition + 2 * (1920 / screenWidth),
                                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                                    dxDrawText("    "..property..": "..param, sx + 20 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)
                                end
                            end
                        end
                    end

                    local priority2Tasks = actor:getTasks(2)

                    for slotName, task in pairs(priority2Tasks) do
                        if (task) then
                            local taskName = task:getName()

                            dxDrawText(taskName, sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                                infoYPosition + 2 * (1920 / screenWidth),
                                tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                            dxDrawText(taskName, sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                                tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                            infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                            local subTask = task.getSubTask and task:getSubTask()

                            while (subTask) do
                                local subTaskName = subTask:getName()

                                dxDrawText("- "..subTaskName, sx + 20 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                                    infoYPosition + 2 * (1920 / screenWidth),
                                    tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                                dxDrawText("- "..subTaskName, sx + 20 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                                    tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                                subTask = subTask.getSubTask and subTask:getSubTask()

                                infoYPosition = infoYPosition + 28 * (1920 / screenWidth)
                            end
                        end
                    end

                    local vehicleId = (actor:getOccupiedVehicle() and actor:getOccupiedVehicle().id) or 'NONE'

                    dxDrawText("Vehicle: "..vehicleId, sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Vehicle: "..vehicleId, sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    dxDrawText("Element: "..tostring(actor.element or false), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Element: "..tostring(actor.element or false), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    local x, y, z = actor:getPosition()
                    local rotX, rotY, rotZ = actor:getRotation()
                    local velX, velY, velZ = actor:getVelocity()

                    dxDrawText("Position: "..tostring(x)..", "..tostring(y)..", "..tostring(z), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Position: "..tostring(x)..", "..tostring(y)..", "..tostring(z), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    dxDrawText("Rotation: "..tostring(rotX)..", "..tostring(rotY)..", "..tostring(rotZ), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Rotation: "..tostring(rotX)..", "..tostring(rotY)..", "..tostring(rotZ), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    dxDrawText("Velocity: "..tostring(velX)..", "..tostring(velY)..", "..tostring(velZ), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Velocity: "..tostring(velX)..", "..tostring(velY)..", "..tostring(velZ), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    dxDrawText("Loading: "..tostring(actor.loading or false), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Loading: "..tostring(actor.loading or false), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    dxDrawText("Frozen: "..tostring(actor:isFrozen() or false), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Frozen: "..tostring(actor:isFrozen() or false), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    dxDrawText("Dead: "..tostring(actor:isDead() or false), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                        infoYPosition + 2 * (1920 / screenWidth),
                        tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    dxDrawText("Dead: "..tostring(actor:isDead() or false), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                        tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                    infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                    if actor:getType() == 'player' then
                        dxDrawText("Moveable: "..tostring(Pad.isMoveable() or false), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Moveable: "..tostring(Pad.isMoveable() or false), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)
                    end

                    if (actor.element) then
                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        dxDrawText("Alpha: "..tostring(actor:getAlpha()), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Alpha: "..tostring(actor:getAlpha()), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        dxDrawText("Interior: "..tostring(actor:getInterior()), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Interior: "..tostring(actor:getInterior()), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        dxDrawText("Active simplest task (by game): ", sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Active simplest task (by game): ", sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        dxDrawText("    "..tostring(getPedSimplestTask(actor.element)), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("    "..tostring(getPedSimplestTask(actor.element)), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        local analogControlStates = {
                            "accelerate",
                            "brake_reverse",
                            "vehicle_left",
                            "vehicle_right",
                        }

                        dxDrawText("Analog control states: ", sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Analog control states: ", sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        for _, controlState in pairs(analogControlStates) do
                            dxDrawText("    "..controlState..": "..tostring(actor:getAnalogControlState(controlState)), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                                infoYPosition + 2 * (1920 / screenWidth),
                                tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                            dxDrawText("    "..controlState..": "..tostring(actor:getAnalogControlState(controlState)), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                                tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                            infoYPosition = infoYPosition + 28 * (1920 / screenWidth)
                        end

                        local controlStates = {
                            'handbrake'
                        }

                        dxDrawText("Control states: ", sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                            infoYPosition + 2 * (1920 / screenWidth),
                            tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        dxDrawText("Control states: ", sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                            tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                        infoYPosition = infoYPosition + 28 * (1920 / screenWidth)

                        for _, controlState in pairs(controlStates) do
                            dxDrawText("    "..controlState..": "..tostring(actor:getControlState(controlState)), sx + 10 * (1920 / screenWidth), infoYPosition + 2 * (1920 / screenWidth), screenWidth,
                                infoYPosition + 2 * (1920 / screenWidth),
                                tocolor(0, 0, 0, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                            dxDrawText("    "..controlState..": "..tostring(actor:getControlState(controlState)), sx + 10 * (1920 / screenWidth), infoYPosition, screenWidth, infoYPosition,
                                tocolor(255, 255, 255, 255), 1.6 * (1920 / screenWidth), "default", "left", "top", false, false, false, true)

                            infoYPosition = infoYPosition + 28 * (1920 / screenWidth)
                        end
                    end
                end
            end
        end
    end
end

function Debug.getTickCount()
    if (Debug.paused) then
        if (Debug.newFrame) then
            pauseTickStart = pauseTickStart + 16
        end

        return pauseTickStart
    end

    return _getTickCount() - tickDifference
end

function Debug.onKey(button, press)
    if (button == 'lctrl') then
        ctrlHold = press
    end

    if (button == 'mouse2' and ctrlHold and press) then
        if (not isCursorShowing()) then
            Overlay.showCursor()
        else
            Overlay.hideCursor()
        end
    end

    if (button == 'p' and ctrlHold and press) then
        if (Debug.paused) then
            Debug.resume()
        else
            Debug.pause()
        end
    end

    if (button == 'F3' and press and Debug.paused) then
        Debug.stepFrame = true
    end

    if (button == 'r' and ctrlHold and press) then
        if (_recording) then
            Debug.stopRecord()
        else
            Debug.record()
        end
    end

    if (button == 'i' and ctrlHold and press) then
        Debug.infoShowing = not Debug.infoShowing
    end
end

function Debug.onDebugFramesGet(hash)
    Overlay.triggerEvent("onDebugFramesReceived", hash, {
        frames = frameCount,
        opcodes = opcodes,
    })
end

function Debug.isLoaded()
    return Debug.loaded
end

addCommandHandler('savestate', function(_, slot)
    SaveState.save(slot)
end)

addCommandHandler('debugframe', function(_, frame)
    frame = tonumber(frame)

    for _, element in pairs(previewElements) do
        if isElement(element) then
            destroyElement(element)
        end
    end

    previewElements = {}

    local playerDimension = getElementDimension(localPlayer)

    if frames[frame] then
        for _, element in pairs(frames[frame].elements) do
            if element.type == 'vehicle' then
                local vehicle = createVehicle(element.model, element.position[1], element.position[2], element.position[3], element.rotation[1], element.rotation[2], element.rotation[3])

                if vehicle then
                    setElementFrozen(vehicle, true)
                    setElementCollisionsEnabled(vehicle, false)
                    setElementAlpha(vehicle, 150)
                    setElementDimension(vehicle, playerDimension)

                    previewElements[#previewElements + 1] = vehicle
                end
            elseif element.type == 'actor' then
                local actor = createPed(element.model, element.position[1], element.position[2], element.position[3], element.rotation[3])

                if actor then
                    setElementFrozen(actor, true)
                    setElementCollisionsEnabled(actor, false)
                    setElementAlpha(actor, 150)
                    setElementDimension(actor, playerDimension)
                    setPedAnimation(actor, unpack(element.animation))

                    previewElements[#previewElements + 1] = actor
                end
            end
        end

        Logger.info('DEBUG', 'Loaded frame '..frame)
    end
end)

-----------------------------------
-- * Events
-----------------------------------

addEvent('sphene:debug:frames:get', true)
addEventHandler("sphene:debug:frames:get", root, Debug.onDebugFramesGet)