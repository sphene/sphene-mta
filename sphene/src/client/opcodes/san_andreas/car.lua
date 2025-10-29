SanAndreasOpcodeCar = {}
SanAndreasOpcodeCar.__index = SanAndreasOpcodeCar

-- Opcode: 0x0242
-- Instruction: arm_car_with_bomb [Car] {bombType} [BombType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0242
function SanAndreasOpcodeCar.armWithBomb(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0338
-- Instruction: set_car_visible [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0338
function SanAndreasOpcodeCar.setVisible(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03C9
-- Instruction: is_car_visibly_damaged [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03C9
function SanAndreasOpcodeCar.isVisiblyDamaged(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0432
-- Instruction: [var handle: Char] = get_char_in_car_passenger_seat [Car] {seat} [SeatId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0432
function SanAndreasOpcodeCar.getCharInPassengerSeat(car, seat, _)
    return car:getOccupant(seat + 1)
end

-- Opcode: 0x051C
-- Instruction: has_car_been_damaged_by_char [Car] {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/051C
function SanAndreasOpcodeCar.hasBeenDamagedByChar(_)
    Script.setOpcodePartiallyImplemented()
    return false
end

-- Opcode: 0x051D
-- Instruction: has_car_been_damaged_by_car [Car] {other} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/051D
function SanAndreasOpcodeCar.hasBeenDamagedByCar(_)
    Script.setOpcodePartiallyImplemented()
    return false
end

-- Opcode: 0x054F
-- Instruction: clear_car_last_damage_entity [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/054F
function SanAndreasOpcodeCar.clearLastDamageEntity(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x056E
-- Instruction: does_vehicle_exist {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/056E
function SanAndreasOpcodeCar.doesExist(car)
    if (type(car) == "table" and car:hasSpawned()) then
        return true
    end

    return false
end

-- Opcode: 0x05EB
-- Instruction: start_playback_recorded_car [Car] {path} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05EB
function SanAndreasOpcodeCar.startPlayback(car, pathId)
    car:assignPath(pathId)
    car:setDamageProof(true)
    return true
end

-- Opcode: 0x05EC
-- Instruction: stop_playback_recorded_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05EC
function SanAndreasOpcodeCar.stopPlayback(car)
    car:releaseFromPath()
    car:setCollisionsEnabled(true)
    car:setDamageProof(false)
    return true
end

-- Opcode: 0x05ED
-- Instruction: pause_playback_recorded_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05ED
function SanAndreasOpcodeCar.pausePlayback(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05EE
-- Instruction: unpause_playback_recorded_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05EE
function SanAndreasOpcodeCar.unpausePlayback(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05F1
-- Instruction: set_car_escort_car_left [Car] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05F1
function SanAndreasOpcodeCar.setEscortCarLeft(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05F2
-- Instruction: set_car_escort_car_right [Car] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05F2
function SanAndreasOpcodeCar.setEscortCarRight(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05F3
-- Instruction: set_car_escort_car_rear [Car] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05F3
function SanAndreasOpcodeCar.setEscortCarRear(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05F4
-- Instruction: set_car_escort_car_front [Car] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05F4
function SanAndreasOpcodeCar.setEscortCarFront(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x060E
-- Instruction: is_playback_going_on_for_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/060E
function SanAndreasOpcodeCar.isPlaybackGoingOn(car)
    return car:getAssignedPath() ~= false
end

-- Opcode: 0x0657
-- Instruction: open_car_door [Car] {door} [CarDoor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0657
function SanAndreasOpcodeCar.openDoor(car, door)
    return car:setDoorOpenRatio(door, 1)
end

-- Opcode: 0x0674
-- Instruction: custom_plate_for_next_car {modelId} [model_vehicle] {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0674
function SanAndreasOpcodeCar.customPlateForNextCar(carModel, numberplate)
    ElementManager.setModelData(carModel, 'numberplate', numberplate)
end

-- Opcode: 0x067F
-- Instruction: force_car_lights [Car] {lightMode} [CarLights]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/067F
function SanAndreasOpcodeCar.forceLights(car, lights)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0683
-- Instruction: attach_car_to_car [Car] {handle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0683
function SanAndreasOpcodeCar.attachToCar(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0684
-- Instruction: detach_car [Car] {x} [float] {y} [float] {z} [float] {collisionDetection} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0684
function SanAndreasOpcodeCar.detach(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0686
-- Instruction: is_vehicle_attached [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0686
function SanAndreasOpcodeCar.isAttached(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0689
-- Instruction: pop_car_door [Car] {door} [CarDoor] {visibility} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0689
function SanAndreasOpcodeCar.popDoor(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x068A
-- Instruction: fix_car_door [Car] {door} [CarDoor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/068A
function SanAndreasOpcodeCar.fixDoor(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x068B
-- Instruction: task_everyone_leave_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/068B
function SanAndreasOpcodeCar.taskEveryoneLeave(car)
    for _, actor in pairs(car:getOccupants()) do
        if (actor) then
            actor:exitVehicle()
        end
    end
end

-- Opcode: 0x0697
-- Instruction: pop_car_panel [Car] {panelId} [int] {visibility} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0697
function SanAndreasOpcodeCar.popPanel(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0698
-- Instruction: fix_car_panel [Car] {panelId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0698
function SanAndreasOpcodeCar.fixPanel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0699
-- Instruction: fix_car_tyre [Car] {tireId} [WheelId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0699
function SanAndreasOpcodeCar.fixTire(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06A2
-- Instruction: [var x: float], [var y: float], [var z: float] = get_car_speed_vector [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06A2
function SanAndreasOpcodeCar.getSpeedVector(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06A3
-- Instruction: [var mass: float] = get_car_mass [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06A3
function SanAndreasOpcodeCar.getMass(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06BE
-- Instruction: [var angle: float] = get_car_roll [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06BE
function SanAndreasOpcodeCar.getRoll(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06C5
-- Instruction: skip_to_end_and_stop_playback_recorded_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06C5
function SanAndreasOpcodeCar.skipToEndAndStopPlayback(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06E5
-- Instruction: [var modelId: model_object] = get_available_vehicle_mod [Car] {slotId} [ModSlot]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06E5
function SanAndreasOpcodeCar.getAvailableMod(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06E7
-- Instruction: [var handle: int] = add_vehicle_mod [Car] {modelId} [model_object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06E7
function SanAndreasOpcodeCar.addMod(car, component, _)
   return car:addComponent(component)
end

-- Opcode: 0x06E8
-- Instruction: remove_vehicle_mod [Car] {modelId} [model_object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06E8
function SanAndreasOpcodeCar.removeMod(car, component)
    car:removeComponent(component)
end

-- Opcode: 0x06EC
-- Instruction: [var numPaintjobs: int] = get_num_available_paintjobs [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06EC
function SanAndreasOpcodeCar.getNumAvailablePaintjobs(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06ED
-- Instruction: give_vehicle_paintjob [Car] {paintjobId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06ED
function SanAndreasOpcodeCar.givePaintjob(car, paintjob)
    return car:setPaintjob(paintjob)
end

-- Opcode: 0x06FC
-- Instruction: does_car_have_stuck_car_check [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06FC
function SanAndreasOpcodeCar.doesHaveStuckCarCheck(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06FD
-- Instruction: set_playback_speed [Car] {speed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06FD
function SanAndreasOpcodeCar.setPlaybackSpeed(car, speed)
   car:setAssignedPathSpeed(speed)
end

-- Opcode: 0x0704
-- Instruction: car_goto_coordinates_racing [Car] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0704
function SanAndreasOpcodeCar.gotoCoordinatesRacing(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0705
-- Instruction: start_playback_recorded_car_using_ai [Car] {pathId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0705
function SanAndreasOpcodeCar.startPlaybackUsingAi(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0706
-- Instruction: skip_in_playback_recorded_car [Car] {amount} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0706
function SanAndreasOpcodeCar.skipInPlayback(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x070C
-- Instruction: explode_car_in_cutscene [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/070C
function SanAndreasOpcodeCar.explodeInCutscene(car)
    return car:blow(true)
end

-- Opcode: 0x0714
-- Instruction: set_car_stay_in_slow_lane [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0714
function SanAndreasOpcodeCar.setStayInSlowLane(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0730
-- Instruction: damage_car_panel [Car] {panelId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0730
function SanAndreasOpcodeCar.damagePanel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0731
-- Instruction: set_car_roll [Car] {yAngle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0731
function SanAndreasOpcodeCar.setRoll(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x073B
-- Instruction: set_car_can_go_against_traffic [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/073B
function SanAndreasOpcodeCar.setCanGoAgainstTraffic(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x073C
-- Instruction: damage_car_door [Car] {door} [CarDoor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/073C
function SanAndreasOpcodeCar.damageDoor(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0763
-- Instruction: set_car_as_mission_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0763
function SanAndreasOpcodeCar.setAsMissionCar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x077D
-- Instruction: [var angle: float] = get_car_pitch [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/077D
function SanAndreasOpcodeCar.getPitch(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07C5
-- Instruction: [var x: float], [var y: float], [var z: float], [var w: float] = get_vehicle_quaternion [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07C5
function SanAndreasOpcodeCar.getQuaternion(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07C6
-- Instruction: set_vehicle_quaternion [Car] {x} [float] {y} [float] {z} [float] {w} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07C6
function SanAndreasOpcodeCar.setQuaternion(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07D5
-- Instruction: apply_force_to_car [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07D5
function SanAndreasOpcodeCar.applyForce(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07DA
-- Instruction: add_to_car_rotation_velocity [Car] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07DA
function SanAndreasOpcodeCar.addToRotationVelocity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07DB
-- Instruction: set_car_rotation_velocity [Car] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07DB
function SanAndreasOpcodeCar.setRotationVelocity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07EE
-- Instruction: set_car_always_create_skids [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07EE
function SanAndreasOpcodeCar.setAlwaysCreateSkids(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07F5
-- Instruction: control_car_hydraulics [Car] {_p2} [float] {_p3} [float] {_p4} [float] {_p5} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07F5
function SanAndreasOpcodeCar.controlHydraulics(_, _, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07F8
-- Instruction: set_car_follow_car [Car] {handle} [Car] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07F8
function SanAndreasOpcodeCar.setFollowCar(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07FF
-- Instruction: set_car_hydraulics [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07FF
function SanAndreasOpcodeCar.setHydraulics(car, allowHydraulics)
    if (allowHydraulics) then
        car:addUpgrade(1087)
    else
        car:removeUpgrade(1087)
    end
end

-- Opcode: 0x0803
-- Instruction: does_car_have_hydraulics [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0803
function SanAndreasOpcodeCar.doesHaveHydraulics(car)
   return car:hasUpgrade(1087)
end

-- Opcode: 0x081D
-- Instruction: set_car_engine_broken [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/081D
function SanAndreasOpcodeCar.setEngineBroken(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x083F
-- Instruction: [var value: float] = get_car_upright_value [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/083F
function SanAndreasOpcodeCar.getUprightValue(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0840
-- Instruction: set_vehicle_area_visible [Car] {interiorId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0840
function SanAndreasOpcodeCar.setAreaVisible(car, interior)
    return car:setInterior(interior)
end

-- Opcode: 0x0841
-- Instruction: select_weapons_for_vehicle [Car] {_p2} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0841
function SanAndreasOpcodeCar.selectWeapons(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x084E
-- Instruction: set_vehicle_can_be_targetted [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/084E
function SanAndreasOpcodeCar.setCanBeTargeted(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0852
-- Instruction: set_car_can_be_visibly_damaged [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0852
function SanAndreasOpcodeCar.setCanBeVisiblyDamaged(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x085E
-- Instruction: start_playback_recorded_car_looped [Car] {pathId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/085E
function SanAndreasOpcodeCar.startPlaybackLooped(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0878
-- Instruction: set_vehicle_dirt_level [Car] {level} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0878
function SanAndreasOpcodeCar.setDirtLevel(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x088B
-- Instruction: set_vehicle_air_resistance_multiplier [Car] {multiplier} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/088B
function SanAndreasOpcodeCar.setAirResistanceMultiplier(car, multiplier)
   return car:setAirResistance(multiplier)
end

-- Opcode: 0x088C
-- Instruction: set_car_coordinates_no_offset [Car] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/088C
function SanAndreasOpcodeCar.setCoordinatesNoOffset(car, posX, posY, posZ)
   car:setPosition(posX, posY, posZ)
end

-- Opcode: 0x0897
-- Instruction: is_vehicle_touching_object [Car] {handle} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0897
function SanAndreasOpcodeCar.isTouchingObject(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08A4
-- Instruction: control_movable_vehicle_part [Car] {range} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08A4
function SanAndreasOpcodeCar.controlMovablePart(_, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08A5
-- Instruction: winch_can_pick_vehicle_up [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08A5
function SanAndreasOpcodeCar.winchCanPickUp(_, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08A6
-- Instruction: open_car_door_a_bit [Car] {door} [CarDoor] {value} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08A6
function SanAndreasOpcodeCar.openDoorABit(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08A7
-- Instruction: is_car_door_fully_open [Car] {door} [CarDoor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08A7
function SanAndreasOpcodeCar.isDoorFullyOpen(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08CB
-- Instruction: explode_car_in_cutscene_shake_and_bits [Car] {shake} [bool] {effect} [bool] {sound} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08CB
function SanAndreasOpcodeCar.explodeInCutsceneShakeAndBits(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08EC
-- Instruction: [var class: VehicleClass] = get_vehicle_class [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08EC
function SanAndreasOpcodeCar.getClass(car, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08F2
-- Instruction: vehicle_can_be_targetted_by_hs_missile [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08F2
function SanAndreasOpcodeCar.canBeTargetedByHsMissile(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08F3
-- Instruction: set_freebies_in_vehicle [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08F3
function SanAndreasOpcodeCar.setFreebies(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0918
-- Instruction: set_car_engine_on [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0918
function SanAndreasOpcodeCar.setEngineOn(vehicle, toggle)
    return vehicle:setEngineState((toggle == 1) or false)
end

-- Opcode: 0x0919
-- Instruction: set_car_lights_on [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0919
function SanAndreasOpcodeCar.setLightsOn(vehicle, toggle)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0939
-- Instruction: attach_car_to_object [Car] {handle} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0939
function SanAndreasOpcodeCar.attachToObject(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0957
-- Instruction: vehicle_does_provide_cover [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0957
function SanAndreasOpcodeCar.doesProvideCover(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x095E
-- Instruction: control_car_door [Car] {door} [CarDoor] {state} [CarDoorState] {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/095E
function SanAndreasOpcodeCar.controlDoor(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x095F
-- Instruction: [var ratio: float] = get_door_angle_ratio [Car] {door} [CarDoor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/095F
function SanAndreasOpcodeCar.getDoorAngleRatio(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0969
-- Instruction: is_big_vehicle [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0969
function SanAndreasOpcodeCar.isBig(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x096B
-- Instruction: store_car_mod_state
-- https://library.sannybuilder.com/#/sa/script/extensions/default/096B
function SanAndreasOpcodeCar.storeModState()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x096C
-- Instruction: restore_car_mod_state
-- https://library.sannybuilder.com/#/sa/script/extensions/default/096C
function SanAndreasOpcodeCar.restoreModState()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x096D
-- Instruction: [var modelId: model_object] = get_current_car_mod [Car] {slot} [ModSlot]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/096D
function SanAndreasOpcodeCar.getCurrentMod(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x096E
-- Instruction: is_car_low_rider [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/096E
function SanAndreasOpcodeCar.isLowRider(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x096F
-- Instruction: is_car_street_racer [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/096F
function SanAndreasOpcodeCar.isStreetRacer(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0975
-- Instruction: is_emergency_services_vehicle [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0975
function SanAndreasOpcodeCar.isEmergencyServices(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x097D
-- Instruction: [var count: int] = get_num_car_colours [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/097D
function SanAndreasOpcodeCar.getNumColors(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0987
-- Instruction: [var handle: Car] = get_car_blocking_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0987
function SanAndreasOpcodeCar.getBlockingCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0988
-- Instruction: [var paintjobNumber: int] = get_current_vehicle_paintjob [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0988
function SanAndreasOpcodeCar.getCurrentPaintjob(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x098D
-- Instruction: [var offset: float] = get_car_moving_component_offset [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/098D
function SanAndreasOpcodeCar.getMovingComponentOffset(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x099A
-- Instruction: set_car_collision [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/099A
function SanAndreasOpcodeCar.setCollision(car, toggle)
    if (toggle == 1) then
        toggle = true
    else
        toggle = false
    end

    return car:setCollisionsEnabled(toggle)
end

-- Opcode: 0x099B
-- Instruction: change_playback_to_use_ai [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/099B
function SanAndreasOpcodeCar.changePlaybackToUseAi(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09AB
-- Instruction: random_passenger_say [Car] {phrase} [SpeechId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09AB
function SanAndreasOpcodeCar.randomPassengerSay(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09B0
-- Instruction: set_vehicle_is_considered_by_player [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09B0
function SanAndreasOpcodeCar.setIsConsideredByPlayer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09B3
-- Instruction: [var lockStatus: CarLock] = get_car_door_lock_status [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09B3
function SanAndreasOpcodeCar.getDoorLockStatus(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09BB
-- Instruction: is_car_door_damaged [Car] {door} [CarDoor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09BB
function SanAndreasOpcodeCar.isDoorDamaged(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09C4
-- Instruction: set_petrol_tank_weakpoint [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09C4
function SanAndreasOpcodeCar.setPetrolTankWeakpoint(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09CB
-- Instruction: is_car_touching_car [Car] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09CB
function SanAndreasOpcodeCar.isTouchingCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09D0
-- Instruction: is_vehicle_on_all_wheels [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09D0
function SanAndreasOpcodeCar.isOnAllWheels(car)
    return car:areWheelsTouchingGround()
end

-- Opcode: 0x09E1
-- Instruction: [var value: int] = get_car_model_value {model} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09E1
function SanAndreasOpcodeCar.getModelValue(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09E9
-- Instruction: give_non_player_car_nitro [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09E9
function SanAndreasOpcodeCar.giveNonPlayerNitro(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09FE
-- Instruction: reset_vehicle_hydraulics [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09FE
function SanAndreasOpcodeCar.resetHydraulics(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A11
-- Instruction: set_extra_car_colours [Car] {color3} [int] {color4} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A11
function SanAndreasOpcodeCar.setExtraColors(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A12
-- Instruction: [var color3: int], [var color4: int] = get_extra_car_colours [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A12
function SanAndreasOpcodeCar.getExtraColors(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A15
-- Instruction: has_car_been_resprayed [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A15
function SanAndreasOpcodeCar.hasBeenResprayed(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A21
-- Instruction: improve_car_by_cheating [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A21
function SanAndreasOpcodeCar.improveByCheating(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0A30
-- Instruction: fix_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A30
function SanAndreasOpcodeCar.fix(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AB7
-- Instruction: [var numGear: int] = get_car_number_of_gears [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AB7
function SanAndreasOpcodeCar.getNumberOfGears(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AB8
-- Instruction: [var gear: int] = get_car_current_gear [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AB8
function SanAndreasOpcodeCar.getCurrentGear(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ABD
-- Instruction: is_car_siren_on [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ABD
function SanAndreasOpcodeCar.isSirenOn(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ABE
-- Instruction: is_car_engine_on [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ABE
function SanAndreasOpcodeCar.isEngineOn(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ABF
-- Instruction: cleo_set_car_engine_on [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ABF
function SanAndreasOpcodeCar.cleoSetEngineOn(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D0F
-- Instruction: set_car_model_alpha [Car] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D0F
function SanAndreasOpcodeCar.setModelAlpha(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D33
-- Instruction: set_car_door_window_state [Car] {door} [CarNodeDoor] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D33
function SanAndreasOpcodeCar.setDoorWindowState(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E00
-- Instruction: [var status: CarAlarm] = get_car_alarm [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E00
function SanAndreasOpcodeCar.getAlarm(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E08
-- Instruction: is_car_script_controlled [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E08
function SanAndreasOpcodeCar.isScriptControlled(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E09
-- Instruction: mark_car_as_needed [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E09
function SanAndreasOpcodeCar.markAsNeeded(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E12
-- Instruction: [var subclass: VehicleSubclass] = get_vehicle_subclass [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E12
function SanAndreasOpcodeCar.getSubclass(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E17
-- Instruction: init_extended_car_vars [Car] {identifier} [string] {totalVars} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E17
function SanAndreasOpcodeCar.initExtendedVars(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E18
-- Instruction: set_extended_car_var [Car] {identifier} [string] {varNumber} [int] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E18
function SanAndreasOpcodeCar.setExtendedVar(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E19
-- Instruction: [var value: any] = get_extended_car_var [Car] {identifier} [string] {varNumber} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E19
function SanAndreasOpcodeCar.getExtendedCarVar(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E59
-- Instruction: [var trailer: Car] = get_trailer_from_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E59
function SanAndreasOpcodeCar.getTrailer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E5A
-- Instruction: [var tractor: Car] = get_car_from_trailer [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E5A
function SanAndreasOpcodeCar.getTractor(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E5B
-- Instruction: [var x: float], [var y: float], [var z: float] = get_car_dummy_coord [Car] {vehicleDummy} [VehicleDummy] {worldCoords} [bool] {invertX} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E5B
function SanAndreasOpcodeCar.getDummyCoord(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E5F
-- Instruction: car_horn [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E5F
function SanAndreasOpcodeCar.playHorn(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E61
-- Instruction: set_car_alarm [Car] {status} [CarAlarm]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E61
function SanAndreasOpcodeCar.setAlarm(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E65
-- Instruction: [var intensity: float] = get_car_collision_intensity [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E65
function SanAndreasOpcodeCar.getCollisionIntensity(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E66
-- Instruction: [var x: float], [var y: float], [var z: float] = get_car_collision_coordinates [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E66
function SanAndreasOpcodeCar.getCollisionCoordinates(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E82
-- Instruction: does_car_have_part_node [Car] {carNode} [CarNode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E82
function SanAndreasOpcodeCar.doesHavePartNode(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E90
-- Instruction: [var surfaceType: SurfaceType] = get_car_collision_surface [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E90
function SanAndreasOpcodeCar.getCollisionSurface(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E91
-- Instruction: [var lighting: float] = get_car_collision_lighting [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E91
function SanAndreasOpcodeCar.getCollisionLighting(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E93
-- Instruction: is_car_really_in_air [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E93
function SanAndreasOpcodeCar.isReallyInAir(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EAD
-- Instruction: [var bullet: bool], [var fire: bool], [var explosion: bool], [var collision: bool], [var melee: bool] = get_car_proofs [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EAD
function SanAndreasOpcodeCar.getProofs(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EB4
-- Instruction: set_car_coordinates_simple [Car] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EB4
function SanAndreasOpcodeCar.setCoordinatesSimple(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EB6
-- Instruction: [var char: Char], [var weaponType: WeaponType], [var intensity: float] = get_car_weapon_damage_last_frame [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EB6
function SanAndreasOpcodeCar.getWeaponDamageLastFrame(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EC9
-- Instruction: [var randomSeed: int] = get_car_random_seed [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EC9
function SanAndreasOpcodeCar.getRandomSeed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ECD
-- Instruction: dont_delete_car_until_time [Car] {msFromNow} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ECD
function SanAndreasOpcodeCar.dontDeleteUntilTime(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ECF
-- Instruction: [var timeIsDead: int] = get_time_car_is_dead [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ECF
function SanAndreasOpcodeCar.getTimeIsDead(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EE7
-- Instruction: locate_car_distance_to_object [Car] {object} [Object] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EE7
function SanAndreasOpcodeCar.locateDistanceToObject(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EE8
-- Instruction: locate_car_distance_to_car [Car] {car} [Car] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EE8
function SanAndreasOpcodeCar.locateDistanceToCar(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EEB
-- Instruction: locate_car_distance_to_coordinates [Car] {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EEB
function SanAndreasOpcodeCar.locateDistanceToCoordinates(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EF5
-- Instruction: is_car_owned_by_player [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EF5
function SanAndreasOpcodeCar.isOwnedByPlayer(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EF6
-- Instruction: set_car_owned_by_player [Car] {ownedByPlayer} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EF6
function SanAndreasOpcodeCar.setOwnedByPlayer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EF9
-- Instruction: [var carAnimGroup: CarAnimGroup] = get_car_animgroup [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EF9
function SanAndreasOpcodeCar.getAnimGroup(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EFB
-- Instruction: is_car_convertible [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EFB
function SanAndreasOpcodeCar.isConvertible(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EFC
-- Instruction: [var value: int] = get_car_value [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EFC
function SanAndreasOpcodeCar.getValue(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EFD
-- Instruction: [var gas: float], [var brake: float] = get_car_pedals [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EFD
function SanAndreasOpcodeCar.getPedals(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D0C
-- Instruction: [var handle: Matrix] = get_car_component_matrix [Car] {componentName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D0C
function SanAndreasOpcodeCar.getComponentMatrix(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D0D
-- Instruction: [var handle: Component] = get_car_component [Car] {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D0D
function SanAndreasOpcodeCar.getComponent(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D12
-- Instruction: set_car_component_model_alpha [Car] {componentName} [string] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D12
function SanAndreasOpcodeCar.setComponentModelAlpha(_, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0242, SanAndreasOpcodeCar.armWithBomb, 'arm_car_with_bomb [Car] {bombType} [BombType]')
Opcode.register(0x0338, SanAndreasOpcodeCar.setVisible, 'set_car_visible [Car] {state} [bool]')
Opcode.register(0x03c9, SanAndreasOpcodeCar.isVisiblyDamaged, 'is_car_visibly_damaged [Car]')
Opcode.register(0x0432, SanAndreasOpcodeCar.getCharInPassengerSeat, '[var handle: Char] = get_char_in_car_passenger_seat [Car] {seat} [SeatId]')
Opcode.register(0x051c, SanAndreasOpcodeCar.hasBeenDamagedByChar, 'has_car_been_damaged_by_char [Car] {handle} [Char]')
Opcode.register(0x051d, SanAndreasOpcodeCar.hasBeenDamagedByCar, 'has_car_been_damaged_by_car [Car] {other} [Car]')
Opcode.register(0x054f, SanAndreasOpcodeCar.clearLastDamageEntity, 'clear_car_last_damage_entity [Car]')
Opcode.register(0x056e, SanAndreasOpcodeCar.doesExist, 'does_vehicle_exist {handle} [any]')
Opcode.register(0x05eb, SanAndreasOpcodeCar.startPlayback, 'start_playback_recorded_car [Car] {path} [int]')
Opcode.register(0x05ec, SanAndreasOpcodeCar.stopPlayback, 'stop_playback_recorded_car [Car]')
Opcode.register(0x05ed, SanAndreasOpcodeCar.pausePlayback, 'pause_playback_recorded_car [Car]')
Opcode.register(0x05ee, SanAndreasOpcodeCar.unpausePlayback, 'unpause_playback_recorded_car [Car]')
Opcode.register(0x05f1, SanAndreasOpcodeCar.setEscortCarLeft, 'set_car_escort_car_left [Car] {handle} [Car]')
Opcode.register(0x05f2, SanAndreasOpcodeCar.setEscortCarRight, 'set_car_escort_car_right [Car] {handle} [Car]')
Opcode.register(0x05f3, SanAndreasOpcodeCar.setEscortCarRear, 'set_car_escort_car_rear [Car] {handle} [Car]')
Opcode.register(0x05f4, SanAndreasOpcodeCar.setEscortCarFront, 'set_car_escort_car_front [Car] {handle} [Car]')
Opcode.register(0x060e, SanAndreasOpcodeCar.isPlaybackGoingOn, 'is_playback_going_on_for_car [Car]')
Opcode.register(0x0657, SanAndreasOpcodeCar.openDoor, 'open_car_door [Car] {door} [CarDoor]')
Opcode.register(0x0674, SanAndreasOpcodeCar.customPlateForNextCar, 'custom_plate_for_next_car {modelId} [model_vehicle] {text} [string]')
Opcode.register(0x067f, SanAndreasOpcodeCar.forceLights, 'force_car_lights [Car] {lightMode} [CarLights]')
Opcode.register(0x0683, SanAndreasOpcodeCar.attachToCar, 'attach_car_to_car [Car] {handle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]')
Opcode.register(0x0684, SanAndreasOpcodeCar.detach, 'detach_car [Car] {x} [float] {y} [float] {z} [float] {collisionDetection} [bool]')
Opcode.register(0x0686, SanAndreasOpcodeCar.isAttached, 'is_vehicle_attached [Car]')
Opcode.register(0x0689, SanAndreasOpcodeCar.popDoor, 'pop_car_door [Car] {door} [CarDoor] {visibility} [bool]')
Opcode.register(0x068a, SanAndreasOpcodeCar.fixDoor, 'fix_car_door [Car] {door} [CarDoor]')
Opcode.register(0x068b, SanAndreasOpcodeCar.taskEveryoneLeave, 'task_everyone_leave_car [Car]')
Opcode.register(0x0697, SanAndreasOpcodeCar.popPanel, 'pop_car_panel [Car] {panelId} [int] {visibility} [bool]')
Opcode.register(0x0698, SanAndreasOpcodeCar.fixPanel, 'fix_car_panel [Car] {panelId} [int]')
Opcode.register(0x0699, SanAndreasOpcodeCar.fixTire, 'fix_car_tyre [Car] {tireId} [WheelId]')
Opcode.register(0x06a2, SanAndreasOpcodeCar.getSpeedVector, '[var x: float], [var y: float], [var z: float] = get_car_speed_vector [Car]')
Opcode.register(0x06a3, SanAndreasOpcodeCar.getMass, '[var mass: float] = get_car_mass [Car]')
Opcode.register(0x06be, SanAndreasOpcodeCar.getRoll, '[var angle: float] = get_car_roll [Car]')
Opcode.register(0x06c5, SanAndreasOpcodeCar.skipToEndAndStopPlayback, 'skip_to_end_and_stop_playback_recorded_car [Car]')
Opcode.register(0x06e5, SanAndreasOpcodeCar.getAvailableMod, '[var modelId: model_object] = get_available_vehicle_mod [Car] {slotId} [ModSlot]')
Opcode.register(0x06e7, SanAndreasOpcodeCar.addMod, '[var handle: int] = add_vehicle_mod [Car] {modelId} [model_object]')
Opcode.register(0x06e8, SanAndreasOpcodeCar.removeMod, 'remove_vehicle_mod [Car] {modelId} [model_object]')
Opcode.register(0x06ec, SanAndreasOpcodeCar.getNumAvailablePaintjobs, '[var numPaintjobs: int] = get_num_available_paintjobs [Car]')
Opcode.register(0x06ed, SanAndreasOpcodeCar.givePaintjob, 'give_vehicle_paintjob [Car] {paintjobId} [int]')
Opcode.register(0x06fc, SanAndreasOpcodeCar.doesHaveStuckCarCheck, 'does_car_have_stuck_car_check [Car]')
Opcode.register(0x06fd, SanAndreasOpcodeCar.setPlaybackSpeed, 'set_playback_speed [Car] {speed} [float]')
Opcode.register(0x0704, SanAndreasOpcodeCar.gotoCoordinatesRacing, 'car_goto_coordinates_racing [Car] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0705, SanAndreasOpcodeCar.startPlaybackUsingAi, 'start_playback_recorded_car_using_ai [Car] {pathId} [int]')
Opcode.register(0x0706, SanAndreasOpcodeCar.skipInPlayback, 'skip_in_playback_recorded_car [Car] {amount} [float]')
Opcode.register(0x070c, SanAndreasOpcodeCar.explodeInCutscene, 'explode_car_in_cutscene [Car]')
Opcode.register(0x0714, SanAndreasOpcodeCar.setStayInSlowLane, 'set_car_stay_in_slow_lane [Car] {state} [bool]')
Opcode.register(0x0730, SanAndreasOpcodeCar.damagePanel, 'damage_car_panel [Car] {panelId} [int]')
Opcode.register(0x0731, SanAndreasOpcodeCar.setRoll, 'set_car_roll [Car] {yAngle} [float]')
Opcode.register(0x073b, SanAndreasOpcodeCar.setCanGoAgainstTraffic, 'set_car_can_go_against_traffic [Car] {state} [bool]')
Opcode.register(0x073c, SanAndreasOpcodeCar.damageDoor, 'damage_car_door [Car] {door} [CarDoor]')
Opcode.register(0x0763, SanAndreasOpcodeCar.setAsMissionCar, 'set_car_as_mission_car [Car]')
Opcode.register(0x077d, SanAndreasOpcodeCar.getPitch, '[var angle: float] = get_car_pitch [Car]')
Opcode.register(0x07c5, SanAndreasOpcodeCar.getQuaternion, '[var x: float], [var y: float], [var z: float], [var w: float] = get_vehicle_quaternion [Car]')
Opcode.register(0x07c6, SanAndreasOpcodeCar.setQuaternion, 'set_vehicle_quaternion [Car] {x} [float] {y} [float] {z} [float] {w} [float]')
Opcode.register(0x07d5, SanAndreasOpcodeCar.applyForce, 'apply_force_to_car [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]')
Opcode.register(0x07da, SanAndreasOpcodeCar.addToRotationVelocity, 'add_to_car_rotation_velocity [Car] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x07db, SanAndreasOpcodeCar.setRotationVelocity, 'set_car_rotation_velocity [Car] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x07ee, SanAndreasOpcodeCar.setAlwaysCreateSkids, 'set_car_always_create_skids [Car] {state} [bool]')
Opcode.register(0x07f5, SanAndreasOpcodeCar.controlHydraulics, 'control_car_hydraulics [Car] {_p2} [float] {_p3} [float] {_p4} [float] {_p5} [float]')
Opcode.register(0x07f8, SanAndreasOpcodeCar.setFollowCar, 'set_car_follow_car [Car] {handle} [Car] {radius} [float]')
Opcode.register(0x07ff, SanAndreasOpcodeCar.setHydraulics, 'set_car_hydraulics [Car] {state} [bool]')
Opcode.register(0x0803, SanAndreasOpcodeCar.doesHaveHydraulics, 'does_car_have_hydraulics [Car]')
Opcode.register(0x081d, SanAndreasOpcodeCar.setEngineBroken, 'set_car_engine_broken [Car] {state} [bool]')
Opcode.register(0x083f, SanAndreasOpcodeCar.getUprightValue, '[var value: float] = get_car_upright_value [Car]')
Opcode.register(0x0840, SanAndreasOpcodeCar.setAreaVisible, 'set_vehicle_area_visible [Car] {interiorId} [int]')
Opcode.register(0x0841, SanAndreasOpcodeCar.selectWeapons, 'select_weapons_for_vehicle [Car] {_p2} [int]')
Opcode.register(0x084e, SanAndreasOpcodeCar.setCanBeTargeted, 'set_vehicle_can_be_targetted [Car] {state} [bool]')
Opcode.register(0x0852, SanAndreasOpcodeCar.setCanBeVisiblyDamaged, 'set_car_can_be_visibly_damaged [Car] {state} [bool]')
Opcode.register(0x085e, SanAndreasOpcodeCar.startPlaybackLooped, 'start_playback_recorded_car_looped [Car] {pathId} [int]')
Opcode.register(0x0878, SanAndreasOpcodeCar.setDirtLevel, 'set_vehicle_dirt_level [Car] {level} [float]')
Opcode.register(0x088b, SanAndreasOpcodeCar.setAirResistanceMultiplier, 'set_vehicle_air_resistance_multiplier [Car] {multiplier} [float]')
Opcode.register(0x088c, SanAndreasOpcodeCar.setCoordinatesNoOffset, 'set_car_coordinates_no_offset [Car] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0897, SanAndreasOpcodeCar.isTouchingObject, 'is_vehicle_touching_object [Car] {handle} [Object]')
Opcode.register(0x08a4, SanAndreasOpcodeCar.controlMovablePart, 'control_movable_vehicle_part [Car] {range} [float]')
Opcode.register(0x08a5, SanAndreasOpcodeCar.winchCanPickUp, 'winch_can_pick_vehicle_up [Car] {state} [bool]')
Opcode.register(0x08a6, SanAndreasOpcodeCar.openDoorABit, 'open_car_door_a_bit [Car] {door} [CarDoor] {value} [float]')
Opcode.register(0x08a7, SanAndreasOpcodeCar.isDoorFullyOpen, 'is_car_door_fully_open [Car] {door} [CarDoor]')
Opcode.register(0x08cb, SanAndreasOpcodeCar.explodeInCutsceneShakeAndBits, 'explode_car_in_cutscene_shake_and_bits [Car] {shake} [bool] {effect} [bool] {sound} [bool]')
Opcode.register(0x08ec, SanAndreasOpcodeCar.getClass, '[var class: VehicleClass] = get_vehicle_class [Car]')
Opcode.register(0x08f2, SanAndreasOpcodeCar.canBeTargetedByHsMissile, 'vehicle_can_be_targetted_by_hs_missile [Car] {state} [bool]')
Opcode.register(0x08f3, SanAndreasOpcodeCar.setFreebies, 'set_freebies_in_vehicle [Car] {state} [bool]')
Opcode.register(0x0918, SanAndreasOpcodeCar.setEngineOn, 'set_car_engine_on [Car] {state} [bool]')
Opcode.register(0x0919, SanAndreasOpcodeCar.setLightsOn, 'set_car_lights_on [Car] {state} [bool]')
Opcode.register(0x0939, SanAndreasOpcodeCar.attachToObject, 'attach_car_to_object [Car] {handle} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]')
Opcode.register(0x0957, SanAndreasOpcodeCar.doesProvideCover, 'vehicle_does_provide_cover [Car] {state} [bool]')
Opcode.register(0x095e, SanAndreasOpcodeCar.controlDoor, 'control_car_door [Car] {door} [CarDoor] {state} [CarDoorState] {angle} [float]')
Opcode.register(0x095f, SanAndreasOpcodeCar.getDoorAngleRatio, '[var ratio: float] = get_door_angle_ratio [Car] {door} [CarDoor]')
Opcode.register(0x0969, SanAndreasOpcodeCar.isBig, 'is_big_vehicle [Car]')
Opcode.register(0x096b, SanAndreasOpcodeCar.storeModState, 'store_car_mod_state')
Opcode.register(0x096c, SanAndreasOpcodeCar.restoreModState, 'restore_car_mod_state')
Opcode.register(0x096d, SanAndreasOpcodeCar.getCurrentMod, '[var modelId: model_object] = get_current_car_mod [Car] {slot} [ModSlot]')
Opcode.register(0x096e, SanAndreasOpcodeCar.isLowRider, 'is_car_low_rider [Car]')
Opcode.register(0x096f, SanAndreasOpcodeCar.isStreetRacer, 'is_car_street_racer [Car]')
Opcode.register(0x0975, SanAndreasOpcodeCar.isEmergencyServices, 'is_emergency_services_vehicle [Car]')
Opcode.register(0x097d, SanAndreasOpcodeCar.getNumColors, '[var count: int] = get_num_car_colours [Car]')
Opcode.register(0x0987, SanAndreasOpcodeCar.getBlockingCar, '[var handle: Car] = get_car_blocking_car [Car]')
Opcode.register(0x0988, SanAndreasOpcodeCar.getCurrentPaintjob, '[var paintjobNumber: int] = get_current_vehicle_paintjob [Car]')
Opcode.register(0x098d, SanAndreasOpcodeCar.getMovingComponentOffset, '[var offset: float] = get_car_moving_component_offset [Car]')
Opcode.register(0x099a, SanAndreasOpcodeCar.setCollision, 'set_car_collision [Car] {state} [bool]')
Opcode.register(0x099b, SanAndreasOpcodeCar.changePlaybackToUseAi, 'change_playback_to_use_ai [Car]')
Opcode.register(0x09ab, SanAndreasOpcodeCar.randomPassengerSay, 'random_passenger_say [Car] {phrase} [SpeechId]')
Opcode.register(0x09b0, SanAndreasOpcodeCar.setIsConsideredByPlayer, 'set_vehicle_is_considered_by_player [Car] {state} [bool]')
Opcode.register(0x09b3, SanAndreasOpcodeCar.getDoorLockStatus, '[var lockStatus: CarLock] = get_car_door_lock_status [Car]')
Opcode.register(0x09bb, SanAndreasOpcodeCar.isDoorDamaged, 'is_car_door_damaged [Car] {door} [CarDoor]')
Opcode.register(0x09c4, SanAndreasOpcodeCar.setPetrolTankWeakpoint, 'set_petrol_tank_weakpoint [Car] {state} [bool]')
Opcode.register(0x09cb, SanAndreasOpcodeCar.isTouchingCar, 'is_car_touching_car [Car] {handle} [Car]')
Opcode.register(0x09d0, SanAndreasOpcodeCar.isOnAllWheels, 'is_vehicle_on_all_wheels [Car]')
Opcode.register(0x09e1, SanAndreasOpcodeCar.getModelValue, '[var value: int] = get_car_model_value {model} [model_vehicle]')
Opcode.register(0x09e9, SanAndreasOpcodeCar.giveNonPlayerNitro, 'give_non_player_car_nitro [Car]')
Opcode.register(0x09fe, SanAndreasOpcodeCar.resetHydraulics, 'reset_vehicle_hydraulics [Car]')
Opcode.register(0x0a11, SanAndreasOpcodeCar.setExtraColors, 'set_extra_car_colours [Car] {color3} [int] {color4} [int]')
Opcode.register(0x0a12, SanAndreasOpcodeCar.getExtraColors, '[var color3: int], [var color4: int] = get_extra_car_colours [Car]')
Opcode.register(0x0a15, SanAndreasOpcodeCar.hasBeenResprayed, 'has_car_been_resprayed [Car]')
Opcode.register(0x0a21, SanAndreasOpcodeCar.improveByCheating, 'improve_car_by_cheating [Car] {state} [bool]')
Opcode.register(0x0a30, SanAndreasOpcodeCar.fix, 'fix_car [Car]')
Opcode.register(0x0ab7, SanAndreasOpcodeCar.getNumberOfGears, '[var numGear: int] = get_car_number_of_gears [Car]')
Opcode.register(0x0ab8, SanAndreasOpcodeCar.getCurrentGear, '[var gear: int] = get_car_current_gear [Car]')
Opcode.register(0x0abd, SanAndreasOpcodeCar.isSirenOn, 'is_car_siren_on [Car]')
Opcode.register(0x0abe, SanAndreasOpcodeCar.isEngineOn, 'is_car_engine_on [Car]')
Opcode.register(0x0abf, SanAndreasOpcodeCar.cleoSetEngineOn, 'cleo_set_car_engine_on [Car] {state} [bool]')
Opcode.register(0x0d0f, SanAndreasOpcodeCar.setModelAlpha, 'set_car_model_alpha [Car] {alpha} [int]')
Opcode.register(0x0d33, SanAndreasOpcodeCar.setDoorWindowState, 'set_car_door_window_state [Car] {door} [CarNodeDoor] {state} [bool]')
Opcode.register(0x0e00, SanAndreasOpcodeCar.getAlarm, '[var status: CarAlarm] = get_car_alarm [Car]')
Opcode.register(0x0e08, SanAndreasOpcodeCar.isScriptControlled, 'is_car_script_controlled [Car]')
Opcode.register(0x0e09, SanAndreasOpcodeCar.markAsNeeded, 'mark_car_as_needed [Car]')
Opcode.register(0x0e12, SanAndreasOpcodeCar.getSubclass, '[var subclass: VehicleSubclass] = get_vehicle_subclass [Car]')
Opcode.register(0x0e17, SanAndreasOpcodeCar.initExtendedVars, 'init_extended_car_vars [Car] {identifier} [string] {totalVars} [int]')
Opcode.register(0x0e18, SanAndreasOpcodeCar.setExtendedVar, 'set_extended_car_var [Car] {identifier} [string] {varNumber} [int] {value} [any]')
Opcode.register(0x0e19, SanAndreasOpcodeCar.getExtendedCarVar, '[var value: any] = get_extended_car_var [Car] {identifier} [string] {varNumber} [int]')
Opcode.register(0x0e59, SanAndreasOpcodeCar.getTrailer, '[var trailer: Car] = get_trailer_from_car [Car]')
Opcode.register(0x0e5a, SanAndreasOpcodeCar.getTractor, '[var tractor: Car] = get_car_from_trailer [Car]')
Opcode.register(0x0e5b, SanAndreasOpcodeCar.getDummyCoord, '[var x: float], [var y: float], [var z: float] = get_car_dummy_coord [Car] {vehicleDummy} [VehicleDummy] {worldCoords} [bool] {invertX} [bool]')
Opcode.register(0x0e5f, SanAndreasOpcodeCar.playHorn, 'car_horn [Car]')
Opcode.register(0x0e61, SanAndreasOpcodeCar.setAlarm, 'set_car_alarm [Car] {status} [CarAlarm]')
Opcode.register(0x0e65, SanAndreasOpcodeCar.getCollisionIntensity, '[var intensity: float] = get_car_collision_intensity [Car]')
Opcode.register(0x0e66, SanAndreasOpcodeCar.getCollisionCoordinates, '[var x: float], [var y: float], [var z: float] = get_car_collision_coordinates [Car]')
Opcode.register(0x0e82, SanAndreasOpcodeCar.doesHavePartNode, 'does_car_have_part_node [Car] {carNode} [CarNode]')
Opcode.register(0x0e90, SanAndreasOpcodeCar.getCollisionSurface, '[var surfaceType: SurfaceType] = get_car_collision_surface [Car]')
Opcode.register(0x0e91, SanAndreasOpcodeCar.getCollisionLighting, '[var lighting: float] = get_car_collision_lighting [Car]')
Opcode.register(0x0e93, SanAndreasOpcodeCar.isReallyInAir, 'is_car_really_in_air [Car]')
Opcode.register(0x0ead, SanAndreasOpcodeCar.getProofs, '[var bullet: bool], [var fire: bool], [var explosion: bool], [var collision: bool], [var melee: bool] = get_car_proofs [Car]')
Opcode.register(0x0eb4, SanAndreasOpcodeCar.setCoordinatesSimple, 'set_car_coordinates_simple [Car] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0eb6, SanAndreasOpcodeCar.getWeaponDamageLastFrame, '[var char: Char], [var weaponType: WeaponType], [var intensity: float] = get_car_weapon_damage_last_frame [Car]')
Opcode.register(0x0ec9, SanAndreasOpcodeCar.getRandomSeed, '[var randomSeed: int] = get_car_random_seed [Car]')
Opcode.register(0x0ecd, SanAndreasOpcodeCar.dontDeleteUntilTime, 'dont_delete_car_until_time [Car] {msFromNow} [int]')
Opcode.register(0x0ecf, SanAndreasOpcodeCar.getTimeIsDead, '[var timeIsDead: int] = get_time_car_is_dead [Car]')
Opcode.register(0x0ee7, SanAndreasOpcodeCar.locateDistanceToObject, 'locate_car_distance_to_object [Car] {object} [Object] {radius} [float]')
Opcode.register(0x0ee8, SanAndreasOpcodeCar.locateDistanceToCar, 'locate_car_distance_to_car [Car] {car} [Car] {radius} [float]')
Opcode.register(0x0eeb, SanAndreasOpcodeCar.locateDistanceToCoordinates, 'locate_car_distance_to_coordinates [Car] {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x0ef5, SanAndreasOpcodeCar.isOwnedByPlayer, 'is_car_owned_by_player [Car]')
Opcode.register(0x0ef6, SanAndreasOpcodeCar.setOwnedByPlayer, 'set_car_owned_by_player [Car] {ownedByPlayer} [bool]')
Opcode.register(0x0ef9, SanAndreasOpcodeCar.getAnimGroup, '[var carAnimGroup: CarAnimGroup] = get_car_animgroup [Car]')
Opcode.register(0x0efb, SanAndreasOpcodeCar.isConvertible, 'is_car_convertible [Car]')
Opcode.register(0x0efc, SanAndreasOpcodeCar.getValue, '[var value: int] = get_car_value [Car]')
Opcode.register(0x0efd, SanAndreasOpcodeCar.getPedals, '[var gas: float], [var brake: float] = get_car_pedals [Car]')
Opcode.register(0x0d0c, SanAndreasOpcodeCar.getComponentMatrix, '[var handle: Matrix] = get_car_component_matrix [Car] {componentName} [string]')
Opcode.register(0x0d0d, SanAndreasOpcodeCar.getComponent, '[var handle: Component] = get_car_component [Car] {name} [string]')
Opcode.register(0x0d12, SanAndreasOpcodeCar.setComponentModelAlpha, 'set_car_component_model_alpha [Car] {componentName} [string] {alpha} [int]')
