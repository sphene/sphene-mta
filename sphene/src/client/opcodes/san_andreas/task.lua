SanAndreasOpcodeTask = {}
SanAndreasOpcodeTask.__index = SanAndreasOpcodeTask

-- Opcode: 0x04EB
-- Instruction: task_toggle_duck {handle} [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04EB
function SanAndreasOpcodeTask.toggleDuck(actor, crouch)
    if (type(actor) ~= "table") then
        return false
    end

    actor:clearTasks()
    return actor:setControlState("crouch", (crouch == 1) and true or false)
end

-- Opcode: 0x05B9
-- Instruction: task_pause {handle} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05B9
function SanAndreasOpcodeTask.pause(actor)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    actor:clearTasks()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05BA
-- Instruction: task_stand_still {handle} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05BA
function SanAndreasOpcodeTask.standStill(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05BB
-- Instruction: task_fall_and_get_up {handle} [Char] {fallDown} [bool] {timeOnGround} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05BB
function SanAndreasOpcodeTask.fallAndGetUp(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05BC
-- Instruction: task_jump {handle} [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05BC
function SanAndreasOpcodeTask.jump(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05BD
-- Instruction: task_tired {handle} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05BD
function SanAndreasOpcodeTask.tired(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05BE
-- Instruction: task_die {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05BE
function SanAndreasOpcodeTask.die(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05BF
-- Instruction: task_look_at_char {observer} [Char] {target} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05BF
function SanAndreasOpcodeTask.lookAtChar(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05C0
-- Instruction: task_look_at_vehicle {char} [Char] {vehicle} [Car] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05C0
function SanAndreasOpcodeTask.lookAtVehicle(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05C1
-- Instruction: task_say {handle} [Char] {phrase} [SpeechId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05C1
function SanAndreasOpcodeTask.say(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05C2
-- Instruction: task_shake_fist {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05C2
function SanAndreasOpcodeTask.shakeFist(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05C3
-- Instruction: task_cower {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05C3
function SanAndreasOpcodeTask.cower(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05C4
-- Instruction: task_hands_up {handle} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05C4
function SanAndreasOpcodeTask.handsUp(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05C5
-- Instruction: task_duck {handle} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05C5
function SanAndreasOpcodeTask.duck(ped, timeInMs)
    local task = TaskSimpleDuck:create(ped, timeInMs)

    return ped:addScriptedTask(task, 2, "TASK_SECONDARY_DUCK")
end

-- Opcode: 0x05C7
-- Instruction: task_use_atm {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05C7
function SanAndreasOpcodeTask.useAtm(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05C8
-- Instruction: task_scratch_head {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05C8
function SanAndreasOpcodeTask.scratchHead(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05C9
-- Instruction: task_look_about {handle} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05C9
function SanAndreasOpcodeTask.lookAbout(_, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05CA
-- Instruction: task_enter_car_as_passenger {char} [Char] {vehicle} [Car] {time} [int] {seat} [SeatId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05CA
function SanAndreasOpcodeTask.enterCarAsPassenger(actor, car, time, seat)
    if (actor == -1) then
        local sequence = Sequence.getActiveSequence()

        if sequence == nil then
            return
        end

        sequence:registerTask(TaskComplexEnterCarAsPassenger, {car, seat + 1}, 1, 'TASK_PRIORITY_PRIMARY')
        return
    end

    if type(actor) ~= "table" then
        return false
    end

    Script.setOpcodePartiallyImplemented()
    actor:clearTasks()

    local task = TaskComplexEnterCarAsPassenger:create(actor, car, seat + 1)

    actor:addScriptedTask(task, 1, "TASK_PRIORITY_PRIMARY")
end

-- Opcode: 0x05CB
-- Instruction: task_enter_car_as_driver {char} [Char] {vehicle} [Car] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05CB
function SanAndreasOpcodeTask.enterCarAsDriver(actor, car, time)
    if (actor == -1) then
        local sequence = Sequence.getActiveSequence()

        if sequence == nil then
            return
        end

        sequence:registerTask(TaskComplexEnterCarAsDriver, {car}, 1, 'TASK_PRIORITY_PRIMARY')
        return
    end

    Script.setOpcodePartiallyImplemented()
    actor:clearTasks()

    local task = TaskComplexEnterCarAsDriver:create(actor, car)

    actor:addScriptedTask(task, 1, "TASK_PRIORITY_PRIMARY")
end

-- Opcode: 0x05CD
-- Instruction: task_leave_car {char} [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05CD
function SanAndreasOpcodeTask.leaveCar(actor, car)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    actor:clearTasks()
    return actor:exitVehicle()
end

-- Opcode: 0x05CF
-- Instruction: task_leave_car_and_flee {char} [Char] {vehicle} [Car] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05CF
function SanAndreasOpcodeTask.leaveCarAndFlee(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05D1
-- Instruction: task_car_drive_to_coord {driver} [Char] {vehicle} [Car] {x} [float] {y} [float] {z} [float] {speed} [float] {driveStyle} [DriveMode] {modelId} [model_vehicle] {drivingStyle} [DrivingMode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05D1
function SanAndreasOpcodeTask.carDriveToCoord(actor, car, posX, posY, posZ, speed, speed2, model, drivingStyle)
    if (actor == -1) then
        local sequence = Sequence.getActiveSequence()

        if sequence == nil then
            return
        end

        sequence:registerTask(TaskComplexCarDriveToPoint, {car, posX, posY, posZ, speed, speed2, model, drivingStyle}, 1, 'TASK_PRIORITY_PRIMARY')
        return
    end

    Script.setOpcodePartiallyImplemented()

    actor:clearTasks()

    local task = TaskComplexCarDriveToPoint:create(actor, car, posX, posY, posZ, speed, speed2, model, drivingStyle)

    actor:addScriptedTask(task, 1, "TASK_PRIORITY_PRIMARY")

    return true
end

-- Opcode: 0x05D2
-- Instruction: task_car_drive_wander {char} [Char] {vehicle} [Car] {speed} [float] {drivingMode} [DrivingMode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05D2
function SanAndreasOpcodeTask.carDriveWander(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05D3
-- Instruction: task_go_straight_to_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {speed} [MoveState] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05D3
function SanAndreasOpcodeTask.goStraightToCoord(actor, posX, posY, posZ, mode, time)
    if (actor == -1) then
        local sequence = Sequence.getActiveSequence()

        if sequence == nil then
            return
        end

        sequence:registerTask(TaskSimpleGoToPoint, {posX, posY, posZ}, 1, 'TASK_PRIORITY_PRIMARY')
        return
    end

    Script.setOpcodePartiallyImplemented()

    actor:clearTasks()

    local task = TaskSimpleGoToPoint:create(actor, posX, posY, posZ)

    actor:addScriptedTask(task, 1, "TASK_PRIORITY_PRIMARY")

    return true
end

-- Opcode: 0x05D4
-- Instruction: task_achieve_heading {handle} [Char] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05D4
function SanAndreasOpcodeTask.achieveHeading(actor, _)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    actor:clearTasks()
    return true
end

-- Opcode: 0x05D8
-- Instruction: task_follow_point_route {handle} [Char] {speed} [MoveState] {mode} [RouteMode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05D8
function SanAndreasOpcodeTask.followPointRoute(_, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05D9
-- Instruction: task_goto_char {walking} [Char] {target} [Char] {time} [int] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05D9
function SanAndreasOpcodeTask.gotoChar(_, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05DA
-- Instruction: task_flee_point {handle} [Char] {x} [float] {y} [float] {z} [float] {radius} [float] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05DA
function SanAndreasOpcodeTask.fleePoint(_, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05DB
-- Instruction: task_flee_char {handle} [Char] {threat} [Char] {radius} [float] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05DB
function SanAndreasOpcodeTask.fleeChar(_, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05DC
-- Instruction: task_smart_flee_point {handle} [Char] {x} [float] {y} [float] {z} [float] {radius} [float] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05DC
function SanAndreasOpcodeTask.smartFleePoint()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05DD
-- Instruction: task_smart_flee_char {handle} [Char] {threat} [Char] {radius} [float] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05DD
function SanAndreasOpcodeTask.smartFleeChar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05DE
-- Instruction: task_wander_standard {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05DE
function SanAndreasOpcodeTask.wanderStandard()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05E2
-- Instruction: task_kill_char_on_foot {killer} [Char] {target} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05E2
function SanAndreasOpcodeTask.killCharOnFoot()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05F5
-- Instruction: task_follow_path_nodes_to_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {walkSpeed} [int] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05F5
function SanAndreasOpcodeTask.followPathNodesToCoord()
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0603
-- Instruction: task_go_to_coord_any_means {char} [Char] {x} [float] {y} [float] {z} [float] {speed} [MoveState] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0603
function SanAndreasOpcodeTask.goToCoordAnyMeans(_, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0605
-- Instruction: task_play_anim {handle} [Char] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {keepLastFrame} [bool] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0605
function SanAndreasOpcodeTask.playAnim(actor, animation, block, _, looped, locked, _, _, time)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    Script.setOpcodePartiallyImplemented()
    return actor:setAnimation(block, animation,
        time, ((looped == 1) and true or false),
        ((locked == 1) and false or true), true)
end

-- Opcode: 0x0622
-- Instruction: task_leave_car_immediately {char} [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0622
function SanAndreasOpcodeTask.leaveCarImmediately(actor, car)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    Script.setOpcodePartiallyImplemented()
    actor:clearTasks()

    return actor:exitVehicle()
end

-- Opcode: 0x0633
-- Instruction: task_leave_any_car {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0633
function SanAndreasOpcodeTask.leaveAnyCar(actor)
    Script.setOpcodePartiallyImplemented()
    return actor:exitVehicle()
end

-- Opcode: 0x0634
-- Instruction: task_kill_char_on_foot_while_ducking {char} [Char] {target} [Char] {flags} [int] {actionDelay} [int] {actionChance} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0634
function SanAndreasOpcodeTask.killCharOnFootWhileDucking(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0635
-- Instruction: task_aim_gun_at_char {char} [Char] {target} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0635
function SanAndreasOpcodeTask.aimGunAtChar(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0637
-- Instruction: task_go_to_coord_while_shooting {char} [Char] {x} [float] {y} [float] {z} [float] {speed} [MoveState] {turnRadius} [float] {stopRadius} [float] {target} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0637
function SanAndreasOpcodeTask.goToCoordWhileShooting(_, _, _, _, _, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0638
-- Instruction: task_stay_in_same_place {handle} [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0638
function SanAndreasOpcodeTask.stayInSamePlace(actor, _)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    actor:clearTasks()
    return true
end

-- Opcode: 0x0639
-- Instruction: task_turn_char_to_face_char {char} [Char] {target} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0639
function SanAndreasOpcodeTask.turnCharToFaceChar(actor, _)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    actor:clearTasks()
    return true
end

-- Opcode: 0x0655
-- Instruction: task_look_at_object {char} [Char] {object} [Object] {time} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0655
function SanAndreasOpcodeTask.lookAtObject(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0667
-- Instruction: task_aim_gun_at_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0667
function SanAndreasOpcodeTask.aimGunAtCoord(_, _, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0668
-- Instruction: task_shoot_at_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0668
function SanAndreasOpcodeTask.shootAtCoord(_, _, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0672
-- Instruction: task_destroy_car {char} [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0672
function SanAndreasOpcodeTask.destroyCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0673
-- Instruction: task_dive_and_get_up {handle} [Char] {directionX} [float] {directionY} [float] {timeOnGround} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0673
function SanAndreasOpcodeTask.diveAndGetUp(actor, offsetX, offsetY, timeOnGround)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    Script.setOpcodePartiallyImplemented()

    actor:clearTasks()

    local rotX, rotY, _ = actor:getRotation()
    actor:setAnimation("ped", "ev_dive", timeOnGround, false)

    local posX, posY, _ = actor:getPosition()

    local newX = posX + offsetX
    local newY = posY + offsetY

    actor:setRotation(rotX, rotY, findRotation(posX, posY, newX, newY))

    return true
end

-- Opcode: 0x0676
-- Instruction: task_shuffle_to_next_car_seat {char} [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0676
function SanAndreasOpcodeTask.shuffleToNextCarSeat(actor, car)
    Script.setOpcodePartiallyImplemented()
    actor:removeFromVehicle()

    if (car:getOccupant(0) ~= false) then
        car:getOccupant(0):removeFromVehicle()
    end

    actor:warpIntoVehicle(car, 0)
end

-- Opcode: 0x0677
-- Instruction: task_chat_with_char {char} [Char] {other} [Char] {leadSpeaker} [bool] {_p4} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0677
function SanAndreasOpcodeTask.chatWithChar(_, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0688
-- Instruction: task_toggle_ped_threat_scanner {handle} [Char] {onFoot} [bool] {inCar} [bool] {duringScriptTask} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0688
function SanAndreasOpcodeTask.togglePedThreatScanner(_, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x06A5
-- Instruction: task_dive_from_attachment_and_get_up {handle} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06A5
function SanAndreasOpcodeTask.diveFromAttachmentAndGetUp(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06A8
-- Instruction: task_goto_char_offset {char} [Char] {target} [Char] {time} [int] {radius} [float] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06A8
function SanAndreasOpcodeTask.gotoCharOffset(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06A9
-- Instruction: task_look_at_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06A9
function SanAndreasOpcodeTask.lookAtCoord(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x06B0
-- Instruction: task_sit_down {handle} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06B0
function SanAndreasOpcodeTask.sitDown(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06BA
-- Instruction: task_turn_char_to_face_coord {handle} [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06BA
function SanAndreasOpcodeTask.turnCharToFaceCoord(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06BB
-- Instruction: task_drive_point_route {char} [Char] {vehicle} [Car] {speed} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06BB
function SanAndreasOpcodeTask.drivePointRoute(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06C2
-- Instruction: task_go_to_coord_while_aiming {char} [Char] {x} [float] {y} [float] {z} [float] {speed} [MoveState] {turnRadius} [float] {stopRadius} [float] {target} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06C2
function SanAndreasOpcodeTask.goToCoordWhileAiming(_, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06C7
-- Instruction: task_car_temp_action {char} [Char] {vehicle} [Car] {actionId} [TempAction] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06C7
function SanAndreasOpcodeTask.carTempAction(actor, car, action, timelimit)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    actor:clearTasks()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x06E1
-- Instruction: task_car_mission {char} [Char] {vehicle} [Car] {targetVehicle} [Car] {missionId} [CarMission] {cruiseSpeed} [float] {drivingStyle} [DrivingMode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06E1
function SanAndreasOpcodeTask.carMission(_, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x06E2
-- Instruction: task_go_to_object {char} [Char] {object} [Object] {time} [int] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06E2
function SanAndreasOpcodeTask.goToObject(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06E3
-- Instruction: task_weapon_roll {handle} [Char] {direction} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06E3
function SanAndreasOpcodeTask.weaponRoll(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06E4
-- Instruction: task_char_arrest_char {char} [Char] {target} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06E4
function SanAndreasOpcodeTask.charArrestChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x070A
-- Instruction: task_pick_up_object {char} [Char] {object} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {boneId} [int] {_p7} [int] {animationName} [string] {animationFile} [string] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/070A
function SanAndreasOpcodeTask.pickUpObject(actor, animation, block, _, looped, locked, _, _, time)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0713
-- Instruction: task_drive_by {handle} [Char] {targetChar} [Char] {targetVehicle} [Car] {x} [float] {y} [float] {z} [float] {radius} [float] {type} [DriveByType] {rightHandCarSeat} [bool] {fireRate} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0713
function SanAndreasOpcodeTask.driveBy(actor)
    actor:clearTasks()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0729
-- Instruction: task_use_mobile_phone {handle} [Char] {start} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0729
function SanAndreasOpcodeTask.useMobilePhone(actor, toggle)
    if (type(actor) ~= "table") then
        return
    end

    Script.setOpcodePartiallyImplemented()

    if (toggle == 1) then
        actor:setAnimation("ped", "phone_in", 1000, false)
    else
        actor:setAnimation("ped", "phone_out", 1000, false)
    end

    return false
end

-- Opcode: 0x072A
-- Instruction: task_warp_char_into_car_as_driver {char} [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/072A
function SanAndreasOpcodeTask.warpCharIntoCarAsDriver(actor, car)
    actor:clearTasks()

    local vehX, vehY, vehZ = car:getPosition()

    if (vehZ ~= nil) then
        actor:setPosition(vehX, vehY, vehZ + 10)
    end

    actor:warpIntoVehicle(car, 0)

    return true
end

-- Opcode: 0x072B
-- Instruction: task_warp_char_into_car_as_passenger {char} [Char] {vehicle} [Car] {seatId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/072B
function SanAndreasOpcodeTask.warpCharIntoCarAsPassenger(actor, car, seat)
    actor:clearTasks()

    local vehX, vehY, vehZ = car:getPosition()

    if (vehZ ~= nil) then
        actor:setPosition(vehX, vehY, vehZ + 10)
    end

    actor:warpIntoVehicle(car, seat + 1)

    return true
end

-- Opcode: 0x074C
-- Instruction: task_use_attractor {char} [Char] {attractor} [Attractor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/074C
function SanAndreasOpcodeTask.useAttractor(_, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x074D
-- Instruction: task_shoot_at_char {handle} [Char] {target} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/074D
function SanAndreasOpcodeTask.shootAtChar(_, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0751
-- Instruction: task_flee_char_any_means {handle} [Char] {threat} [Char] {runDistance} [float] {time} [int] {changeCourse} [bool] {_p6} [int] {_p7} [int] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0751
function SanAndreasOpcodeTask.fleeCharAnyMeans(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0762
-- Instruction: task_dead {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0762
function SanAndreasOpcodeTask.dead(actor)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    actor:setHealth(0)
end

-- Opcode: 0x0772
-- Instruction: task_goto_car {char} [Char] {vehicle} [Car] {time} [int] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0772
function SanAndreasOpcodeTask.gotoCar(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x078F
-- Instruction: task_climb {handle} [Char] {flag} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/078F
function SanAndreasOpcodeTask.climb(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07A3
-- Instruction: task_goto_char_aiming {handle} [Char] {target} [Char] {radiusFrom} [float] {radiusTo} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07A3
function SanAndreasOpcodeTask.gotoCharAiming(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07A5
-- Instruction: task_kill_char_on_foot_timed {handle} [Char] {target} [Char] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07A5
function SanAndreasOpcodeTask.killCharOnFootTimed(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07A7
-- Instruction: task_jetpack {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07A7
function SanAndreasOpcodeTask.jetpack(actor)
   actor:giveJetpack()
end

-- Opcode: 0x07BC
-- Instruction: task_set_char_decision_maker {char} [Char] {handleOrTemplate} [DecisionMakerCharTemplate]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07BC
function SanAndreasOpcodeTask.setCharDecisionMaker(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07C9
-- Instruction: task_complex_pickup_object {char} [Char] {object} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07C9
function SanAndreasOpcodeTask.complexPickupObject(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07CD
-- Instruction: task_char_slide_to_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {angle} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07CD
function SanAndreasOpcodeTask.charSlideToCoord(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07E1
-- Instruction: task_swim_to_coord {handle} [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07E1
function SanAndreasOpcodeTask.swimToCoord(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07E7
-- Instruction: task_drive_point_route_advanced {char} [Char] {vehicle} [Car] {speed} [float] {driveStyle} [DriveMode] {modelId} [model_vehicle] {drivingStyle} [DrivingMode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07E7
function SanAndreasOpcodeTask.drivePointRouteAdvanced(_, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0804
-- Instruction: task_char_slide_to_coord_and_play_anim {handle} [Char] {x} [float] {y} [float] {z} [float] {heading} [float] {radius} [float] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {keepLastFrame} [bool] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0804
function SanAndreasOpcodeTask.charSlideToCoordAndPlayAnim(_, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0812
-- Instruction: task_play_anim_non_interruptable {handle} [Char] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {keepLastFrame} [bool] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0812
function SanAndreasOpcodeTask.playAnimNonInterruptable(actor, animation, block, _, looped, locked, _, _, time)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    Script.setOpcodePartiallyImplemented()
    return actor:setAnimation(block, animation,
        time, ((looped == 1) and true or false),
        ((locked == 1) and false or true), false)
end

-- Opcode: 0x0817
-- Instruction: task_follow_patrol_route {handle} [Char] {speed} [MoveState] {mode} [RouteMode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0817
function SanAndreasOpcodeTask.followPatrolRoute(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0823
-- Instruction: task_greet_partner {handle} [Char] {partner} [Char] {approachRatio} [float] {greetStyle} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0823
function SanAndreasOpcodeTask.greetPartner(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0829
-- Instruction: task_die_named_anim {handle} [Char] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0829
function SanAndreasOpcodeTask.dieNamedAnim(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0850
-- Instruction: task_follow_footsteps {handle} [Char] {target} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0850
function SanAndreasOpcodeTask.followFootsteps(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0859
-- Instruction: task_walk_alongside_char {handle} [Char] {target} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0859
function SanAndreasOpcodeTask.walkAlongsideChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x085B
-- Instruction: task_kinda_stay_in_same_place {handle} [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/085B
function SanAndreasOpcodeTask.kindaStayInSamePlace(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x088A
-- Instruction: task_play_anim_with_flags {handle} [Char] {animationName} [string] {animationFile} [string] {frameDelta} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {lockF} [bool] {time} [int] {disableForce} [bool] {disableLockZ} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/088A
function SanAndreasOpcodeTask.playAnimWithFlags(_, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08A0
-- Instruction: task_use_closest_map_attractor {handle} [Char] {radius} [float] {modelId} [model_object] {fromX} [float] {fromY} [float] {fromZ} [float] {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08A0
function SanAndreasOpcodeTask.useClosestMapAttractor(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x099F
-- Instruction: task_set_ignore_weapon_range_flag {handle} [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/099F
function SanAndreasOpcodeTask.setIgnoreWeaponRangeFlag(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09A0
-- Instruction: task_pick_up_second_object {char} [Char] {object} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {boneId} [int] {_p7} [int] {animationName} [string] {animationFile} [string] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09A0
function SanAndreasOpcodeTask.pickUpSecondObject(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A1A
-- Instruction: task_play_anim_secondary {handle} [Char] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {keepLastFrame} [bool] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A1A
function SanAndreasOpcodeTask.playAnimSecondary(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A1D
-- Instruction: task_hand_gesture {handle} [Char] {target} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A1D
function SanAndreasOpcodeTask.handGesture(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A2E
-- Instruction: task_follow_path_nodes_to_coord_with_radius {handle} [Char] {x} [float] {y} [float] {z} [float] {mode} [int] {time} [int] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A2E
function SanAndreasOpcodeTask.followPathNodesToCoordWithRadius(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 04eb=3,actor %1d% crouch %2h% %3d% ms
Opcode.register(0x04eb, SanAndreasOpcodeTask.toggleDuck, 2, 'task_toggle_duck ${1} ${2}', {false, false})
-- INI: 05B9=2,AS_actor %1h% stay_idle %2h% ms
Opcode.register(0x05b9, SanAndreasOpcodeTask.pause, 2, 'task_pause ${1} ${2}', {false, false})
-- INI: 05BA=2,AS_actor %1d% move_mouth %2h% ms
Opcode.register(0x05ba, SanAndreasOpcodeTask.standStill, 2, 'task_stand_still ${1} ${2}', {false, false})
-- INI: 05BB=3,AS_actor %1h% fall_down %2h% time_on_ground %3d%
Opcode.register(0x05bb, SanAndreasOpcodeTask.fallAndGetUp, 3, 'task_fall_and_get_up ${1} ${2} ${3}', {false, false, false})
-- INI: 05BC=2,AS_actor %1h% jump %2h%
Opcode.register(0x05bc, SanAndreasOpcodeTask.jump, 2, 'task_jump ${1} ${2}', {false, false})
-- INI: 05BD=2,AS_actor %1d% tired %2d% ms
Opcode.register(0x05bd, SanAndreasOpcodeTask.tired, 2, 'task_tired ${1} ${2}', {false, false})
-- INI: 05BE=1,AS_actor %1d% die
Opcode.register(0x05be, SanAndreasOpcodeTask.die, 1, 'task_die ${1}', {false})
-- INI: 05BF=3,AS_actor %1d% look_at_actor %2d% %3d% ms
Opcode.register(0x05bf, SanAndreasOpcodeTask.lookAtChar, 3, 'task_look_at_char ${1} ${2} ${3}', {false, false, false})
-- INI: 05C0=3,AS_actor %1d% look_at_car %2d% %3d% ms
Opcode.register(0x05c0, SanAndreasOpcodeTask.lookAtVehicle, 3, 'task_look_at_vehicle ${1} ${2} ${3}', {false, false, false})
-- INI: 05C1=2,AS_actor %1h% speak_from_audio_table %2d%
Opcode.register(0x05c1, SanAndreasOpcodeTask.say, 2, 'task_say ${1} ${2}', {false, false})
-- INI: 05C2=1,AS_actor %1d% show_the_finger
Opcode.register(0x05c2, SanAndreasOpcodeTask.shakeFist, 1, 'task_shake_fist ${1}', {false})
-- INI: 05C3=1,AS_actor %1d% hands_cower
Opcode.register(0x05c3, SanAndreasOpcodeTask.cower, 1, 'task_cower ${1}', {false})
-- INI: 05C4=2,AS_actor %1d% hands_up %2d% ms
Opcode.register(0x05c4, SanAndreasOpcodeTask.handsUp, 2, 'task_hands_up ${1} ${2}', {false, false})
-- INI: 05C5=2,AS_actor %1d% cower %2h% ms
Opcode.register(0x05c5, SanAndreasOpcodeTask.duck, 2, 'task_duck ${1} ${2}', {false, false})
-- INI: 05C7=1,AS_actor %1h% use_atm
Opcode.register(0x05c7, SanAndreasOpcodeTask.useAtm, 1, 'task_use_atm ${1}', {false})
-- INI: 05C8=1,AS_actor %1h% look_around
Opcode.register(0x05c8, SanAndreasOpcodeTask.scratchHead, 1, 'task_scratch_head ${1}', {false})
-- INI: 05C9=2,AS_actor %1h% on_guard %2d% ms
Opcode.register(0x05c9, SanAndreasOpcodeTask.lookAbout, 2, 'task_look_about ${1} ${2}', {false, false})
-- INI: 05CA=4,AS_actor %1d% enter_car %2d% passenger_seat %4h% time %3d%
Opcode.register(0x05ca, SanAndreasOpcodeTask.enterCarAsPassenger, 4, 'task_enter_car_as_passenger ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 05CB=3,AS_actor %1d% enter_car %2d% as_driver %3d% ms
Opcode.register(0x05cb, SanAndreasOpcodeTask.enterCarAsDriver, 3, 'task_enter_car_as_driver ${1} ${2} ${3}', {false, false, false})
-- INI: 05CD=2,AS_actor %1d% exit_car %2d%
Opcode.register(0x05cd, SanAndreasOpcodeTask.leaveCar, 2, 'task_leave_car ${1} ${2}', {false, false})
-- INI: 05CF=5,AS_actor %1d% exit_car %2d% in_direction %3d% %4d% %5d%
Opcode.register(0x05cf, SanAndreasOpcodeTask.leaveCarAndFlee, 5, 'task_leave_car_and_flee ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 05D1=9,AS_actor %1d% drive_car %2d% to %3d% %4d% %5d% speed %6d% %7h% model %8m%  %9h%
Opcode.register(0x05d1, SanAndreasOpcodeTask.carDriveToCoord, 9, 'task_car_drive_to_coord ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 05D2=4,AS_actor %1d% run_to_and_hijack_car %2d% max_search_radius %3d% traffic_behavior %4h%
Opcode.register(0x05d2, SanAndreasOpcodeTask.carDriveWander, 4, 'task_car_drive_wander ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 05D3=6,AS_actor %1h% goto_point %2d% %3d% %4d% mode %5h% time %6d% ms ; versionA
Opcode.register(0x05d3, SanAndreasOpcodeTask.goStraightToCoord, 6, 'task_go_straight_to_coord ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 05D4=2,AS_actor %1h% rotate_angle %2d%
Opcode.register(0x05d4, SanAndreasOpcodeTask.achieveHeading, 2, 'task_achieve_heading ${1} ${2}', {false, false})
-- INI: 05D8=3,AS_assign_scmpath to_actor %1d% flags %2h% %3h%
Opcode.register(0x05d8, SanAndreasOpcodeTask.followPointRoute, 3, 'task_follow_point_route ${1} ${2} ${3}', {false, false, false})
-- INI: 05D9=4,AS_actor %1d% run_to_actor %2d% timelimit %3d% stop_within_radius %4d%
Opcode.register(0x05d9, SanAndreasOpcodeTask.gotoChar, 4, 'task_goto_char ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 05DA=6,AS_actor %1d% run_away_in_panic_from %2d% %3d% %4d% away_radius %5d% timelimit %6d%
Opcode.register(0x05da, SanAndreasOpcodeTask.fleePoint, 6, 'task_flee_point ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 05DB=4,AS_actor %1h% flee_from_actor %2d% from_origin_radius %3d% timelimit %4h%
Opcode.register(0x05db, SanAndreasOpcodeTask.fleeChar, 4, 'task_flee_char ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 05dc=0,terminate_this_custom_script
Opcode.register(0x05dc, SanAndreasOpcodeTask.smartFleePoint, 6, 'task_smart_flee_point ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 05dd=1,terminate_all_custom_scripts_with_this_name %1s%
Opcode.register(0x05dd, SanAndreasOpcodeTask.smartFleeChar, 4, 'task_smart_flee_char ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 05DE=1,AS_actor %1d% walk_around_ped_path
Opcode.register(0x05de, SanAndreasOpcodeTask.wanderStandard, 1, 'task_wander_standard ${1}', {false})
-- INI: 05E2=2,AS_actor %1d% kill_actor %2d%
Opcode.register(0x05e2, SanAndreasOpcodeTask.killCharOnFoot, 2, 'task_kill_char_on_foot ${1} ${2}', {false, false})
-- INI: 05F5=6,AS_actor %1d% goto_point_using_paths %2d% %3d% %4d% mode %5h% time %6d%
Opcode.register(0x05f5, SanAndreasOpcodeTask.followPathNodesToCoord, 6, 'task_follow_path_nodes_to_coord ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0603=0, is_camera_in_widescreen_mode
Opcode.register(0x0603, SanAndreasOpcodeTask.goToCoordAnyMeans, 6, 'task_go_to_coord_any_means ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0605=2, %2d% = model %1d% weapon id
Opcode.register(0x0605, SanAndreasOpcodeTask.playAnim, 9, 'task_play_anim ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, true, false, false, false, false, false, false, false})
-- INI: 0622=2,AS_actor %1d% bail_car %2d%
Opcode.register(0x0622, SanAndreasOpcodeTask.leaveCarImmediately, 2, 'task_leave_car_immediately ${1} ${2}', {false, false})
-- INI: 0633=1,AS_actor %1d% exit_car
Opcode.register(0x0633, SanAndreasOpcodeTask.leaveAnyCar, 1, 'task_leave_any_car ${1}', {false})
-- INI: 0634=5,AS_actor %1d% attack_using_weapon_actor %2d% flags %3h% perform_actions_after_time %4d% chance_of_action %5h%
Opcode.register(0x0634, SanAndreasOpcodeTask.killCharOnFootWhileDucking, 5, 'task_kill_char_on_foot_while_ducking ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0635=3,AS_actor %1h% aim_at_actor %2d% %3d% ms
Opcode.register(0x0635, SanAndreasOpcodeTask.aimGunAtChar, 3, 'task_aim_gun_at_char ${1} ${2} ${3}', {false, false, false})
-- INI: 0637=8,AS_actor %1h% goto %2d% %3d% %4d% mode %5h% turn_radius %6d% stop_radius %7d% look_at_actor %8d%
Opcode.register(0x0637, SanAndreasOpcodeTask.goToCoordWhileShooting, 8, 'task_go_to_coord_while_shooting ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0638=2,AS_actor %1d% stay_put %2h%
Opcode.register(0x0638, SanAndreasOpcodeTask.stayInSamePlace, 2, 'task_stay_in_same_place ${1} ${2}', {false, false})
-- INI: 0639=2,AS_actor %1d% rotate_to_actor %2d%
Opcode.register(0x0639, SanAndreasOpcodeTask.turnCharToFaceChar, 2, 'task_turn_char_to_face_char ${1} ${2}', {false, true})
-- INI: 0655=3,AS_actor %1d% look_at_object %2d% %3d% ms
Opcode.register(0x0655, SanAndreasOpcodeTask.lookAtObject, 3, 'task_look_at_object ${1} ${2} ${3}', {false, false, false})
-- INI: 0667=5,AS_actor %1h% aim_at %2d% %3d% %4d% %5d% ms
Opcode.register(0x0667, SanAndreasOpcodeTask.aimGunAtCoord, 5, 'task_aim_gun_at_coord ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0668=5,AS_actor %1d% rotate_and_shoot_at %2d% %3d% %4d% %5d% ms
Opcode.register(0x0668, SanAndreasOpcodeTask.shootAtCoord, 5, 'task_shoot_at_coord ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0672=2,AS_actor %1h% attack_car %2d%
Opcode.register(0x0672, SanAndreasOpcodeTask.destroyCar, 2, 'task_destroy_car ${1} ${2}', {false, false})
-- INI: 0673=4,play_animation on actor %1d% animgroup %2d% anim %3d% blendfactor %4f%
Opcode.register(0x0673, SanAndreasOpcodeTask.diveAndGetUp, 4, 'task_dive_and_get_up ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0676=2,AS_actor %1h% in_car %2d% move_from_passengerseat_to_driverseat
Opcode.register(0x0676, SanAndreasOpcodeTask.shuffleToNextCarSeat, 2, 'task_shuffle_to_next_car_seat ${1} ${2}', {false, false})
-- INI: 0677=4,AS_actor %1h% chat_with_actor %2d% lead_speaker_flag %3h% unknown_flag %4h%
Opcode.register(0x0677, SanAndreasOpcodeTask.chatWithChar, 4, 'task_chat_with_char ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0688=4,AS_actor %1h% unknown_toggle_ped_threat_scanner %2h% %3h% %4h%
Opcode.register(0x0688, SanAndreasOpcodeTask.togglePedThreatScanner, 4, 'task_toggle_ped_threat_scanner ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 06A5=2,AS_actor %1d% jump_forward stay_on_ground %2d% ms and_stands_back
Opcode.register(0x06a5, SanAndreasOpcodeTask.diveFromAttachmentAndGetUp, 2, 'task_dive_from_attachment_and_get_up ${1} ${2}', {false, false})
-- INI: 06A8=5,AS_actor %1d% run_to_and_look_at_actor %2d% timelimit %3h% approach_distance %4d% approach_angle %5d%
Opcode.register(0x06a8, SanAndreasOpcodeTask.gotoCharOffset, 5, 'task_goto_char_offset ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 06A9=5,AS_actor %1h% look_at_point %2d% %3d% %4d% %5d% ms
Opcode.register(0x06a9, SanAndreasOpcodeTask.lookAtCoord, 5, 'task_look_at_coord ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 06B0=2,AS_actor %1d% sit_down %2d% ms
Opcode.register(0x06b0, SanAndreasOpcodeTask.sitDown, 2, 'task_sit_down ${1} ${2}', {false, false})
-- INI: 06BA=4,AS_actor %1d% turn_to_and_look_at %2d% %3d% %4d%
Opcode.register(0x06ba, SanAndreasOpcodeTask.turnCharToFaceCoord, 4, 'task_turn_char_to_face_coord ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 06BB=3,set_actor %1h% drive_car %2d% speed %3d% along_SCM_path
Opcode.register(0x06bb, SanAndreasOpcodeTask.drivePointRoute, 3, 'task_drive_point_route ${1} ${2} ${3}', {false, false, false})
-- INI: 06C2=11,AS_actor %1h% goto %2d% %3d% %4d% mode %5h% turn_radius %6d% stop_radius %7d% actor %8d% with_offset %9d% %10d% %11d%
Opcode.register(0x06c2, SanAndreasOpcodeTask.goToCoordWhileAiming, 11, 'task_go_to_coord_while_aiming ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11}', {false, false, false, false, false, false, false, false, false, false, false})
-- INI: 06C7=4,AS_actor %1d% driver_of_car %2d% perform_action %3h% timelimit %4d%
Opcode.register(0x06c7, SanAndreasOpcodeTask.carTempAction, 4, 'task_car_temp_action ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 06E1=6,AS_actor %1d% using_car %2d% target_car %3d% with_order %4h% max_speed %5d% traffic_flag %6h%
Opcode.register(0x06e1, SanAndreasOpcodeTask.carMission, 6, 'task_car_mission ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 06E2=4,AS_actor %1d% run_to_object %2d% timelimit %3h% stop_within_radius %4d%
Opcode.register(0x06e2, SanAndreasOpcodeTask.goToObject, 4, 'task_go_to_object ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 06E3=2,AS_actor %1h% roll_sideways %2h%
Opcode.register(0x06e3, SanAndreasOpcodeTask.weaponRoll, 2, 'task_weapon_roll ${1} ${2}', {false, false})
-- INI: 06E4=2,AS_actor %1d% attempt_to_bust_actor %2d%
Opcode.register(0x06e4, SanAndreasOpcodeTask.charArrestChar, 2, 'task_char_arrest_char ${1} ${2}', {false, false})
-- INI: 070A=10,AS_actor %1d% attach_to_object %2d% offset %3d% %4d% %5d% on_bone %6h% %7h% perform_animation %8h% IFP_file %9h% time %10h%
Opcode.register(0x070a, SanAndreasOpcodeTask.pickUpObject, 10, 'task_pick_up_object ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10}', {false, false, false, false, false, false, false, false, false, false})
-- INI: 0713=10,actor %1d% driveby_actor %2h% car %3h% point %4d% %5d% %6d% radius %7d% %8h% %9h% firing_rate %10h%
Opcode.register(0x0713, SanAndreasOpcodeTask.driveBy, 10, 'task_drive_by ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10}', {false, false, false, false, false, false, false, false, false, false})
-- INI: 0729=2,AS_actor %1d% hold_cellphone %2h%
Opcode.register(0x0729, SanAndreasOpcodeTask.useMobilePhone, 2, 'task_use_mobile_phone ${1} ${2}', {false, false})
-- INI: 072A=2,put_actor %1d% into_car %2d% driverseat
Opcode.register(0x072a, SanAndreasOpcodeTask.warpCharIntoCarAsDriver, 2, 'task_warp_char_into_car_as_driver ${1} ${2}', {false, false})
-- INI: 072B=3,put_actor %1d% into_car %2d% passengerseat %3d%
Opcode.register(0x072b, SanAndreasOpcodeTask.warpCharIntoCarAsPassenger, 3, 'task_warp_char_into_car_as_passenger ${1} ${2} ${3}', {false, false, false})
-- INI: 074C=2,AS_actor %1h% goto_AS_origin %2d%
Opcode.register(0x074c, SanAndreasOpcodeTask.useAttractor, 2, 'task_use_attractor ${1} ${2}', {false, false})
-- INI: 074D=3,AS_actor %1h% turns_to_and_look_at_actor %2d% timelimit %3h%
Opcode.register(0x074d, SanAndreasOpcodeTask.shootAtChar, 3, 'task_shoot_at_char ${1} ${2} ${3}', {false, false, false})
-- INI: 0751=8,AS_actor %1d% flee_from_actor %2d% run_distance %3d% time %4d% change_course %5h% unknown %6d% %7d% away_radius %8d%
Opcode.register(0x0751, SanAndreasOpcodeTask.fleeCharAnyMeans, 8, 'task_flee_char_any_means ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0762=1,AS_actor %1d% dies
Opcode.register(0x0762, SanAndreasOpcodeTask.dead, 1, 'task_dead ${1}', {false})
-- INI: 0772=4,AS_actor %1h% run_to_car %2d% %3d% ms stop_at_distance %4d%
Opcode.register(0x0772, SanAndreasOpcodeTask.gotoCar, 4, 'task_goto_car ${1} ${2} ${3} ${4}', {false, true, true, true})
-- INI: 078F=2,AS_actor %1h% climb %2h%
Opcode.register(0x078f, SanAndreasOpcodeTask.climb, 2, 'task_climb ${1} ${2}', {false, false})
-- INI: 07A3=4,AS_actor %1d% run_to_and_follow_actor %2d% wait_radius_between %3d% and %4d%
Opcode.register(0x07a3, SanAndreasOpcodeTask.gotoCharAiming, 4, 'task_goto_char_aiming ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 07A5=3,AS_actor %1h% attack_actor %2d% time %3d%
Opcode.register(0x07a5, SanAndreasOpcodeTask.killCharOnFootTimed, 3, 'task_kill_char_on_foot_timed ${1} ${2} ${3}', {false, false, false})
-- INI: 07A7=1,put_jetpack_on_actor %1d%
Opcode.register(0x07a7, SanAndreasOpcodeTask.jetpack, 1, 'task_jetpack ${1}', {false})
-- INI: 07BC=2,set_actor %1h% decision_maker_to %2d% ; AS_pack_version
Opcode.register(0x07bc, SanAndreasOpcodeTask.setCharDecisionMaker, 2, 'task_set_char_decision_maker ${1} ${2}', {false, false})
-- INI: 07C9=2,AS_actor %1h% walk_to_object %2d% then_lift_and_hold_in_hands
Opcode.register(0x07c9, SanAndreasOpcodeTask.complexPickupObject, 2, 'task_complex_pickup_object ${1} ${2}', {false, false})
-- INI: 07CD=6,AS_actor %1d% walk_to %2d% %3d% %4d% stop_with_angle %5d% within_radius %6d%
Opcode.register(0x07cd, SanAndreasOpcodeTask.charSlideToCoord, 6, 'task_char_slide_to_coord ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 07E1=4,AS_actor %1d% swim_to %2d% %3d% %4d%
Opcode.register(0x07e1, SanAndreasOpcodeTask.swimToCoord, 4, 'task_swim_to_coord ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 07E7=6,AS_assign_scmpath_to_actor %1h% in_car %2d% speed %3d% flags %4h% %5h% %6h%
Opcode.register(0x07e7, SanAndreasOpcodeTask.drivePointRouteAdvanced, 6, 'task_drive_point_route_advanced ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0804=14,AS_actor %1d% walk_to %2d% %3d% %4d% angle %5d% radius %6d% animation %7h% IFP_file %8h% %9d% LA %10h% LX %11h% LY %12h% LF %13h% LT %14h%
Opcode.register(0x0804, SanAndreasOpcodeTask.charSlideToCoordAndPlayAnim, 14, 'task_char_slide_to_coord_and_play_anim ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14}', {false, true, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0812=9,AS_actor %1d% perform_animation %2h% IFP %3h% framedelta %4d% loopA %5h% lockX %6h% lockY %7h% lockF %8h% time %9h% ; versionB
Opcode.register(0x0812, SanAndreasOpcodeTask.playAnimNonInterruptable, 9, 'task_play_anim_non_interruptable ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 0817=3,assign_actor %1d% to_animation_path_with_walk_mode %2d% route_mode %3d%
Opcode.register(0x0817, SanAndreasOpcodeTask.followPatrolRoute, 3, 'task_follow_patrol_route ${1} ${2} ${3}', {false, false, false})
-- INI: 0823=4,AS_actor %1d% greet_actor %2d% %3d% %4h%
Opcode.register(0x0823, SanAndreasOpcodeTask.greetPartner, 4, 'task_greet_partner ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0829=5,actor %1d% perform_animation %2h% IFP_file %3h% %4d% time %5h% and_dies
Opcode.register(0x0829, SanAndreasOpcodeTask.dieNamedAnim, 5, 'task_die_named_anim ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0850=2,AS_actor %1d% follow_actor %2d%
Opcode.register(0x0850, SanAndreasOpcodeTask.followFootsteps, 2, 'task_follow_footsteps ${1} ${2}', {false, false})
-- INI: 0859=2,AS_actor %1d% walk_alongisde_actor %2d%
Opcode.register(0x0859, SanAndreasOpcodeTask.walkAlongsideChar, 2, 'task_walk_alongside_char ${1} ${2}', {false, false})
-- INI: 085B=2,AS_actor %1h% set_kinda_stay_in_same_place %2h%
Opcode.register(0x085b, SanAndreasOpcodeTask.kindaStayInSamePlace, 2, 'task_kinda_stay_in_same_place ${1} ${2}', {false, false})
-- INI: 088A=11,actor %1d% perform_animation %2h% IFP %3h% %4d% loopA %5h% lockX %6h% lockY %7h% lockF %8h% time %9h% disable_force %10h% disable_lockZ %11h%
Opcode.register(0x088a, SanAndreasOpcodeTask.playAnimWithFlags, 11, 'task_play_anim_with_flags ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11}', {false, false, false, false, false, false, false, false, false, false, false})
-- INI: 08A0=7,actor %1d% in_radius %2d% near_model %3o% with_offset %4d% %5d% %6d% end_script_named %7h% ; IF and SET
Opcode.register(0x08a0, SanAndreasOpcodeTask.useClosestMapAttractor, 7, 'task_use_closest_map_attractor ${1} ${2} ${object.3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 099F=2,AS_actor %1h% ignore_weapon_range %2h%
Opcode.register(0x099f, SanAndreasOpcodeTask.setIgnoreWeaponRangeFlag, 2, 'task_set_ignore_weapon_range_flag ${1} ${2}', {false, false})
-- INI: 09A0=10,actor %1d% attach_object %2d% with_offset %3d% %4d% %5d% on_bone %6h% %7h% perform_animation %8h% IFP_file %9h% time %10h%
Opcode.register(0x09a0, SanAndreasOpcodeTask.pickUpSecondObject, 10, 'task_pick_up_second_object ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10}', {false, false, false, false, false, false, false, false, false, false})
-- INI: 0A1A=9,actor %1d% perform_walk_animation %2h% IFP %3h% framedelta %4d% loopA %5h% lockX %6h% lockY %7h% lockF %8h% %9h% ms ; versionC
Opcode.register(0x0a1a, SanAndreasOpcodeTask.playAnimSecondary, 9, 'task_play_anim_secondary ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 0A1D=2,AS_actor %1d% rotate_to_and_look_at_actor %2d%
Opcode.register(0x0a1d, SanAndreasOpcodeTask.handGesture, 2, 'task_hand_gesture ${1} ${2}', {false, false})
-- INI: 0A2E=7,AS_actor %1d% go_to %2d% %3d% %4d% mode %5h% time %6h% stop_radius %7d%  following_paths
Opcode.register(0x0a2e, SanAndreasOpcodeTask.followPathNodesToCoordWithRadius, 7, 'task_follow_path_nodes_to_coord_with_radius ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
