ViceCityOpcodeCutsceneObject = {}
ViceCityOpcodeCutsceneObject.__index = ViceCityOpcodeCutsceneObject

-- Opcode: 0x02E5
-- Instruction: [var handle: CutsceneObject] = create_cutscene_object {modelId} [model_any]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02E5
function ViceCityOpcodeCutsceneObject.create(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02E6
-- Instruction: set_cutscene_anim [CutsceneObject] {animation} [string]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02E6
function ViceCityOpcodeCutsceneObject.setAnim(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0524
-- Instruction: attach_cutscene_object_to_bone [CutsceneObject] {char} [CutsceneObject] {boneId} [Bone]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0524
function ViceCityOpcodeCutsceneObject.attachToBone(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0525
-- Instruction: attach_cutscene_object_to_component [CutsceneObject] {char} [CutsceneObject] {frameName} [string]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0525
function ViceCityOpcodeCutsceneObject.attachToComponent(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x054B
-- Instruction: attach_cutscene_object_to_vehicle [CutsceneObject] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/054B
function ViceCityOpcodeCutsceneObject.attachToVehicle(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 02e5=2,%2d% = create_cutscene_object %1o%
Opcode.register(0x02e5, ViceCityOpcodeCutsceneObject.create, 2, '${2} = create_cutscene_object ${1}', {false, true})
-- INI: 02e6=2,set_cutscene_anim %1d% %2s%
Opcode.register(0x02e6, ViceCityOpcodeCutsceneObject.setAnim, 2, 'set_cutscene_anim ${1} ${2}', {false, false})
-- INI: 0524=3,attach_cutscene_object %1d% to_bone %2d% %3h%
Opcode.register(0x0524, ViceCityOpcodeCutsceneObject.attachToBone, 3, 'attach_cutscene_object_to_bone ${1} ${2} ${3}', {false, false, false})
-- INI: 0525=3,attach_cutscene_object %1d% to_component %2d% %3s%
Opcode.register(0x0525, ViceCityOpcodeCutsceneObject.attachToComponent, 3, 'attach_cutscene_object_to_component ${1} ${2} ${3}', {false, false, false})
-- INI: 054b=2,attach_cutscene_object_to_car %1d% %2d%
Opcode.register(0x054b, ViceCityOpcodeCutsceneObject.attachToVehicle, 2, 'attach_cutscene_object_to_vehicle ${1} ${2}', {true, true})
