SanAndreasOpcodeStreaming = {}
SanAndreasOpcodeStreaming.__index = SanAndreasOpcodeStreaming

-- Opcode: 0x06DA
-- Instruction: mark_mission_trains_as_no_longer_needed
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06DA
function SanAndreasOpcodeStreaming.markMissionTrainsAsNoLongerNeeded()
    for _, train in pairs(TrainElement:all()) do
        train:setDirection(false)
    end
end

-- Opcode: 0x06E6
-- Instruction: [var slotId: ModSlot] = get_vehicle_mod_type {modelId} [model_object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06E6
function SanAndreasOpcodeStreaming.getVehicleModType(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06E9
-- Instruction: request_vehicle_mod {modelId} [model_object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06E9
function SanAndreasOpcodeStreaming.requestVehicleMod(_)
   return true
end

-- Opcode: 0x06EA
-- Instruction: has_vehicle_mod_loaded {modelId} [model_object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06EA
function SanAndreasOpcodeStreaming.hasVehicleModLoaded(_)
   return true
end

-- Opcode: 0x06EB
-- Instruction: mark_vehicle_mod_as_no_longer_needed {modelId} [model_object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06EB
function SanAndreasOpcodeStreaming.markVehicleModAsNoLongerNeeded(_)
   return true
end

-- Opcode: 0x0771
-- Instruction: custom_plate_design_for_next_car {modelId} [model_vehicle] {townId} [Town]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0771
function SanAndreasOpcodeStreaming.customPlateDesignForNextCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0776
-- Instruction: request_ipl {iplName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0776
function SanAndreasOpcodeStreaming.requestIpl(group)
    IPL.loadGroup(group)
end

-- Opcode: 0x0777
-- Instruction: remove_ipl {iplName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0777
function SanAndreasOpcodeStreaming.removeIpl(group)
    IPL.unloadGroup(group)
end

-- Opcode: 0x0778
-- Instruction: remove_ipl_discreetly {iplName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0778
function SanAndreasOpcodeStreaming.removeIplDiscreetly(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x077E
-- Instruction: [var areaId: int] = get_area_visible
-- https://library.sannybuilder.com/#/sa/script/extensions/default/077E
function SanAndreasOpcodeStreaming.getAreaVisible(_)
    return getCameraInterior()
end

-- Opcode: 0x07C0
-- Instruction: request_car_recording {pathId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07C0
function SanAndreasOpcodeStreaming.requestCarRecording(pathId)
    Carrec.load(pathId)
end

-- Opcode: 0x07C1
-- Instruction: has_car_recording_been_loaded {pathId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07C1
function SanAndreasOpcodeStreaming.hasCarRecordingBeenLoaded(pathId)
    return Carrec.isAvailable(pathId)
end

-- Opcode: 0x07DE
-- Instruction: is_model_in_cdimage {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07DE
function SanAndreasOpcodeStreaming.isModelInCdimage(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07E4
-- Instruction: [var leftBottomBackX: float], [var leftBottomBackY: float], [var leftBottomBackZ: float], [var rightTopFrontX: float], [var rightTopFrontY: float], [var rightTopFrontZ: float] = get_model_dimensions {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07E4
function SanAndreasOpcodeStreaming.getModelDimensions(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x081E
-- Instruction: is_this_model_a_boat {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/081E
function SanAndreasOpcodeStreaming.isThisModelABoat(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x081F
-- Instruction: is_this_model_a_plane {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/081F
function SanAndreasOpcodeStreaming.isThisModelAPlane(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0820
-- Instruction: is_this_model_a_heli {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0820
function SanAndreasOpcodeStreaming.isThisModelAHeli(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0873
-- Instruction: remove_car_recording {pathId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0873
function SanAndreasOpcodeStreaming.removeCarRecording(pathId)
    Carrec.release(pathId)
end

-- Opcode: 0x08E8
-- Instruction: attach_anims_to_model {pedModelId} [int] {animationFile} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08E8
function SanAndreasOpcodeStreaming.attachAnimsToModel(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09B2
-- Instruction: [var modelId: model_vehicle], [var class: int] = get_random_car_model_in_memory {_p1} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09B2
function SanAndreasOpcodeStreaming.getRandomCarModelInMemory(_)
    Script.setOpcodePartiallyImplemented()

    local model = math.random(400, 600)

    while (VehicleElement.getTypeFromModel(model) ~= 'car') do
        model = math.random(400, 600)
    end

    Script.storeValueAtIndex(2, model)
    Script.storeValueAtIndex(3, 0)

    ElementManager.loadModel(model)

    return true
end

-- Opcode: 0x0A01
-- Instruction: is_this_model_a_car {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A01
function SanAndreasOpcodeStreaming.isThisModelACar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A0B
-- Instruction: load_scene_in_direction {x} [float] {y} [float] {z} [float] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A0B
function SanAndreasOpcodeStreaming.loadSceneInDirection(posX, posY, posZ, _)
    enginePreloadWorldArea(posX, posY, posZ, 'models')
end

-- Opcode: 0x0E7F
-- Instruction: [var type: ModelInfoType] = get_model_type {model} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E7F
function SanAndreasOpcodeStreaming.getModelType(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E98
-- Instruction: request_priority_model {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E98
function SanAndreasOpcodeStreaming.requestPriorityModel(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E99
-- Instruction: load_all_priority_models_now
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E99
function SanAndreasOpcodeStreaming.loadAllPriorityModelsNow()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E9A
-- Instruction: load_special_character_for_id {id} [int] {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E9A
function SanAndreasOpcodeStreaming.loadSpecialCharacterForId(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E9B
-- Instruction: unload_special_character_from_id {id} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E9B
function SanAndreasOpcodeStreaming.unloadSpecialCharacterFromId(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E9C
-- Instruction: [var modelId: model_any] = get_model_by_name {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E9C
function SanAndreasOpcodeStreaming.getModelByName(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E9D
-- Instruction: is_model_available_by_name {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E9D
function SanAndreasOpcodeStreaming.isModelAvailableByName(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E9F
-- Instruction: remove_all_unused_models
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E9F
function SanAndreasOpcodeStreaming.removeAllUnusedModels()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EA3
-- Instruction: remove_model_if_unused {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EA3
function SanAndreasOpcodeStreaming.removeModelIfUnused(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EF8
-- Instruction: [var modelInfo: int] = get_model_info {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EF8
function SanAndreasOpcodeStreaming.getModelInfo(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F00
-- Instruction: [var specialModel: int] = load_special_model {dff} [string] {txd} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F00
function SanAndreasOpcodeStreaming.loadSpecialModel()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F01
-- Instruction: remove_special_model {specialModel} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F01
function SanAndreasOpcodeStreaming.removeSpecialModel()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F05
-- Instruction: [var clump: int], [var atomic: int], [var txdIndex: int] = get_special_model_data {specialModel} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F05
function SanAndreasOpcodeStreaming.getSpecialModelData()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x06da, SanAndreasOpcodeStreaming.markMissionTrainsAsNoLongerNeeded, 'mark_mission_trains_as_no_longer_needed')
Opcode.register(0x06e6, SanAndreasOpcodeStreaming.getVehicleModType, '[var slotId: ModSlot] = get_vehicle_mod_type {modelId} [model_object]')
Opcode.register(0x06e9, SanAndreasOpcodeStreaming.requestVehicleMod, 'request_vehicle_mod {modelId} [model_object]')
Opcode.register(0x06ea, SanAndreasOpcodeStreaming.hasVehicleModLoaded, 'has_vehicle_mod_loaded {modelId} [model_object]')
Opcode.register(0x06eb, SanAndreasOpcodeStreaming.markVehicleModAsNoLongerNeeded, 'mark_vehicle_mod_as_no_longer_needed {modelId} [model_object]')
Opcode.register(0x0771, SanAndreasOpcodeStreaming.customPlateDesignForNextCar, 'custom_plate_design_for_next_car {modelId} [model_vehicle] {townId} [Town]')
Opcode.register(0x0776, SanAndreasOpcodeStreaming.requestIpl, 'request_ipl {iplName} [string]')
Opcode.register(0x0777, SanAndreasOpcodeStreaming.removeIpl, 'remove_ipl {iplName} [string]')
Opcode.register(0x0778, SanAndreasOpcodeStreaming.removeIplDiscreetly, 'remove_ipl_discreetly {iplName} [string]')
Opcode.register(0x077e, SanAndreasOpcodeStreaming.getAreaVisible, '[var areaId: int] = get_area_visible')
Opcode.register(0x07c0, SanAndreasOpcodeStreaming.requestCarRecording, 'request_car_recording {pathId} [int]')
Opcode.register(0x07c1, SanAndreasOpcodeStreaming.hasCarRecordingBeenLoaded, 'has_car_recording_been_loaded {pathId} [int]')
Opcode.register(0x07de, SanAndreasOpcodeStreaming.isModelInCdimage, 'is_model_in_cdimage {modelId} [model_any]')
Opcode.register(0x07e4, SanAndreasOpcodeStreaming.getModelDimensions, '[var leftBottomBackX: float], [var leftBottomBackY: float], [var leftBottomBackZ: float], [var rightTopFrontX: float], [var rightTopFrontY: float], [var rightTopFrontZ: float] = get_model_dimensions {modelId} [model_any]')
Opcode.register(0x081e, SanAndreasOpcodeStreaming.isThisModelABoat, 'is_this_model_a_boat {modelId} [model_any]')
Opcode.register(0x081f, SanAndreasOpcodeStreaming.isThisModelAPlane, 'is_this_model_a_plane {modelId} [model_any]')
Opcode.register(0x0820, SanAndreasOpcodeStreaming.isThisModelAHeli, 'is_this_model_a_heli {modelId} [model_any]')
Opcode.register(0x0873, SanAndreasOpcodeStreaming.removeCarRecording, 'remove_car_recording {pathId} [int]')
Opcode.register(0x08e8, SanAndreasOpcodeStreaming.attachAnimsToModel, 'attach_anims_to_model {pedModelId} [int] {animationFile} [string]')
Opcode.register(0x09b2, SanAndreasOpcodeStreaming.getRandomCarModelInMemory, '[var modelId: model_vehicle], [var class: int] = get_random_car_model_in_memory {_p1} [bool]')
Opcode.register(0x0a01, SanAndreasOpcodeStreaming.isThisModelACar, 'is_this_model_a_car {modelId} [model_any]')
Opcode.register(0x0a0b, SanAndreasOpcodeStreaming.loadSceneInDirection, 'load_scene_in_direction {x} [float] {y} [float] {z} [float] {heading} [float]')
Opcode.register(0x0e7f, SanAndreasOpcodeStreaming.getModelType, '[var type: ModelInfoType] = get_model_type {model} [model_any]')
Opcode.register(0x0e98, SanAndreasOpcodeStreaming.requestPriorityModel, 'request_priority_model {modelId} [model_any]')
Opcode.register(0x0e99, SanAndreasOpcodeStreaming.loadAllPriorityModelsNow, 'load_all_priority_models_now')
Opcode.register(0x0e9a, SanAndreasOpcodeStreaming.loadSpecialCharacterForId, 'load_special_character_for_id {id} [int] {name} [string]')
Opcode.register(0x0e9b, SanAndreasOpcodeStreaming.unloadSpecialCharacterFromId, 'unload_special_character_from_id {id} [int]')
Opcode.register(0x0e9c, SanAndreasOpcodeStreaming.getModelByName, '[var modelId: model_any] = get_model_by_name {name} [string]')
Opcode.register(0x0e9d, SanAndreasOpcodeStreaming.isModelAvailableByName, 'is_model_available_by_name {name} [string]')
Opcode.register(0x0e9f, SanAndreasOpcodeStreaming.removeAllUnusedModels, 'remove_all_unused_models')
Opcode.register(0x0ea3, SanAndreasOpcodeStreaming.removeModelIfUnused, 'remove_model_if_unused {modelId} [model_any]')
Opcode.register(0x0ef8, SanAndreasOpcodeStreaming.getModelInfo, '[var modelInfo: int] = get_model_info {modelId} [model_any]')
Opcode.register(0x0f00, SanAndreasOpcodeStreaming.loadSpecialModel, '[var specialModel: int] = load_special_model {dff} [string] {txd} [string]')
Opcode.register(0x0f01, SanAndreasOpcodeStreaming.removeSpecialModel, 'remove_special_model {specialModel} [int]')
Opcode.register(0x0f05, SanAndreasOpcodeStreaming.getSpecialModelData, '[var clump: int], [var atomic: int], [var txdIndex: int] = get_special_model_data {specialModel} [int]')
