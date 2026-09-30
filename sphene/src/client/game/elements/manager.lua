-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local requestedModels = {}
local streamingReferences = {}
local handlesToElement = {}

local externalScriptTriggers = {
    ped = {
        status = true,
        triggers = {}
    },
    object = {
        status = true,
        triggers = {}
    },
}

-----------------------------------
-- * Variables
-----------------------------------

ElementManager = {}
ElementManager.__index = ElementManager

-----------------------------------
-- * Functions
-----------------------------------

function ElementManager.load()
    externalScriptTriggers = {
        ped = {
            status = true,
            triggers = {}
        },
        object = {
            status = true,
            triggers = {}
        },
    }
end

function ElementManager.unload()
    handlesToElement = {}

    for model in pairs(streamingReferences) do
        ElementManager.releaseStreamingReference(model)
    end
end

-- Script models are either plain GTA model IDs or negative indices in the SCM's used-objects table.
function ElementManager.resolveModelId(model)
    if (type(model) ~= 'number') then
        return nil
    end

    if (model < 0) then
        local objectName = Script.objectsById[math.abs(model - 1)]

        if (not objectName) then
            return nil
        end

        return engineGetModelIDFromName(objectName) or nil
    end

    return model
end

-- Request the model to be loaded/streamed into the game.
function ElementManager.requestModel(model)
    if (not ElementManager.isModelRequested(model)) then
        requestedModels[model] = {}
    end

    if (streamingReferences[model]) then
        return
    end

    local modelId = ElementManager.resolveModelId(model)

    if (modelId and ElementManager.engineStreamingRequestModel(modelId, true)) then
        streamingReferences[model] = modelId
    else
        -- Lets print a warning here, so we can debug if anything goes wrong.
        Logger.warning('MODEL', "Couldn't request model {}, scripts waiting for it will hang.", model)
    end
end

-- Release the loaded/streamed model from the game.
function ElementManager.releaseStreamingReference(model)
    local modelId = streamingReferences[model]

    if (not modelId) then
        return
    end

    streamingReferences[model] = nil
    ElementManager.engineStreamingReleaseModel(modelId, true)
end

-- Unload the model and release the request.
function ElementManager.releaseModel(model)
    ElementManager.releaseStreamingReference(model)

    if (not ElementManager.isModelRequested(model)) then
        return
    end

    requestedModels[model] = nil
end

function ElementManager.isModelRequested(model)
    return requestedModels[model] ~= nil
end

function ElementManager.hasModelLoaded(model)
    local modelId = ElementManager.resolveModelId(model)

    if (not modelId) then
        return false
    end

    return engineStreamingGetModelLoadState(modelId) == 'loaded'
end

-- Load all models synchronously - SCM may wait for these to load fully.
function ElementManager.loadAllRequestedModels()
    for _, modelId in pairs(streamingReferences) do
        if (engineStreamingGetModelLoadState(modelId) ~= 'loaded') then
            ElementManager.engineStreamingRequestModel(modelId, false, true)
        end
    end
end

-- We do pcalls here, because some engine functions return error, which
-- breaks Sphene. This is a workaround until we have engineIsModelValid.
function ElementManager.engineStreamingRequestModel(modelId, addReference, blocking)
    return pcall(engineStreamingRequestModel, modelId, addReference, blocking)
end

function ElementManager.engineStreamingReleaseModel(modelId, removeReference)
    return pcall(engineStreamingReleaseModel, modelId, removeReference)
end

function ElementManager.setModelData(model, data, value)
    if (not ElementManager.isModelRequested(model)) then
        return
    end

    requestedModels[model][data] = value
end

function ElementManager.getModelData(model, data)
    if (not ElementManager.isModelRequested(model)) then
        return nil
    end

    return requestedModels[model][data]
end

function ElementManager.registerExternalScriptTrigger(type, scriptId, model, priority, radius, _)
    if (not externalScriptTriggers[type]) then
        return
    end

    externalScriptTriggers[type].triggers[model] = {
        scriptId = scriptId,
        priority = priority,
        radius = radius
    }
end

