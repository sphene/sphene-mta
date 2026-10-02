SharedOpcodeStreaming = {}
SharedOpcodeStreaming.__index = SharedOpcodeStreaming

-- Opcode: 0x023C
-- Instruction: load_special_character {slotId} [int] {modelName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/023C
function SharedOpcodeStreaming.loadSpecialCharacter(id, model)
   ActorElement.loadSpecialActor(model, id)
end

-- Opcode: 0x023D
-- Instruction: has_special_character_loaded {slotId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/023D
function SharedOpcodeStreaming.hasSpecialCharacterLoaded(id)
    return ActorElement.isSpecialActorSlotUsed(id)
end

-- Opcode: 0x0247
-- Instruction: request_model {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0247
function SharedOpcodeStreaming.requestModel(model)
    ElementManager.requestModel(model)
end

-- Opcode: 0x0248
-- Instruction: has_model_loaded {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0248
function SharedOpcodeStreaming.hasModelLoaded(model)
    return ElementManager.hasModelLoaded(model)
end

-- Opcode: 0x0249
-- Instruction: mark_model_as_no_longer_needed {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0249
function SharedOpcodeStreaming.markModelAsNoLongerNeeded(model)
    ElementManager.releaseModel(model)
end

-- Opcode: 0x0296
-- Instruction: unload_special_character {slotId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0296
function SharedOpcodeStreaming.unloadSpecialCharacter(id)
     ActorElement.unloadSpecialActor(id)
end

-- Opcode: 0x038B
-- Instruction: load_all_models_now
-- https://library.sannybuilder.com/#/sa/script/extensions/default/038B
function SharedOpcodeStreaming.loadAllModelsNow()
    ElementManager.loadAllRequestedModels()
    return true
end

-- Opcode: 0x03AF
-- Instruction: switch_streaming {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03AF
function SharedOpcodeStreaming.switch()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03CB
-- Instruction: load_scene {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03CB
function SharedOpcodeStreaming.loadScene(posX, posY, posZ)
    enginePreloadWorldArea(posX, posY, posZ, 'models')
end

-- Opcode: 0x0488
-- Instruction: is_model_available {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0488
function SharedOpcodeStreaming.isModelAvailable(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04BB
-- Instruction: set_area_visible {areaId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04BB
function SharedOpcodeStreaming.setAreaVisible(interior)
    --TaskHandler.sendTask(nil, TaskCode.SYNC_CAMERA_INTERIOR, interior)

    setElementInterior(localPlayer, interior)
    return setCameraInterior(interior)
end

-- Opcode: 0x04E4
-- Instruction: request_collision {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04E4
function SharedOpcodeStreaming.requestCollision(posX, posY)
    enginePreloadWorldArea(posX, posY, 0, 'collisions')
end

-- Opcode: 0x04ED
-- Instruction: request_animation {animationFile} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04ED
function SharedOpcodeStreaming.requestAnimation(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x04EE
-- Instruction: has_animation_loaded {animationFile} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04EE
function SharedOpcodeStreaming.hasAnimationLoaded(_)
    Script.setOpcodePartiallyImplemented()
    return true
end

-- Opcode: 0x04EF
-- Instruction: remove_animation {animationFile} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04EF
function SharedOpcodeStreaming.removeAnimation(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0ADB
-- Instruction: [var carName: string] = get_name_of_vehicle_model {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ADB
function SharedOpcodeStreaming.getNameOfVehicleModel(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 023c=2,load_special_actor %1d% %2s%
Opcode.register(0x023c, SharedOpcodeStreaming.loadSpecialCharacter, 2, 'load_special_character ${1} ${2}', {false, false})
-- INI: 023d=1,  special_actor %1d% loaded
Opcode.register(0x023d, SharedOpcodeStreaming.hasSpecialCharacterLoaded, 1, 'has_special_character_loaded ${1}', {false})
-- INI: 0247=1,request_model %1o%
Opcode.register(0x0247, SharedOpcodeStreaming.requestModel, 1, 'request_model ${object.1}', {false})
-- INI: 0248=1,  model %1o% available
Opcode.register(0x0248, SharedOpcodeStreaming.hasModelLoaded, 1, 'has_model_loaded ${object.1}', {false})
-- INI: 0249=1,release_model %1o%
Opcode.register(0x0249, SharedOpcodeStreaming.markModelAsNoLongerNeeded, 1, 'mark_model_as_no_longer_needed ${object.1}', {false})
-- INI: 0296=1,unload_special_actor %1d%
Opcode.register(0x0296, SharedOpcodeStreaming.unloadSpecialCharacter, 1, 'unload_special_character ${1}', {false})
-- INI: 038b=0,load_requested_models
Opcode.register(0x038b, SharedOpcodeStreaming.loadAllModelsNow, 0, 'load_all_models_now', {})
-- INI: 03af=1,set_streaming %1b:enabled/disabled%
Opcode.register(0x03af, SharedOpcodeStreaming.switch, 1, 'switch_streaming ${1}', {false})
-- INI: 03cb=3,load_scene %1d% %2d% %3d%
Opcode.register(0x03cb, SharedOpcodeStreaming.loadScene, 3, 'load_scene ${1} ${2} ${3}', {false, false, false})
-- INI: 0488=1,  model %1o% exists
Opcode.register(0x0488, SharedOpcodeStreaming.isModelAvailable, 1, 'is_model_available ${object.1}', {false})
-- INI: 04bb=1,select_interiour %1h%  ;; select render area
Opcode.register(0x04bb, SharedOpcodeStreaming.setAreaVisible, 1, 'set_area_visible ${1}', {false})
-- INI: 04e4=2,request_collision_at %1d% %2d%
Opcode.register(0x04e4, SharedOpcodeStreaming.requestCollision, 2, 'request_collision ${1} ${2}', {false, false})
-- INI: 04ed=1,load_animation %1s%
Opcode.register(0x04ed, SharedOpcodeStreaming.requestAnimation, 1, 'request_animation ${1}', {false})
-- INI: 04ee=1,  animation %1s% loaded
Opcode.register(0x04ee, SharedOpcodeStreaming.hasAnimationLoaded, 1, 'has_animation_loaded ${1}', {false})
-- INI: 04ef=1,release_animation %1s%
Opcode.register(0x04ef, SharedOpcodeStreaming.removeAnimation, 1, 'remove_animation ${1}', {false})
-- INI: 0ADB=2,%2d% = vehicle_model %1o% name
Opcode.register(0x0adb, SharedOpcodeStreaming.getNameOfVehicleModel, 2, '${1} = get_name_of_vehicle_model ${vehicle.2}', {true, false})
