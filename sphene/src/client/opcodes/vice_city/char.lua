ViceCityOpcodeChar = {}
ViceCityOpcodeChar.__index = ViceCityOpcodeChar

-- Opcode: 0x04EB
-- Instruction: task_toggle_duck {handle} [Char] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04EB
function ViceCityOpcodeChar.setCrouch(actor, crouch)
    if (type(actor) ~= "table") then
        return false
    end

    actor:clearTasks()
    return actor:setControlState("crouch", (crouch == 1) and true or false)
end

-- Opcode: 0x0673
-- Instruction: task_dive_and_get_up {handle} [Char] {directionX} [float] {directionY} [float] {timeOnGround} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0673
function ViceCityOpcodeChar.playAnimation(actor, offsetX, offsetY, timeOnGround)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    Script.setOpcodePartiallyImplemented()

    actor:clearTasks()

    local rotX, rotY, _ = actor:getRotation()
    actor:setAnimation("dodge", "cover_dive_01", timeOnGround, false)

    local posX, posY, _ = actor:getPosition()

    local newX = posX + offsetX
    local newY = posY + offsetY

    actor:setRotation(rotX, rotY, findRotation(posX, posY, newX, newY))

    return true
end

-- Opcode: 0x009C
-- Instruction: char_wander_dir [Char] {direction} [WanderDirection]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/009C
function ViceCityOpcodeChar.wanderDir(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x009E
-- Instruction: char_follow_path [Char] {x} [float] {y} [float] {z} [float] {radius} [float] {moveState} [MoveState]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/009E
function ViceCityOpcodeChar.followPath(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x009F
-- Instruction: char_set_idle [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/009F
function ViceCityOpcodeChar.setIdle(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x011A
-- Instruction: set_char_threat_search [Char] {pedThreat} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/011A
function ViceCityOpcodeChar.setThreatSearch(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x011C
-- Instruction: set_char_obj_no_obj [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/011C
function ViceCityOpcodeChar.setObjNoObj(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0123
-- Instruction: has_char_spotted_player [Char] {player} [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0123
function ViceCityOpcodeChar.hasSpottedPlayer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0126
-- Instruction: is_char_objective_passed [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0126
function ViceCityOpcodeChar.isObjectivePassed(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0192
-- Instruction: set_char_obj_wait_on_foot [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0192
function ViceCityOpcodeChar.setObjWaitOnFoot(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0193
-- Instruction: set_char_obj_flee_on_foot_till_safe [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0193
function ViceCityOpcodeChar.setObjFleeOnFootTillSafe(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0194
-- Instruction: set_char_obj_guard_spot [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0194
function ViceCityOpcodeChar.setObjGuardSpot(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01BE
-- Instruction: turn_char_to_face_coord [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01BE
function ViceCityOpcodeChar.turnToFaceCoord(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01C9
-- Instruction: set_char_obj_kill_char_on_foot [Char] {target} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01C9
function ViceCityOpcodeChar.setObjKillCharOnFoot(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01CA
-- Instruction: set_char_obj_kill_player_on_foot [Char] {target} [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01CA
function ViceCityOpcodeChar.setObjKillPlayerOnFoot(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01CB
-- Instruction: set_char_obj_kill_char_any_means [Char] {target} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01CB
function ViceCityOpcodeChar.setObjKillCharAnyMeans(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01CC
-- Instruction: set_char_obj_kill_player_any_means [Char] {target} [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01CC
function ViceCityOpcodeChar.setObjKillPlayerAnyMeans(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01CE
-- Instruction: set_char_obj_flee_player_on_foot_till_safe [Char] {target} [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01CE
function ViceCityOpcodeChar.setObjFleePlayerOnFootTillSafe(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01CF
-- Instruction: set_char_obj_flee_char_on_foot_always [Char] {target} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01CF
function ViceCityOpcodeChar.setObjFleeCharOnFootAlways(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01D0
-- Instruction: set_char_obj_flee_player_on_foot_always [Char] {target} [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01D0
function ViceCityOpcodeChar.setObjFleePlayerOnFootAlways(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01D1
-- Instruction: set_char_obj_goto_char_on_foot [Char] {target} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01D1
function ViceCityOpcodeChar.setObjGotoCharOnFoot(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01D2
-- Instruction: set_char_obj_goto_player_on_foot [Char] {target} [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01D2
function ViceCityOpcodeChar.setObjGotoPlayerOnFoot(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01D3
-- Instruction: set_char_obj_leave_car [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01D3
function ViceCityOpcodeChar.setObjLeaveCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01D4
-- Instruction: set_char_obj_enter_car_as_passenger [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01D4
function ViceCityOpcodeChar.setObjEnterCarAsPassenger(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01D5
-- Instruction: set_char_obj_enter_car_as_driver [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01D5
function ViceCityOpcodeChar.setObjEnterCarAsDriver(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01D8
-- Instruction: set_char_obj_destroy_object [Char] {handle} [Object]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01D8
function ViceCityOpcodeChar.setObjDestroyObject(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01D9
-- Instruction: set_char_obj_destroy_car [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01D9
function ViceCityOpcodeChar.setObjDestroyCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01DE
-- Instruction: set_char_as_leader [Char] {leader} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01DE
function ViceCityOpcodeChar.followChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01DF
-- Instruction: set_player_as_leader [Char] {leader} [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01DF
function ViceCityOpcodeChar.followPlayer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01E0
-- Instruction: leave_group [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01E0
function ViceCityOpcodeChar.leaveGroup(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01E1
-- Instruction: set_char_obj_follow_route [Char] {routeId} [int] {mode} [FollowRoute]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01E1
function ViceCityOpcodeChar.setObjFollowRoute(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01ED
-- Instruction: clear_char_threat_search [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01ED
function ViceCityOpcodeChar.clearThreatSearch(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x020E
-- Instruction: turn_char_to_face_char [Char] {char} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/020E
function ViceCityOpcodeChar.turnToFaceChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x020F
-- Instruction: turn_char_to_face_player [Char] {player} [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/020F
function ViceCityOpcodeChar.turnToFacePlayer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0211
-- Instruction: set_char_obj_goto_coord_on_foot [Char] {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0211
function ViceCityOpcodeChar.setObjGotoCoordOnFoot(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x022C
-- Instruction: char_look_at_char_always [Char] {target} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/022C
function ViceCityOpcodeChar.lookAtCharAlways(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x022D
-- Instruction: char_look_at_player_always [Char] {target} [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/022D
function ViceCityOpcodeChar.lookAtPlayerAlways(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x022F
-- Instruction: stop_char_looking [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/022F
function ViceCityOpcodeChar.stopLooking(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0239
-- Instruction: set_char_obj_run_to_coord [Char] {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0239
function ViceCityOpcodeChar.setObjRunToCoord(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0243
-- Instruction: set_char_personality [Char] {pedstat} [PedStat]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0243
function ViceCityOpcodeChar.setPersonality(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0291
-- Instruction: set_char_heed_threats [Char] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0291
function ViceCityOpcodeChar.setHeedThreats(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0319
-- Instruction: set_char_running [Char] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0319
function ViceCityOpcodeChar.setRunning(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x031F
-- Instruction: is_char_in_chars_group [Char] {leader} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/031F
function ViceCityOpcodeChar.isInCharsGroup(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0320
-- Instruction: is_char_in_players_group [Char] {leader} [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0320
function ViceCityOpcodeChar.isInPlayersGroup(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0352
-- Instruction: undress_char [Char] {modelName} [string]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0352
function ViceCityOpcodeChar.undress(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0353
-- Instruction: dress_char [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0353
function ViceCityOpcodeChar.dress(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0365
-- Instruction: set_char_obj_hail_taxi [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0365
function ViceCityOpcodeChar.setObjHailTaxi(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0372
-- Instruction: set_char_wait_state [Char] {stateId} [WaitState] {timeInMs} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0372
function ViceCityOpcodeChar.setWaitState(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0377
-- Instruction: set_char_obj_steal_any_car [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0377
function ViceCityOpcodeChar.setObjStealAnyCar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03E2
-- Instruction: set_char_obj_leave_any_car [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03E2
function ViceCityOpcodeChar.setObjLeaveAnyCar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0411
-- Instruction: set_char_use_pednode_seek [Char] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0411
function ViceCityOpcodeChar.setUsePednodeSeek(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x046B
-- Instruction: set_char_obj_flee_car [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/046B
function ViceCityOpcodeChar.setObjFleeCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0481
-- Instruction: set_enter_car_range_multiplier {value} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0481
function ViceCityOpcodeChar.setEnterCarRangeMultiplier(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0482
-- Instruction: set_threat_reaction_range_multiplier {value} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0482
function ViceCityOpcodeChar.setThreatReactionRangeMultiplier(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0483
-- Instruction: set_char_cease_attack_timer [Char] {timer} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0483
function ViceCityOpcodeChar.setCeaseAttackTimer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04C2
-- Instruction: set_char_obj_walk_to_char [Char] {target} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04C2
function ViceCityOpcodeChar.setObjWalkToChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04C6
-- Instruction: set_char_obj_aim_gun_at_char [Char] {target} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04C6
function ViceCityOpcodeChar.setObjAimGunAtChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04F3
-- Instruction: set_char_shuffle_into_drivers_seat [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04F3
function ViceCityOpcodeChar.setShuffleIntoDriversSeat(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04F5
-- Instruction: set_char_as_player_friend [Char] {player} [Player] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04F5
function ViceCityOpcodeChar.setAsPlayerFriend(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04FF
-- Instruction: is_char_obj_no_obj [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04FF
function ViceCityOpcodeChar.isObjNoObj(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0502
-- Instruction: set_char_obj_sprint_to_coord [Char] {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0502
function ViceCityOpcodeChar.setObjSprintToCoord(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x050D
-- Instruction: is_char_leaving_vehicle_to_die [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/050D
function ViceCityOpcodeChar.isLeavingVehicleToDie(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0510
-- Instruction: is_char_wander_path_clear [Char] {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0510
function ViceCityOpcodeChar.isWanderPathClear(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0514
-- Instruction: set_char_can_be_damaged_by_members_of_gang [Char] {gangId} [GangType] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0514
function ViceCityOpcodeChar.setCanBeDamagedByMembersOfGang(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0521
-- Instruction: is_char_drowning_in_water [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0521
function ViceCityOpcodeChar.isDrowningInWater(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x052B
-- Instruction: set_char_answering_mobile [Char] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/052B
function ViceCityOpcodeChar.setAnsweringMobile(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x053C
-- Instruction: set_char_in_players_group_can_fight [Char] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/053C
function ViceCityOpcodeChar.setInPlayersGroupCanFight(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x053D
-- Instruction: clear_char_wait_state [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/053D
function ViceCityOpcodeChar.clearWaitState(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0549
-- Instruction: clear_char_follow_path [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0549
function ViceCityOpcodeChar.clearFollowPath(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0562
-- Instruction: set_char_ignore_threats_behind_objects [Char] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0562
function ViceCityOpcodeChar.setIgnoreThreatsBehindObjects(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x056B
-- Instruction: set_char_crouch_when_threatened [Char] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/056B
function ViceCityOpcodeChar.setCrouchWhenThreatened(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0571
-- Instruction: is_char_stuck [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0571
function ViceCityOpcodeChar.isStuck(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0573
-- Instruction: set_char_stop_shoot_dont_seek_entity [Char] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0573
function ViceCityOpcodeChar.setStopShootDontSeekEntity(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0579
-- Instruction: clear_all_char_anims [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0579
function ViceCityOpcodeChar.clearAllAnims(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0580
-- Instruction: [var status: ObjBuyIceCreamStatus] = set_char_obj_buy_ice_cream [Char] {distributionCar} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0580
function ViceCityOpcodeChar.setObjBuyIceCream(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0584
-- Instruction: clear_char_ice_cream_purchase [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0584
function ViceCityOpcodeChar.clearIceCreamPurchase()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0586
-- Instruction: has_char_attempted_attractor [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0586
function ViceCityOpcodeChar.hasAttemptedAttractor(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x058B
-- Instruction: has_char_bought_ice_cream [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/058B
function ViceCityOpcodeChar.hasBoughtIceCream(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0593
-- Instruction: set_char_frightened_in_jacked_car [Char] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0593
function ViceCityOpcodeChar.setFrightenedInJackedCar(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 04eb=3,actor %1d% crouch %2h% %3d% ms
Opcode.register(0x04eb, ViceCityOpcodeChar.setCrouch, 3, 'task_toggle_duck ${1} ${2}', {false, false, false})
-- INI: 0673=4,play_animation on actor %1d% animgroup %2d% anim %3d% blendfactor %4f%
Opcode.register(0x0673, ViceCityOpcodeChar.playAnimation, 4, 'task_dive_and_get_up ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 009c=2,set_actor %1d% wander_direction %2d%
Opcode.register(0x009c, ViceCityOpcodeChar.wanderDir, 2, 'char_wander_dir ${1} ${2}', {false, false})
-- INI: 009e=6,set_actor %1d% follow_path %2d% %3d% %4d% radius %5d% move_stat %6h%
Opcode.register(0x009e, ViceCityOpcodeChar.followPath, 6, 'char_follow_path ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 009f=1,set_actor %1d% idle
Opcode.register(0x009f, ViceCityOpcodeChar.setIdle, 1, 'char_set_idle ${1}', {false})
-- INI: 011a=2,set_actor %1d% search_threat %2i%
Opcode.register(0x011a, ViceCityOpcodeChar.setThreatSearch, 2, 'set_char_threat_search ${1} ${2}', {false, false})
-- INI: 011c=1,actor %1d% clear_objective
Opcode.register(0x011c, ViceCityOpcodeChar.setObjNoObj, 1, 'set_char_obj_no_obj ${1}', {false})
-- INI: 0123=2,  actor %1d% spotted_player %2d%
Opcode.register(0x0123, ViceCityOpcodeChar.hasSpottedPlayer, 2, 'has_char_spotted_player ${1} ${2}', {false, false})
-- INI: 0126=1,  actor %1d% objective_passed
Opcode.register(0x0126, ViceCityOpcodeChar.isObjectivePassed, 1, 'is_char_objective_passed ${1}', {false})
-- INI: 0192=1,set_actor %1d% objective_to_stand_still
Opcode.register(0x0192, ViceCityOpcodeChar.setObjWaitOnFoot, 1, 'set_char_obj_wait_on_foot ${1}', {false})
-- INI: 0193=1,set_actor %1d% objective_to_act_like_ped
Opcode.register(0x0193, ViceCityOpcodeChar.setObjFleeOnFootTillSafe, 1, 'set_char_obj_flee_on_foot_till_safe ${1}', {false})
-- INI: 0194=4,set_actor %1d% objective_to_guard_point %2d% %3d% %4d%
Opcode.register(0x0194, ViceCityOpcodeChar.setObjGuardSpot, 4, 'set_char_obj_guard_spot ${1} ${2} ${3} ${4}', {false, true, true, true})
-- INI: 01be=4,set_actor %1d% to_look_at_spot %2d% %3d% %4d%
Opcode.register(0x01be, ViceCityOpcodeChar.turnToFaceCoord, 4, 'turn_char_to_face_coord ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 01c9=2,actor %1d% kill_actor %2d%
Opcode.register(0x01c9, ViceCityOpcodeChar.setObjKillCharOnFoot, 2, 'set_char_obj_kill_char_on_foot ${1} ${2}', {false, false})
-- INI: 01ca=2,actor %1d% kill_player %2d%
Opcode.register(0x01ca, ViceCityOpcodeChar.setObjKillPlayerOnFoot, 2, 'set_char_obj_kill_player_on_foot ${1} ${2}', {false, false})
-- INI: 01cb=2,actor %1d% kill_actor %2d%
Opcode.register(0x01cb, ViceCityOpcodeChar.setObjKillCharAnyMeans, 2, 'set_char_obj_kill_char_any_means ${1} ${2}', {false, false})
-- INI: 01cc=2,actor %1d% kill_player %2d%
Opcode.register(0x01cc, ViceCityOpcodeChar.setObjKillPlayerAnyMeans, 2, 'set_char_obj_kill_player_any_means ${1} ${2}', {false, false})
-- INI: 01ce=2,actor %1d% avoid_player %2d%
Opcode.register(0x01ce, ViceCityOpcodeChar.setObjFleePlayerOnFootTillSafe, 2, 'set_char_obj_flee_player_on_foot_till_safe ${1} ${2}', {false, false})
-- INI: 01cf=2,actor %1d% avoid_actor %2d%
Opcode.register(0x01cf, ViceCityOpcodeChar.setObjFleeCharOnFootAlways, 2, 'set_char_obj_flee_char_on_foot_always ${1} ${2}', {false, false})
-- INI: 01d0=2,actor %1d% avoid_player %2d%
Opcode.register(0x01d0, ViceCityOpcodeChar.setObjFleePlayerOnFootAlways, 2, 'set_char_obj_flee_player_on_foot_always ${1} ${2}', {false, false})
-- INI: 01d1=2,actor %1d% follow_actor %2d%
Opcode.register(0x01d1, ViceCityOpcodeChar.setObjGotoCharOnFoot, 2, 'set_char_obj_goto_char_on_foot ${1} ${2}', {false, false})
-- INI: 01d2=2,actor %1d% follow_player %2d%
Opcode.register(0x01d2, ViceCityOpcodeChar.setObjGotoPlayerOnFoot, 2, 'set_char_obj_goto_player_on_foot ${1} ${2}', {false, false})
-- INI: 01d3=2,actor %1d% leave_car %2d%
Opcode.register(0x01d3, ViceCityOpcodeChar.setObjLeaveCar, 2, 'set_char_obj_leave_car ${1} ${2}', {false, false})
-- INI: 01d4=2,actor %1d% go_to_car %2d% and_enter_it_as_a_passenger
Opcode.register(0x01d4, ViceCityOpcodeChar.setObjEnterCarAsPassenger, 2, 'set_char_obj_enter_car_as_passenger ${1} ${2}', {false, true})
-- INI: 01d5=2,actor %1d% go_to_and_drive_car %2d%
Opcode.register(0x01d5, ViceCityOpcodeChar.setObjEnterCarAsDriver, 2, 'set_char_obj_enter_car_as_driver ${1} ${2}', {false, true})
-- INI: 01d8=2,actor %1d% destroy_object %2d%
Opcode.register(0x01d8, ViceCityOpcodeChar.setObjDestroyObject, 2, 'set_char_obj_destroy_object ${1} ${2}', {false, false})
-- INI: 01d9=2,actor %1d% destroy_car %2d%
Opcode.register(0x01d9, ViceCityOpcodeChar.setObjDestroyCar, 2, 'set_char_obj_destroy_car ${1} ${2}', {false, false})
-- INI: 01de=2,tie_actor %1d% to_actor %2d%
Opcode.register(0x01de, ViceCityOpcodeChar.followChar, 2, 'set_char_as_leader ${1} ${2}', {false, false})
-- INI: 01df=2,tie_actor %1d% to_player %2d%
Opcode.register(0x01df, ViceCityOpcodeChar.followPlayer, 2, 'set_player_as_leader ${1} ${2}', {false, false})
-- INI: 01e0=1,clear_leader %1d%
Opcode.register(0x01e0, ViceCityOpcodeChar.leaveGroup, 1, 'leave_group ${1}', {false})
-- INI: 01e1=3,set_actor %1d% follow_route %2d% %3d%
Opcode.register(0x01e1, ViceCityOpcodeChar.setObjFollowRoute, 3, 'set_char_obj_follow_route ${1} ${2} ${3}', {false, false, false})
-- INI: 01ed=1,clear_actor %1d% threat_search
Opcode.register(0x01ed, ViceCityOpcodeChar.clearThreatSearch, 1, 'clear_char_threat_search ${1}', {false})
-- INI: 020e=2,actor %1d% look_at_actor %2d%
Opcode.register(0x020e, ViceCityOpcodeChar.turnToFaceChar, 2, 'turn_char_to_face_char ${1} ${2}', {false, false})
-- INI: 020f=2,actor %1d% look_at_player %2d%
Opcode.register(0x020f, ViceCityOpcodeChar.turnToFacePlayer, 2, 'turn_char_to_face_player ${1} ${2}', {false, false})
-- INI: 0211=3,actor %1d% walk_to %2d% %3d%
Opcode.register(0x0211, ViceCityOpcodeChar.setObjGotoCoordOnFoot, 3, 'set_char_obj_goto_coord_on_foot ${1} ${2} ${3}', {false, true, false})
-- INI: 022c=2,set_actor %1d% to_look_at_actor %2d%
Opcode.register(0x022c, ViceCityOpcodeChar.lookAtCharAlways, 2, 'char_look_at_char_always ${1} ${2}', {false, false})
-- INI: 022d=2,set_actor %1d% to_look_at_player %2d%
Opcode.register(0x022d, ViceCityOpcodeChar.lookAtPlayerAlways, 2, 'char_look_at_player_always ${1} ${2}', {false, false})
-- INI: 022f=1,set_actor %1d% stop_looking
Opcode.register(0x022f, ViceCityOpcodeChar.stopLooking, 1, 'stop_char_looking ${1}', {false})
-- INI: 0239=3,actor %1d% run_to %2d% %3d%
Opcode.register(0x0239, ViceCityOpcodeChar.setObjRunToCoord, 3, 'set_char_obj_run_to_coord ${1} ${2} ${3}', {false, true, false})
-- INI: 0243=2,set_actor %1d% ped_stats_to %2d%
Opcode.register(0x0243, ViceCityOpcodeChar.setPersonality, 2, 'set_char_personality ${1} ${2}', {false, true})
-- INI: 0291=2,set_actor %1d% heed_threats %2d%
Opcode.register(0x0291, ViceCityOpcodeChar.setHeedThreats, 2, 'set_char_heed_threats ${1} ${2}', {false, false})
-- INI: 0319=2,set_actor %1d% running %2b:true/false
Opcode.register(0x0319, ViceCityOpcodeChar.setRunning, 2, 'set_char_running ${1} ${2}', {false, false})
-- INI: 031f=2,  actor %1d% in_range_of_actor %2d%
Opcode.register(0x031f, ViceCityOpcodeChar.isInCharsGroup, 2, 'is_char_in_chars_group ${1} ${2}', {false, false})
-- INI: 0320=2,  actor %1d% in_range_of_player %2d%
Opcode.register(0x0320, ViceCityOpcodeChar.isInPlayersGroup, 2, 'is_char_in_players_group ${1} ${2}', {false, false})
-- INI: 0352=2,set_actor %1d% skin_to %2s%
Opcode.register(0x0352, ViceCityOpcodeChar.undress, 2, 'undress_char ${1} ${2}', {false, true})
-- INI: 0353=1,refresh_actor %1d%
Opcode.register(0x0353, ViceCityOpcodeChar.dress, 1, 'dress_char ${1}', {false})
-- INI: 0365=1,set_actor %1d% objective_hail_taxi
Opcode.register(0x0365, ViceCityOpcodeChar.setObjHailTaxi, 1, 'set_char_obj_hail_taxi ${1}', {false})
-- INI: 0372=3,set_actor %1d% anim %2d% wait_state_time %3d% ms
Opcode.register(0x0372, ViceCityOpcodeChar.setWaitState, 3, 'set_char_wait_state ${1} ${2} ${3}', {false, false, false})
-- INI: 0377=1,set_actor %1d% steal_any_car
Opcode.register(0x0377, ViceCityOpcodeChar.setObjStealAnyCar, 1, 'set_char_obj_steal_any_car ${1}', {false})
-- INI: 03e2=1,actor %1d% leave_any_car
Opcode.register(0x03e2, ViceCityOpcodeChar.setObjLeaveAnyCar, 1, 'set_char_obj_leave_any_car ${1}', {false})
-- INI: 0411=2,set_actor %1d% use_pednode_seek %2d%
Opcode.register(0x0411, ViceCityOpcodeChar.setUsePednodeSeek, 2, 'set_char_use_pednode_seek ${1} ${2}', {false, false})
-- INI: 046b=2,actor %1d% leave_car %2d% and_flee
Opcode.register(0x046b, ViceCityOpcodeChar.setObjFleeCar, 2, 'set_char_obj_flee_car ${1} ${2}', {false, false})
-- INI: 0481=1,set_enter_car_range_multiplier %1d%
Opcode.register(0x0481, ViceCityOpcodeChar.setEnterCarRangeMultiplier, 1, 'set_enter_car_range_multiplier ${1}', {false})
-- INI: 0482=1,set_threat_reaction_range_multiplier %1d%
Opcode.register(0x0482, ViceCityOpcodeChar.setThreatReactionRangeMultiplier, 1, 'set_threat_reaction_range_multiplier ${1}', {false})
-- INI: 0483=2,set_actor %1d% cease_attack_timer %2d%
Opcode.register(0x0483, ViceCityOpcodeChar.setCeaseAttackTimer, 2, 'set_char_cease_attack_timer ${1} ${2}', {false, false})
-- INI: 04c2=2,actor %1d% walk_to_actor %2d%
Opcode.register(0x04c2, ViceCityOpcodeChar.setObjWalkToChar, 2, 'set_char_obj_walk_to_char ${1} ${2}', {false, true})
-- INI: 04c6=2,actor %1d% aim_gun_at_actor %2d%
Opcode.register(0x04c6, ViceCityOpcodeChar.setObjAimGunAtChar, 2, 'set_char_obj_aim_gun_at_char ${1} ${2}', {false, false})
-- INI: 04f3=1,move_actor %1d% from_car_passengerseat_to_driverseat
Opcode.register(0x04f3, ViceCityOpcodeChar.setShuffleIntoDriversSeat, 1, 'set_char_shuffle_into_drivers_seat ${1}', {false})
-- INI: 04f5=3,set_actor %1d% as_player_friend %2d% flag %3h%
Opcode.register(0x04f5, ViceCityOpcodeChar.setAsPlayerFriend, 3, 'set_char_as_player_friend ${1} ${2} ${3}', {false, false, false})
-- INI: 04ff=1,  actor %1d% no_objective
Opcode.register(0x04ff, ViceCityOpcodeChar.isObjNoObj, 1, 'is_char_obj_no_obj ${1}', {false})
-- INI: 0502=3,set_actor %1d% sprint_to %2d% %3d%
Opcode.register(0x0502, ViceCityOpcodeChar.setObjSprintToCoord, 3, 'set_char_obj_sprint_to_coord ${1} ${2} ${3}', {false, true, false})
-- INI: 050d=1,  actor %1d% leaving_car_to_die
Opcode.register(0x050d, ViceCityOpcodeChar.isLeavingVehicleToDie, 1, 'is_char_leaving_vehicle_to_die ${1}', {false})
-- INI: 0510=5,  actor %1d% path_is_clear %2d% %3d% %4d% radius %5d%
Opcode.register(0x0510, ViceCityOpcodeChar.isWanderPathClear, 5, 'is_char_wander_path_clear ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0514=3,set_actor %1d% can_be_damaged_by_members_of_gang %2h% %3h%
Opcode.register(0x0514, ViceCityOpcodeChar.setCanBeDamagedByMembersOfGang, 3, 'set_char_can_be_damaged_by_members_of_gang ${1} ${2} ${3}', {false, false, false})
-- INI: 0521=1,  actor %1d% drowning_in_water
Opcode.register(0x0521, ViceCityOpcodeChar.isDrowningInWater, 1, 'is_char_drowning_in_water ${1}', {false})
-- INI: 052b=2,actor %1d% hold_cellphone %2h%
Opcode.register(0x052b, ViceCityOpcodeChar.setAnsweringMobile, 2, 'set_char_answering_mobile ${1} ${2}', {false, false})
-- INI: 053c=2,set_actor %1d% in_players_group_can_fight %2h%
Opcode.register(0x053c, ViceCityOpcodeChar.setInPlayersGroupCanFight, 2, 'set_char_in_players_group_can_fight ${1} ${2}', {false, false})
-- INI: 053d=1,clear_actor %1d% wait_state
Opcode.register(0x053d, ViceCityOpcodeChar.clearWaitState, 1, 'clear_char_wait_state ${1}', {false})
-- INI: 0549=1,clear_actor %1d% follow_path
Opcode.register(0x0549, ViceCityOpcodeChar.clearFollowPath, 1, 'clear_char_follow_path ${1}', {false})
-- INI: 0562=2,set_actor %1d% ignore_threats_behind_objects %2h%
Opcode.register(0x0562, ViceCityOpcodeChar.setIgnoreThreatsBehindObjects, 2, 'set_char_ignore_threats_behind_objects ${1} ${2}', {false, false})
-- INI: 056b=2,set_actor %1d% crouch_when_threatened %2h%
Opcode.register(0x056b, ViceCityOpcodeChar.setCrouchWhenThreatened, 2, 'set_char_crouch_when_threatened ${1} ${2}', {false, false})
-- INI: 0571=1,  actor %1d% stuck
Opcode.register(0x0571, ViceCityOpcodeChar.isStuck, 1, 'is_char_stuck ${1}', {false})
-- INI: 0573=2,set_actor %1d% stop_shoot_dont_seek_entity %2h%
Opcode.register(0x0573, ViceCityOpcodeChar.setStopShootDontSeekEntity, 2, 'set_char_stop_shoot_dont_seek_entity ${1} ${2}', {false, false})
-- INI: 0579=1,stop_actor %1d%
Opcode.register(0x0579, ViceCityOpcodeChar.clearAllAnims, 1, 'clear_all_char_anims ${1}', {false})
-- INI: 0580=3,%3d% = distribution_mission_status distribution_actor %1d% distribution_car %2d%
Opcode.register(0x0580, ViceCityOpcodeChar.setObjBuyIceCream, 3, '${3} = set_char_obj_buy_ice_cream ${1} ${2}', {false, false, true})
-- INI: 0584=1,clear_char_ice_cream_purchase %1d%
Opcode.register(0x0584, ViceCityOpcodeChar.clearIceCreamPurchase, 1, 'clear_char_ice_cream_purchase ${1}', {false})
-- INI: 0586=1,  actor %1d% has_attempted_attractor
Opcode.register(0x0586, ViceCityOpcodeChar.hasAttemptedAttractor, 1, 'has_char_attempted_attractor ${1}', {false})
-- INI: 058b=1,  actor %1d% bought_ice_cream
Opcode.register(0x058b, ViceCityOpcodeChar.hasBoughtIceCream, 1, 'has_char_bought_ice_cream ${1}', {false})
-- INI: 0593=2,set_actor %1d% frightened_in_jacked_car %2h%
Opcode.register(0x0593, ViceCityOpcodeChar.setFrightenedInJackedCar, 2, 'set_char_frightened_in_jacked_car ${1} ${2}', {false, false})
