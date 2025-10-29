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
    local status = actor:getTaskStatus(taskId)
    Script.storeValueAtIndex(3, status)
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

    Script.storeValueAtIndex(2, velX)
    Script.storeValueAtIndex(3, velY)
    Script.storeValueAtIndex(4, velZ * 20)
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


Opcode.register(0x0179, SanAndreasOpcodeChar.isTouchingObject, 'is_char_touching_object [Char] {object} [Object]')
Opcode.register(0x017b, SanAndreasOpcodeChar.setAmmo, 'set_char_ammo [Char] {weaponType} [WeaponType] {ammo} [int]')
Opcode.register(0x023b, SanAndreasOpcodeChar.isTouchingObjectOnFoot, 'is_char_touching_object_on_foot [Char] {object} [Object]')
Opcode.register(0x02a0, SanAndreasOpcodeChar.isStopped, 'is_char_stopped [Char]')
Opcode.register(0x02d6, SanAndreasOpcodeChar.isShootingInArea, 'is_char_shooting_in_area [Char] {leftBottomX} [float] {leftBottomY} [float] {topRightX} [float] {topRightY} [float] {drawSphere} [bool]')
Opcode.register(0x0364, SanAndreasOpcodeChar.hasSpottedChar, 'has_char_spotted_char [Char] {target} [Char]')
Opcode.register(0x0393, SanAndreasOpcodeChar.setAnimSpeed, 'set_char_anim_speed [Char] {animName} [string] {animSpeed} [float]')
Opcode.register(0x041a, SanAndreasOpcodeChar.getAmmoInWeapon, '[var ammo: int] = get_ammo_in_char_weapon [Char] {weaponType} [WeaponType]')
Opcode.register(0x0430, SanAndreasOpcodeChar.warpIntoCarAsPassenger, 'warp_char_into_car_as_passenger [Char] {handle} [Car] {seat} [SeatId]')
Opcode.register(0x0491, SanAndreasOpcodeChar.hasGotWeapon, 'has_char_got_weapon [Char] {weaponType} [WeaponType]')
Opcode.register(0x04a7, SanAndreasOpcodeChar.isInAnyBoat, 'is_char_in_any_boat [Char]')
Opcode.register(0x04a9, SanAndreasOpcodeChar.isInAnyHeli, 'is_char_in_any_heli [Char]')
Opcode.register(0x04ab, SanAndreasOpcodeChar.isInAnyPlane, 'is_char_in_any_plane [Char]')
Opcode.register(0x04c8, SanAndreasOpcodeChar.isInFlyingVehicle, 'is_char_in_flying_vehicle [Char]')
Opcode.register(0x0503, SanAndreasOpcodeChar.createSwatRope, '[var handle: Char] = create_swat_rope {pedType} [PedType] {modelId} [model_char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x051b, SanAndreasOpcodeChar.hasBeenDamagedByCar, 'has_char_been_damaged_by_car [Char] {handle} [Car]')
Opcode.register(0x0547, SanAndreasOpcodeChar.isTouchingVehicle, 'is_char_touching_vehicle [Char] {handle} [Car]')
Opcode.register(0x0555, SanAndreasOpcodeChar.removeWeapon, 'remove_weapon_from_char [Char] {weaponType} [WeaponType]')
Opcode.register(0x0575, SanAndreasOpcodeChar.freezePositionAndDontLoadCollision, 'freeze_char_position_and_dont_load_collision [Char] {state} [bool]')
Opcode.register(0x05f6, SanAndreasOpcodeChar.isInAngledArea2D, 'is_char_in_angled_area_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x05f7, SanAndreasOpcodeChar.isInAngledAreaOnFoot2D, 'is_char_in_angled_area_on_foot_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x05f8, SanAndreasOpcodeChar.isInAngledAreaInCar2D, 'is_char_in_angled_area_in_car_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x05f9, SanAndreasOpcodeChar.isStoppedInAngledArea2D, 'is_char_stopped_in_angled_area_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x05fa, SanAndreasOpcodeChar.isStoppedInAngledAreaOnFoot2D, 'is_char_stopped_in_angled_area_on_foot_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x05fb, SanAndreasOpcodeChar.isStoppedInAngledAreaInCar2D, 'is_char_stopped_in_angled_area_in_car_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x05fc, SanAndreasOpcodeChar.isInAngledArea3D, 'is_char_in_angled_area_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x05fd, SanAndreasOpcodeChar.isInAngledAreaOnFoot3D, 'is_char_in_angled_area_on_foot_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x05fe, SanAndreasOpcodeChar.isInAngledAreaInCar3D, 'is_char_in_angled_area_in_car_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x05ff, SanAndreasOpcodeChar.isStoppedInAngledArea3D, 'is_char_stopped_in_angled_area_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x0600, SanAndreasOpcodeChar.isStoppedInAngledAreaOnFoot3D, 'is_char_stopped_in_angled_area_on_foot_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x0601, SanAndreasOpcodeChar.isStoppedInAngledAreaInCar3D, 'is_char_stopped_in_angled_area_in_car_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x0602, SanAndreasOpcodeChar.isInTaxi, 'is_char_in_taxi [Char]')
Opcode.register(0x060b, SanAndreasOpcodeChar.setDecisionMaker, 'set_char_decision_maker [Char] {handleOrTemplate} [DecisionMakerCharTemplate]')
Opcode.register(0x060f, SanAndreasOpcodeChar.setSenseRange, 'set_sense_range {handle} [Char] {range} [float]')
Opcode.register(0x0611, SanAndreasOpcodeChar.isPlayingAnim, 'is_char_playing_anim [Char] {animationName} [string]')
Opcode.register(0x0612, SanAndreasOpcodeChar.setAnimPlayingFlag, 'set_char_anim_playing_flag [Char] {animationName} [string] {flag} [bool]')
Opcode.register(0x0613, SanAndreasOpcodeChar.getAnimCurrentTime, '[var time: float] = get_char_anim_current_time [Char] {animationName} [string]')
Opcode.register(0x0614, SanAndreasOpcodeChar.setAnimCurrentTime, 'set_char_anim_current_time [Char] {animationName} [string] {time} [float]')
Opcode.register(0x0618, SanAndreasOpcodeChar.performSequence, 'perform_sequence_task [Char] {sequence} [Sequence]')
Opcode.register(0x0619, SanAndreasOpcodeChar.setCollision, 'set_char_collision [Char] {state} [bool]')
Opcode.register(0x061a, SanAndreasOpcodeChar.getAnimTotalTime, '[var totalTime: float] = get_char_anim_total_time [Char] {animationName} [string]')
Opcode.register(0x0621, SanAndreasOpcodeChar.createAtAttractor, '[var handle: Char] = create_char_at_attractor {pedType} [PedType] {modelId} [model_char] {taskId} [int] {attractor} [Attractor]')
Opcode.register(0x062e, SanAndreasOpcodeChar.getScriptTaskStatus, '[var status: TaskStatus] = get_script_task_status [Char] {taskId} [int]')
Opcode.register(0x0642, SanAndreasOpcodeChar.isAtScriptedAttractor, 'is_char_at_scripted_attractor [Char] {handle} [Attractor]')
Opcode.register(0x0646, SanAndreasOpcodeChar.getSequenceProgress, '[var progress: int] = get_sequence_progress [Char]')
Opcode.register(0x0647, SanAndreasOpcodeChar.clearLookAt, 'clear_look_at [Char]')
Opcode.register(0x0648, SanAndreasOpcodeChar.setFollowNodeThresholdDistance, 'set_follow_node_threshold_distance [Char] {range} [float]')
Opcode.register(0x0665, SanAndreasOpcodeChar.getModel, '[var modelId: int] = get_char_model [Char]')
Opcode.register(0x0687, SanAndreasOpcodeChar.clearTasks, 'clear_char_tasks [Char]')
Opcode.register(0x06a7, SanAndreasOpcodeChar.attachToBike, 'attach_char_to_bike [Char] {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {position} [int] {_p7} [float] {_p8} [float] {weaponType} [WeaponType]')
Opcode.register(0x06ab, SanAndreasOpcodeChar.hideWeaponForScriptedCutscene, 'hide_char_weapon_for_scripted_cutscene [Char] {state} [bool]')
Opcode.register(0x06ac, SanAndreasOpcodeChar.getSpeed, '[var speed: float] = get_char_speed [Char]')
Opcode.register(0x06c9, SanAndreasOpcodeChar.removeFromGroup, 'remove_char_from_group [Char]')
Opcode.register(0x06ee, SanAndreasOpcodeChar.isGroupMember, 'is_group_member [Char] {handle} [Group]')
Opcode.register(0x06ef, SanAndreasOpcodeChar.isGroupLeader, 'is_group_leader [Char] {handle} [Group]')
Opcode.register(0x06ff, SanAndreasOpcodeChar.isNearAnyChars, 'are_any_chars_near_char [Char] {radius} [float]')
Opcode.register(0x070b, SanAndreasOpcodeChar.dropObject, 'drop_object [Char] {state} [bool]')
Opcode.register(0x0737, SanAndreasOpcodeChar.isHoldingObject, 'is_char_holding_object [Char] {handle} [Object]')
Opcode.register(0x0741, SanAndreasOpcodeChar.hasBeenArrested, 'has_char_been_arrested [Char]')
Opcode.register(0x074e, SanAndreasOpcodeChar.setInformRespectedFriends, 'set_inform_respected_friends [Char] {radius} [float] {_p3} [int]')
Opcode.register(0x074f, SanAndreasOpcodeChar.isRespondingToEvent, 'is_char_responding_to_event [Char] {event} [Event]')
Opcode.register(0x0770, SanAndreasOpcodeChar.setIsTargetPriority, 'set_char_is_target_priority [Char] {state} [bool]')
Opcode.register(0x077a, SanAndreasOpcodeChar.setRelationship, 'set_char_relationship [Char] {relationshipType} [RelationshipType] {pedType} [PedType]')
Opcode.register(0x077b, SanAndreasOpcodeChar.clearRelationship, 'clear_char_relationship [Char] {relationshipType} [RelationshipType] {toPedType} [PedType]')
Opcode.register(0x077c, SanAndreasOpcodeChar.clearAllRelationships, 'clear_all_char_relationships [Char] {relationshipType} [RelationshipType]')
Opcode.register(0x0792, SanAndreasOpcodeChar.clearTasksImmediately, 'clear_char_tasks_immediately [Char]')
Opcode.register(0x07a0, SanAndreasOpcodeChar.performSequenceFromProgress, 'perform_sequence_task_from_progress [Char] {sequence} [Sequence] {_p3} [int] {_p4} [int]')
Opcode.register(0x07a1, SanAndreasOpcodeChar.setNextDesiredMoveState, 'set_next_desired_move_state {moveState} [MoveState]')
Opcode.register(0x07a4, SanAndreasOpcodeChar.getSequenceProgressRecursive, '[var _p2: int], [var _p3: int] = get_sequence_progress_recursive [Char]')
Opcode.register(0x07a9, SanAndreasOpcodeChar.isInAnySearchlight, '[var handle: Searchlight] = is_char_in_any_searchlight [Char]')
Opcode.register(0x07cb, SanAndreasOpcodeChar.listenToPlayerGroupCommands, 'listen_to_player_group_commands [Char] {state} [bool]')
Opcode.register(0x07dd, SanAndreasOpcodeChar.setShootRate, 'set_char_shoot_rate [Char] {rate} [int]')
Opcode.register(0x07fe, SanAndreasOpcodeChar.giveMeleeAttack, 'give_melee_attack_to_char [Char] {fightStyle} [FightStyle] {moveId} [int]')
Opcode.register(0x080e, SanAndreasOpcodeChar.getHighestPriorityEvent, '[var event: Event] = get_char_highest_priority_event [Char]')
Opcode.register(0x0811, SanAndreasOpcodeChar.getCarIsUsing, '[var handle: Car] = get_car_char_is_using [Char]')
Opcode.register(0x0816, SanAndreasOpcodeChar.setKindaStayInSamePlace, 'set_char_kinda_stay_in_same_place [Char] {state} [bool]')
Opcode.register(0x0818, SanAndreasOpcodeChar.isInAir, 'is_char_in_air [Char]')
Opcode.register(0x0819, SanAndreasOpcodeChar.getHeightAboveGround, '[var height: float] = get_char_height_above_ground [Char]')
Opcode.register(0x081a, SanAndreasOpcodeChar.setWeaponSkill, 'set_char_weapon_skill [Char] {skill} [WeaponSkill]')
Opcode.register(0x083c, SanAndreasOpcodeChar.setVelocity, 'set_char_velocity [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x083d, SanAndreasOpcodeChar.getVelocity, '[var x: float], [var y: float], [var z: float] = get_char_velocity [Char]')
Opcode.register(0x083e, SanAndreasOpcodeChar.setRotation, 'set_char_rotation [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0851, SanAndreasOpcodeChar.damage, 'damage_char [Char] {amount} [int] {damageArmour} [bool]')
Opcode.register(0x0856, SanAndreasOpcodeChar.setAllowedToDuck, 'set_char_allowed_to_duck [Char] {state} [bool]')
Opcode.register(0x0860, SanAndreasOpcodeChar.setAreaVisible, 'set_char_area_visible [Char] {areaId} [int]')
Opcode.register(0x087e, SanAndreasOpcodeChar.setDropsWeaponsWhenDead, 'set_char_drops_weapons_when_dead [Char] {state} [bool]')
Opcode.register(0x087f, SanAndreasOpcodeChar.setNeverLeavesGroup, 'set_char_never_leaves_group [Char] {state} [bool]')
Opcode.register(0x0887, SanAndreasOpcodeChar.setHeadingLimitForAttached, 'set_heading_limit_for_attached_char [Char] {orientation} [int] {headingLimit} [float]')
Opcode.register(0x0889, SanAndreasOpcodeChar.getCoordinatesOfDied, '[var x: float], [var y: float], [var z: float] = get_dead_char_coordinates [Char]')
Opcode.register(0x089f, SanAndreasOpcodeChar.getPedType, '[var pedType: PedType] = get_ped_type [Char]')
Opcode.register(0x08ad, SanAndreasOpcodeChar.setHasUsedEntryExit, 'set_char_has_used_entry_exit [Char] {x} [float] {y} [float] {radius} [float]')
Opcode.register(0x08af, SanAndreasOpcodeChar.setMaxHealth, 'set_char_max_health [Char] {maxHealth} [int]')
Opcode.register(0x08c6, SanAndreasOpcodeChar.setCanBeKnockedOffBike, 'set_char_can_be_knocked_off_bike [Char] {stayOnBike} [bool]')
Opcode.register(0x08c7, SanAndreasOpcodeChar.setCoordinatesDontWarpGang, 'set_char_coordinates_dont_warp_gang [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x093b, SanAndreasOpcodeChar.setBulletproofVest, 'set_char_bulletproof_vest [Char] {state} [bool]')
Opcode.register(0x0946, SanAndreasOpcodeChar.setUsesUpperbodyDamageAnimsOnly, 'set_char_uses_upperbody_damage_anims_only [Char] {state} [bool]')
Opcode.register(0x0947, SanAndreasOpcodeChar.setSayContext, '[var _p3: int] = set_char_say_context [Char] {phrase} [SpeechId]')
Opcode.register(0x094b, SanAndreasOpcodeChar.getNameOfEntryExitUsed, '[var interiorName: string] = get_name_of_entry_exit_char_used [Char]')
Opcode.register(0x094c, SanAndreasOpcodeChar.getPositionOfEntryExitCharUsed, '[var x: float], [var y: float], [var z: float], [var heading: float] = get_position_of_entry_exit_char_used [Char]')
Opcode.register(0x094d, SanAndreasOpcodeChar.isTalking, 'is_char_talking [Char]')
Opcode.register(0x094e, SanAndreasOpcodeChar.disableSpeech, 'disable_char_speech [Char] {stopNow} [bool]')
Opcode.register(0x094f, SanAndreasOpcodeChar.enableSpeech, 'enable_char_speech [Char]')
Opcode.register(0x095d, SanAndreasOpcodeChar.isStuckUnderCar, 'is_char_stuck_under_car [Char]')
Opcode.register(0x0961, SanAndreasOpcodeChar.setKeepTask, 'set_char_keep_task [Char] {state} [bool]')
Opcode.register(0x0965, SanAndreasOpcodeChar.isSwimming, 'is_char_swimming [Char]')
Opcode.register(0x0966, SanAndreasOpcodeChar.getSwimState, '[var state: int] = get_char_swim_state [Char]')
Opcode.register(0x0967, SanAndreasOpcodeChar.startFacialTalk, 'start_char_facial_talk [Char] {duration} [int]')
Opcode.register(0x0968, SanAndreasOpcodeChar.stopFacialTalk, 'stop_char_facial_talk [Char]')
Opcode.register(0x0972, SanAndreasOpcodeChar.setCoordinatesNoOffset, 'set_char_coordinates_no_offset [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0982, SanAndreasOpcodeChar.setForceDieInCar, 'set_char_force_die_in_car [Char] {state} [bool]')
Opcode.register(0x09a1, SanAndreasOpcodeChar.dropSecondObject, 'drop_second_object [Char] {state} [bool]')
Opcode.register(0x09a7, SanAndreasOpcodeChar.setDruggedUp, 'set_char_drugged_up [Char] {state} [bool]')
Opcode.register(0x09a8, SanAndreasOpcodeChar.isHeadMissing, 'is_char_head_missing [Char]')
Opcode.register(0x09ae, SanAndreasOpcodeChar.isInAnyTrain, 'is_char_in_any_train [Char]')
Opcode.register(0x09b5, SanAndreasOpcodeChar.setSignalAfterKill, 'set_char_signal_after_kill [Char] {state} [bool]')
Opcode.register(0x09b6, SanAndreasOpcodeChar.setWantedByPolice, 'set_char_wanted_by_police [Char] {state} [bool]')
Opcode.register(0x09bc, SanAndreasOpcodeChar.setCoordinatesDontWarpGangNoOffset, 'set_char_coordinates_dont_warp_gang_no_offset [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x09c5, SanAndreasOpcodeChar.isUsingMapAttractor, 'is_char_using_map_attractor [Char]')
Opcode.register(0x09c9, SanAndreasOpcodeChar.removeFromCarMaintainPosition, 'remove_char_from_car_maintain_position [Char] {vehicle} [Car]')
Opcode.register(0x09d5, SanAndreasOpcodeChar.setSayContextImportant, '[var _p6: int] = set_char_say_context_important [Char] {phrase} [SpeechId] {_p3} [bool] {_p4} [bool] {_p5} [bool]')
Opcode.register(0x09d6, SanAndreasOpcodeChar.setSayScript, 'set_char_say_script [Char] {_p2} [int] {_p3} [bool] {_p4} [bool] {_p5} [bool]')
Opcode.register(0x09de, SanAndreasOpcodeChar.isGettingInToACar, 'is_char_getting_in_to_a_car [Char]')
Opcode.register(0x09e8, SanAndreasOpcodeChar.getAreaVisible, '[var areaId: int] = get_char_area_visible [Char]')
Opcode.register(0x09ed, SanAndreasOpcodeChar.hasSpottedCharInFront, 'has_char_spotted_char_in_front [Char] {handle} [Char]')
Opcode.register(0x09f4, SanAndreasOpcodeChar.ignoreHeightDifferenceFollowingNodes, 'ignore_height_difference_following_nodes [Char] {state} [bool]')
Opcode.register(0x09f6, SanAndreasOpcodeChar.setGetOutUpsideDownCar, 'set_char_get_out_upside_down_car [Char] {state} [bool]')
Opcode.register(0x0a09, SanAndreasOpcodeChar.shutUpForScriptedSpeech, 'shut_char_up_for_scripted_speech [Char] {state} [bool]')
Opcode.register(0x0a1b, SanAndreasOpcodeChar.isTouchingChar, 'is_char_touching_char [Char] {handle} [Char]')
Opcode.register(0x0a27, SanAndreasOpcodeChar.setDeathWeaponsPersist, 'set_death_weapons_persist [Char] {state} [bool]')
Opcode.register(0x0a28, SanAndreasOpcodeChar.setSwimSpeed, 'set_swim_speed [Char] {speed} [float]')
Opcode.register(0x0a32, SanAndreasOpcodeChar.isAttachedToAnyCar, 'is_char_attached_to_any_car [Char]')
Opcode.register(0x0a33, SanAndreasOpcodeChar.storeCarIsAttachedToNoSave, '[var handle: Car] = store_car_char_is_attached_to_no_save [Char]')
Opcode.register(0x0ab5, SanAndreasOpcodeChar.storeClosestEntities, '[var carHandle: Car], [var charHandle: Char] = store_closest_entities [Char]')
Opcode.register(0x0d0b, SanAndreasOpcodeChar.getBoneMatrix, '[var matrix: int] = get_char_bone_matrix [Char] {pedBone} [PedBone]')
Opcode.register(0x0d10, SanAndreasOpcodeChar.setModelAlpha, 'set_char_model_alpha [Char] {alpha} [int]')
Opcode.register(0x0d30, SanAndreasOpcodeChar.getBone, '[var address: int] = get_char_bone [Char] {pedBone} [PedBone]')
Opcode.register(0x0d31, SanAndreasOpcodeChar.getBoneOffsetVector, '[var offsetVector: int] = get_bone_offset_vector {pedBone} [PedBone]')
Opcode.register(0x0d32, SanAndreasOpcodeChar.getBoneQuat, '[var quat: int] = get_bone_quat {bone} [int]')
Opcode.register(0x0d39, SanAndreasOpcodeChar.getMaxHealth, '[var maxHealth: float] = get_char_max_health [Char]')
Opcode.register(0x0e0a, SanAndreasOpcodeChar.isScriptControlled, 'is_char_script_controlled [Char]')
Opcode.register(0x0e0b, SanAndreasOpcodeChar.markAsNeeded, 'mark_char_as_needed [Char]')
Opcode.register(0x0e14, SanAndreasOpcodeChar.initExtendedVars, 'init_extended_char_vars [Char] {identifier} [string] {totalVars} [int]')
Opcode.register(0x0e15, SanAndreasOpcodeChar.setExtendedVar, 'set_extended_char_var [Char] {identifier} [string] {varNumber} [int] {value} [any]')
Opcode.register(0x0e16, SanAndreasOpcodeChar.getExtendedVar, '[var value: any] = get_extended_char_var [Char] {identifier} [string] {varNumber} [int]')
Opcode.register(0x0e24, SanAndreasOpcodeChar.fixGroundBrightnessAndFadeIn, 'fix_char_ground_brightness_and_fade_in [Char] {fixGround} [bool] {fixBrightness} [bool] {fadeIn} [bool]')
Opcode.register(0x0e30, SanAndreasOpcodeChar.setRenderObjectAutoHide, 'set_render_object_auto_hide [Char] {dead} [bool] {weapon} [bool] {car} [bool]')
Opcode.register(0x0e32, SanAndreasOpcodeChar.setCoordinatesSimple, 'set_char_coordinates_simple [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0e42, SanAndreasOpcodeChar.isDoingTaskId, 'is_char_doing_task_id [Char] {taskId} [TaskId]')
Opcode.register(0x0e43, SanAndreasOpcodeChar.getTaskPointerById, '[var address: int] = get_char_task_pointer_by_id [Char] {taskId} [TaskId]')
Opcode.register(0x0e44, SanAndreasOpcodeChar.getKillTargetChar, '[var killTarget: Char] = get_char_kill_target_char [Char]')
Opcode.register(0x0e46, SanAndreasOpcodeChar.isUsingGun, 'is_char_using_gun [Char]')
Opcode.register(0x0e47, SanAndreasOpcodeChar.isFighting, 'is_char_fighting [Char]')
Opcode.register(0x0e48, SanAndreasOpcodeChar.isFallenOnGround, 'is_char_fallen_on_ground [Char]')
Opcode.register(0x0e49, SanAndreasOpcodeChar.isEnteringAnyCar, 'is_char_entering_any_car [Char]')
Opcode.register(0x0e4a, SanAndreasOpcodeChar.isExitingAnyCar, 'is_char_exiting_any_car [Char]')
Opcode.register(0x0e4b, SanAndreasOpcodeChar.isPlayingAnyScriptAnimation, 'is_char_playing_any_script_animation [Char]')
Opcode.register(0x0e4c, SanAndreasOpcodeChar.isDoingAnyImportantTask, 'is_char_doing_any_important_task [Char]')
Opcode.register(0x0e5c, SanAndreasOpcodeChar.getHealthPercent, '[var healthPercent: float] = get_char_health_percent [Char]')
Opcode.register(0x0e83, SanAndreasOpcodeChar.getCurrentWeaponinfo, '[var handle: WeaponInfo] = get_current_char_weaponinfo [Char]')
Opcode.register(0x0e8b, SanAndreasOpcodeChar.getWeaponState, '[var weaponState: WeaponState] = get_char_weapon_state [Char]')
Opcode.register(0x0e8c, SanAndreasOpcodeChar.getCharWeaponClip, '[var weaponClip: int] = get_char_weapon_clip [Char]')
Opcode.register(0x0e8e, SanAndreasOpcodeChar.getCollisionSurface, '[var surfaceType: SurfaceType] = get_char_collision_surface [Char]')
Opcode.register(0x0e8f, SanAndreasOpcodeChar.getCollisionLighting, '[var lighting: float] = get_char_collision_lighting [Char]')
Opcode.register(0x0e92, SanAndreasOpcodeChar.isReallyInAir, 'is_char_really_in_air [Char]')
Opcode.register(0x0e96, SanAndreasOpcodeChar.clearPrimaryTasks, 'clear_char_primary_tasks [Char]')
Opcode.register(0x0e97, SanAndreasOpcodeChar.clearSecondaryTasks, 'clear_char_secondary_tasks [Char]')
Opcode.register(0x0ea0, SanAndreasOpcodeChar.setSecondPlayer, 'set_char_second_player [Char] {enableCamera} [bool] {separateCars} [bool]')
Opcode.register(0x0ea4, SanAndreasOpcodeChar.isOnFire, 'is_char_on_fire [Char]')
Opcode.register(0x0ea5, SanAndreasOpcodeChar.getClosestCop, '[var closestCop: Char] = get_closest_cop_near_char [Char] {radius} [float] {alive} [bool] {inCar} [bool] {onFoot} [bool] {seenInFront} [bool]')
Opcode.register(0x0eaa, SanAndreasOpcodeChar.setArrested, 'set_char_arrested [Char]')
Opcode.register(0x0eab, SanAndreasOpcodeChar.getPedState, '[var pedState: PedState] = get_char_pedstate [Char]')
Opcode.register(0x0eac, SanAndreasOpcodeChar.getProofs, '[var bullet: bool], [var fire: bool], [var explosion: bool], [var collision: bool], [var melee: bool] = get_char_proofs [Char]')
Opcode.register(0x0eaf, SanAndreasOpcodeChar.isWeaponVisibleSet, 'is_char_weapon_visible_set [Char]')
Opcode.register(0x0eb1, SanAndreasOpcodeChar.getStatId, '[var pedStat: PedStat] = get_char_stat_id [Char]')
Opcode.register(0x0eb5, SanAndreasOpcodeChar.getDamageLastFrame, '[var entity: Char], [var weaponType: WeaponType], [var bodyPart: BodyPart], [var intensity: float] = get_char_damage_last_frame [Char]')
Opcode.register(0x0ec8, SanAndreasOpcodeChar.getRandomSeed, '[var randomSeed: int] = get_char_random_seed [Char]')
Opcode.register(0x0ecb, SanAndreasOpcodeChar.getMoveState, '[var moveState: MoveState] = get_char_move_state [Char]')
Opcode.register(0x0ecc, SanAndreasOpcodeChar.dontDeleteUntilTime, 'dont_delete_char_until_time [Char] {msFromNow} [int]')
Opcode.register(0x0ece, SanAndreasOpcodeChar.getTimeIsDead, '[var timeIsDead: int] = get_time_char_is_dead [Char]')
Opcode.register(0x0ed9, SanAndreasOpcodeChar.setIgnoreDamageAnims, 'set_char_ignore_damage_anims [Char] {state} [bool]')
Opcode.register(0x0ee4, SanAndreasOpcodeChar.locateDistanceToChar, 'locate_char_distance_to_char [Char] {character} [Char] {radius} [float]')
Opcode.register(0x0ee5, SanAndreasOpcodeChar.locateDistanceToCar, 'locate_char_distance_to_car [Char] {car} [Car] {radius} [float]')
Opcode.register(0x0ee6, SanAndreasOpcodeChar.locateDistanceToObject, 'locate_char_distance_to_object [Char] {object} [Object] {radius} [float]')
Opcode.register(0x0eea, SanAndreasOpcodeChar.locateDistanceToCoordinates, 'locate_char_distance_to_coordinates [Char] {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x0efa, SanAndreasOpcodeChar.getFear, '[var fear: int] = get_char_fear [Char]')
Opcode.register(0x0eff, SanAndreasOpcodeChar.getSimplestActiveTask, '[var taskId: TaskId], [var address: int] = get_char_simplest_active_task [Char]')
Opcode.register(0x0f02, SanAndreasOpcodeChar.createRenderObjectToCharBoneFromSpecial, '[var renderobject: int] = create_render_object_to_char_bone_from_special [Char] {specialModel} [int] {pedBone} [PedBone] {x} [float] {y} [float] {z} [float] {rx} [float] {ry} [float] {rz} [float]')
