SharedOpcodePlayer = {}
SharedOpcodePlayer.__index = SharedOpcodePlayer

-- Opcode: 0x0053
-- Instruction: [var handle: Player] = create_player {playerIndex} [int] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0053
function SharedOpcodePlayer.create(model, posX, posY, posZ, _)
    local player = PlayerElement:create(model, localPlayer)

    player:spawn(posX, posY, posZ)

    return player
end

-- Opcode: 0x0109
-- Instruction: add_score [Player] {money} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0109
function SharedOpcodePlayer.addScore(player, money)
    -- @TODO: Add setMoney method to PlayerElement
    -- player:setMoney(money)
    return TaskHandler.sendTask(nil, TaskCode.GIVE_PLAYER_MONEY, money)
end

-- Opcode: 0x010A
-- Instruction: is_score_greater [Player] {money} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/010A
function SharedOpcodePlayer.isScoreGreater(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x010B
-- Instruction: [var money: int] = store_score [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/010B
function SharedOpcodePlayer.storeScore(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x010D
-- Instruction: alter_wanted_level [Player] {wantedLevel} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/010D
function SharedOpcodePlayer.alterWantedLevel(player, wantedLevel)
    return TaskHandler.sendTask(nil, TaskCode.PLAYER_SET_WANTED_LEVEL, wantedLevel)
end

-- Opcode: 0x010E
-- Instruction: alter_wanted_level_no_drop [Player] {wantedLevel} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/010E
function SharedOpcodePlayer.alterWantedLevelNoDrop(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x010F
-- Instruction: is_wanted_level_greater [Player] {wantedLevel} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/010F
function SharedOpcodePlayer.isWantedLevelGreater(player, wantedLevel)
    return (player:getWantedLevel() > wantedLevel)
end

-- Opcode: 0x0110
-- Instruction: clear_wanted_level [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0110
function SharedOpcodePlayer.clearWantedLevel()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0117
-- Instruction: is_player_dead {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0117
function SharedOpcodePlayer.isDead(player)
   return player:isDead()
end

-- Opcode: 0x0122
-- Instruction: is_player_pressing_horn [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0122
function SharedOpcodePlayer.isPressingHorn(player)
    return player:getControlState('horn')
end

-- Opcode: 0x01B4
-- Instruction: set_player_control [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01B4
function SharedOpcodePlayer.setControl(player, canMove)
    player:setMoveable(canMove == 1)
end

-- Opcode: 0x01C0
-- Instruction: [var wantedLevel: int] = store_wanted_level [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01C0
function SharedOpcodePlayer.storeWantedLevel(player, _)
    return player:getWantedLevel()
end

-- Opcode: 0x01F5
-- Instruction: [var handle: Char] = get_player_char [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01F5
function SharedOpcodePlayer.getChar(playerHandle, _)
    return playerHandle
end

-- Opcode: 0x0221
-- Instruction: apply_brakes_to_players_car [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0221
function SharedOpcodePlayer.applyBrakesToCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0241
-- Instruction: is_player_in_remote_mode [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0241
function SharedOpcodePlayer.isInRemoteMode(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0256
-- Instruction: is_player_playing [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0256
function SharedOpcodePlayer.isPlaying(player)
    if (player:isPlayer() and player:hasSpawned()) then
        return true
    end

    return false
end

-- Opcode: 0x0297
-- Instruction: reset_num_of_models_killed_by_player [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0297
function SharedOpcodePlayer.resetNumOfModelsKilled()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0298
-- Instruction: [var amount: int] = get_num_of_models_killed_by_player [Player] {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0298
function SharedOpcodePlayer.getNumOfModelsKilled(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0330
-- Instruction: set_player_never_gets_tired [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0330
function SharedOpcodePlayer.setNeverGetsTired(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0331
-- Instruction: set_player_fast_reload [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0331
function SharedOpcodePlayer.setFastReload(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03EE
-- Instruction: can_player_start_mission [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03EE
function SharedOpcodePlayer.canStartMission(player)
    return not player:isFrozen()
end

-- Opcode: 0x03EF
-- Instruction: make_player_safe_for_cutscene [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03EF
function SharedOpcodePlayer.makeSafeForCutscene(player)
    Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0414
-- Instruction: set_free_health_care [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0414
function SharedOpcodePlayer.setFreeHealthCare(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0457
-- Instruction: is_player_targetting_char [Player] {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0457
function SharedOpcodePlayer.isTargetingChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04E3
-- Instruction: set_player_mood [Player] {mood} [PlayerMood] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04E3
function SharedOpcodePlayer.setMood(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04FC
-- Instruction: [var twoWheelsTime: int], [var twoWheelsDistance: float], [var wheelieTime: int], [var wheelieDistance: float], [var stoppieTime: int], [var stoppieDistance: float] = get_wheelie_stats [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04FC
function SharedOpcodePlayer.getWheelieStats(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0500
-- Instruction: is_player_wearing [Player] {modelName} [string] {bodyPart} [BodyPart]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0500
function SharedOpcodePlayer.isWearing(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0501
-- Instruction: set_player_can_do_drive_by [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0501
function SharedOpcodePlayer.setCanDoDriveBy(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x052C
-- Instruction: set_player_drunkenness [Player] {intensity} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/052C
function SharedOpcodePlayer.setDrunkenness(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x055D
-- Instruction: make_player_fire_proof [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/055D
function SharedOpcodePlayer.makeFireProof(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x055E
-- Instruction: increase_player_max_health [Player] {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/055E
function SharedOpcodePlayer.increaseMaxHealth(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x055F
-- Instruction: increase_player_max_armour [Player] {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/055F
function SharedOpcodePlayer.increaseMaxArmor(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0563
-- Instruction: ensure_player_has_drive_by_weapon [Player] {ammo} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0563
function SharedOpcodePlayer.ensureHasDriveByWeapon(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0583
-- Instruction: is_player_in_info_zone [Player] {infoZone} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0583
function SharedOpcodePlayer.isInInfoZone(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0053, SharedOpcodePlayer.create, '[var handle: Player] = create_player {playerIndex} [int] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0109, SharedOpcodePlayer.addScore, 'add_score [Player] {money} [int]')
Opcode.register(0x010a, SharedOpcodePlayer.isScoreGreater, 'is_score_greater [Player] {money} [int]')
Opcode.register(0x010b, SharedOpcodePlayer.storeScore, '[var money: int] = store_score [Player]')
Opcode.register(0x010d, SharedOpcodePlayer.alterWantedLevel, 'alter_wanted_level [Player] {wantedLevel} [int]')
Opcode.register(0x010e, SharedOpcodePlayer.alterWantedLevelNoDrop, 'alter_wanted_level_no_drop [Player] {wantedLevel} [int]')
Opcode.register(0x010f, SharedOpcodePlayer.isWantedLevelGreater, 'is_wanted_level_greater [Player] {wantedLevel} [int]')
Opcode.register(0x0110, SharedOpcodePlayer.clearWantedLevel, 'clear_wanted_level [Player]')
Opcode.register(0x0117, SharedOpcodePlayer.isDead, 'is_player_dead {handle} [any]')
Opcode.register(0x0122, SharedOpcodePlayer.isPressingHorn, 'is_player_pressing_horn [Player]')
Opcode.register(0x01b4, SharedOpcodePlayer.setControl, 'set_player_control [Player] {state} [bool]')
Opcode.register(0x01c0, SharedOpcodePlayer.storeWantedLevel, '[var wantedLevel: int] = store_wanted_level [Player]')
Opcode.register(0x01f5, SharedOpcodePlayer.getChar, '[var handle: Char] = get_player_char [Player]')
Opcode.register(0x0221, SharedOpcodePlayer.applyBrakesToCar, 'apply_brakes_to_players_car [Player] {state} [bool]')
Opcode.register(0x0241, SharedOpcodePlayer.isInRemoteMode, 'is_player_in_remote_mode [Player]')
Opcode.register(0x0256, SharedOpcodePlayer.isPlaying, 'is_player_playing [Player]')
Opcode.register(0x0297, SharedOpcodePlayer.resetNumOfModelsKilled, 'reset_num_of_models_killed_by_player [Player]')
Opcode.register(0x0298, SharedOpcodePlayer.getNumOfModelsKilled, '[var amount: int] = get_num_of_models_killed_by_player [Player] {modelId} [model_any]')
Opcode.register(0x0330, SharedOpcodePlayer.setNeverGetsTired, 'set_player_never_gets_tired [Player] {state} [bool]')
Opcode.register(0x0331, SharedOpcodePlayer.setFastReload, 'set_player_fast_reload [Player] {state} [bool]')
Opcode.register(0x03ee, SharedOpcodePlayer.canStartMission, 'can_player_start_mission [Player]')
Opcode.register(0x03ef, SharedOpcodePlayer.makeSafeForCutscene, 'make_player_safe_for_cutscene [Player]')
Opcode.register(0x0414, SharedOpcodePlayer.setFreeHealthCare, 'set_free_health_care [Player] {state} [bool]')
Opcode.register(0x0457, SharedOpcodePlayer.isTargetingChar, 'is_player_targetting_char [Player] {handle} [Char]')
Opcode.register(0x04e3, SharedOpcodePlayer.setMood, 'set_player_mood [Player] {mood} [PlayerMood] {time} [int]')
Opcode.register(0x04fc, SharedOpcodePlayer.getWheelieStats, '[var twoWheelsTime: int], [var twoWheelsDistance: float], [var wheelieTime: int], [var wheelieDistance: float], [var stoppieTime: int], [var stoppieDistance: float] = get_wheelie_stats [Player]')
Opcode.register(0x0500, SharedOpcodePlayer.isWearing, 'is_player_wearing [Player] {modelName} [string] {bodyPart} [BodyPart]')
Opcode.register(0x0501, SharedOpcodePlayer.setCanDoDriveBy, 'set_player_can_do_drive_by [Player] {state} [bool]')
Opcode.register(0x052c, SharedOpcodePlayer.setDrunkenness, 'set_player_drunkenness [Player] {intensity} [int]')
Opcode.register(0x055d, SharedOpcodePlayer.makeFireProof, 'make_player_fire_proof [Player] {state} [bool]')
Opcode.register(0x055e, SharedOpcodePlayer.increaseMaxHealth, 'increase_player_max_health [Player] {value} [int]')
Opcode.register(0x055f, SharedOpcodePlayer.increaseMaxArmor, 'increase_player_max_armour [Player] {value} [int]')
Opcode.register(0x0563, SharedOpcodePlayer.ensureHasDriveByWeapon, 'ensure_player_has_drive_by_weapon [Player] {ammo} [int]')
Opcode.register(0x0583, SharedOpcodePlayer.isInInfoZone, 'is_player_in_info_zone [Player] {infoZone} [gxt_key]')