function ElementManager.setExternalScriptTriggerStatus(elementType, status)
    if (externalScriptTriggers[elementType]) then
        externalScriptTriggers[elementType].status = status
    end
end

function ElementManager.onPreFrame()
    for _, vehicle in pairs(VehicleElement:all()) do
        vehicle:onPreFrame()
    end

    for _, train in pairs(TrainElement:all()) do
        train:onPreFrame()
    end

    for _, trainCarriage in pairs(TrainCarriageElement:all()) do
        trainCarriage:onPreFrame()
    end

    for _, actor in pairs(ActorElement:all()) do
        actor:onPreFrame()
    end

    for _, playerElement in pairs(PlayerElement:all()) do
        playerElement:onPreFrame()
    end

    for _, marker in pairs(MarkerElement:all()) do
        marker:onPreFrame()
    end

    for _, blip in pairs(BlipElement:all()) do
        blip:onPreFrame()
    end

    for _, object in pairs(ObjectElement:all()) do
        object:onPreFrame()
    end

    for _, pickup in pairs(PickupElement:all()) do
        pickup:onPreFrame()
    end

    for _, searchLight in pairs(SearchLightElement:all()) do
        searchLight:onPreFrame()
    end
end

function ElementManager.onFrame()
    for _, vehicle in pairs(VehicleElement:all()) do
        vehicle:onFrame()
    end

    for _, train in pairs(TrainElement:all()) do
        train:onFrame()
    end

    for _, trainCarriage in pairs(TrainCarriageElement:all()) do
        trainCarriage:onFrame()
    end

    for _, actor in pairs(ActorElement:all()) do
        actor:onFrame()
    end

    for _, playerElement in pairs(PlayerElement:all()) do
        playerElement:onFrame()
    end

    for _, marker in pairs(MarkerElement:all()) do
        marker:onFrame()
    end

    for _, blip in pairs(BlipElement:all()) do
        blip:onFrame()
    end

    for _, object in pairs(ObjectElement:all()) do
        object:onFrame()
    end

    for _, pickup in pairs(PickupElement:all()) do
        pickup:onFrame()
    end

    for _, searchLight in pairs(SearchLightElement:all()) do
        searchLight:onFrame()
    end
end

function ElementManager.runExternalScriptsForElement(element)
    local player = PlayerElement.getLocalPlayer()

    if (not player) then
        return
    end

    local elementType = element:getType()
    local elementModel = element:getModel()
    local scripts = {}

    if (externalScriptTriggers[elementType] and externalScriptTriggers[elementType].status) then
        for _, trigger in pairs(externalScriptTriggers[elementType].triggers[elementModel] or {}) do
            if type(trigger) ~= "table" then
                Script.panic("Invalid external script trigger '" .. tostring(trigger) .. "' for element type '" .. tostring(elementType) .. "' and model '" .. tostring(elementModel) .. "'!")
                return
            end

            if (trigger.radius == -1 or element:getDistanceToElement(player) <= trigger.radius) then
                if (trigger.priority == -1) then
                    trigger.priority = 0
                end

                scripts[#scripts + 1] = {
                    scriptId = trigger.scriptId,
                    priority = trigger.priority
                }
            end
        end
    end

    table.sort(scripts, function(a, b)
        return a.priority < b.priority
    end)

    for _, script in pairs(scripts) do
        if Script.isExternalScriptLoaded(script.scriptId) and Script.getExternalScriptRunningCount() == 0 then
            Script.runExternalScript(script.scriptId, element.id)
        end
    end
end

function ElementManager.addElementHandle(handle, element)
    if handle == nil or element == nil then
        return
    end

    handlesToElement[handle] = element
end

function ElementManager.removeElementHandle(handle)
    if handle == nil then
        return
    end

    handlesToElement[handle] = nil
end

function ElementManager.getElementByHandle(handle)
    return handlesToElement[handle]
end

function ElementManager.setLoadRadius(radius)
    loadRadius = radius
end

function ElementManager.resetLoadRadius()
    loadRadius = 120
end

-----------------------------------
-- * Events
-----------------------------------
