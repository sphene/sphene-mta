ViceCityOpcodeWorld = {}
ViceCityOpcodeWorld.__index = ViceCityOpcodeWorld

-- Opcode: 0x0503
-- Instruction: [var handle: Char] = create_swat_rope {pedType} [PedType] {modelId} [model_char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0503
function ViceCityOpcodeWorld.createSwatRope(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x037E
-- Instruction: is_sniper_bullet_in_area {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/037E
function ViceCityOpcodeWorld.isSniperBulletInArea(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03AD
-- Instruction: switch_rubbish {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03AD
function ViceCityOpcodeWorld.switchRubbish(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03AE
-- Instruction: remove_particle_effects_in_area {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03AE
function ViceCityOpcodeWorld.removeParticleEffectsInArea(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03DF
-- Instruction: force_random_ped_type {pedType} [PedType]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03DF
function ViceCityOpcodeWorld.forceRandomPedType(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0469
-- Instruction: [var handle: Char] = get_random_cop_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {cop} [bool] {swat} [bool] {fbi} [bool] {army} [bool] {vice} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0469
function ViceCityOpcodeWorld.getRandomCopInArea(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0523
-- Instruction: has_glass_been_shattered_nearby {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0523
function ViceCityOpcodeWorld.hasGlassBeenShatteredNearby(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0545
-- Instruction: remove_everything_for_huge_cutscene
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0545
function ViceCityOpcodeWorld.removeEverythingForHugeCutscene()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0548
-- Instruction: check_for_ped_model_around_player {player} [Player] {offsetX} [float] {offsetY} [float] {offsetZ} [float] {modelId1} [model_char] {modelId2} [model_char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0548
function ViceCityOpcodeWorld.checkForPedModelAroundPlayer(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x054D
-- Instruction: set_tonights_event {scrollbarMessage} [ScrollbarMessage]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/054D
function ViceCityOpcodeWorld.setTonightsEvent(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x055A
-- Instruction: add_porn_leaflet_to_rubbish {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/055A
function ViceCityOpcodeWorld.addPornLeafletToRubbish(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x058F
-- Instruction: [var handle: Char] = get_random_ice_cream_customer_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {allowCivilian} [int] {allowGangMember} [int] {allowCriminal} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/058F
function ViceCityOpcodeWorld.getRandomIceCreamCustomerInArea(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0591
-- Instruction: unlock_all_car_doors_in_area {leftBottomX} [float] {leftBottomY} [float] {topRightX} [float] {topRightY} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0591
function ViceCityOpcodeWorld.unlockAllCarDoorsInArea(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0503, ViceCityOpcodeWorld.createSwatRope, '[var handle: Char] = create_swat_rope {pedType} [PedType] {modelId} [model_char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x037e, ViceCityOpcodeWorld.isSniperBulletInArea, 'is_sniper_bullet_in_area {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x03ad, ViceCityOpcodeWorld.switchRubbish, 'switch_rubbish {state} [bool]')
Opcode.register(0x03ae, ViceCityOpcodeWorld.removeParticleEffectsInArea, 'remove_particle_effects_in_area {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x03df, ViceCityOpcodeWorld.forceRandomPedType, 'force_random_ped_type {pedType} [PedType]')
Opcode.register(0x0469, ViceCityOpcodeWorld.getRandomCopInArea, '[var handle: Char] = get_random_cop_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {cop} [bool] {swat} [bool] {fbi} [bool] {army} [bool] {vice} [bool]')
Opcode.register(0x0523, ViceCityOpcodeWorld.hasGlassBeenShatteredNearby, 'has_glass_been_shattered_nearby {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0545, ViceCityOpcodeWorld.removeEverythingForHugeCutscene, 'remove_everything_for_huge_cutscene')
Opcode.register(0x0548, ViceCityOpcodeWorld.checkForPedModelAroundPlayer, 'check_for_ped_model_around_player {player} [Player] {offsetX} [float] {offsetY} [float] {offsetZ} [float] {modelId1} [model_char] {modelId2} [model_char]')
Opcode.register(0x054d, ViceCityOpcodeWorld.setTonightsEvent, 'set_tonights_event {scrollbarMessage} [ScrollbarMessage]')
Opcode.register(0x055a, ViceCityOpcodeWorld.addPornLeafletToRubbish, 'add_porn_leaflet_to_rubbish {state} [bool]')
Opcode.register(0x058f, ViceCityOpcodeWorld.getRandomIceCreamCustomerInArea, '[var handle: Char] = get_random_ice_cream_customer_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {allowCivilian} [int] {allowGangMember} [int] {allowCriminal} [int]')
Opcode.register(0x0591, ViceCityOpcodeWorld.unlockAllCarDoorsInArea, 'unlock_all_car_doors_in_area {leftBottomX} [float] {leftBottomY} [float] {topRightX} [float] {topRightY} [float]')
