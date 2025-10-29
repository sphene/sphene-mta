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


Opcode.register(0x02e5, ViceCityOpcodeCutsceneObject.create, '[var handle: CutsceneObject] = create_cutscene_object {modelId} [model_any]')
Opcode.register(0x02e6, ViceCityOpcodeCutsceneObject.setAnim, 'set_cutscene_anim [CutsceneObject] {animation} [string]')
Opcode.register(0x0524, ViceCityOpcodeCutsceneObject.attachToBone, 'attach_cutscene_object_to_bone [CutsceneObject] {char} [CutsceneObject] {boneId} [Bone]')
Opcode.register(0x0525, ViceCityOpcodeCutsceneObject.attachToComponent, 'attach_cutscene_object_to_component [CutsceneObject] {char} [CutsceneObject] {frameName} [string]')
Opcode.register(0x054b, ViceCityOpcodeCutsceneObject.attachToVehicle, 'attach_cutscene_object_to_vehicle [CutsceneObject] {vehicle} [Car]')
