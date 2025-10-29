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
        return 0
    elseif (zone == "San Fierro") then
        return 1
    elseif (zone == "Las Venturas") then
        return 2
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


Opcode.register(0x0458, SanAndreasOpcodePlayer.isTargetingObject, 'is_player_targetting_object [Player] {handle} [Object]')
Opcode.register(0x068c, SanAndreasOpcodePlayer.isTargetingAnything, 'is_player_targetting_anything [Player]')
Opcode.register(0x06af, SanAndreasOpcodePlayer.disableSprint, 'disable_player_sprint [Player] {state} [bool]')
Opcode.register(0x06df, SanAndreasOpcodePlayer.delete, 'delete_player [Player]')
Opcode.register(0x070d, SanAndreasOpcodePlayer.buildModel, 'build_player_model [Player]')
Opcode.register(0x0784, SanAndreasOpcodePlayer.giveClothes, 'give_player_clothes [Player] {textureHash} [int] {modelHash} [int] {bodyPart} [BodyPart]')
Opcode.register(0x0793, SanAndreasOpcodePlayer.storeClothesState, 'store_clothes_state')
Opcode.register(0x0794, SanAndreasOpcodePlayer.restoreClothesState, 'restore_clothes_state')
Opcode.register(0x07af, SanAndreasOpcodePlayer.getGroup, '[var handle: Group] = get_player_group [Player]')
Opcode.register(0x07b4, SanAndreasOpcodePlayer.setGroupRecruitment, 'set_player_group_recruitment [Player] {state} [bool]')
Opcode.register(0x07f1, SanAndreasOpcodePlayer.isPerformingWheelie, 'is_player_performing_wheelie [Player]')
Opcode.register(0x07f2, SanAndreasOpcodePlayer.isPerformingStoppie, 'is_player_performing_stoppie [Player]')
Opcode.register(0x0806, SanAndreasOpcodePlayer.getTotalNumberOfPedsKilled, '[var numPeds: int] = get_total_number_of_peds_killed_by_player [Player]')
Opcode.register(0x0842, SanAndreasOpcodePlayer.getCityIsIn, '[var townId: Town] = get_city_player_is_in [Player]')
Opcode.register(0x0858, SanAndreasOpcodePlayer.setHeadingForAttached, 'set_heading_for_attached_player [Player] {heading} [float] {rotationSpeed} [float]')
Opcode.register(0x0861, SanAndreasOpcodePlayer.isAttachedHeadingAchieved, 'is_attached_player_heading_achieved [Player]')
Opcode.register(0x087b, SanAndreasOpcodePlayer.giveClothesOutsideShop, 'give_player_clothes_outside_shop [Player] {textureName} [string] {modelName} [string] {bodyPart} [BodyPart]')
Opcode.register(0x08f5, SanAndreasOpcodePlayer.makeGangDisappear, 'make_player_gang_disappear')
Opcode.register(0x08f6, SanAndreasOpcodePlayer.makeGangReappear, 'make_player_gang_reappear')
Opcode.register(0x08f7, SanAndreasOpcodePlayer.getClothesItem, '[var textureHash: int], [var modelHash: int] = get_clothes_item [Player] {bodyPart} [BodyPart]')
Opcode.register(0x0945, SanAndreasOpcodePlayer.getMaxArmor, '[var maxArmour: int] = get_player_max_armour [Player]')
Opcode.register(0x09c7, SanAndreasOpcodePlayer.setModel, 'set_player_model [Player] {modelId} [int]')
Opcode.register(0x09d7, SanAndreasOpcodePlayer.forceInteriorLighting, 'force_interior_lighting_for_player [Player] {state} [bool]')
Opcode.register(0x09d9, SanAndreasOpcodePlayer.useDetonator, 'use_detonator')
Opcode.register(0x09e7, SanAndreasOpcodePlayer.isControlOn, 'is_player_control_on [Player]')
Opcode.register(0x09eb, SanAndreasOpcodePlayer.takeOffGoggles, 'player_take_off_goggles [Player] {animate} [bool]')
Opcode.register(0x0a0c, SanAndreasOpcodePlayer.isUsingJetpack, 'is_player_using_jetpack [Player]')
Opcode.register(0x0a20, SanAndreasOpcodePlayer.setGroupToFollowAlways, 'set_player_group_to_follow_always [Player] {state} [bool]')
Opcode.register(0x0a29, SanAndreasOpcodePlayer.isClimbing, 'is_player_climbing [Player]')
Opcode.register(0x0a31, SanAndreasOpcodePlayer.setGroupToFollowNever, 'set_player_group_to_follow_never [Player] {state} [bool]')
Opcode.register(0x0a3a, SanAndreasOpcodePlayer.isLastBuildingModelShot, 'is_last_building_model_shot_by_player [Player] {modelId} [model_any]')
Opcode.register(0x0a3b, SanAndreasOpcodePlayer.clearLastBuildingModelShot, 'clear_last_building_model_shot_by_player [Player]')
Opcode.register(0x0ad2, SanAndreasOpcodePlayer.getCharIsTargeting, '[var handle: Char] = get_char_player_is_targeting [Player]')
Opcode.register(0x0e5e, SanAndreasOpcodePlayer.changeMoney, 'change_player_money [Player] {mode} [ChangeMoney] {value} [int]')
