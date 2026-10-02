SanAndreasOpcodeChar = {}
SanAndreasOpcodeChar.__index = SanAndreasOpcodeChar

-- Opcode: 0x0179
-- Instruction: is_char_touching_object [Char] {object} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0179
function SanAndreasOpcodeChar.isTouchingObject(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x017B
-- Instruction: set_char_ammo [Char] {weaponType} [WeaponType] {ammo} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/017B
function SanAndreasOpcodeChar.setAmmo(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x023B
-- Instruction: is_char_touching_object_on_foot [Char] {object} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/023B
function SanAndreasOpcodeChar.isTouchingObjectOnFoot(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02A0
-- Instruction: is_char_stopped [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02A0
function SanAndreasOpcodeChar.isStopped(actor)
    local velX, velY, velZ = actor:getVelocity()

    if (velX == 0 and velY == 0 and velZ == 0) then
        return true
    end

    return false
end

-- Opcode: 0x02D6
-- Instruction: is_char_shooting_in_area [Char] {leftBottomX} [float] {leftBottomY} [float] {topRightX} [float] {topRightY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02D6
function SanAndreasOpcodeChar.isShootingInArea(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0364
-- Instruction: has_char_spotted_char [Char] {target} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0364
function SanAndreasOpcodeChar.hasSpottedChar(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0393
-- Instruction: set_char_anim_speed [Char] {animName} [string] {animSpeed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0393
function SanAndreasOpcodeChar.setAnimSpeed(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x041A
-- Instruction: [var ammo: int] = get_ammo_in_char_weapon [Char] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/041A
function SanAndreasOpcodeChar.getAmmoInWeapon(actor, weapon, _)
    return actor:getAmmoForWeapon(weapon)
end

-- Opcode: 0x0430
-- Instruction: warp_char_into_car_as_passenger [Char] {handle} [Car] {seat} [SeatId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0430
function SanAndreasOpcodeChar.warpIntoCarAsPassenger(actor, car, seat)
    if (actor == -1) then
        return
    end

    Script.setOpcodePartiallyImplemented()
    actor:clearTasks()

    actor:warpIntoVehicle(car, (seat + 1))
end

-- Opcode: 0x0491
-- Instruction: has_char_got_weapon [Char] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0491
function SanAndreasOpcodeChar.hasGotWeapon(actor, weaponId)
    return actor:hasWeapon(weaponId)
end

-- Opcode: 0x04A7
-- Instruction: is_char_in_any_boat [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04A7
function SanAndreasOpcodeChar.isInAnyBoat(actor)
    local vehicle = actor:getOccupiedVehicle()

    if (vehicle) then
        return vehicle:getVehicleType() == 'boat'
    end

    return false
end

-- Opcode: 0x04A9
-- Instruction: is_char_in_any_heli [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04A9
function SanAndreasOpcodeChar.isInAnyHeli(actor)
    local vehicle = actor:getOccupiedVehicle()

    if (vehicle) then
        return vehicle:getVehicleType() == 'heli'
    end

    return false
end

-- Opcode: 0x04AB
-- Instruction: is_char_in_any_plane [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04AB
function SanAndreasOpcodeChar.isInAnyPlane(actor)
    local vehicle = actor:getOccupiedVehicle()

    if (vehicle) then
        return vehicle:getVehicleType() == 'plane'
    end

    return false
end

-- Opcode: 0x04C8
-- Instruction: is_char_in_flying_vehicle [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04C8
function SanAndreasOpcodeChar.isInFlyingVehicle(actor)
    return (opcodes[0x04A9](actor) or opcodes[0x04AB](actor))
end

-- Opcode: 0x0503
-- Instruction: [var handle: Char] = create_swat_rope {pedType} [PedType] {modelId} [model_char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0503
function SanAndreasOpcodeChar.createSwatRope(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x051B
-- Instruction: has_char_been_damaged_by_car [Char] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/051B
function SanAndreasOpcodeChar.hasBeenDamagedByCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0547
-- Instruction: is_char_touching_vehicle [Char] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0547
function SanAndreasOpcodeChar.isTouchingVehicle(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0555
-- Instruction: remove_weapon_from_char [Char] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0555
function SanAndreasOpcodeChar.removeWeapon(actor, weapon)
    return actor:removeWeapon(weapon)
end

-- Opcode: 0x0575
-- Instruction: freeze_char_position_and_dont_load_collision [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0575
function SanAndreasOpcodeChar.freezePositionAndDontLoadCollision(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05F6
-- Instruction: is_char_in_angled_area_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05F6
function SanAndreasOpcodeChar.isInAngledArea2D()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05F7
-- Instruction: is_char_in_angled_area_on_foot_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05F7
function SanAndreasOpcodeChar.isInAngledAreaOnFoot2D(_, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05F8
-- Instruction: is_char_in_angled_area_in_car_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05F8
function SanAndreasOpcodeChar.isInAngledAreaInCar2D(_, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05F9
-- Instruction: is_char_stopped_in_angled_area_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05F9
function SanAndreasOpcodeChar.isStoppedInAngledArea2D(_, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05FA
-- Instruction: is_char_stopped_in_angled_area_on_foot_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05FA
function SanAndreasOpcodeChar.isStoppedInAngledAreaOnFoot2D(_, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05FB
-- Instruction: is_char_stopped_in_angled_area_in_car_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05FB
function SanAndreasOpcodeChar.isStoppedInAngledAreaInCar2D(_, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05FC
-- Instruction: is_char_in_angled_area_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05FC
function SanAndreasOpcodeChar.isInAngledArea3D(_, _, _, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05FD
-- Instruction: is_char_in_angled_area_on_foot_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05FD
function SanAndreasOpcodeChar.isInAngledAreaOnFoot3D(_, _, _, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05FE
-- Instruction: is_char_in_angled_area_in_car_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05FE
function SanAndreasOpcodeChar.isInAngledAreaInCar3D(_, _, _, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05FF
-- Instruction: is_char_stopped_in_angled_area_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05FF
function SanAndreasOpcodeChar.isStoppedInAngledArea3D(_, _, _, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0600
-- Instruction: is_char_stopped_in_angled_area_on_foot_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0600
function SanAndreasOpcodeChar.isStoppedInAngledAreaOnFoot3D(_, _, _, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0601
-- Instruction: is_char_stopped_in_angled_area_in_car_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0601
function SanAndreasOpcodeChar.isStoppedInAngledAreaInCar3D(_, _, _, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0602
-- Instruction: is_char_in_taxi [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0602
function SanAndreasOpcodeChar.isInTaxi(actor)
    local vehicle = actor:getOccupiedVehicle()

    if (vehicle) then
        return vehicle:getVehicleType() == 'car' and vehicle:getVehicleClass() == 'taxi'
    end

    return false
end

-- Opcode: 0x060B
-- Instruction: set_char_decision_maker [Char] {handleOrTemplate} [DecisionMakerCharTemplate]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/060B
function SanAndreasOpcodeChar.setDecisionMaker(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x060F
-- Instruction: set_sense_range {handle} [Char] {range} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/060F
function SanAndreasOpcodeChar.setSenseRange(_, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0611
-- Instruction: is_char_playing_anim [Char] {animationName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0611
function SanAndreasOpcodeChar.isPlayingAnim(actor, animation)
    if (type(actor) ~= "table") then
        return false
    end

    return actor:isPerformingAnimation(animation)
end

-- Opcode: 0x0612
-- Instruction: set_char_anim_playing_flag [Char] {animationName} [string] {flag} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0612
function SanAndreasOpcodeChar.setAnimPlayingFlag(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0613
-- Instruction: [var time: float] = get_char_anim_current_time [Char] {animationName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0613
function SanAndreasOpcodeChar.getAnimCurrentTime(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0614
-- Instruction: set_char_anim_current_time [Char] {animationName} [string] {time} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0614
function SanAndreasOpcodeChar.setAnimCurrentTime(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0618
-- Instruction: perform_sequence_task [Char] {sequence} [Sequence]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0618
function SanAndreasOpcodeChar.performSequence(actor, sequence)
    actor:setActiveSequence(sequence)
end

-- Opcode: 0x0619
-- Instruction: set_char_collision [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0619
function SanAndreasOpcodeChar.setCollision(actor, toggle)
    return actor:setCollisionsEnabled((toggle == 1) or false)
end

-- Opcode: 0x061A
-- Instruction: [var totalTime: float] = get_char_anim_total_time [Char] {animationName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/061A
function SanAndreasOpcodeChar.getAnimTotalTime(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0621
-- Instruction: [var handle: Char] = create_char_at_attractor {pedType} [PedType] {modelId} [model_char] {taskId} [int] {attractor} [Attractor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0621
function SanAndreasOpcodeChar.createAtAttractor(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x062E
-- Instruction: [var status: TaskStatus] = get_script_task_status [Char] {taskId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/062E
function SanAndreasOpcodeChar.getScriptTaskStatus(actor, taskId)
    return actor:getTaskStatus(taskId)
end

-- Opcode: 0x0642
-- Instruction: is_char_at_scripted_attractor [Char] {handle} [Attractor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0642
function SanAndreasOpcodeChar.isAtScriptedAttractor(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0646
-- Instruction: [var progress: int] = get_sequence_progress [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0646
function SanAndreasOpcodeChar.getSequenceProgress(actor)
    return actor:getSequenceProgress()
end

-- Opcode: 0x0647
-- Instruction: clear_look_at [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0647
function SanAndreasOpcodeChar.clearLookAt(actor)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    actor:clearTasks()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0648
-- Instruction: set_follow_node_threshold_distance [Char] {range} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0648
function SanAndreasOpcodeChar.setFollowNodeThresholdDistance(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0665
-- Instruction: [var modelId: int] = get_char_model [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0665
function SanAndreasOpcodeChar.getModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0687
-- Instruction: clear_char_tasks [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0687
function SanAndreasOpcodeChar.clearTasks(actor)
    if (type(actor) ~= "table") then
        return false
    end

    if (type(actor) == "number") then
        actor = PlayerElement.getLocalPlayer()
    end

    return actor:clearTasks()
end

-- Opcode: 0x06A7
-- Instruction: attach_char_to_bike [Char] {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {position} [int] {_p7} [float] {_p8} [float] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06A7
function SanAndreasOpcodeChar.attachToBike(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06AB
-- Instruction: hide_char_weapon_for_scripted_cutscene [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06AB
function SanAndreasOpcodeChar.hideWeaponForScriptedCutscene(actor, setHidden)
    --return TaskHandler.sendTask(nil, TaskCode.SET_WEAPONS_HIDDEN, actor, setHidden)
end

-- Opcode: 0x06AC
-- Instruction: [var speed: float] = get_char_speed [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06AC
function SanAndreasOpcodeChar.getSpeed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06C9
-- Instruction: remove_char_from_group [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06C9
function SanAndreasOpcodeChar.removeFromGroup(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06EE
-- Instruction: is_group_member [Char] {handle} [Group]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06EE
function SanAndreasOpcodeChar.isGroupMember(actor, group)
    return actor:isInGroup(group)
end

-- Opcode: 0x06EF
-- Instruction: is_group_leader [Char] {handle} [Group]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06EF
function SanAndreasOpcodeChar.isGroupLeader(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x06FF
-- Instruction: are_any_chars_near_char [Char] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06FF
function SanAndreasOpcodeChar.isNearAnyChars(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x070B
-- Instruction: drop_object [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/070B
function SanAndreasOpcodeChar.dropObject(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0737
-- Instruction: is_char_holding_object [Char] {handle} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0737
function SanAndreasOpcodeChar.isHoldingObject(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0741
-- Instruction: has_char_been_arrested [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0741
function SanAndreasOpcodeChar.hasBeenArrested(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x074E
-- Instruction: set_inform_respected_friends [Char] {radius} [float] {_p3} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/074E
function SanAndreasOpcodeChar.setInformRespectedFriends(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x074F
-- Instruction: is_char_responding_to_event [Char] {event} [Event]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/074F
function SanAndreasOpcodeChar.isRespondingToEvent(_)
    Script.setOpcodePartiallyImplemented()
    return false
end

-- Opcode: 0x0770
-- Instruction: set_char_is_target_priority [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0770
function SanAndreasOpcodeChar.setIsTargetPriority(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x077A
-- Instruction: set_char_relationship [Char] {relationshipType} [RelationshipType] {pedType} [PedType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/077A
function SanAndreasOpcodeChar.setRelationship(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x077B
-- Instruction: clear_char_relationship [Char] {relationshipType} [RelationshipType] {toPedType} [PedType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/077B
function SanAndreasOpcodeChar.clearRelationship(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x077C
-- Instruction: clear_all_char_relationships [Char] {relationshipType} [RelationshipType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/077C
function SanAndreasOpcodeChar.clearAllRelationships(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0792
-- Instruction: clear_char_tasks_immediately [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0792
function SanAndreasOpcodeChar.clearTasksImmediately(actor)
    actor:clearTasks()
    return true
end

-- Opcode: 0x07A0
-- Instruction: perform_sequence_task_from_progress [Char] {sequence} [Sequence] {_p3} [int] {_p4} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07A0
function SanAndreasOpcodeChar.performSequenceFromProgress(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07A1
-- Instruction: set_next_desired_move_state {moveState} [MoveState]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07A1
function SanAndreasOpcodeChar.setNextDesiredMoveState(_)
    return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07A4
-- Instruction: [var _p2: int], [var _p3: int] = get_sequence_progress_recursive [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07A4
function SanAndreasOpcodeChar.getSequenceProgressRecursive(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07A9
-- Instruction: [var handle: Searchlight] = is_char_in_any_searchlight [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07A9
function SanAndreasOpcodeChar.isInAnySearchlight(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07CB
-- Instruction: listen_to_player_group_commands [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07CB
function SanAndreasOpcodeChar.listenToPlayerGroupCommands(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07DD
-- Instruction: set_char_shoot_rate [Char] {rate} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07DD
function SanAndreasOpcodeChar.setShootRate(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07FE
-- Instruction: give_melee_attack_to_char [Char] {fightStyle} [FightStyle] {moveId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07FE
function SanAndreasOpcodeChar.giveMeleeAttack(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x080E
-- Instruction: [var event: Event] = get_char_highest_priority_event [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/080E
function SanAndreasOpcodeChar.getHighestPriorityEvent(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0811
-- Instruction: [var handle: Car] = get_car_char_is_using [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0811
function SanAndreasOpcodeChar.getCarIsUsing(actor, _)
    if (type(actor) ~= "table") then
        return 0
    end

    return actor:getOccupiedVehicle()
end

-- Opcode: 0x0816
-- Instruction: set_char_kinda_stay_in_same_place [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0816
function SanAndreasOpcodeChar.setKindaStayInSamePlace(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0818
-- Instruction: is_char_in_air [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0818
function SanAndreasOpcodeChar.isInAir(actor)
    return actor:isInAir()
end

-- Opcode: 0x0819
-- Instruction: [var height: float] = get_char_height_above_ground [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0819
function SanAndreasOpcodeChar.getHeightAboveGround(actor, _)
    if (type(actor) ~= "table") then
        return 0
    end

    local x, y, z = actor:getPosition()

    enginePreloadWorldArea(x, y, z, "collisions")
    return z - (getGroundPosition(x, y, z) or 0)
end

-- Opcode: 0x081A
-- Instruction: set_char_weapon_skill [Char] {skill} [WeaponSkill]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/081A
function SanAndreasOpcodeChar.setWeaponSkill(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x083C
-- Instruction: set_char_velocity [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/083C
function SanAndreasOpcodeChar.setVelocity(actor, velX, velY, velZ)
   actor:setVelocity(velX, velY, velZ / 20)
end

-- Opcode: 0x083D
-- Instruction: [var x: float], [var y: float], [var z: float] = get_char_velocity [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/083D
function SanAndreasOpcodeChar.getVelocity(actor, _, _, _)
    local velX, velY, velZ = actor:getVelocity()

    velX = velX or 0.0
    velY = velY or 0.0
    velZ = velZ or 0.0

    return velX, velY, velZ * 20
end

-- Opcode: 0x083E
-- Instruction: set_char_rotation [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/083E
function SanAndreasOpcodeChar.setRotation(actor, rotX, rotY, rotZ)
    actor:setRotation(rotX, rotY, rotZ)
end

-- Opcode: 0x0851
-- Instruction: damage_char [Char] {amount} [int] {damageArmour} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0851
function SanAndreasOpcodeChar.damage(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0856
-- Instruction: set_char_allowed_to_duck [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0856
function SanAndreasOpcodeChar.setAllowedToDuck(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0860
-- Instruction: set_char_area_visible [Char] {areaId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0860
function SanAndreasOpcodeChar.setAreaVisible(actor, interior)
    actor:setInterior(interior)
end

-- Opcode: 0x087E
-- Instruction: set_char_drops_weapons_when_dead [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/087E
function SanAndreasOpcodeChar.setDropsWeaponsWhenDead(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x087F
-- Instruction: set_char_never_leaves_group [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/087F
function SanAndreasOpcodeChar.setNeverLeavesGroup(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0887
-- Instruction: set_heading_limit_for_attached_char [Char] {orientation} [int] {headingLimit} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0887
function SanAndreasOpcodeChar.setHeadingLimitForAttached(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0889
-- Instruction: [var x: float], [var y: float], [var z: float] = get_dead_char_coordinates [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0889
function SanAndreasOpcodeChar.getCoordinatesOfDied(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x089F
-- Instruction: [var pedType: PedType] = get_ped_type [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/089F
function SanAndreasOpcodeChar.getPedType(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08AD
-- Instruction: set_char_has_used_entry_exit [Char] {x} [float] {y} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08AD
function SanAndreasOpcodeChar.setHasUsedEntryExit(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08AF
-- Instruction: set_char_max_health [Char] {maxHealth} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08AF
function SanAndreasOpcodeChar.setMaxHealth(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08C6
-- Instruction: set_char_can_be_knocked_off_bike [Char] {stayOnBike} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08C6
function SanAndreasOpcodeChar.setCanBeKnockedOffBike(actor, stayOnBike)
    return actor:setCanBeKnockedOffBike(not stayOnBike)
end

-- Opcode: 0x08C7
-- Instruction: set_char_coordinates_dont_warp_gang [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08C7
function SanAndreasOpcodeChar.setCoordinatesDontWarpGang(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x093B
-- Instruction: set_char_bulletproof_vest [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/093B
function SanAndreasOpcodeChar.setBulletproofVest(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0946
-- Instruction: set_char_uses_upperbody_damage_anims_only [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0946
function SanAndreasOpcodeChar.setUsesUpperbodyDamageAnimsOnly(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0947
-- Instruction: [var _p3: int] = set_char_say_context [Char] {phrase} [SpeechId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0947
function SanAndreasOpcodeChar.setSayContext(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x094B
-- Instruction: [var interiorName: string] = get_name_of_entry_exit_char_used [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/094B
function SanAndreasOpcodeChar.getNameOfEntryExitUsed(actor, _)
    return actor:getActiveInteriorName()
end

-- Opcode: 0x094C
-- Instruction: [var x: float], [var y: float], [var z: float], [var heading: float] = get_position_of_entry_exit_char_used [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/094C
function SanAndreasOpcodeChar.getPositionOfEntryExitCharUsed(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x094D
-- Instruction: is_char_talking [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/094D
function SanAndreasOpcodeChar.isTalking(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x094E
-- Instruction: disable_char_speech [Char] {stopNow} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/094E
function SanAndreasOpcodeChar.disableSpeech(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x094F
-- Instruction: enable_char_speech [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/094F
function SanAndreasOpcodeChar.enableSpeech(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x095D
-- Instruction: is_char_stuck_under_car [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/095D
function SanAndreasOpcodeChar.isStuckUnderCar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0961
-- Instruction: set_char_keep_task [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0961
function SanAndreasOpcodeChar.setKeepTask(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0965
-- Instruction: is_char_swimming [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0965
function SanAndreasOpcodeChar.isSwimming(_)
    Script.setOpcodePartiallyImplemented()
    return false
end

-- Opcode: 0x0966
-- Instruction: [var state: int] = get_char_swim_state [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0966
function SanAndreasOpcodeChar.getSwimState(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0967
-- Instruction: start_char_facial_talk [Char] {duration} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0967
function SanAndreasOpcodeChar.startFacialTalk(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0968
-- Instruction: stop_char_facial_talk [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0968
function SanAndreasOpcodeChar.stopFacialTalk(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0972
-- Instruction: set_char_coordinates_no_offset [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0972
function SanAndreasOpcodeChar.setCoordinatesNoOffset(actor, posX, posY, posZ)
    Script.setOpcodePartiallyImplemented()
    actor:clearTasks()
    actor:setPosition(posX, posY, posZ)
    return true
end

-- Opcode: 0x0982
-- Instruction: set_char_force_die_in_car [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0982
function SanAndreasOpcodeChar.setForceDieInCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09A1
-- Instruction: drop_second_object [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09A1
function SanAndreasOpcodeChar.dropSecondObject(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09A7
-- Instruction: set_char_drugged_up [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09A7
function SanAndreasOpcodeChar.setDruggedUp(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09A8
-- Instruction: is_char_head_missing [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09A8
function SanAndreasOpcodeChar.isHeadMissing(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09AE
-- Instruction: is_char_in_any_train [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09AE
function SanAndreasOpcodeChar.isInAnyTrain(actor)
    local vehicle = actor:getOccupiedVehicle()

    if (vehicle) then
        return vehicle:getVehicleType() == 'train'
    end

    return false
end

-- Opcode: 0x09B5
-- Instruction: set_char_signal_after_kill [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09B5
function SanAndreasOpcodeChar.setSignalAfterKill(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09B6
-- Instruction: set_char_wanted_by_police [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09B6
function SanAndreasOpcodeChar.setWantedByPolice(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09BC
-- Instruction: set_char_coordinates_dont_warp_gang_no_offset [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09BC
function SanAndreasOpcodeChar.setCoordinatesDontWarpGangNoOffset(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09C5
-- Instruction: is_char_using_map_attractor [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09C5
function SanAndreasOpcodeChar.isUsingMapAttractor(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09C9
-- Instruction: remove_char_from_car_maintain_position [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09C9
function SanAndreasOpcodeChar.removeFromCarMaintainPosition(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09D5
-- Instruction: [var _p6: int] = set_char_say_context_important [Char] {phrase} [SpeechId] {_p3} [bool] {_p4} [bool] {_p5} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09D5
function SanAndreasOpcodeChar.setSayContextImportant(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09D6
-- Instruction: set_char_say_script [Char] {_p2} [int] {_p3} [bool] {_p4} [bool] {_p5} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09D6
function SanAndreasOpcodeChar.setSayScript(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09DE
-- Instruction: is_char_getting_in_to_a_car [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09DE
function SanAndreasOpcodeChar.isGettingInToACar(actor)
    if (type(actor) ~= "table") then
        return false
    end

    return actor:isEnteringCar()
end

-- Opcode: 0x09E8
-- Instruction: [var areaId: int] = get_char_area_visible [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09E8
function SanAndreasOpcodeChar.getAreaVisible(actor, _)
    return actor:getInterior()
end

-- Opcode: 0x09ED
-- Instruction: has_char_spotted_char_in_front [Char] {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09ED
function SanAndreasOpcodeChar.hasSpottedCharInFront(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09F4
-- Instruction: ignore_height_difference_following_nodes [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09F4
function SanAndreasOpcodeChar.ignoreHeightDifferenceFollowingNodes(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09F6
-- Instruction: set_char_get_out_upside_down_car [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09F6
function SanAndreasOpcodeChar.setGetOutUpsideDownCar(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0A09
-- Instruction: shut_char_up_for_scripted_speech [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A09
function SanAndreasOpcodeChar.shutUpForScriptedSpeech(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0A1B
-- Instruction: is_char_touching_char [Char] {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A1B
function SanAndreasOpcodeChar.isTouchingChar(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0A27
-- Instruction: set_death_weapons_persist [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A27
function SanAndreasOpcodeChar.setDeathWeaponsPersist(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A28
-- Instruction: set_swim_speed [Char] {speed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A28
function SanAndreasOpcodeChar.setSwimSpeed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A32
-- Instruction: is_char_attached_to_any_car [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A32
function SanAndreasOpcodeChar.isAttachedToAnyCar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A33
-- Instruction: [var handle: Car] = store_car_char_is_attached_to_no_save [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A33
function SanAndreasOpcodeChar.storeCarIsAttachedToNoSave(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AB5
-- Instruction: [var carHandle: Car], [var charHandle: Char] = store_closest_entities [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AB5
function SanAndreasOpcodeChar.storeClosestEntities(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D0B
-- Instruction: [var matrix: int] = get_char_bone_matrix [Char] {pedBone} [PedBone]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D0B
function SanAndreasOpcodeChar.getBoneMatrix(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D10
-- Instruction: set_char_model_alpha [Char] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D10
function SanAndreasOpcodeChar.setModelAlpha(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D30
-- Instruction: [var address: int] = get_char_bone [Char] {pedBone} [PedBone]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D30
function SanAndreasOpcodeChar.getBone(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D31
-- Instruction: [var offsetVector: int] = get_bone_offset_vector {pedBone} [PedBone]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D31
function SanAndreasOpcodeChar.getBoneOffsetVector(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D32
-- Instruction: [var quat: int] = get_bone_quat {bone} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D32
function SanAndreasOpcodeChar.getBoneQuat(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D39
-- Instruction: [var maxHealth: float] = get_char_max_health [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D39
function SanAndreasOpcodeChar.getMaxHealth(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E0A
-- Instruction: is_char_script_controlled [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E0A
function SanAndreasOpcodeChar.isScriptControlled(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E0B
-- Instruction: mark_char_as_needed [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E0B
function SanAndreasOpcodeChar.markAsNeeded(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E14
-- Instruction: init_extended_char_vars [Char] {identifier} [string] {totalVars} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E14
function SanAndreasOpcodeChar.initExtendedVars(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E15
-- Instruction: set_extended_char_var [Char] {identifier} [string] {varNumber} [int] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E15
function SanAndreasOpcodeChar.setExtendedVar(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E16
-- Instruction: [var value: any] = get_extended_char_var [Char] {identifier} [string] {varNumber} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E16
function SanAndreasOpcodeChar.getExtendedVar(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E24
-- Instruction: fix_char_ground_brightness_and_fade_in [Char] {fixGround} [bool] {fixBrightness} [bool] {fadeIn} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E24
function SanAndreasOpcodeChar.fixGroundBrightnessAndFadeIn(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E30
-- Instruction: set_render_object_auto_hide [Char] {dead} [bool] {weapon} [bool] {car} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E30
function SanAndreasOpcodeChar.setRenderObjectAutoHide(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E32
-- Instruction: set_char_coordinates_simple [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E32
function SanAndreasOpcodeChar.setCoordinatesSimple(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E42
-- Instruction: is_char_doing_task_id [Char] {taskId} [TaskId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E42
function SanAndreasOpcodeChar.isDoingTaskId(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E43
-- Instruction: [var address: int] = get_char_task_pointer_by_id [Char] {taskId} [TaskId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E43
function SanAndreasOpcodeChar.getTaskPointerById(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E44
-- Instruction: [var killTarget: Char] = get_char_kill_target_char [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E44
function SanAndreasOpcodeChar.getKillTargetChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E46
-- Instruction: is_char_using_gun [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E46
function SanAndreasOpcodeChar.isUsingGun(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E47
-- Instruction: is_char_fighting [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E47
function SanAndreasOpcodeChar.isFighting(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E48
-- Instruction: is_char_fallen_on_ground [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E48
function SanAndreasOpcodeChar.isFallenOnGround(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E49
-- Instruction: is_char_entering_any_car [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E49
function SanAndreasOpcodeChar.isEnteringAnyCar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E4A
-- Instruction: is_char_exiting_any_car [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E4A
function SanAndreasOpcodeChar.isExitingAnyCar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E4B
-- Instruction: is_char_playing_any_script_animation [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E4B
function SanAndreasOpcodeChar.isPlayingAnyScriptAnimation(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E4C
-- Instruction: is_char_doing_any_important_task [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E4C
function SanAndreasOpcodeChar.isDoingAnyImportantTask(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E5C
-- Instruction: [var healthPercent: float] = get_char_health_percent [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E5C
function SanAndreasOpcodeChar.getHealthPercent(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E83
-- Instruction: [var handle: WeaponInfo] = get_current_char_weaponinfo [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E83
function SanAndreasOpcodeChar.getCurrentWeaponinfo(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E8B
-- Instruction: [var weaponState: WeaponState] = get_char_weapon_state [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E8B
function SanAndreasOpcodeChar.getWeaponState(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E8C
-- Instruction: [var weaponClip: int] = get_char_weapon_clip [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E8C
function SanAndreasOpcodeChar.getCharWeaponClip(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E8E
-- Instruction: [var surfaceType: SurfaceType] = get_char_collision_surface [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E8E
function SanAndreasOpcodeChar.getCollisionSurface(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E8F
-- Instruction: [var lighting: float] = get_char_collision_lighting [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E8F
function SanAndreasOpcodeChar.getCollisionLighting(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E92
-- Instruction: is_char_really_in_air [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E92
function SanAndreasOpcodeChar.isReallyInAir(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E96
-- Instruction: clear_char_primary_tasks [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E96
function SanAndreasOpcodeChar.clearPrimaryTasks(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E97
-- Instruction: clear_char_secondary_tasks [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E97
function SanAndreasOpcodeChar.clearSecondaryTasks(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EA0
-- Instruction: set_char_second_player [Char] {enableCamera} [bool] {separateCars} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EA0
function SanAndreasOpcodeChar.setSecondPlayer(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EA4
-- Instruction: is_char_on_fire [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EA4
function SanAndreasOpcodeChar.isOnFire(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EA5
-- Instruction: [var closestCop: Char] = get_closest_cop_near_char [Char] {radius} [float] {alive} [bool] {inCar} [bool] {onFoot} [bool] {seenInFront} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EA5
function SanAndreasOpcodeChar.getClosestCop(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EAA
-- Instruction: set_char_arrested [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EAA
function SanAndreasOpcodeChar.setArrested(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EAB
-- Instruction: [var pedState: PedState] = get_char_pedstate [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EAB
function SanAndreasOpcodeChar.getPedState(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EAC
-- Instruction: [var bullet: bool], [var fire: bool], [var explosion: bool], [var collision: bool], [var melee: bool] = get_char_proofs [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EAC
function SanAndreasOpcodeChar.getProofs(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EAF
-- Instruction: is_char_weapon_visible_set [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EAF
function SanAndreasOpcodeChar.isWeaponVisibleSet(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EB1
-- Instruction: [var pedStat: PedStat] = get_char_stat_id [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EB1
function SanAndreasOpcodeChar.getStatId(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EB5
-- Instruction: [var entity: Char], [var weaponType: WeaponType], [var bodyPart: BodyPart], [var intensity: float] = get_char_damage_last_frame [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EB5
function SanAndreasOpcodeChar.getDamageLastFrame(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EC8
-- Instruction: [var randomSeed: int] = get_char_random_seed [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EC8
function SanAndreasOpcodeChar.getRandomSeed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ECB
-- Instruction: [var moveState: MoveState] = get_char_move_state [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ECB
function SanAndreasOpcodeChar.getMoveState(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ECC
-- Instruction: dont_delete_char_until_time [Char] {msFromNow} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ECC
function SanAndreasOpcodeChar.dontDeleteUntilTime(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ECE
-- Instruction: [var timeIsDead: int] = get_time_char_is_dead [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ECE
function SanAndreasOpcodeChar.getTimeIsDead(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ED9
-- Instruction: set_char_ignore_damage_anims [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ED9
function SanAndreasOpcodeChar.setIgnoreDamageAnims(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EE4
-- Instruction: locate_char_distance_to_char [Char] {character} [Char] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EE4
function SanAndreasOpcodeChar.locateDistanceToChar(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EE5
-- Instruction: locate_char_distance_to_car [Char] {car} [Car] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EE5
function SanAndreasOpcodeChar.locateDistanceToCar(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EE6
-- Instruction: locate_char_distance_to_object [Char] {object} [Object] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EE6
function SanAndreasOpcodeChar.locateDistanceToObject(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EEA
-- Instruction: locate_char_distance_to_coordinates [Char] {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EEA
function SanAndreasOpcodeChar.locateDistanceToCoordinates(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EFA
-- Instruction: [var fear: int] = get_char_fear [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EFA
function SanAndreasOpcodeChar.getFear(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EFF
-- Instruction: [var taskId: TaskId], [var address: int] = get_char_simplest_active_task [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EFF
function SanAndreasOpcodeChar.getSimplestActiveTask(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F02
-- Instruction: [var renderobject: int] = create_render_object_to_char_bone_from_special [Char] {specialModel} [int] {pedBone} [PedBone] {x} [float] {y} [float] {z} [float] {rx} [float] {ry} [float] {rz} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F02
function SanAndreasOpcodeChar.createRenderObjectToCharBoneFromSpecial()
   return Script.setOpcodeUnimplemented()
end


-- INI: 0179=2,  actor %1d% touching_object %2d%
Opcode.register(0x0179, SanAndreasOpcodeChar.isTouchingObject, 2, 'is_char_touching_object ${1} ${2}', {false, false})
-- INI: 017b=3,set_actor %1d% weapon %2d% ammo_to %3d%
Opcode.register(0x017b, SanAndreasOpcodeChar.setAmmo, 3, 'set_char_ammo ${1} ${2} ${3}', {false, false, true})
-- INI: 023b=2,  actor %1d% touching_object %2d% on_foot
Opcode.register(0x023b, SanAndreasOpcodeChar.isTouchingObjectOnFoot, 2, 'is_char_touching_object_on_foot ${1} ${2}', {false, false})
-- INI: 02a0=1,  actor %1d% stopped
Opcode.register(0x02a0, SanAndreasOpcodeChar.isStopped, 1, 'is_char_stopped ${1}', {false})
-- INI: 02d6=6,  actor %1d% shooting_in_area %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x02d6, SanAndreasOpcodeChar.isShootingInArea, 6, 'is_char_shooting_in_area ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0364=2,  actor %1d% spotted_actor %2d%
Opcode.register(0x0364, SanAndreasOpcodeChar.hasSpottedChar, 2, 'has_char_spotted_char ${1} ${2}', {false, false})
-- INI: 0393=2,set_actor %1d% anim_speed %2d%
Opcode.register(0x0393, SanAndreasOpcodeChar.setAnimSpeed, 3, 'set_char_anim_speed ${1} ${2} ${3}', {false, false, false})
-- INI: 041a=3,get_ammo_in_actor %1d% weapon %2d% store_to %3d%
Opcode.register(0x041a, SanAndreasOpcodeChar.getAmmoInWeapon, 3, '${3} = get_ammo_in_char_weapon ${1} ${2}', {false, false, true})
-- INI: 0430=3,put_actor %1d% into_car %2d% passenger_seat %3h%
Opcode.register(0x0430, SanAndreasOpcodeChar.warpIntoCarAsPassenger, 3, 'warp_char_into_car_as_passenger ${1} ${2} ${3}', {false, false, false})
-- INI: 0491=2,  actor %1d% has_weapon %2d%
Opcode.register(0x0491, SanAndreasOpcodeChar.hasGotWeapon, 2, 'has_char_got_weapon ${1} ${2}', {false, false})
-- INI: 04a7=1,  actor %1d% in_any_boat
Opcode.register(0x04a7, SanAndreasOpcodeChar.isInAnyBoat, 1, 'is_char_in_any_boat ${1}', {false})
-- INI: 04a9=1,  actor %1d% in_any_heli
Opcode.register(0x04a9, SanAndreasOpcodeChar.isInAnyHeli, 1, 'is_char_in_any_heli ${1}', {false})
-- INI: 04ab=1,  actor %1d% in_any_plane
Opcode.register(0x04ab, SanAndreasOpcodeChar.isInAnyPlane, 1, 'is_char_in_any_plane ${1}', {false})
-- INI: 04c8=1,  actor %1d% in_flying_vehicle
Opcode.register(0x04c8, SanAndreasOpcodeChar.isInFlyingVehicle, 1, 'is_char_in_flying_vehicle ${1}', {false})
-- INI: 0503=3,create_rappel_at %1d% %2d% %3d%
Opcode.register(0x0503, SanAndreasOpcodeChar.createSwatRope, 6, '${4} = create_swat_rope ${ped.5} ${6} ${1} ${2} ${3}', {false, false, false, true, false, false})
-- INI: 051B=2,  actor %1d% damaged_by_car %2d%
Opcode.register(0x051b, SanAndreasOpcodeChar.hasBeenDamagedByCar, 2, 'has_char_been_damaged_by_car ${1} ${2}', {false, false})
-- INI: 0547=2,  actor %1d% touching_car %2d%
Opcode.register(0x0547, SanAndreasOpcodeChar.isTouchingVehicle, 2, 'is_char_touching_vehicle ${1} ${2}', {false, false})
-- INI: 0555=2,remove_actor %1d% weapon %2d%
Opcode.register(0x0555, SanAndreasOpcodeChar.removeWeapon, 2, 'remove_weapon_from_char ${1} ${2}', {false, false})
-- INI: 0575=2,set_actor %1d% keep_position %2d%
Opcode.register(0x0575, SanAndreasOpcodeChar.freezePositionAndDontLoadCollision, 2, 'freeze_char_position_and_dont_load_collision ${1} ${2}', {false, false})
-- INI: 05F6=7,  actor %1d% in_rectangle_ll_corner_at %2d% %3d% lr_corner_at %4d% %5d% angle %6d% sphere %7h%
Opcode.register(0x05f6, SanAndreasOpcodeChar.isInAngledArea2D, 7, 'is_char_in_angled_area_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 05f7=2, %2d% = label %1p% pointer
Opcode.register(0x05f7, SanAndreasOpcodeChar.isInAngledAreaOnFoot2D, 7, 'is_char_in_angled_area_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, true, false, false, false, false, false})
-- INI: 05f8=2, %2d% = var %1d% pointer
Opcode.register(0x05f8, SanAndreasOpcodeChar.isInAngledAreaInCar2D, 7, 'is_char_in_angled_area_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, true, false, false, false, false, false})
-- INI: 05f9=3, %3d% = %1d% AND %2d%
Opcode.register(0x05f9, SanAndreasOpcodeChar.isStoppedInAngledArea2D, 7, 'is_char_stopped_in_angled_area_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, true, false, false, false, false})
-- INI: 05fa=3, %3d% = %1d% OR %2d%
Opcode.register(0x05fa, SanAndreasOpcodeChar.isStoppedInAngledAreaOnFoot2D, 7, 'is_char_stopped_in_angled_area_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, true, false, false, false, false})
-- INI: 05fb=3, %3d% = %1d% XOR %2d%
Opcode.register(0x05fb, SanAndreasOpcodeChar.isStoppedInAngledAreaInCar2D, 7, 'is_char_stopped_in_angled_area_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, true, false, false, false, false})
-- INI: 05fc=2, %2d% = NOT %1d%
Opcode.register(0x05fc, SanAndreasOpcodeChar.isInAngledArea3D, 9, 'is_char_in_angled_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, true, false, false, false, false, false, false, false})
-- INI: 05fd=3, %3d% = %1d% MOD %2d%
Opcode.register(0x05fd, SanAndreasOpcodeChar.isInAngledAreaOnFoot3D, 9, 'is_char_in_angled_area_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, true, false, false, false, false, false, false})
-- INI: 05fe=3, %3d% = %1d% SHR %2d%
Opcode.register(0x05fe, SanAndreasOpcodeChar.isInAngledAreaInCar3D, 9, 'is_char_in_angled_area_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, true, false, false, false, false, false, false})
-- INI: 05ff=3, %3d% = %1d% SHL %2d%
Opcode.register(0x05ff, SanAndreasOpcodeChar.isStoppedInAngledArea3D, 9, 'is_char_stopped_in_angled_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, true, false, false, false, false, false, false})
-- INI: 0600=9,  actor %1d% in_cube_fll_corner_at %2d% %3d% %4d% fur_corner_at %5d% %6d% %7d% depth %8d% flag %9h% stopped_on_foot
Opcode.register(0x0600, SanAndreasOpcodeChar.isStoppedInAngledAreaOnFoot3D, 9, 'is_char_stopped_in_angled_area_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 0601=2, is_button_pressed_on_pad %1d% with_sensitivity %2d%
Opcode.register(0x0601, SanAndreasOpcodeChar.isStoppedInAngledAreaInCar3D, 9, 'is_char_stopped_in_angled_area_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 0602=2, emulate_button_press_on_pad %1d% with_sensitivity %2d%
Opcode.register(0x0602, SanAndreasOpcodeChar.isInTaxi, 1, 'is_char_in_taxi ${1}', {false})
-- INI: 060B=2,set_actor %1d% decision_maker_to %2d%
Opcode.register(0x060b, SanAndreasOpcodeChar.setDecisionMaker, 2, 'set_char_decision_maker ${1} ${2}', {false, false})
-- INI: 060F=2,set_actor %1d% melee_accuracy_to %2d%
Opcode.register(0x060f, SanAndreasOpcodeChar.setSenseRange, 2, 'set_sense_range ${1} ${2}', {false, false})
-- INI: 0611=2,  actor %1d% performing_animation %2h%
Opcode.register(0x0611, SanAndreasOpcodeChar.isPlayingAnim, 2, 'is_char_playing_anim ${1} ${2}', {false, false})
-- INI: 0612=3,set_actor %1d% animation %2h% paused %3h%
Opcode.register(0x0612, SanAndreasOpcodeChar.setAnimPlayingFlag, 3, 'set_char_anim_playing_flag ${1} ${2} ${3}', {false, false, false})
-- INI: 0613=3,%3d% = actor %1d% animation %2h% time
Opcode.register(0x0613, SanAndreasOpcodeChar.getAnimCurrentTime, 3, '${3} = get_char_anim_current_time ${1} ${2}', {false, false, true})
-- INI: 0614=3,set_actor %1d% animation %2h% progress_to %3d% // 0.0 to 1.0
Opcode.register(0x0614, SanAndreasOpcodeChar.setAnimCurrentTime, 3, 'set_char_anim_current_time ${1} ${2} ${3}', {false, false, true})
-- INI: 0618=2,assign_actor %1d% to_AS_pack %2d%
Opcode.register(0x0618, SanAndreasOpcodeChar.performSequence, 2, 'perform_sequence_task ${1} ${2}', {false, false})
-- INI: 0619=2,enable_actor %1d% collision_detection %2h%
Opcode.register(0x0619, SanAndreasOpcodeChar.setCollision, 2, 'set_char_collision ${1} ${2}', {false, false})
-- INI: 061A=3,get_actor %1d% animation %2h% total_time_to %3d%
Opcode.register(0x061a, SanAndreasOpcodeChar.getAnimTotalTime, 3, '${3} = get_char_anim_total_time ${1} ${2}', {false, false, true})
-- INI: 0621=5,create_actor_pedtype %1h% model %2m% at_AS_origin %3d% task %4d% handle_as %5d%
Opcode.register(0x0621, SanAndreasOpcodeChar.createAtAttractor, 5, '${5} = create_char_at_attractor ${1} ${ped.2} ${3} ${4}', {false, false, false, false, true})
-- INI: 062E=3,get_actor %1d% task %2d% status_store_to %3d% ; ret 7 if not found
Opcode.register(0x062e, SanAndreasOpcodeChar.getScriptTaskStatus, 3, '${3} = get_script_task_status ${1} ${2}', {false, false, true})
-- INI: 0642=2,  actor %1d% at_AS_origin %2d%
Opcode.register(0x0642, SanAndreasOpcodeChar.isAtScriptedAttractor, 2, 'is_char_at_scripted_attractor ${1} ${2}', {false, false})
-- INI: 0646=2,unknown_get_actor %1d% task_1560_status_store_to %2d% ; similar to 062E
Opcode.register(0x0646, SanAndreasOpcodeChar.getSequenceProgress, 2, '${2} = get_sequence_progress ${1}', {false, true})
-- INI: 0647=1,AS_actor %1d% clear_look_task
Opcode.register(0x0647, SanAndreasOpcodeChar.clearLookAt, 1, 'clear_look_at ${1}', {false})
-- INI: 0648=2,unknown_actor %1d% task_set %2d% ; float
Opcode.register(0x0648, SanAndreasOpcodeChar.setFollowNodeThresholdDistance, 2, 'set_follow_node_threshold_distance ${1} ${2}', {false, false})
-- INI: 0665=2,get_actor %1d% model_to %2d%
Opcode.register(0x0665, SanAndreasOpcodeChar.getModel, 2, '${2} = get_char_model ${1}', {false, true})
-- INI: 0687=1,clear_actor %1d% task
Opcode.register(0x0687, SanAndreasOpcodeChar.clearTasks, 1, 'clear_char_tasks ${1}', {false})
-- INI: 06A7=9,put_actor %1d% into_turret_on_car %2d% at_car_offset %3d% %4d% %5d% position %6h% shooting_angle %7d% %8d% with_weapon %9h%
Opcode.register(0x06a7, SanAndreasOpcodeChar.attachToBike, 9, 'attach_char_to_bike ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 06AB=2,set_actor %1d% all_weapons_hidden %2h%
Opcode.register(0x06ab, SanAndreasOpcodeChar.hideWeaponForScriptedCutscene, 2, 'hide_char_weapon_for_scripted_cutscene ${1} ${2}', {false, false})
-- INI: 06AC=2,%2d% = actor %1d% movement_speed
Opcode.register(0x06ac, SanAndreasOpcodeChar.getSpeed, 2, '${2} = get_char_speed ${1}', {false, true})
-- INI: 06C9=1,remove_actor %1d% from_group
Opcode.register(0x06c9, SanAndreasOpcodeChar.removeFromGroup, 1, 'remove_char_from_group ${1}', {false})
-- INI: 06EE=2,  actor %1d% in_group %2d%
Opcode.register(0x06ee, SanAndreasOpcodeChar.isGroupMember, 2, 'is_group_member ${1} ${2}', {false, false})
-- INI: 06EF=2,  actor %1d% leading_group %2d%
Opcode.register(0x06ef, SanAndreasOpcodeChar.isGroupLeader, 2, 'is_group_leader ${1} ${2}', {false, false})
-- INI: 06FF=2,  any_ped_near_actor %1d% in_range %2d%
Opcode.register(0x06ff, SanAndreasOpcodeChar.isNearAnyChars, 2, 'are_any_chars_near_char ${1} ${2}', {false, false})
-- INI: 070B=2,set_actor %1d% onbone_attached_object_operation %2d%
Opcode.register(0x070b, SanAndreasOpcodeChar.dropObject, 2, 'drop_object ${1} ${2}', {false, false})
-- INI: 0737=2,  actor %1d% lifting_object %2d%
Opcode.register(0x0737, SanAndreasOpcodeChar.isHoldingObject, 2, 'is_char_holding_object ${1} ${2}', {false, false})
-- INI: 0741=1,  actor %1d% busted
Opcode.register(0x0741, SanAndreasOpcodeChar.hasBeenArrested, 1, 'has_char_been_arrested ${1}', {false})
-- INI: 074E=3,unknown_set_actor_threat_scanner_flags %1d% radius %2d% peds_to_scan %3h%
Opcode.register(0x074e, SanAndreasOpcodeChar.setInformRespectedFriends, 3, 'set_inform_respected_friends ${1} ${2} ${3}', {false, false, false})
-- INI: 074F=2,  actor %1d% ped_event == %2h%
Opcode.register(0x074f, SanAndreasOpcodeChar.isRespondingToEvent, 2, 'is_char_responding_to_event ${1} ${2}', {false, false})
-- INI: 0770=2,set_actor %1d% target_priority %2h%
Opcode.register(0x0770, SanAndreasOpcodeChar.setIsTargetPriority, 2, 'set_char_is_target_priority ${1} ${2}', {false, false})
-- INI: 077A=3,set_actor %1d% acquaintance %2h% to_actors_pedtype %3h% ; see ped.dat
Opcode.register(0x077a, SanAndreasOpcodeChar.setRelationship, 3, 'set_char_relationship ${1} ${2} ${3}', {false, false, false})
-- INI: 077B=3,clear_actor %1d% acquaintance %2h% to_actors_pedtype %3h% ; see ped.dat
Opcode.register(0x077b, SanAndreasOpcodeChar.clearRelationship, 3, 'clear_char_relationship ${1} ${2} ${3}', {false, false, false})
-- INI: 077C=2,clear_actor %1d% acquaintance %2h% to_all_pedtypes ; see ped.dat
Opcode.register(0x077c, SanAndreasOpcodeChar.clearAllRelationships, 2, 'clear_all_char_relationships ${1} ${2}', {false, false})
-- INI: 0792=1,disembark_instantly_actor %1d%
Opcode.register(0x0792, SanAndreasOpcodeChar.clearTasksImmediately, 1, 'clear_char_tasks_immediately ${1}', {false})
-- INI: 07A0=4,unknown_actor %1d% unknown_assigned_to_AS %2d% unknown_set %3h% unknown_set %4h%
Opcode.register(0x07a0, SanAndreasOpcodeChar.performSequenceFromProgress, 4, 'perform_sequence_task_from_progress ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 07A1=1,set_walk_speed %1h%
Opcode.register(0x07a1, SanAndreasOpcodeChar.setNextDesiredMoveState, 1, 'set_next_desired_move_state ${1}', {false})
-- INI: 07A4=3,get_actor %1d% task_1560_flags_store_to %2d% %3d%
Opcode.register(0x07a4, SanAndreasOpcodeChar.getSequenceProgressRecursive, 3, '${2}, ${3} = get_sequence_progress_recursive ${1}', {false, true, true})
-- INI: 07A9=2,get_searchlight_on_actor %1d% store_to %2d% // IF and SET
Opcode.register(0x07a9, SanAndreasOpcodeChar.isInAnySearchlight, 2, '${2} = is_char_in_any_searchlight ${1}', {false, true})
-- INI: 07CB=2,set_actor %1d% supporting_fire %2h%
Opcode.register(0x07cb, SanAndreasOpcodeChar.listenToPlayerGroupCommands, 2, 'listen_to_player_group_commands ${1} ${2}', {false, false})
-- INI: 07DD=2,set_actor %1d% attack_rate %2h%  ; previously known as temper_to
Opcode.register(0x07dd, SanAndreasOpcodeChar.setShootRate, 2, 'set_char_shoot_rate ${1} ${2}', {false, false})
-- INI: 07FE=3,set_actor %1d% fighting_style_to %2h% moves %3h%
Opcode.register(0x07fe, SanAndreasOpcodeChar.giveMeleeAttack, 3, 'give_melee_attack_to_char ${1} ${2} ${3}', {false, false, false})
-- INI: 080E=2,get_actor %1d% ped_event_to %2d%
Opcode.register(0x080e, SanAndreasOpcodeChar.getHighestPriorityEvent, 2, '${2} = get_char_highest_priority_event ${1}', {false, true})
-- INI: 0811=2,%2d% = actor %1d% used_car
Opcode.register(0x0811, SanAndreasOpcodeChar.getCarIsUsing, 2, '${2} = get_car_char_is_using ${1}', {false, true})
-- INI: 0816=2,set_actor %1d% dont_chase_victim %2h%
Opcode.register(0x0816, SanAndreasOpcodeChar.setKindaStayInSamePlace, 2, 'set_char_kinda_stay_in_same_place ${1} ${2}', {false, false})
-- INI: 0818=1,  actor %1d% in_air
Opcode.register(0x0818, SanAndreasOpcodeChar.isInAir, 1, 'is_char_in_air ${1}', {false})
-- INI: 0819=2,%2d% = actor %1d% distance_from_ground
Opcode.register(0x0819, SanAndreasOpcodeChar.getHeightAboveGround, 2, '${2} = get_char_height_above_ground ${1}', {false, true})
-- INI: 081A=2,set_actor %1d% weapon_skill_to %2h%
Opcode.register(0x081a, SanAndreasOpcodeChar.setWeaponSkill, 2, 'set_char_weapon_skill ${1} ${2}', {false, false})
-- INI: 083C=4,set_actor %1d% velocity_in_direction_XYZ %2d% %3d% %4d%
Opcode.register(0x083c, SanAndreasOpcodeChar.setVelocity, 4, 'set_char_velocity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 083D=4,get_actor %1d% velocity_in_direction_XYZ %2d% %3d% %4d%
Opcode.register(0x083d, SanAndreasOpcodeChar.getVelocity, 4, '${2}, ${3}, ${4} = get_char_velocity ${1}', {false, true, true, true})
-- INI: 083E=4,set_actor %1d% rotation %2d% %3d% %4d% while_in_air
Opcode.register(0x083e, SanAndreasOpcodeChar.setRotation, 4, 'set_char_rotation ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0851=3,set_actor %1d% decrease_health_by %2h% affect_armour %3h%
Opcode.register(0x0851, SanAndreasOpcodeChar.damage, 3, 'damage_char ${1} ${2} ${3}', {false, false, false})
-- INI: 0856=2,set_actor %1d% enable_crouch %2h%
Opcode.register(0x0856, SanAndreasOpcodeChar.setAllowedToDuck, 2, 'set_char_allowed_to_duck ${1} ${2}', {false, false})
-- INI: 0860=2,link_actor %1d% to_interior %2h%
Opcode.register(0x0860, SanAndreasOpcodeChar.setAreaVisible, 2, 'set_char_area_visible ${1} ${2}', {false, false})
-- INI: 087E=2,set_actor %1d% weapon_droppable %2h%
Opcode.register(0x087e, SanAndreasOpcodeChar.setDropsWeaponsWhenDead, 2, 'set_char_drops_weapons_when_dead ${1} ${2}', {false, false})
-- INI: 087F=2,set_actor %1d% never_leave_group %2h%
Opcode.register(0x087f, SanAndreasOpcodeChar.setNeverLeavesGroup, 2, 'set_char_never_leaves_group ${1} ${2}', {false, false})
-- INI: 0887=3,set_actor %1d% turret_mode_orientation %2h% both_side_angle_limit %3d%
Opcode.register(0x0887, SanAndreasOpcodeChar.setHeadingLimitForAttached, 3, 'set_heading_limit_for_attached_char ${1} ${2} ${3}', {false, false, false})
-- INI: 0889=4,store_actor %1d% center_of_body_position_to %2d% %3d% %4d%
Opcode.register(0x0889, SanAndreasOpcodeChar.getCoordinatesOfDied, 4, '${2}, ${3}, ${4} = get_dead_char_coordinates ${1}', {false, true, true, true})
-- INI: 089F=2,get_actor %1d% pedtype_to %2d%
Opcode.register(0x089f, SanAndreasOpcodeChar.getPedType, 2, '${1} = get_ped_type ${2}', {false, false})
-- INI: 08AD=4,link_actor %1d% to_enex_marker_at %2d% %3d% radius %4d%
Opcode.register(0x08ad, SanAndreasOpcodeChar.setHasUsedEntryExit, 4, 'set_char_has_used_entry_exit ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 08AF=2,set_actor %1d% max_health_to %2d%
Opcode.register(0x08af, SanAndreasOpcodeChar.setMaxHealth, 2, 'set_char_max_health ${1} ${2}', {false, false})
-- INI: 08C6=2,set_actor %1d% stay_on_bike %2h%
Opcode.register(0x08c6, SanAndreasOpcodeChar.setCanBeKnockedOffBike, 2, 'set_char_can_be_knocked_off_bike ${1} ${2}', {false, false})
-- INI: 08C7=4,put_actor %1d% at %2d% %3d% %4d% dont_warp_gang
Opcode.register(0x08c7, SanAndreasOpcodeChar.setCoordinatesDontWarpGang, 4, 'set_char_coordinates_dont_warp_gang ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 093B=2,set_actor %1d% upper_body_damage_anims_only %2h%
Opcode.register(0x093b, SanAndreasOpcodeChar.setBulletproofVest, 2, 'set_char_bulletproof_vest ${1} ${2}', {false, false})
-- INI: 0946=2,set_actor %1d% actions_uninterupted_by_weapon_fire %2d%
Opcode.register(0x0946, SanAndreasOpcodeChar.setUsesUpperbodyDamageAnimsOnly, 2, 'set_char_uses_upperbody_damage_anims_only ${1} ${2}', {false, false})
-- INI: 0947=3,actor %1d% speak_from_audio_table %2d% store_spoken_phrase_id_to %3d%
Opcode.register(0x0947, SanAndreasOpcodeChar.setSayContext, 3, '${3} = set_char_say_context ${1} ${2}', {false, false, true})
-- INI: 094B=2,%2d% = get_active_interior_name_from_actor %1d% ; 16-byte string
Opcode.register(0x094b, SanAndreasOpcodeChar.getNameOfEntryExitUsed, 2, '${2} = get_name_of_entry_exit_char_used ${1}', {false, true})
-- INI: 094C=5,get_actor %1d% currently_used_EnEx_3D_coord_to %2d% %3d% %4d% number_to %5d%
Opcode.register(0x094c, SanAndreasOpcodeChar.getPositionOfEntryExitCharUsed, 5, '${2}, ${3}, ${4}, ${5} = get_position_of_entry_exit_char_used ${1}', {false, true, true, true, true})
-- INI: 094D=1,  actor %1d% mutally_active
Opcode.register(0x094d, SanAndreasOpcodeChar.isTalking, 1, 'is_char_talking ${1}', {false})
-- INI: 094E=2,set_actor %1d% mute_pain_audio %2h%
Opcode.register(0x094e, SanAndreasOpcodeChar.disableSpeech, 2, 'disable_char_speech ${1} ${2}', {false, false})
-- INI: 094F=1,enable_actor %1d% pain_audio
Opcode.register(0x094f, SanAndreasOpcodeChar.enableSpeech, 1, 'enable_char_speech ${1}', {false})
-- INI: 095D=1,  actor %1d% stuck_under_car
Opcode.register(0x095d, SanAndreasOpcodeChar.isStuckUnderCar, 1, 'is_char_stuck_under_car ${1}', {false})
-- INI: 0961=2,set_actor %1d% keep_tasks_after_cleanup %2h%
Opcode.register(0x0961, SanAndreasOpcodeChar.setKeepTask, 2, 'set_char_keep_task ${1} ${2}', {false, false})
-- INI: 0965=1,  actor %1d% swimming
Opcode.register(0x0965, SanAndreasOpcodeChar.isSwimming, 1, 'is_char_swimming ${1}', {false})
-- INI: 0966=2,get_actor %1d% swimming_status_to %2d%
Opcode.register(0x0966, SanAndreasOpcodeChar.getSwimState, 2, '${2} = get_char_swim_state ${1}', {false, true})
-- INI: 0967=2,actor %1d% move_mouth %2d% ms
Opcode.register(0x0967, SanAndreasOpcodeChar.startFacialTalk, 2, 'start_char_facial_talk ${1} ${2}', {false, false})
-- INI: 0968=1,actor %1d% stop_mouth
Opcode.register(0x0968, SanAndreasOpcodeChar.stopFacialTalk, 1, 'stop_char_facial_talk ${1}', {false})
-- INI: 0972=4,put_actor %1d% at %2d% %3d% %4d% no_offset
Opcode.register(0x0972, SanAndreasOpcodeChar.setCoordinatesNoOffset, 4, 'set_char_coordinates_no_offset ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0982=2,set_actor %1d% stay_in_car_when_dead %2h%
Opcode.register(0x0982, SanAndreasOpcodeChar.setForceDieInCar, 2, 'set_char_force_die_in_car ${1} ${2}', {false, false})
-- INI: 09A1=2,set_actor %1d% onbone_attached_objectB_operation %2b%
Opcode.register(0x09a1, SanAndreasOpcodeChar.dropSecondObject, 2, 'drop_second_object ${1} ${2}', {false, false})
-- INI: 09A7=2,set_actor %1d% drugged_up %2h%
Opcode.register(0x09a7, SanAndreasOpcodeChar.setDruggedUp, 2, 'set_char_drugged_up ${1} ${2}', {false, false})
-- INI: 09A8=1,  actor %1d% headshoted
Opcode.register(0x09a8, SanAndreasOpcodeChar.isHeadMissing, 1, 'is_char_head_missing ${1}', {false})
-- INI: 09AE=1,  actor %1d% driving_train
Opcode.register(0x09ae, SanAndreasOpcodeChar.isInAnyTrain, 1, 'is_char_in_any_train ${1}', {false})
-- INI: 09B5=2,set_actor %1d% signal_after_kill %2h%
Opcode.register(0x09b5, SanAndreasOpcodeChar.setSignalAfterKill, 2, 'set_char_signal_after_kill ${1} ${2}', {false, false})
-- INI: 09B6=2,set_actor %1d% wanted_by_police %2h%
Opcode.register(0x09b6, SanAndreasOpcodeChar.setWantedByPolice, 2, 'set_char_wanted_by_police ${1} ${2}', {false, false})
-- INI: 09BC=4,put_actor %1d% at %2d% %3d% %4d% no_offset_and_dont_warp_gang
Opcode.register(0x09bc, SanAndreasOpcodeChar.setCoordinatesDontWarpGangNoOffset, 4, 'set_char_coordinates_dont_warp_gang_no_offset ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 09C5=1,  unknown_actor %1d%
Opcode.register(0x09c5, SanAndreasOpcodeChar.isUsingMapAttractor, 1, 'is_char_using_map_attractor ${1}', {false})
-- INI: 09C9=2,disembark_actor %1d% from_car %2d% and_freeze_actor_position
Opcode.register(0x09c9, SanAndreasOpcodeChar.removeFromCarMaintainPosition, 2, 'remove_char_from_car_maintain_position ${1} ${2}', {false, false})
-- INI: 09D5=6,play_sound_of_actor %1d% soundslot %2d% unknown_flags %3h% %4h% %5h% as %6d% ; extended 0947
Opcode.register(0x09d5, SanAndreasOpcodeChar.setSayContextImportant, 6, '${6} = set_char_say_context_important ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false, true})
-- INI: 09D6=5,unknown_set_actor %1d% sound %2d% flags %3h% %4h% %5h%
Opcode.register(0x09d6, SanAndreasOpcodeChar.setSayScript, 5, 'set_char_say_script ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 09DE=1,  actor %1d% entering_car
Opcode.register(0x09de, SanAndreasOpcodeChar.isGettingInToACar, 1, 'is_char_getting_in_to_a_car ${1}', {false})
-- INI: 09E8=2,%2d% = actor %1d% active_interior
Opcode.register(0x09e8, SanAndreasOpcodeChar.getAreaVisible, 2, '${2} = get_char_area_visible ${1}', {false, true})
-- INI: 09ED=2,  actor %1d% is_within_field_of_view_actor %2d%
Opcode.register(0x09ed, SanAndreasOpcodeChar.hasSpottedCharInFront, 2, 'has_char_spotted_char_in_front ${1} ${2}', {false, false})
-- INI: 09F4=2,set_actor %1d% ignore_height_difference_following_nodes %2h%
Opcode.register(0x09f4, SanAndreasOpcodeChar.ignoreHeightDifferenceFollowingNodes, 2, 'ignore_height_difference_following_nodes ${1} ${2}', {false, false})
-- INI: 09F6=2,set_actor %1d% unjackable_through_driver_seat %2h%
Opcode.register(0x09f6, SanAndreasOpcodeChar.setGetOutUpsideDownCar, 2, 'set_char_get_out_upside_down_car ${1} ${2}', {false, false})
-- INI: 0A09=2,set_actor %1d% muted %2h% ; versionB
Opcode.register(0x0a09, SanAndreasOpcodeChar.shutUpForScriptedSpeech, 2, 'shut_char_up_for_scripted_speech ${1} ${2}', {false, false})
-- INI: 0A1B=2,  actor %1d% colliding_with_actor %2d%
Opcode.register(0x0a1b, SanAndreasOpcodeChar.isTouchingChar, 2, 'is_char_touching_char ${1} ${2}', {false, false})
-- INI: 0A27=2,set_actor %1d% death_pickups_persist %2h%
Opcode.register(0x0a27, SanAndreasOpcodeChar.setDeathWeaponsPersist, 2, 'set_death_weapons_persist ${1} ${2}', {false, false})
-- INI: 0A28=2,set_actor %1d% swimming_speed_to %2d%
Opcode.register(0x0a28, SanAndreasOpcodeChar.setSwimSpeed, 2, 'set_swim_speed ${1} ${2}', {false, false})
-- INI: 0A32=1,  actor %1d% on_turret_of_car
Opcode.register(0x0a32, SanAndreasOpcodeChar.isAttachedToAnyCar, 1, 'is_char_attached_to_any_car ${1}', {false})
-- INI: 0A33=2,get_car_ped_is_attached_to %1d% store_to %2d%
Opcode.register(0x0a33, SanAndreasOpcodeChar.storeCarIsAttachedToNoSave, 2, '${1} = store_car_char_is_attached_to_no_save ${2}', {true, false})
-- INI: 0AB5=3,store_char %1d% closest_vehicle_to %2d% closest_ped_to %3d%
Opcode.register(0x0ab5, SanAndreasOpcodeChar.storeClosestEntities, 3, '${2}, ${3} = store_closest_entities ${1}', {false, true, true})
-- INI: 0D0B=3,get_actor %1d% bone %2d% matrix_to %3d% // IF and SET
Opcode.register(0x0d0b, SanAndreasOpcodeChar.getBoneMatrix, 3, '${3} = get_char_bone_matrix ${1} ${2}', {false, false, true})
-- INI: 0D10=2,set_actor %1d% model_alpha %2d% // IF and SET
Opcode.register(0x0d10, SanAndreasOpcodeChar.setModelAlpha, 2, 'set_char_model_alpha ${1} ${2}', {false, false})
-- INI: 0D30=3,%3d% = actor %1d% bone %2d% // IF and SET
Opcode.register(0x0d30, SanAndreasOpcodeChar.getBone, 3, '${3} = get_char_bone ${1} ${2}', {false, false, true})
-- INI: 0D31=2,%2d% = bone %1d% offset_vector
Opcode.register(0x0d31, SanAndreasOpcodeChar.getBoneOffsetVector, 2, '${1} = get_bone_offset_vector ${2}', {true, false})
-- INI: 0D32=2,%2d% = bone %1d% quat
Opcode.register(0x0d32, SanAndreasOpcodeChar.getBoneQuat, 2, '${1} = get_bone_quat ${2}', {true, false})
-- INI: 0D39=2,%2d% = actor %1d% max_health
Opcode.register(0x0d39, SanAndreasOpcodeChar.getMaxHealth, 2, '${1} = get_char_max_health ${2}', {true, false})
-- INI: 0E0A=1,is_char_script_controlled %1d%
Opcode.register(0x0e0a, SanAndreasOpcodeChar.isScriptControlled, 1, 'is_char_script_controlled ${1}', {false})
-- INI: 0E0B=1,mark_char_as_needed %1d%
Opcode.register(0x0e0b, SanAndreasOpcodeChar.markAsNeeded, 1, 'mark_char_as_needed ${1}', {false})
-- INI: 0E14=3,init_extended_char_vars %1d% id %2d% new_vars %3d%
Opcode.register(0x0e14, SanAndreasOpcodeChar.initExtendedVars, 3, 'init_extended_char_vars ${1} ${2} ${3}', {false, false, false})
-- INI: 0E15=4,set_extended_char_var %1d% id %2d% var %3d% value %4d%
Opcode.register(0x0e15, SanAndreasOpcodeChar.setExtendedVar, 4, 'set_extended_char_var ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0E16=4,get_extended_char_var %1d% id %2d% var %3d% to %4d%
Opcode.register(0x0e16, SanAndreasOpcodeChar.getExtendedVar, 4, '${4} = get_extended_char_var ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0E24=4,fix_char %1d% ground %2d% brightness %3d% and_fade_in %4d%
Opcode.register(0x0e24, SanAndreasOpcodeChar.fixGroundBrightnessAndFadeIn, 4, 'fix_char_ground_brightness_and_fade_in ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0E30=4,set_render_object_auto_hide %1d% dead %2d% weapon %3d% car %4d%
Opcode.register(0x0e30, SanAndreasOpcodeChar.setRenderObjectAutoHide, 4, 'set_render_object_auto_hide ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0E32=4,set_char_coordinates_simple %1d% coord %2d% %3d% %4d%
Opcode.register(0x0e32, SanAndreasOpcodeChar.setCoordinatesSimple, 4, 'set_char_coordinates_simple ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0E42=2,is_char_doing_task_id %1d% %2d%
Opcode.register(0x0e42, SanAndreasOpcodeChar.isDoingTaskId, 2, 'is_char_doing_task_id ${1} ${2}', {false, false})
-- INI: 0E43=3,get_char_task_pointer_by_id %1d% %2d% store_to %3d%
Opcode.register(0x0e43, SanAndreasOpcodeChar.getTaskPointerById, 3, '${3} = get_char_task_pointer_by_id ${1} ${2}', {false, false, true})
-- INI: 0E44=2,get_char_kill_target_char %1d% store_to %2d%
Opcode.register(0x0e44, SanAndreasOpcodeChar.getKillTargetChar, 2, '${1} = get_char_kill_target_char ${2}', {true, false})
-- INI: 0E46=1,is_char_using_gun %1d%
Opcode.register(0x0e46, SanAndreasOpcodeChar.isUsingGun, 1, 'is_char_using_gun ${1}', {false})
-- INI: 0E47=1,is_char_fighting %1d%
Opcode.register(0x0e47, SanAndreasOpcodeChar.isFighting, 1, 'is_char_fighting ${1}', {false})
-- INI: 0E48=1,is_char_fallen_on_ground %1d%
Opcode.register(0x0e48, SanAndreasOpcodeChar.isFallenOnGround, 1, 'is_char_fallen_on_ground ${1}', {false})
-- INI: 0E49=1,is_char_entering_any_car %1d%
Opcode.register(0x0e49, SanAndreasOpcodeChar.isEnteringAnyCar, 1, 'is_char_entering_any_car ${1}', {false})
-- INI: 0E4A=1,is_char_exiting_any_car %1d%
Opcode.register(0x0e4a, SanAndreasOpcodeChar.isExitingAnyCar, 1, 'is_char_exiting_any_car ${1}', {false})
-- INI: 0E4B=2,is_char_playing_any_script_animation %1d% include_anims %2d%
Opcode.register(0x0e4b, SanAndreasOpcodeChar.isPlayingAnyScriptAnimation, 1, 'is_char_playing_any_script_animation ${1}', {false})
-- INI: 0E4C=2,is_char_doing_any_important_task %1d% include_anims %2d%
Opcode.register(0x0e4c, SanAndreasOpcodeChar.isDoingAnyImportantTask, 1, 'is_char_doing_any_important_task ${1}', {false})
-- INI: 0E5C=2,get_player_health_percent %1d% store_to %2d%
Opcode.register(0x0e5c, SanAndreasOpcodeChar.getHealthPercent, 2, '${1} = get_char_health_percent ${2}', {true, false})
-- INI: 0E83=2,get_current_char_weaponinfo %1d% store_to %2d%
Opcode.register(0x0e83, SanAndreasOpcodeChar.getCurrentWeaponinfo, 2, '${1} = get_current_char_weaponinfo ${2}', {true, false})
-- INI: 0E8B=2,get_char_weapon_state %1d% store_to %2d%
Opcode.register(0x0e8b, SanAndreasOpcodeChar.getWeaponState, 2, '${1} = get_char_weapon_state ${2}', {true, false})
-- INI: 0E8C=2,get_char_weapon_clip %1d% store_to %2d%
Opcode.register(0x0e8c, SanAndreasOpcodeChar.getCharWeaponClip, 2, '${1} = get_char_weapon_clip ${2}', {true, false})
-- INI: 0E8E=2,get_char_collision_surface %1d% store_to %2d%
Opcode.register(0x0e8e, SanAndreasOpcodeChar.getCollisionSurface, 2, '${1} = get_char_collision_surface ${2}', {true, false})
-- INI: 0E8F=2,get_char_collision_lighting %1d% store_to %2d%
Opcode.register(0x0e8f, SanAndreasOpcodeChar.getCollisionLighting, 2, '${1} = get_char_collision_lighting ${2}', {true, false})
-- INI: 0E92=1,is_char_really_in_air %1d%
Opcode.register(0x0e92, SanAndreasOpcodeChar.isReallyInAir, 1, 'is_char_really_in_air ${1}', {false})
-- INI: 0E96=1,clear_char_primary_tasks %1d%
Opcode.register(0x0e96, SanAndreasOpcodeChar.clearPrimaryTasks, 1, 'clear_char_primary_tasks ${1}', {false})
-- INI: 0E97=1,clear_char_secondary_tasks %1d%
Opcode.register(0x0e97, SanAndreasOpcodeChar.clearSecondaryTasks, 1, 'clear_char_secondary_tasks ${1}', {false})
-- INI: 0EA0=3,set_actor_second_player %1d% enable_camera %2d% separate_cars %3d%
Opcode.register(0x0ea0, SanAndreasOpcodeChar.setSecondPlayer, 3, 'set_char_second_player ${1} ${2} ${3}', {false, false, false})
-- INI: 0EA4=1,is_char_on_fire %1d%
Opcode.register(0x0ea4, SanAndreasOpcodeChar.isOnFire, 1, 'is_char_on_fire ${1}', {false})
-- INI: 0EA5=7,get_closest_cop_near_char %1d% radius %2d% alive %3d% in_car %4d% on_foot %5d% seen_in_front %6d% store_to %7d%
Opcode.register(0x0ea5, SanAndreasOpcodeChar.getClosestCop, 7, '${7} = get_closest_cop_near_char ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 0EAA=1,set_char_arrested %1d%
Opcode.register(0x0eaa, SanAndreasOpcodeChar.setArrested, 1, 'set_char_arrested ${1}', {false})
-- INI: 0EAB=2,get_char_pedstate %1d% store_to %2d%
Opcode.register(0x0eab, SanAndreasOpcodeChar.getPedState, 2, '${1} = get_char_pedstate ${2}', {true, false})
-- INI: 0EAC=6,get_char_proofs %1d% bullet %2d% fire %3d% explosion %4d% collision %5d% melee %6d%
Opcode.register(0x0eac, SanAndreasOpcodeChar.getProofs, 6, '${2}, ${3}, ${4}, ${5}, ${6} = get_char_proofs ${1}', {false, true, true, true, true, true})
-- INI: 0EAF=1,is_char_weapon_visible_set %1d%
Opcode.register(0x0eaf, SanAndreasOpcodeChar.isWeaponVisibleSet, 1, 'is_char_weapon_visible_set ${1}', {false})
-- INI: 0EB1=2,get_char_stat_id %1d% store_to %2d%
Opcode.register(0x0eb1, SanAndreasOpcodeChar.getStatId, 2, '${1} = get_char_stat_id ${2}', {true, false})
-- INI: 0EB5=5,get_char_damage_last_frame %1d% damager %2d% type %3d% part %4d% intensity %5d%
Opcode.register(0x0eb5, SanAndreasOpcodeChar.getDamageLastFrame, 5, '${2}, ${3}, ${4}, ${5} = get_char_damage_last_frame ${1}', {false, true, true, true, true})
-- INI: 0EC8=2,get_char_random_seed %1d% store_to %2d%
Opcode.register(0x0ec8, SanAndreasOpcodeChar.getRandomSeed, 2, '${1} = get_char_random_seed ${2}', {true, false})
-- INI: 0ECB=2,get_char_move_state %1d% store_to %2d%
Opcode.register(0x0ecb, SanAndreasOpcodeChar.getMoveState, 2, '${1} = get_char_move_state ${2}', {true, false})
-- INI: 0ECC=2,dont_delete_char_until_time %1d% %2d%
Opcode.register(0x0ecc, SanAndreasOpcodeChar.dontDeleteUntilTime, 2, 'dont_delete_char_until_time ${1} ${2}', {false, false})
-- INI: 0ECE=2,get_time_char_is_dead %1d% store_to %2d%
Opcode.register(0x0ece, SanAndreasOpcodeChar.getTimeIsDead, 2, '${1} = get_time_char_is_dead ${2}', {true, false})
-- INI: 0ED9=2,set_char_ignore_damage_anims %1d% %2d%
Opcode.register(0x0ed9, SanAndreasOpcodeChar.setIgnoreDamageAnims, 2, 'set_char_ignore_damage_anims ${1} ${2}', {false, false})
-- INI: 0EE4=3,locate_char_distance_to_char %1d% char %2d% radius %3d%
Opcode.register(0x0ee4, SanAndreasOpcodeChar.locateDistanceToChar, 3, 'locate_char_distance_to_char ${1} ${2} ${3}', {false, false, false})
-- INI: 0EE5=3,locate_char_distance_to_car %1d% car %2d% radius %3d%
Opcode.register(0x0ee5, SanAndreasOpcodeChar.locateDistanceToCar, 3, 'locate_char_distance_to_car ${1} ${2} ${3}', {false, false, false})
-- INI: 0EE6=3,locate_char_distance_to_object %1d% object %2d% radius %3d%
Opcode.register(0x0ee6, SanAndreasOpcodeChar.locateDistanceToObject, 3, 'locate_char_distance_to_object ${1} ${2} ${3}', {false, false, false})
-- INI: 0EEA=5,locate_char_distance_to_coordinates %1d% pos %2d% %3d% %4d% radius %5d%
Opcode.register(0x0eea, SanAndreasOpcodeChar.locateDistanceToCoordinates, 5, 'locate_char_distance_to_coordinates ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0EFA=2,get_char_fear %1d% store_to %2d%
Opcode.register(0x0efa, SanAndreasOpcodeChar.getFear, 2, '${1} = get_char_fear ${2}', {true, false})
-- INI: 0EFF=3,get_char_simplest_active_task %1d% id_to %2d% pointer_to %3d%
Opcode.register(0x0eff, SanAndreasOpcodeChar.getSimplestActiveTask, 3, '${1}, ${2} = get_char_simplest_active_task ${3}', {false, false, false})
Opcode.register(0x0f02, SanAndreasOpcodeChar.createRenderObjectToCharBoneFromSpecial, 10, '${1} = create_render_object_to_char_bone_from_special [Char] ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}')
