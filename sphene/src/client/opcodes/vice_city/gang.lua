ViceCityOpcodeGang = {}
ViceCityOpcodeGang.__index = ViceCityOpcodeGang

-- Opcode: 0x0235
-- Instruction: set_gang_ped_models {gangId} [GangType] {modelId1} [model_char] {modelId2} [model_char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0235
function ViceCityOpcodeGang.setPedModels(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0236
-- Instruction: set_gang_car_model {gangId} [GangType] {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0236
function ViceCityOpcodeGang.setCarModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0592
-- Instruction: set_gang_attack_player_with_cops {gangId} [GangType] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0592
function ViceCityOpcodeGang.setAttackPlayerWithCops(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0235, ViceCityOpcodeGang.setPedModels, 'set_gang_ped_models {gangId} [GangType] {modelId1} [model_char] {modelId2} [model_char]')
Opcode.register(0x0236, ViceCityOpcodeGang.setCarModel, 'set_gang_car_model {gangId} [GangType] {modelId} [model_vehicle]')
Opcode.register(0x0592, ViceCityOpcodeGang.setAttackPlayerWithCops, 'set_gang_attack_player_with_cops {gangId} [GangType] {state} [bool]')
