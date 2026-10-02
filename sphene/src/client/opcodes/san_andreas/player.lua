SanAndreasOpcodePlayer = {}
SanAndreasOpcodePlayer.__index = SanAndreasOpcodePlayer

-- Opcode: 0x0458
-- Instruction: is_player_targetting_object [Player] {handle} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0458
function SanAndreasOpcodePlayer.isTargetingObject(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x068C
-- Instruction: is_player_targetting_anything [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/068C
function SanAndreasOpcodePlayer.isTargetingAnything(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06AF
-- Instruction: disable_player_sprint [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06AF
function SanAndreasOpcodePlayer.disableSprint(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06DF
-- Instruction: delete_player [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06DF
function SanAndreasOpcodePlayer.delete(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x070D
-- Instruction: build_player_model [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/070D
function SanAndreasOpcodePlayer.buildModel(player)
    player:rebuild()
end

-- Opcode: 0x0784
-- Instruction: give_player_clothes [Player] {textureHash} [int] {modelHash} [int] {bodyPart} [BodyPart]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0784
function SanAndreasOpcodePlayer.giveClothes(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0793
-- Instruction: store_clothes_state
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0793
function SanAndreasOpcodePlayer.storeClothesState(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0794
-- Instruction: restore_clothes_state
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0794
function SanAndreasOpcodePlayer.restoreClothesState(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07AF
-- Instruction: [var handle: Group] = get_player_group [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07AF
function SanAndreasOpcodePlayer.getGroup(playerHandle, _)
    Script.setOpcodePartiallyImplemented()
    return playerHandle
end

-- Opcode: 0x07B4
-- Instruction: set_player_group_recruitment [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07B4
function SanAndreasOpcodePlayer.setGroupRecruitment(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07F1
-- Instruction: is_player_performing_wheelie [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07F1
function SanAndreasOpcodePlayer.isPerformingWheelie(player)
   return player:isPerformingWheelie()
end

-- Opcode: 0x07F2
-- Instruction: is_player_performing_stoppie [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07F2
function SanAndreasOpcodePlayer.isPerformingStoppie(player)
   return player:isPerformingStoppie()
end

-- Opcode: 0x0806
-- Instruction: [var numPeds: int] = get_total_number_of_peds_killed_by_player [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0806
function SanAndreasOpcodePlayer.getTotalNumberOfPedsKilled(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0842
-- Instruction: [var townId: Town] = get_city_player_is_in [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0842
function SanAndreasOpcodePlayer.getCityIsIn(player)
    Script.setOpcodePartiallyImplemented()
    local posX, posY, posZ = player:getPosition()
    local zone = getZoneName(posX, posY, posZ, true)

    if (zone == "Los Santos") then
        return 1
    elseif (zone == "San Fierro") then
        return 2
    elseif (zone == "Las Venturas") then
        return 3
    end

    return 0
end

-- Opcode: 0x0858
-- Instruction: set_heading_for_attached_player [Player] {heading} [float] {rotationSpeed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0858
function SanAndreasOpcodePlayer.setHeadingForAttached(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0861
-- Instruction: is_attached_player_heading_achieved [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0861
function SanAndreasOpcodePlayer.isAttachedHeadingAchieved(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x087B
-- Instruction: give_player_clothes_outside_shop [Player] {textureName} [string] {modelName} [string] {bodyPart} [BodyPart]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/087B
function SanAndreasOpcodePlayer.giveClothesOutsideShop(player, texture, model, bodyPart)
    player:setClothes(texture, model, bodyPart)
end

-- Opcode: 0x08F5
-- Instruction: make_player_gang_disappear
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08F5
function SanAndreasOpcodePlayer.makeGangDisappear()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08F6
-- Instruction: make_player_gang_reappear
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08F6
function SanAndreasOpcodePlayer.makeGangReappear()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08F7
-- Instruction: [var textureHash: int], [var modelHash: int] = get_clothes_item [Player] {bodyPart} [BodyPart]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08F7
function SanAndreasOpcodePlayer.getClothesItem(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0945
-- Instruction: [var maxArmour: int] = get_player_max_armour [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0945
function SanAndreasOpcodePlayer.getMaxArmor(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09C7
-- Instruction: set_player_model [Player] {modelId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09C7
function SanAndreasOpcodePlayer.setModel(player, model)
   player:setModel(model)
end

-- Opcode: 0x09D7
-- Instruction: force_interior_lighting_for_player [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09D7
function SanAndreasOpcodePlayer.forceInteriorLighting(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09D9
-- Instruction: use_detonator
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09D9
function SanAndreasOpcodePlayer.useDetonator()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09E7
-- Instruction: is_player_control_on [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09E7
function SanAndreasOpcodePlayer.isControlOn(_)
    return Pad.isMoveable()
end

-- Opcode: 0x09EB
-- Instruction: player_take_off_goggles [Player] {animate} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09EB
function SanAndreasOpcodePlayer.takeOffGoggles(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A0C
-- Instruction: is_player_using_jetpack [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A0C
function SanAndreasOpcodePlayer.isUsingJetpack(player)
   return player:isWearingJetpack()
end

-- Opcode: 0x0A20
-- Instruction: set_player_group_to_follow_always [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A20
function SanAndreasOpcodePlayer.setGroupToFollowAlways(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0A29
-- Instruction: is_player_climbing [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A29
function SanAndreasOpcodePlayer.isClimbing(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A31
-- Instruction: set_player_group_to_follow_never [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A31
function SanAndreasOpcodePlayer.setGroupToFollowNever(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A3A
-- Instruction: is_last_building_model_shot_by_player [Player] {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A3A
function SanAndreasOpcodePlayer.isLastBuildingModelShot(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A3B
-- Instruction: clear_last_building_model_shot_by_player [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A3B
function SanAndreasOpcodePlayer.clearLastBuildingModelShot(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AD2
-- Instruction: [var handle: Char] = get_char_player_is_targeting [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AD2
function SanAndreasOpcodePlayer.getCharIsTargeting(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E5E
-- Instruction: change_player_money [Player] {mode} [ChangeMoney] {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E5E
function SanAndreasOpcodePlayer.changeMoney(_, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0458=2,  player %1d% aiming_at_object %2d%
Opcode.register(0x0458, SanAndreasOpcodePlayer.isTargetingObject, 2, 'is_player_targetting_object ${1} ${2}', {false, false})
-- INI: 068C=1,  is_player_autoaiming %1d%
Opcode.register(0x068c, SanAndreasOpcodePlayer.isTargetingAnything, 1, 'is_player_targetting_anything ${1}', {false})
-- INI: 06AF=2,set_player %1d% sprint_mode %2h%
Opcode.register(0x06af, SanAndreasOpcodePlayer.disableSprint, 2, 'disable_player_sprint ${1} ${2}', {false, false})
-- INI: 06DF=1,destroy_player %1d%
Opcode.register(0x06df, SanAndreasOpcodePlayer.delete, 1, 'delete_player ${1}', {false})
-- INI: 070D=1,rebuild_player %1d%
Opcode.register(0x070d, SanAndreasOpcodePlayer.buildModel, 1, 'build_player_model ${1}', {false})
-- INI: 0784=4,set_player %1d% textureCRC %2h% modelCRC %3d% bodypart %4h%
Opcode.register(0x0784, SanAndreasOpcodePlayer.giveClothes, 4, 'give_player_clothes ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0793=0,save_player_clothes
Opcode.register(0x0793, SanAndreasOpcodePlayer.storeClothesState, 0, 'store_clothes_state', {})
-- INI: 0794=0,restore_player_clothes
Opcode.register(0x0794, SanAndreasOpcodePlayer.restoreClothesState, 0, 'restore_clothes_state', {})
-- INI: 07AF=2,%2d% = player %1d% group
Opcode.register(0x07af, SanAndreasOpcodePlayer.getGroup, 2, '${2} = get_player_group ${1}', {false, true})
-- INI: 07B4=2,set_player %1d% gang_recruitment_enabled %2d%
Opcode.register(0x07b4, SanAndreasOpcodePlayer.setGroupRecruitment, 2, 'set_player_group_recruitment ${1} ${2}', {false, false})
-- INI: 07F1=1,  player %1d% performing_wheelie
Opcode.register(0x07f1, SanAndreasOpcodePlayer.isPerformingWheelie, 1, 'is_player_performing_wheelie ${1}', {false})
-- INI: 07F2=1,  player %1d% performing_stoppie
Opcode.register(0x07f2, SanAndreasOpcodePlayer.isPerformingStoppie, 1, 'is_player_performing_stoppie ${1}', {false})
-- INI: 0806=2,get_player %1d% kills_from_last_checkpoint %2d%
Opcode.register(0x0806, SanAndreasOpcodePlayer.getTotalNumberOfPedsKilled, 2, '${2} = get_total_number_of_peds_killed_by_player ${1}', {false, true})
-- INI: 0842=2,%2d% = player %1d% town_number
Opcode.register(0x0842, SanAndreasOpcodePlayer.getCityIsIn, 2, '${2} = get_city_player_is_in ${1}', {false, true})
-- INI: 0858=3,set_player %1d% scan_horizon_to_angle %2d% rotation_speed %3d%
Opcode.register(0x0858, SanAndreasOpcodePlayer.setHeadingForAttached, 3, 'set_heading_for_attached_player ${1} ${2} ${3}', {false, true, true})
-- INI: 0861=1,  unknown_player %1d% scanning_horizon ; param is useless
Opcode.register(0x0861, SanAndreasOpcodePlayer.isAttachedHeadingAchieved, 1, 'is_attached_player_heading_achieved ${1}', {false})
-- INI: 087B=4,set_player %1d% clothes_texture %2h% model %3h% body_part %4h%
Opcode.register(0x087b, SanAndreasOpcodePlayer.giveClothesOutsideShop, 4, 'give_player_clothes_outside_shop ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 08F5=0,save_player_group
Opcode.register(0x08f5, SanAndreasOpcodePlayer.makeGangDisappear, 0, 'make_player_gang_disappear', {})
-- INI: 08F6=0,restore_player_group
Opcode.register(0x08f6, SanAndreasOpcodePlayer.makeGangReappear, 0, 'make_player_gang_reappear', {})
-- INI: 08F7=4,get_player %1d% bodypart %2h% textureCRC_to %3d% modelCRC_to %4d%
Opcode.register(0x08f7, SanAndreasOpcodePlayer.getClothesItem, 4, '${3}, ${4} = get_clothes_item ${1} ${2}', {false, false, true, true})
-- INI: 0945=2,get_player %1d% max_armour_to %2d%
Opcode.register(0x0945, SanAndreasOpcodePlayer.getMaxArmor, 2, '${2} = get_player_max_armour ${1}', {false, true})
-- INI: 09C7=2,change_player %1d% model_to %2m%
Opcode.register(0x09c7, SanAndreasOpcodePlayer.setModel, 2, 'set_player_model ${1} ${ped.2}', {false, false})
-- INI: 09D7=2,set_player %1d% force_interior_lighting %2h%
Opcode.register(0x09d7, SanAndreasOpcodePlayer.forceInteriorLighting, 2, 'force_interior_lighting_for_player ${1} ${2}', {false, false})
-- INI: 09D9=0,detonate_all_satchel_charges
Opcode.register(0x09d9, SanAndreasOpcodePlayer.useDetonator, 0, 'use_detonator', {})
-- INI: 09E7=1,  player %1d% not_frozen
Opcode.register(0x09e7, SanAndreasOpcodePlayer.isControlOn, 1, 'is_player_control_on ${1}', {false})
-- INI: 09EB=2,remove_player_goggles %1d% use_anim %2h%
Opcode.register(0x09eb, SanAndreasOpcodePlayer.takeOffGoggles, 2, 'player_take_off_goggles ${1} ${2}', {false, false})
-- INI: 0A0C=1,  player %1d% on_jetpack
Opcode.register(0x0a0c, SanAndreasOpcodePlayer.isUsingJetpack, 1, 'is_player_using_jetpack ${1}', {false})
-- INI: 0A20=2,disable_player %1d% group_control_back %2h%
Opcode.register(0x0a20, SanAndreasOpcodePlayer.setGroupToFollowAlways, 2, 'set_player_group_to_follow_always ${1} ${2}', {false, false})
-- INI: 0A29=1,  player %1d% climbing
Opcode.register(0x0a29, SanAndreasOpcodePlayer.isClimbing, 1, 'is_player_climbing ${1}', {false})
-- INI: 0A31=2,set_player %1d% group_to_follow_never %2h%
Opcode.register(0x0a31, SanAndreasOpcodePlayer.setGroupToFollowNever, 2, 'set_player_group_to_follow_never ${1} ${2}', {false, false})
-- INI: 0A3A=2,  player %1d% last_model_shot %2o%
Opcode.register(0x0a3a, SanAndreasOpcodePlayer.isLastBuildingModelShot, 2, 'is_last_building_model_shot_by_player ${1} ${object.2}', {false, false})
-- INI: 0A3B=1,clear_player %1d% last_model_shot
Opcode.register(0x0a3b, SanAndreasOpcodePlayer.clearLastBuildingModelShot, 1, 'clear_last_building_model_shot_by_player ${1}', {false})
-- INI: 0AD2=2,%2d% = player %1d% targeted_actor // IF and SET
Opcode.register(0x0ad2, SanAndreasOpcodePlayer.getCharIsTargeting, 2, '${2} = get_char_player_is_targeting ${1}', {false, true})
-- INI: 0E5E=3,change_player_money %1d% mode %2d% value %3d%
Opcode.register(0x0e5e, SanAndreasOpcodePlayer.changeMoney, 3, 'change_player_money ${1} ${2} ${3}', {false, false, false})
