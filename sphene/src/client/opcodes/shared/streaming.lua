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
    ElementManager.loadModel(model)
end

-- Opcode: 0x0248
-- Instruction: has_model_loaded {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0248
function SharedOpcodeStreaming.hasModelLoaded(model)
    return ElementManager.isModelLoaded(model)
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


Opcode.register(0x023c, SharedOpcodeStreaming.loadSpecialCharacter, 'load_special_character {slotId} [int] {modelName} [string]')
Opcode.register(0x023d, SharedOpcodeStreaming.hasSpecialCharacterLoaded, 'has_special_character_loaded {slotId} [int]')
Opcode.register(0x0247, SharedOpcodeStreaming.requestModel, 'request_model {modelId} [model_any]')
Opcode.register(0x0248, SharedOpcodeStreaming.hasModelLoaded, 'has_model_loaded {modelId} [model_any]')
Opcode.register(0x0249, SharedOpcodeStreaming.markModelAsNoLongerNeeded, 'mark_model_as_no_longer_needed {modelId} [model_any]')
Opcode.register(0x0296, SharedOpcodeStreaming.unloadSpecialCharacter, 'unload_special_character {slotId} [int]')
Opcode.register(0x038b, SharedOpcodeStreaming.loadAllModelsNow, 'load_all_models_now')
Opcode.register(0x03af, SharedOpcodeStreaming.switch, 'switch_streaming {state} [bool]')
Opcode.register(0x03cb, SharedOpcodeStreaming.loadScene, 'load_scene {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0488, SharedOpcodeStreaming.isModelAvailable, 'is_model_available {modelId} [model_any]')
Opcode.register(0x04bb, SharedOpcodeStreaming.setAreaVisible, 'set_area_visible {areaId} [int]')
Opcode.register(0x04e4, SharedOpcodeStreaming.requestCollision, 'request_collision {x} [float] {y} [float]')
Opcode.register(0x04ed, SharedOpcodeStreaming.requestAnimation, 'request_animation {animationFile} [string]')
Opcode.register(0x04ee, SharedOpcodeStreaming.hasAnimationLoaded, 'has_animation_loaded {animationFile} [string]')
Opcode.register(0x04ef, SharedOpcodeStreaming.removeAnimation, 'remove_animation {animationFile} [string]')
Opcode.register(0x0adb, SharedOpcodeStreaming.getNameOfVehicleModel, '[var carName: string] = get_name_of_vehicle_model {modelId} [model_vehicle]')
