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


Opcode.register(0x04eb, ViceCityOpcodeChar.setCrouch, 'task_toggle_duck {handle} [Char] {state} [bool]')
Opcode.register(0x0673, ViceCityOpcodeChar.playAnimation, 'task_dive_and_get_up {handle} [Char] {directionX} [float] {directionY} [float] {timeOnGround} [int]')
Opcode.register(0x009c, ViceCityOpcodeChar.wanderDir, 'char_wander_dir [Char] {direction} [WanderDirection]')
Opcode.register(0x009e, ViceCityOpcodeChar.followPath, 'char_follow_path [Char] {x} [float] {y} [float] {z} [float] {radius} [float] {moveState} [MoveState]')
Opcode.register(0x009f, ViceCityOpcodeChar.setIdle, 'char_set_idle [Char]')
Opcode.register(0x011a, ViceCityOpcodeChar.setThreatSearch, 'set_char_threat_search [Char] {pedThreat} [int]')
Opcode.register(0x011c, ViceCityOpcodeChar.setObjNoObj, 'set_char_obj_no_obj [Char]')
Opcode.register(0x0123, ViceCityOpcodeChar.hasSpottedPlayer, 'has_char_spotted_player [Char] {player} [Player]')
Opcode.register(0x0126, ViceCityOpcodeChar.isObjectivePassed, 'is_char_objective_passed [Char]')
Opcode.register(0x0192, ViceCityOpcodeChar.setObjWaitOnFoot, 'set_char_obj_wait_on_foot [Char]')
Opcode.register(0x0193, ViceCityOpcodeChar.setObjFleeOnFootTillSafe, 'set_char_obj_flee_on_foot_till_safe [Char]')
Opcode.register(0x0194, ViceCityOpcodeChar.setObjGuardSpot, 'set_char_obj_guard_spot [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x01be, ViceCityOpcodeChar.turnToFaceCoord, 'turn_char_to_face_coord [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x01c9, ViceCityOpcodeChar.setObjKillCharOnFoot, 'set_char_obj_kill_char_on_foot [Char] {target} [Char]')
Opcode.register(0x01ca, ViceCityOpcodeChar.setObjKillPlayerOnFoot, 'set_char_obj_kill_player_on_foot [Char] {target} [Player]')
Opcode.register(0x01cb, ViceCityOpcodeChar.setObjKillCharAnyMeans, 'set_char_obj_kill_char_any_means [Char] {target} [Char]')
Opcode.register(0x01cc, ViceCityOpcodeChar.setObjKillPlayerAnyMeans, 'set_char_obj_kill_player_any_means [Char] {target} [Player]')
Opcode.register(0x01ce, ViceCityOpcodeChar.setObjFleePlayerOnFootTillSafe, 'set_char_obj_flee_player_on_foot_till_safe [Char] {target} [Player]')
Opcode.register(0x01cf, ViceCityOpcodeChar.setObjFleeCharOnFootAlways, 'set_char_obj_flee_char_on_foot_always [Char] {target} [Char]')
Opcode.register(0x01d0, ViceCityOpcodeChar.setObjFleePlayerOnFootAlways, 'set_char_obj_flee_player_on_foot_always [Char] {target} [Player]')
Opcode.register(0x01d1, ViceCityOpcodeChar.setObjGotoCharOnFoot, 'set_char_obj_goto_char_on_foot [Char] {target} [Char]')
Opcode.register(0x01d2, ViceCityOpcodeChar.setObjGotoPlayerOnFoot, 'set_char_obj_goto_player_on_foot [Char] {target} [Player]')
Opcode.register(0x01d3, ViceCityOpcodeChar.setObjLeaveCar, 'set_char_obj_leave_car [Char] {vehicle} [Car]')
Opcode.register(0x01d4, ViceCityOpcodeChar.setObjEnterCarAsPassenger, 'set_char_obj_enter_car_as_passenger [Char] {vehicle} [Car]')
Opcode.register(0x01d5, ViceCityOpcodeChar.setObjEnterCarAsDriver, 'set_char_obj_enter_car_as_driver [Char] {vehicle} [Car]')
Opcode.register(0x01d8, ViceCityOpcodeChar.setObjDestroyObject, 'set_char_obj_destroy_object [Char] {handle} [Object]')
Opcode.register(0x01d9, ViceCityOpcodeChar.setObjDestroyCar, 'set_char_obj_destroy_car [Char] {vehicle} [Car]')
Opcode.register(0x01de, ViceCityOpcodeChar.followChar, 'set_char_as_leader [Char] {leader} [Char]')
Opcode.register(0x01df, ViceCityOpcodeChar.followPlayer, 'set_player_as_leader [Char] {leader} [Player]')
Opcode.register(0x01e0, ViceCityOpcodeChar.leaveGroup, 'leave_group [Char]')
Opcode.register(0x01e1, ViceCityOpcodeChar.setObjFollowRoute, 'set_char_obj_follow_route [Char] {routeId} [int] {mode} [FollowRoute]')
Opcode.register(0x01ed, ViceCityOpcodeChar.clearThreatSearch, 'clear_char_threat_search [Char]')
Opcode.register(0x020e, ViceCityOpcodeChar.turnToFaceChar, 'turn_char_to_face_char [Char] {char} [Char]')
Opcode.register(0x020f, ViceCityOpcodeChar.turnToFacePlayer, 'turn_char_to_face_player [Char] {player} [Player]')
Opcode.register(0x0211, ViceCityOpcodeChar.setObjGotoCoordOnFoot, 'set_char_obj_goto_coord_on_foot [Char] {x} [float] {y} [float]')
Opcode.register(0x022c, ViceCityOpcodeChar.lookAtCharAlways, 'char_look_at_char_always [Char] {target} [Char]')
Opcode.register(0x022d, ViceCityOpcodeChar.lookAtPlayerAlways, 'char_look_at_player_always [Char] {target} [Player]')
Opcode.register(0x022f, ViceCityOpcodeChar.stopLooking, 'stop_char_looking [Char]')
Opcode.register(0x0239, ViceCityOpcodeChar.setObjRunToCoord, 'set_char_obj_run_to_coord [Char] {x} [float] {y} [float]')
Opcode.register(0x0243, ViceCityOpcodeChar.setPersonality, 'set_char_personality [Char] {pedstat} [PedStat]')
Opcode.register(0x0291, ViceCityOpcodeChar.setHeedThreats, 'set_char_heed_threats [Char] {state} [bool]')
Opcode.register(0x0319, ViceCityOpcodeChar.setRunning, 'set_char_running [Char] {state} [bool]')
Opcode.register(0x031f, ViceCityOpcodeChar.isInCharsGroup, 'is_char_in_chars_group [Char] {leader} [Char]')
Opcode.register(0x0320, ViceCityOpcodeChar.isInPlayersGroup, 'is_char_in_players_group [Char] {leader} [Player]')
Opcode.register(0x0352, ViceCityOpcodeChar.undress, 'undress_char [Char] {modelName} [string]')
Opcode.register(0x0353, ViceCityOpcodeChar.dress, 'dress_char [Char]')
Opcode.register(0x0365, ViceCityOpcodeChar.setObjHailTaxi, 'set_char_obj_hail_taxi [Char]')
Opcode.register(0x0372, ViceCityOpcodeChar.setWaitState, 'set_char_wait_state [Char] {stateId} [WaitState] {timeInMs} [int]')
Opcode.register(0x0377, ViceCityOpcodeChar.setObjStealAnyCar, 'set_char_obj_steal_any_car [Char]')
Opcode.register(0x03e2, ViceCityOpcodeChar.setObjLeaveAnyCar, 'set_char_obj_leave_any_car [Char]')
Opcode.register(0x0411, ViceCityOpcodeChar.setUsePednodeSeek, 'set_char_use_pednode_seek [Char] {state} [bool]')
Opcode.register(0x046b, ViceCityOpcodeChar.setObjFleeCar, 'set_char_obj_flee_car [Char] {vehicle} [Car]')
Opcode.register(0x0481, ViceCityOpcodeChar.setEnterCarRangeMultiplier, 'set_enter_car_range_multiplier {value} [float]')
Opcode.register(0x0482, ViceCityOpcodeChar.setThreatReactionRangeMultiplier, 'set_threat_reaction_range_multiplier {value} [float]')
Opcode.register(0x0483, ViceCityOpcodeChar.setCeaseAttackTimer, 'set_char_cease_attack_timer [Char] {timer} [int]')
Opcode.register(0x04c2, ViceCityOpcodeChar.setObjWalkToChar, 'set_char_obj_walk_to_char [Char] {target} [Char]')
Opcode.register(0x04c6, ViceCityOpcodeChar.setObjAimGunAtChar, 'set_char_obj_aim_gun_at_char [Char] {target} [Char]')
Opcode.register(0x04f3, ViceCityOpcodeChar.setShuffleIntoDriversSeat, 'set_char_shuffle_into_drivers_seat [Char]')
Opcode.register(0x04f5, ViceCityOpcodeChar.setAsPlayerFriend, 'set_char_as_player_friend [Char] {player} [Player] {state} [bool]')
Opcode.register(0x04ff, ViceCityOpcodeChar.isObjNoObj, 'is_char_obj_no_obj [Char]')
Opcode.register(0x0502, ViceCityOpcodeChar.setObjSprintToCoord, 'set_char_obj_sprint_to_coord [Char] {x} [float] {y} [float]')
Opcode.register(0x050d, ViceCityOpcodeChar.isLeavingVehicleToDie, 'is_char_leaving_vehicle_to_die [Char]')
Opcode.register(0x0510, ViceCityOpcodeChar.isWanderPathClear, 'is_char_wander_path_clear [Char] {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x0514, ViceCityOpcodeChar.setCanBeDamagedByMembersOfGang, 'set_char_can_be_damaged_by_members_of_gang [Char] {gangId} [GangType] {state} [bool]')
Opcode.register(0x0521, ViceCityOpcodeChar.isDrowningInWater, 'is_char_drowning_in_water [Char]')
Opcode.register(0x052b, ViceCityOpcodeChar.setAnsweringMobile, 'set_char_answering_mobile [Char] {state} [bool]')
Opcode.register(0x053c, ViceCityOpcodeChar.setInPlayersGroupCanFight, 'set_char_in_players_group_can_fight [Char] {state} [bool]')
Opcode.register(0x053d, ViceCityOpcodeChar.clearWaitState, 'clear_char_wait_state [Char]')
Opcode.register(0x0549, ViceCityOpcodeChar.clearFollowPath, 'clear_char_follow_path [Char]')
Opcode.register(0x0562, ViceCityOpcodeChar.setIgnoreThreatsBehindObjects, 'set_char_ignore_threats_behind_objects [Char] {state} [bool]')
Opcode.register(0x056b, ViceCityOpcodeChar.setCrouchWhenThreatened, 'set_char_crouch_when_threatened [Char] {state} [bool]')
Opcode.register(0x0571, ViceCityOpcodeChar.isStuck, 'is_char_stuck [Char]')
Opcode.register(0x0573, ViceCityOpcodeChar.setStopShootDontSeekEntity, 'set_char_stop_shoot_dont_seek_entity [Char] {state} [bool]')
Opcode.register(0x0579, ViceCityOpcodeChar.clearAllAnims, 'clear_all_char_anims [Char]')
Opcode.register(0x0580, ViceCityOpcodeChar.setObjBuyIceCream, '[var status: ObjBuyIceCreamStatus] = set_char_obj_buy_ice_cream [Char] {distributionCar} [Car]')
Opcode.register(0x0584, ViceCityOpcodeChar.clearIceCreamPurchase, 'clear_char_ice_cream_purchase [Char]')
Opcode.register(0x0586, ViceCityOpcodeChar.hasAttemptedAttractor, 'has_char_attempted_attractor [Char]')
Opcode.register(0x058b, ViceCityOpcodeChar.hasBoughtIceCream, 'has_char_bought_ice_cream [Char]')
Opcode.register(0x0593, ViceCityOpcodeChar.setFrightenedInJackedCar, 'set_char_frightened_in_jacked_car [Char] {state} [bool]')
