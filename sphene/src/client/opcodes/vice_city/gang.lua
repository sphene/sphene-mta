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


-- INI: 0235=3,set_gang %1h% models_to %2m% %3m%
Opcode.register(0x0235, ViceCityOpcodeGang.setPedModels, 3, 'set_gang_ped_models ${1} ${2} ${3}', {false, true, false})
-- INI: 0236=2,set_gang %1d% car_to %2m%
Opcode.register(0x0236, ViceCityOpcodeGang.setCarModel, 2, 'set_gang_car_model ${1} ${2}', {false, true})
-- INI: 0592=2,set_gang %1h% attack_player_with_cops %2h%
Opcode.register(0x0592, ViceCityOpcodeGang.setAttackPlayerWithCops, 2, 'set_gang_attack_player_with_cops ${1} ${2}', {false, false})
