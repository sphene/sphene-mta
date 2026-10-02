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


-- INI: 0053=5,%5d% = create_player %1d% at %2d% %3d% %4d%
Opcode.register(0x0053, SharedOpcodePlayer.create, 5, '${5} = create_player ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 0109=2,player %1d% money += %2d%
Opcode.register(0x0109, SharedOpcodePlayer.addScore, 2, 'add_score ${1} ${2}', {false, false})
-- INI: 010a=2,  player %1d% money > %2d%
Opcode.register(0x010a, SharedOpcodePlayer.isScoreGreater, 2, 'is_score_greater ${1} ${2}', {false, false})
-- INI: 010b=2,%2d% = player %1d% money
Opcode.register(0x010b, SharedOpcodePlayer.storeScore, 2, '${2} = store_score ${1}', {false, true})
-- INI: 010d=2,set_player %1d% wanted_level_to %2d%
Opcode.register(0x010d, SharedOpcodePlayer.alterWantedLevel, 2, 'alter_wanted_level ${1} ${2}', {false, false})
-- INI: 010e=2,set_player %1d% minimum_wanted_level_to %2d%
Opcode.register(0x010e, SharedOpcodePlayer.alterWantedLevelNoDrop, 2, 'alter_wanted_level_no_drop ${1} ${2}', {false, false})
-- INI: 010f=2,  player %1d% wanted_level > %2d%
Opcode.register(0x010f, SharedOpcodePlayer.isWantedLevelGreater, 2, 'is_wanted_level_greater ${1} ${2}', {false, false})
-- INI: 0110=1,clear_player %1d% wanted_level
Opcode.register(0x0110, SharedOpcodePlayer.clearWantedLevel, 1, 'clear_wanted_level ${1}', {false})
-- INI: 0117=1,  player %1d% wasted
Opcode.register(0x0117, SharedOpcodePlayer.isDead, 1, 'is_player_dead ${1}', {false})
-- INI: 0122=1,  player %1d% pressing_horn
Opcode.register(0x0122, SharedOpcodePlayer.isPressingHorn, 1, 'is_player_pressing_horn ${1}', {false})
-- INI: 01b4=2,set_player %1d% can_move %2d%
Opcode.register(0x01b4, SharedOpcodePlayer.setControl, 2, 'set_player_control ${1} ${2}', {false, false})
-- INI: 01c0=2,%2d% = player %1d% wanted_level
Opcode.register(0x01c0, SharedOpcodePlayer.storeWantedLevel, 2, '${2} = store_wanted_level ${1}', {false, true})
-- INI: 01f5=2,%2d% = create_emulated_actor_from_player %1d%
Opcode.register(0x01f5, SharedOpcodePlayer.getChar, 2, '${2} = get_player_char ${1}', {false, true})
-- INI: 0221=2,set_player %1d% apply_brakes_to_car %2d%
Opcode.register(0x0221, SharedOpcodePlayer.applyBrakesToCar, 2, 'apply_brakes_to_players_car ${1} ${2}', {false, false})
-- INI: 0241=1,  player %1d% in_remote_mode
Opcode.register(0x0241, SharedOpcodePlayer.isInRemoteMode, 1, 'is_player_in_remote_mode ${1}', {false})
-- INI: 0256=1,  player %1d% defined
Opcode.register(0x0256, SharedOpcodePlayer.isPlaying, 1, 'is_player_playing ${1}', {false})
-- INI: 0297=0,clear_rampage_kills
Opcode.register(0x0297, SharedOpcodePlayer.resetNumOfModelsKilled, 1, 'reset_num_of_models_killed_by_player ${1}', {false})
-- INI: 0298=2,%2d% = rampage_kills %1m%
Opcode.register(0x0298, SharedOpcodePlayer.getNumOfModelsKilled, 3, '${2} = get_num_of_models_killed_by_player ${1}', {false, true})
-- INI: 0330=2,set_player %1d% infinite_run_to %2b:true/false%
Opcode.register(0x0330, SharedOpcodePlayer.setNeverGetsTired, 2, 'set_player_never_gets_tired ${1} ${2}', {false, false})
-- INI: 0331=2,set_player %1d% fast_reload %2h%
Opcode.register(0x0331, SharedOpcodePlayer.setFastReload, 2, 'set_player_fast_reload ${1} ${2}', {false, false})
-- INI: 03ee=1,  player %1d% controllable
Opcode.register(0x03ee, SharedOpcodePlayer.canStartMission, 1, 'can_player_start_mission ${1}', {false})
-- INI: 03ef=1,player %1d% make_safe
Opcode.register(0x03ef, SharedOpcodePlayer.makeSafeForCutscene, 1, 'make_player_safe_for_cutscene ${1}', {false})
-- INI: 0414=2,set_player %1d% single_free_treatment %2d%
Opcode.register(0x0414, SharedOpcodePlayer.setFreeHealthCare, 2, 'set_free_health_care ${1} ${2}', {false, false})
-- INI: 0457=2,  player %1d% aiming_at_actor %2d%
Opcode.register(0x0457, SharedOpcodePlayer.isTargetingChar, 2, 'is_player_targetting_char ${1} ${2}', {false, false})
-- INI: 04e3=3,set_player %1d% mood %2h% duration %3d%
Opcode.register(0x04e3, SharedOpcodePlayer.setMood, 3, 'set_player_mood ${1} ${2} ${3}', {false, false, false})
-- INI: 04fc=7,store_stunt_data %1d% two_wheels: %2d% %3d% wheelie: %4d% %5d% stoppie: %6d% %7d%
Opcode.register(0x04fc, SharedOpcodePlayer.getWheelieStats, 7, '${2}, ${3}, ${4}, ${5}, ${6}, ${7} = get_wheelie_stats ${1}', {false, true, true, true, true, true, true})
-- INI: 0500=2,  player %1d% skin == %2s%
Opcode.register(0x0500, SharedOpcodePlayer.isWearing, 3, 'is_player_wearing ${1} ${2} ${3}', {false, false, false})
-- INI: 0501=2,set_player %1d% drive_by_mode_enabled %2d%
Opcode.register(0x0501, SharedOpcodePlayer.setCanDoDriveBy, 2, 'set_player_can_do_drive_by ${1} ${2}', {false, false})
-- INI: 052c=2,set_player %1d% drunk_visuals %2d%
Opcode.register(0x052c, SharedOpcodePlayer.setDrunkenness, 2, 'set_player_drunkenness ${1} ${2}', {false, false})
-- INI: 055d=2,make_player %1d% fireproof %2h%
Opcode.register(0x055d, SharedOpcodePlayer.makeFireProof, 2, 'make_player_fire_proof ${1} ${2}', {false, false})
-- INI: 055e=2,set_player %1d% max_health += %2h%
Opcode.register(0x055e, SharedOpcodePlayer.increaseMaxHealth, 2, 'increase_player_max_health ${1} ${2}', {false, false})
-- INI: 055f=2,set_player %1d% max_armour += %2h%
Opcode.register(0x055f, SharedOpcodePlayer.increaseMaxArmor, 2, 'increase_player_max_armour ${1} ${2}', {false, false})
-- INI: 0563=2,give_player %1d% ammo %2d%
Opcode.register(0x0563, SharedOpcodePlayer.ensureHasDriveByWeapon, 2, 'ensure_player_has_drive_by_weapon ${1} ${2}', {false, false})
-- INI: 0583=2,  player %1d% in_zone %2s%
Opcode.register(0x0583, SharedOpcodePlayer.isInInfoZone, 2, 'is_player_in_info_zone ${1} ${2}', {false, false})
