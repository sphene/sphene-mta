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
    actor:setAnimation("dodge", "cover_dive_01", timeOnGround, false)

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


Opcode.register(0x04eb, SanAndreasOpcodeTask.toggleDuck, 'task_toggle_duck {handle} [Char] {state} [bool]')
Opcode.register(0x05b9, SanAndreasOpcodeTask.pause, 'task_pause {handle} [Char] {time} [int]')
Opcode.register(0x05ba, SanAndreasOpcodeTask.standStill, 'task_stand_still {handle} [Char] {time} [int]')
Opcode.register(0x05bb, SanAndreasOpcodeTask.fallAndGetUp, 'task_fall_and_get_up {handle} [Char] {fallDown} [bool] {timeOnGround} [int]')
Opcode.register(0x05bc, SanAndreasOpcodeTask.jump, 'task_jump {handle} [Char] {state} [bool]')
Opcode.register(0x05bd, SanAndreasOpcodeTask.tired, 'task_tired {handle} [Char] {time} [int]')
Opcode.register(0x05be, SanAndreasOpcodeTask.die, 'task_die {handle} [Char]')
Opcode.register(0x05bf, SanAndreasOpcodeTask.lookAtChar, 'task_look_at_char {observer} [Char] {target} [Char] {time} [int]')
Opcode.register(0x05c0, SanAndreasOpcodeTask.lookAtVehicle, 'task_look_at_vehicle {char} [Char] {vehicle} [Car] {time} [int]')
Opcode.register(0x05c1, SanAndreasOpcodeTask.say, 'task_say {handle} [Char] {phrase} [SpeechId]')
Opcode.register(0x05c2, SanAndreasOpcodeTask.shakeFist, 'task_shake_fist {handle} [Char]')
Opcode.register(0x05c3, SanAndreasOpcodeTask.cower, 'task_cower {handle} [Char]')
Opcode.register(0x05c4, SanAndreasOpcodeTask.handsUp, 'task_hands_up {handle} [Char] {time} [int]')
Opcode.register(0x05c5, SanAndreasOpcodeTask.duck, 'task_duck {handle} [Char] {time} [int]')
Opcode.register(0x05c7, SanAndreasOpcodeTask.useAtm, 'task_use_atm {handle} [Char]')
Opcode.register(0x05c8, SanAndreasOpcodeTask.scratchHead, 'task_scratch_head {handle} [Char]')
Opcode.register(0x05c9, SanAndreasOpcodeTask.lookAbout, 'task_look_about {handle} [Char] {time} [int]')
Opcode.register(0x05ca, SanAndreasOpcodeTask.enterCarAsPassenger, 'task_enter_car_as_passenger {char} [Char] {vehicle} [Car] {time} [int] {seat} [SeatId]')
Opcode.register(0x05cb, SanAndreasOpcodeTask.enterCarAsDriver, 'task_enter_car_as_driver {char} [Char] {vehicle} [Car] {time} [int]')
Opcode.register(0x05cd, SanAndreasOpcodeTask.leaveCar, 'task_leave_car {char} [Char] {vehicle} [Car]')
Opcode.register(0x05cf, SanAndreasOpcodeTask.leaveCarAndFlee, 'task_leave_car_and_flee {char} [Char] {vehicle} [Car] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x05d1, SanAndreasOpcodeTask.carDriveToCoord, 'task_car_drive_to_coord {driver} [Char] {vehicle} [Car] {x} [float] {y} [float] {z} [float] {speed} [float] {driveStyle} [DriveMode] {modelId} [model_vehicle] {drivingStyle} [DrivingMode]')
Opcode.register(0x05d2, SanAndreasOpcodeTask.carDriveWander, 'task_car_drive_wander {char} [Char] {vehicle} [Car] {speed} [float] {drivingMode} [DrivingMode]')
Opcode.register(0x05d3, SanAndreasOpcodeTask.goStraightToCoord, 'task_go_straight_to_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {speed} [MoveState] {time} [int]')
Opcode.register(0x05d4, SanAndreasOpcodeTask.achieveHeading, 'task_achieve_heading {handle} [Char] {heading} [float]')
Opcode.register(0x05d8, SanAndreasOpcodeTask.followPointRoute, 'task_follow_point_route {handle} [Char] {speed} [MoveState] {mode} [RouteMode]')
Opcode.register(0x05d9, SanAndreasOpcodeTask.gotoChar, 'task_goto_char {walking} [Char] {target} [Char] {time} [int] {radius} [float]')
Opcode.register(0x05da, SanAndreasOpcodeTask.fleePoint, 'task_flee_point {handle} [Char] {x} [float] {y} [float] {z} [float] {radius} [float] {time} [int]')
Opcode.register(0x05db, SanAndreasOpcodeTask.fleeChar, 'task_flee_char {handle} [Char] {threat} [Char] {radius} [float] {time} [int]')
Opcode.register(0x05dc, SanAndreasOpcodeTask.smartFleePoint, 'task_smart_flee_point {handle} [Char] {x} [float] {y} [float] {z} [float] {radius} [float] {time} [int]')
Opcode.register(0x05dd, SanAndreasOpcodeTask.smartFleeChar, 'task_smart_flee_char {handle} [Char] {threat} [Char] {radius} [float] {time} [int]')
Opcode.register(0x05de, SanAndreasOpcodeTask.wanderStandard, 'task_wander_standard {handle} [Char]')
Opcode.register(0x05e2, SanAndreasOpcodeTask.killCharOnFoot, 'task_kill_char_on_foot {killer} [Char] {target} [Char]')
Opcode.register(0x05f5, SanAndreasOpcodeTask.followPathNodesToCoord, 'task_follow_path_nodes_to_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {walkSpeed} [int] {time} [int]')
Opcode.register(0x0603, SanAndreasOpcodeTask.goToCoordAnyMeans, 'task_go_to_coord_any_means {char} [Char] {x} [float] {y} [float] {z} [float] {speed} [MoveState] {vehicle} [Car]')
Opcode.register(0x0605, SanAndreasOpcodeTask.playAnim, 'task_play_anim {handle} [Char] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {keepLastFrame} [bool] {time} [int]')
Opcode.register(0x0622, SanAndreasOpcodeTask.leaveCarImmediately, 'task_leave_car_immediately {char} [Char] {vehicle} [Car]')
Opcode.register(0x0633, SanAndreasOpcodeTask.leaveAnyCar, 'task_leave_any_car {handle} [Char]')
Opcode.register(0x0634, SanAndreasOpcodeTask.killCharOnFootWhileDucking, 'task_kill_char_on_foot_while_ducking {char} [Char] {target} [Char] {flags} [int] {actionDelay} [int] {actionChance} [int]')
Opcode.register(0x0635, SanAndreasOpcodeTask.aimGunAtChar, 'task_aim_gun_at_char {char} [Char] {target} [Char] {time} [int]')
Opcode.register(0x0637, SanAndreasOpcodeTask.goToCoordWhileShooting, 'task_go_to_coord_while_shooting {char} [Char] {x} [float] {y} [float] {z} [float] {speed} [MoveState] {turnRadius} [float] {stopRadius} [float] {target} [Char]')
Opcode.register(0x0638, SanAndreasOpcodeTask.stayInSamePlace, 'task_stay_in_same_place {handle} [Char] {state} [bool]')
Opcode.register(0x0639, SanAndreasOpcodeTask.turnCharToFaceChar, 'task_turn_char_to_face_char {char} [Char] {target} [Char]')
Opcode.register(0x0655, SanAndreasOpcodeTask.lookAtObject, 'task_look_at_object {char} [Char] {object} [Object] {time} [any]')
Opcode.register(0x0667, SanAndreasOpcodeTask.aimGunAtCoord, 'task_aim_gun_at_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {time} [int]')
Opcode.register(0x0668, SanAndreasOpcodeTask.shootAtCoord, 'task_shoot_at_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {time} [int]')
Opcode.register(0x0672, SanAndreasOpcodeTask.destroyCar, 'task_destroy_car {char} [Char] {vehicle} [Car]')
Opcode.register(0x0673, SanAndreasOpcodeTask.diveAndGetUp, 'task_dive_and_get_up {handle} [Char] {directionX} [float] {directionY} [float] {timeOnGround} [int]')
Opcode.register(0x0676, SanAndreasOpcodeTask.shuffleToNextCarSeat, 'task_shuffle_to_next_car_seat {char} [Char] {vehicle} [Car]')
Opcode.register(0x0677, SanAndreasOpcodeTask.chatWithChar, 'task_chat_with_char {char} [Char] {other} [Char] {leadSpeaker} [bool] {_p4} [int]')
Opcode.register(0x0688, SanAndreasOpcodeTask.togglePedThreatScanner, 'task_toggle_ped_threat_scanner {handle} [Char] {onFoot} [bool] {inCar} [bool] {duringScriptTask} [bool]')
Opcode.register(0x06a5, SanAndreasOpcodeTask.diveFromAttachmentAndGetUp, 'task_dive_from_attachment_and_get_up {handle} [Char] {time} [int]')
Opcode.register(0x06a8, SanAndreasOpcodeTask.gotoCharOffset, 'task_goto_char_offset {char} [Char] {target} [Char] {time} [int] {radius} [float] {heading} [float]')
Opcode.register(0x06a9, SanAndreasOpcodeTask.lookAtCoord, 'task_look_at_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {time} [int]')
Opcode.register(0x06b0, SanAndreasOpcodeTask.sitDown, 'task_sit_down {handle} [Char] {time} [int]')
Opcode.register(0x06ba, SanAndreasOpcodeTask.turnCharToFaceCoord, 'task_turn_char_to_face_coord {handle} [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x06bb, SanAndreasOpcodeTask.drivePointRoute, 'task_drive_point_route {char} [Char] {vehicle} [Car] {speed} [int]')
Opcode.register(0x06c2, SanAndreasOpcodeTask.goToCoordWhileAiming, 'task_go_to_coord_while_aiming {char} [Char] {x} [float] {y} [float] {z} [float] {speed} [MoveState] {turnRadius} [float] {stopRadius} [float] {target} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float]')
Opcode.register(0x06c7, SanAndreasOpcodeTask.carTempAction, 'task_car_temp_action {char} [Char] {vehicle} [Car] {actionId} [TempAction] {time} [int]')
Opcode.register(0x06e1, SanAndreasOpcodeTask.carMission, 'task_car_mission {char} [Char] {vehicle} [Car] {targetVehicle} [Car] {missionId} [CarMission] {cruiseSpeed} [float] {drivingStyle} [DrivingMode]')
Opcode.register(0x06e2, SanAndreasOpcodeTask.goToObject, 'task_go_to_object {char} [Char] {object} [Object] {time} [int] {radius} [float]')
Opcode.register(0x06e3, SanAndreasOpcodeTask.weaponRoll, 'task_weapon_roll {handle} [Char] {direction} [bool]')
Opcode.register(0x06e4, SanAndreasOpcodeTask.charArrestChar, 'task_char_arrest_char {char} [Char] {target} [Char]')
Opcode.register(0x070a, SanAndreasOpcodeTask.pickUpObject, 'task_pick_up_object {char} [Char] {object} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {boneId} [int] {_p7} [int] {animationName} [string] {animationFile} [string] {time} [int]')
Opcode.register(0x0713, SanAndreasOpcodeTask.driveBy, 'task_drive_by {handle} [Char] {targetChar} [Char] {targetVehicle} [Car] {x} [float] {y} [float] {z} [float] {radius} [float] {type} [DriveByType] {rightHandCarSeat} [bool] {fireRate} [int]')
Opcode.register(0x0729, SanAndreasOpcodeTask.useMobilePhone, 'task_use_mobile_phone {handle} [Char] {start} [bool]')
Opcode.register(0x072a, SanAndreasOpcodeTask.warpCharIntoCarAsDriver, 'task_warp_char_into_car_as_driver {char} [Char] {vehicle} [Car]')
Opcode.register(0x072b, SanAndreasOpcodeTask.warpCharIntoCarAsPassenger, 'task_warp_char_into_car_as_passenger {char} [Char] {vehicle} [Car] {seatId} [int]')
Opcode.register(0x074c, SanAndreasOpcodeTask.useAttractor, 'task_use_attractor {char} [Char] {attractor} [Attractor]')
Opcode.register(0x074d, SanAndreasOpcodeTask.shootAtChar, 'task_shoot_at_char {handle} [Char] {target} [Char] {time} [int]')
Opcode.register(0x0751, SanAndreasOpcodeTask.fleeCharAnyMeans, 'task_flee_char_any_means {handle} [Char] {threat} [Char] {runDistance} [float] {time} [int] {changeCourse} [bool] {_p6} [int] {_p7} [int] {radius} [float]')
Opcode.register(0x0762, SanAndreasOpcodeTask.dead, 'task_dead {handle} [Char]')
Opcode.register(0x0772, SanAndreasOpcodeTask.gotoCar, 'task_goto_car {char} [Char] {vehicle} [Car] {time} [int] {radius} [float]')
Opcode.register(0x078f, SanAndreasOpcodeTask.climb, 'task_climb {handle} [Char] {flag} [bool]')
Opcode.register(0x07a3, SanAndreasOpcodeTask.gotoCharAiming, 'task_goto_char_aiming {handle} [Char] {target} [Char] {radiusFrom} [float] {radiusTo} [float]')
Opcode.register(0x07a5, SanAndreasOpcodeTask.killCharOnFootTimed, 'task_kill_char_on_foot_timed {handle} [Char] {target} [Char] {time} [int]')
Opcode.register(0x07a7, SanAndreasOpcodeTask.jetpack, 'task_jetpack {handle} [Char]')
Opcode.register(0x07bc, SanAndreasOpcodeTask.setCharDecisionMaker, 'task_set_char_decision_maker {char} [Char] {handleOrTemplate} [DecisionMakerCharTemplate]')
Opcode.register(0x07c9, SanAndreasOpcodeTask.complexPickupObject, 'task_complex_pickup_object {char} [Char] {object} [Object]')
Opcode.register(0x07cd, SanAndreasOpcodeTask.charSlideToCoord, 'task_char_slide_to_coord {handle} [Char] {x} [float] {y} [float] {z} [float] {angle} [float] {radius} [float]')
Opcode.register(0x07e1, SanAndreasOpcodeTask.swimToCoord, 'task_swim_to_coord {handle} [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x07e7, SanAndreasOpcodeTask.drivePointRouteAdvanced, 'task_drive_point_route_advanced {char} [Char] {vehicle} [Car] {speed} [float] {driveStyle} [DriveMode] {modelId} [model_vehicle] {drivingStyle} [DrivingMode]')
Opcode.register(0x0804, SanAndreasOpcodeTask.charSlideToCoordAndPlayAnim, 'task_char_slide_to_coord_and_play_anim {handle} [Char] {x} [float] {y} [float] {z} [float] {heading} [float] {radius} [float] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {keepLastFrame} [bool] {time} [int]')
Opcode.register(0x0812, SanAndreasOpcodeTask.playAnimNonInterruptable, 'task_play_anim_non_interruptable {handle} [Char] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {keepLastFrame} [bool] {time} [int]')
Opcode.register(0x0817, SanAndreasOpcodeTask.followPatrolRoute, 'task_follow_patrol_route {handle} [Char] {speed} [MoveState] {mode} [RouteMode]')
Opcode.register(0x0823, SanAndreasOpcodeTask.greetPartner, 'task_greet_partner {handle} [Char] {partner} [Char] {approachRatio} [float] {greetStyle} [int]')
Opcode.register(0x0829, SanAndreasOpcodeTask.dieNamedAnim, 'task_die_named_anim {handle} [Char] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {time} [int]')
Opcode.register(0x0850, SanAndreasOpcodeTask.followFootsteps, 'task_follow_footsteps {handle} [Char] {target} [Char]')
Opcode.register(0x0859, SanAndreasOpcodeTask.walkAlongsideChar, 'task_walk_alongside_char {handle} [Char] {target} [Char]')
Opcode.register(0x085b, SanAndreasOpcodeTask.kindaStayInSamePlace, 'task_kinda_stay_in_same_place {handle} [Char] {state} [bool]')
Opcode.register(0x088a, SanAndreasOpcodeTask.playAnimWithFlags, 'task_play_anim_with_flags {handle} [Char] {animationName} [string] {animationFile} [string] {frameDelta} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {lockF} [bool] {time} [int] {disableForce} [bool] {disableLockZ} [bool]')
Opcode.register(0x08a0, SanAndreasOpcodeTask.useClosestMapAttractor, 'task_use_closest_map_attractor {handle} [Char] {radius} [float] {modelId} [model_object] {fromX} [float] {fromY} [float] {fromZ} [float] {name} [string]')
Opcode.register(0x099f, SanAndreasOpcodeTask.setIgnoreWeaponRangeFlag, 'task_set_ignore_weapon_range_flag {handle} [Char] {state} [bool]')
Opcode.register(0x09a0, SanAndreasOpcodeTask.pickUpSecondObject, 'task_pick_up_second_object {char} [Char] {object} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {boneId} [int] {_p7} [int] {animationName} [string] {animationFile} [string] {time} [int]')
Opcode.register(0x0a1a, SanAndreasOpcodeTask.playAnimSecondary, 'task_play_anim_secondary {handle} [Char] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {keepLastFrame} [bool] {time} [int]')
Opcode.register(0x0a1d, SanAndreasOpcodeTask.handGesture, 'task_hand_gesture {handle} [Char] {target} [Char]')
Opcode.register(0x0a2e, SanAndreasOpcodeTask.followPathNodesToCoordWithRadius, 'task_follow_path_nodes_to_coord_with_radius {handle} [Char] {x} [float] {y} [float] {z} [float] {mode} [int] {time} [int] {radius} [float]')
