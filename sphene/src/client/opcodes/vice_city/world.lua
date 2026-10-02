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


-- INI: 0503=3,create_rappel_at %1d% %2d% %3d%
Opcode.register(0x0503, ViceCityOpcodeWorld.createSwatRope, 3, '${4} = create_swat_rope ${1} ${2} ${3}', {false, false, false, true})
-- INI: 037e=6,  sniper_bullet_in_area %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x037e, ViceCityOpcodeWorld.isSniperBulletInArea, 6, 'is_sniper_bullet_in_area ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 03ad=1,set_rubbish %1b:visible/invisible%
Opcode.register(0x03ad, ViceCityOpcodeWorld.switchRubbish, 1, 'switch_rubbish ${1}', {false})
-- INI: 03ae=6,remove_objects_from_cube %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x03ae, ViceCityOpcodeWorld.removeParticleEffectsInArea, 6, 'remove_particle_effects_in_area ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 03df=1,all_random_peds %1m%
Opcode.register(0x03df, ViceCityOpcodeWorld.forceRandomPedType, 1, 'force_random_ped_type ${1}', {false})
-- INI: 0469=10,create_actor %10d% in area %1d% %2d% %3d% %4d% unknown %5h% %6h% %7h% %8h% %9h%
Opcode.register(0x0469, ViceCityOpcodeWorld.getRandomCopInArea, 10, '${10} = get_random_cop_in_area ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false, true})
-- INI: 0523=3,  glass_been_shattered_near %1d% %2d% %3d%
Opcode.register(0x0523, ViceCityOpcodeWorld.hasGlassBeenShatteredNearby, 3, 'has_glass_been_shattered_nearby ${1} ${2} ${3}', {false, false, false})
-- INI: 0545=0,clear_world
Opcode.register(0x0545, ViceCityOpcodeWorld.removeEverythingForHugeCutscene, 0, 'remove_everything_for_huge_cutscene', {})
-- INI: 0548=6,  player %1d% check_for_ped_model %5m% %6m% radius %2d% %3d% %4d%
Opcode.register(0x0548, ViceCityOpcodeWorld.checkForPedModelAroundPlayer, 6, 'check_for_ped_model_around_player ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 054d=1,display_message_at_stadium %1h%
Opcode.register(0x054d, ViceCityOpcodeWorld.setTonightsEvent, 1, 'set_tonights_event ${1}', {false})
-- INI: 055a=1,set_secondary_rubbish %1h%
Opcode.register(0x055a, ViceCityOpcodeWorld.addPornLeafletToRubbish, 1, 'add_porn_leaflet_to_rubbish ${1}', {false})
-- INI: 058f=8,%8d% = random_ice_cream_customer_in_area %1d% %2d% %3d% %4d% flag %5h% %6h% %7h%
Opcode.register(0x058f, ViceCityOpcodeWorld.getRandomIceCreamCustomerInArea, 8, '${8} = get_random_ice_cream_customer_in_area ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false, true})
-- INI: 0591=4,unlock_all_car_doors_in_area %1d% %2d% %3d% %4d%
Opcode.register(0x0591, ViceCityOpcodeWorld.unlockAllCarDoorsInArea, 4, 'unlock_all_car_doors_in_area ${1} ${2} ${3} ${4}', {false, false, false, false})
