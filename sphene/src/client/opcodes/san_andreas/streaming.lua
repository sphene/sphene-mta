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

    ElementManager.loadModel(model)

    return model, 0
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


-- INI: 06DA=0,reset_train_directions
Opcode.register(0x06da, SanAndreasOpcodeStreaming.markMissionTrainsAsNoLongerNeeded, 0, 'mark_mission_trains_as_no_longer_needed', {})
-- INI: 06E6=2,get_itemID %1d% destinated_component_slot_to %2d%
Opcode.register(0x06e6, SanAndreasOpcodeStreaming.getVehicleModType, 2, '${1} = get_vehicle_mod_type ${2}', {false, false})
-- INI: 06E9=1,load_car_component %1o%
Opcode.register(0x06e9, SanAndreasOpcodeStreaming.requestVehicleMod, 1, 'request_vehicle_mod ${object.1}', {false})
-- INI: 06EA=1,  car_component %1o% available
Opcode.register(0x06ea, SanAndreasOpcodeStreaming.hasVehicleModLoaded, 1, 'has_vehicle_mod_loaded ${object.1}', {false})
-- INI: 06EB=1,release_car_component %1o%
Opcode.register(0x06eb, SanAndreasOpcodeStreaming.markVehicleModAsNoLongerNeeded, 1, 'mark_vehicle_mod_as_no_longer_needed ${object.1}', {false})
-- INI: 0771=2,set_model_numplate %1m% town_texture %2h%
Opcode.register(0x0771, SanAndreasOpcodeStreaming.customPlateDesignForNextCar, 2, 'custom_plate_design_for_next_car ${vehicle.1} ${2}', {false, false})
-- INI: 0776=1,create_objects_in_object_group %1h%
Opcode.register(0x0776, SanAndreasOpcodeStreaming.requestIpl, 1, 'request_ipl ${1}', {false})
-- INI: 0777=1,delete_objects_in_object_group %1h%
Opcode.register(0x0777, SanAndreasOpcodeStreaming.removeIpl, 1, 'remove_ipl ${1}', {false})
-- INI: 0778=1,recreate_objects_in_object_group %1h%
Opcode.register(0x0778, SanAndreasOpcodeStreaming.removeIplDiscreetly, 1, 'remove_ipl_discreetly ${1}', {false})
-- INI: 077E=1,get_active_interior_to %1d%
Opcode.register(0x077e, SanAndreasOpcodeStreaming.getAreaVisible, 1, '${1} = get_area_visible', {false})
-- INI: 07C0=1,load_path %1d%
Opcode.register(0x07c0, SanAndreasOpcodeStreaming.requestCarRecording, 1, 'request_car_recording ${1}', {false})
-- INI: 07C1=1,  path %1d% available
Opcode.register(0x07c1, SanAndreasOpcodeStreaming.hasCarRecordingBeenLoaded, 1, 'has_car_recording_been_loaded ${1}', {false})
-- INI: 07DE=1,  model %1o% exists ; versionB
Opcode.register(0x07de, SanAndreasOpcodeStreaming.isModelInCdimage, 1, 'is_model_in_cdimage ${object.1}', {false})
-- INI: 07E4=7,get_model %1o% dimensions_cornerA_to %2d% %3d% %4d% dimensions_cornerB_to %5d% %6d% %7d%
Opcode.register(0x07e4, SanAndreasOpcodeStreaming.getModelDimensions, 7, '${2}, ${3}, ${4}, ${5}, ${6}, ${7} = get_model_dimensions ${object.1}', {false, true, true, true, true, true, true})
-- INI: 081E=1,  model %1o% boat
Opcode.register(0x081e, SanAndreasOpcodeStreaming.isThisModelABoat, 1, 'is_this_model_a_boat ${object.1}', {false})
-- INI: 081F=1,  model %1o% plane
Opcode.register(0x081f, SanAndreasOpcodeStreaming.isThisModelAPlane, 1, 'is_this_model_a_plane ${object.1}', {false})
-- INI: 0820=1,  model %1o% heli
Opcode.register(0x0820, SanAndreasOpcodeStreaming.isThisModelAHeli, 1, 'is_this_model_a_heli ${object.1}', {false})
-- INI: 0873=1,release_path %1d%
Opcode.register(0x0873, SanAndreasOpcodeStreaming.removeCarRecording, 1, 'remove_car_recording ${1}', {false})
-- INI: 08E8=2,assign_external_script_handle %2g% to_model %1m%
Opcode.register(0x08e8, SanAndreasOpcodeStreaming.attachAnimsToModel, 2, 'attach_anims_to_model ${1} ${2}', {false, false})
-- INI: 09B2=3,get_random_available_car_unk %1h% model_to %2d% class_to %3d%
Opcode.register(0x09b2, SanAndreasOpcodeStreaming.getRandomCarModelInMemory, 3, '${2}, ${3} = get_random_car_model_in_memory ${1}', {false, true, true})
-- INI: 0A01=1,  model %1o% car
Opcode.register(0x0a01, SanAndreasOpcodeStreaming.isThisModelACar, 1, 'is_this_model_a_car ${object.1}', {false})
-- INI: 0A0B=4,set_rendering_origin_at_3D_coord %1d% %2d% %3d% angle %4d%
Opcode.register(0x0a0b, SanAndreasOpcodeStreaming.loadSceneInDirection, 4, 'load_scene_in_direction ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0E7F=2,get_model_type %1d% store_to %2d%
Opcode.register(0x0e7f, SanAndreasOpcodeStreaming.getModelType, 2, '${1} = get_model_type ${2}', {true, false})
-- INI: 0E98=1,request_priority_model %1d%
Opcode.register(0x0e98, SanAndreasOpcodeStreaming.requestPriorityModel, 1, 'request_priority_model ${1}', {false})
-- INI: 0E99=0,load_all_priority_models_now
Opcode.register(0x0e99, SanAndreasOpcodeStreaming.loadAllPriorityModelsNow, 0, 'load_all_priority_models_now', {})
-- INI: 0E9A=2,load_special_character_for_id %1d% name %2d%
Opcode.register(0x0e9a, SanAndreasOpcodeStreaming.loadSpecialCharacterForId, 2, 'load_special_character_for_id ${1} ${2}', {false, false})
-- INI: 0E9B=1,unload_special_character_from_id %1d%
Opcode.register(0x0e9b, SanAndreasOpcodeStreaming.unloadSpecialCharacterFromId, 1, 'unload_special_character_from_id ${1}', {false})
-- INI: 0E9C=2,get_model_by_name %1d% store_id %2d%
Opcode.register(0x0e9c, SanAndreasOpcodeStreaming.getModelByName, 2, '${1} = get_model_by_name ${2}', {false, false})
-- INI: 0E9D=1,get_model_available_by_name %1d%
Opcode.register(0x0e9d, SanAndreasOpcodeStreaming.isModelAvailableByName, 1, 'is_model_available_by_name ${1}', {false})
-- INI: 0E9F=0,remove_all_unused_models
Opcode.register(0x0e9f, SanAndreasOpcodeStreaming.removeAllUnusedModels, 0, 'remove_all_unused_models', {})
-- INI: 0EA3=1,remove_model_if_unused %1d%
Opcode.register(0x0ea3, SanAndreasOpcodeStreaming.removeModelIfUnused, 1, 'remove_model_if_unused ${1}', {false})
-- INI: 0EF8=2,get_model_info %1d% store_to %2d%
Opcode.register(0x0ef8, SanAndreasOpcodeStreaming.getModelInfo, 2, '${1} = get_model_info ${2}', {true, false})
Opcode.register(0x0f00, SanAndreasOpcodeStreaming.loadSpecialModel, 3, '${1} = load_special_model ${2} ${3}')
Opcode.register(0x0f01, SanAndreasOpcodeStreaming.removeSpecialModel, 1, 'remove_special_model ${1}')
Opcode.register(0x0f05, SanAndreasOpcodeStreaming.getSpecialModelData, 4, '${1}, ${2}, ${3} = get_special_model_data ${4}')
