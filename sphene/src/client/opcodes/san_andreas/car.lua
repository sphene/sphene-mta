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


-- INI: 0242=2,set_car %1d% bomb_status_to %2d%
Opcode.register(0x0242, SanAndreasOpcodeCar.armWithBomb, 2, 'arm_car_with_bomb [Car] ${1}')
-- INI: 0338=2,set_car %1d% visible %2h%
Opcode.register(0x0338, SanAndreasOpcodeCar.setVisible, 2, 'set_car_visible ${1} ${2}', {false, false})
-- INI: 03c9=1,  car %1d% visibly_damaged
Opcode.register(0x03c9, SanAndreasOpcodeCar.isVisiblyDamaged, 1, 'is_car_visibly_damaged ${1}', {false})
-- INI: 0432=3,get_actor_in_car %1d% passenger_seat %2d% store_to %3d%
Opcode.register(0x0432, SanAndreasOpcodeCar.getCharInPassengerSeat, 3, '${3} = get_char_in_car_passenger_seat ${1} ${2}', {false, false, true})
-- INI: 051C=2,  car %1d% damaged_by_actor %2d%
Opcode.register(0x051c, SanAndreasOpcodeCar.hasBeenDamagedByChar, 2, 'has_car_been_damaged_by_char ${1} ${2}', {false, false})
-- INI: 051D=2,  car %1d% damaged_by_car %2d%
Opcode.register(0x051d, SanAndreasOpcodeCar.hasBeenDamagedByCar, 2, 'has_car_been_damaged_by_car ${1} ${2}', {false, false})
-- INI: 054F=1,clear_car %1d% damage
Opcode.register(0x054f, SanAndreasOpcodeCar.clearLastDamageEntity, 1, 'clear_car_last_damage_entity ${1}', {false})
-- INI: 056e=1,  car %1d% defined
Opcode.register(0x056e, SanAndreasOpcodeCar.doesExist, 1, 'does_vehicle_exist ${1}', {false})
-- INI: 05eb=2,%2h% = object_struct %1d% handle
Opcode.register(0x05eb, SanAndreasOpcodeCar.startPlayback, 2, 'start_playback_recorded_car ${1} ${2}', {false, true})
-- INI: 05ec=1,%1d% = get_this_script_struct
Opcode.register(0x05ec, SanAndreasOpcodeCar.stopPlayback, 1, 'stop_playback_recorded_car ${1}', {true})
-- INI: 05ed=2,%2d% = get_script_struct_named %1s%
Opcode.register(0x05ed, SanAndreasOpcodeCar.pausePlayback, 1, 'pause_playback_recorded_car ${1}', {false})
-- INI: 05ee=1,  key_pressed %1d%  //VK_...
Opcode.register(0x05ee, SanAndreasOpcodeCar.unpausePlayback, 1, 'unpause_playback_recorded_car ${1}', {false})
-- INI: 05f1=6,%6d% = random_object_near_point %1d% %2d% %3d% in_radius %4d% find_next %5h% //IF and SET
Opcode.register(0x05f1, SanAndreasOpcodeCar.setEscortCarLeft, 2, 'set_car_escort_car_left ${1} ${2}', {false, false})
-- INI: 05f2=1,%1d% = pop_float
Opcode.register(0x05f2, SanAndreasOpcodeCar.setEscortCarRight, 2, 'set_car_escort_car_right ${1} ${2}', {true, false})
-- INI: 05f3=3,%3d% = pow %1d% base %2d% // all floats
Opcode.register(0x05f3, SanAndreasOpcodeCar.setEscortCarRear, 2, 'set_car_escort_car_rear ${1} ${2}', {false, false})
-- INI: 05f4=3,%3d% = log %1d% base %2d% //all floats
Opcode.register(0x05f4, SanAndreasOpcodeCar.setEscortCarFront, 2, 'set_car_escort_car_front ${1} ${2}', {false, false})
-- INI: 060E=1,  car %1d% assigned_to_path
Opcode.register(0x060e, SanAndreasOpcodeCar.isPlaybackGoingOn, 1, 'is_playback_going_on_for_car ${1}', {false})
-- INI: 0657=2,car %1d% open_door %2h%
Opcode.register(0x0657, SanAndreasOpcodeCar.openDoor, 2, 'open_car_door ${1} ${2}', {false, false})
-- INI: 0674=2,set_car_model %1m% numberplate %2h%
Opcode.register(0x0674, SanAndreasOpcodeCar.customPlateForNextCar, 2, 'custom_plate_for_next_car ${vehicle.1} ${2}', {false, false})
-- INI: 067F=2,set_car %1d% lights %2h%
Opcode.register(0x067f, SanAndreasOpcodeCar.forceLights, 2, 'force_car_lights ${1} ${2}', {false, false})
-- INI: 0683=8,attach_car %1d% to_car %2d% with_offset %3d% %4d% %5d% rotation %6d% %7d% %8d%
Opcode.register(0x0683, SanAndreasOpcodeCar.attachToCar, 8, 'attach_car_to_car ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0684=5,detach_car %1d% %2d% %3d% %4d% collision_detection %5h%
Opcode.register(0x0684, SanAndreasOpcodeCar.detach, 5, 'detach_car ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0686=1,  car %1d% attached
Opcode.register(0x0686, SanAndreasOpcodeCar.isAttached, 1, 'is_vehicle_attached ${1}', {false})
-- INI: 0689=3,set_car %1d% remove_door %2h% removed_door_visible %3d%
Opcode.register(0x0689, SanAndreasOpcodeCar.popDoor, 3, 'pop_car_door ${1} ${2} ${3}', {false, false, false})
-- INI: 068A=2,set_car %1d% repair_door %2h%
Opcode.register(0x068a, SanAndreasOpcodeCar.fixDoor, 2, 'fix_car_door ${1} ${2}', {false, false})
-- INI: 068B=1,set_car %1d% all_disembark
Opcode.register(0x068b, SanAndreasOpcodeCar.taskEveryoneLeave, 1, 'task_everyone_leave_car ${1}', {false})
-- INI: 0697=3,set_car %1d% remove_component %2h% visible_effect_flag %3d%
Opcode.register(0x0697, SanAndreasOpcodeCar.popPanel, 3, 'pop_car_panel ${1} ${2} ${3}', {false, false, false})
-- INI: 0698=2,set_car %1d% repair_componentB %2h%
Opcode.register(0x0698, SanAndreasOpcodeCar.fixPanel, 2, 'fix_car_panel ${1} ${2}', {false, false})
-- INI: 0699=2,set_car %1d% repair_tire %2h%
Opcode.register(0x0699, SanAndreasOpcodeCar.fixTire, 2, 'fix_car_tyre ${1} ${2}', {false, false})
-- INI: 06A2=4,get_car %1d% velocity_in_direction_XYZ %2d% %3d% %4d%
Opcode.register(0x06a2, SanAndreasOpcodeCar.getSpeedVector, 4, '${2}, ${3}, ${4} = get_car_speed_vector ${1}', {false, true, true, true})
-- INI: 06A3=2,get_car %1d% mass_to %2d%
Opcode.register(0x06a3, SanAndreasOpcodeCar.getMass, 2, '${2} = get_car_mass ${1}', {false, true})
-- INI: 06BE=2,%2d% = car %1d% y_angle
Opcode.register(0x06be, SanAndreasOpcodeCar.getRoll, 2, '${2} = get_car_roll ${1}', {false, true})
-- INI: 06C5=1,release_car %1d% from_path
Opcode.register(0x06c5, SanAndreasOpcodeCar.skipToEndAndStopPlayback, 1, 'skip_to_end_and_stop_playback_recorded_car ${1}', {false})
-- INI: 06E5=3,get_car %1d% possible_to_built_in_component_pool_index %2d% itemID_to %3d%
Opcode.register(0x06e5, SanAndreasOpcodeCar.getAvailableMod, 3, '${3} = get_available_vehicle_mod ${1} ${2}', {false, false, true})
-- INI: 06E7=3,%3d% = add_car_component %2o% to_car %1d%
Opcode.register(0x06e7, SanAndreasOpcodeCar.addMod, 3, '${3} = add_vehicle_mod ${object.2} ${1}', {false, false, true})
-- INI: 06E8=2,car %1d% destroy_component %2d%
Opcode.register(0x06e8, SanAndreasOpcodeCar.removeMod, 2, 'remove_vehicle_mod ${1} ${2}', {false, false})
-- INI: 06EC=2,get_car %1d% number_of_possible_paintjobs_to %2d%
Opcode.register(0x06ec, SanAndreasOpcodeCar.getNumAvailablePaintjobs, 2, '${2} = get_num_available_paintjobs ${1}', {false, true})
-- INI: 06ED=2,set_car %1d% paintjob %2h%
Opcode.register(0x06ed, SanAndreasOpcodeCar.givePaintjob, 2, 'give_vehicle_paintjob ${1} ${2}', {false, false})
-- INI: 06FC=1,  car %1d% stuck_check_enabled
Opcode.register(0x06fc, SanAndreasOpcodeCar.doesHaveStuckCarCheck, 1, 'does_car_have_stuck_car_check ${1}', {false})
-- INI: 06FD=2,set_car %1d% speed_on_path_to %2d%
Opcode.register(0x06fd, SanAndreasOpcodeCar.setPlaybackSpeed, 2, 'set_playback_speed ${1} ${2}', {false, false})
-- INI: 0704=4,car %1d% drive_to %2d% %3d% %4d%
Opcode.register(0x0704, SanAndreasOpcodeCar.gotoCoordinatesRacing, 4, 'car_goto_coordinates_racing ${1} ${2} ${3} ${4}', {false, true, false, false})
-- INI: 0705=2,car %1d% assign_to_path %2d% and_drive_normal
Opcode.register(0x0705, SanAndreasOpcodeCar.startPlaybackUsingAi, 2, 'start_playback_recorded_car_using_ai ${1} ${2}', {false, true})
-- INI: 0706=2,advance_car %1d% further_along_path %2d%
Opcode.register(0x0706, SanAndreasOpcodeCar.skipInPlayback, 2, 'skip_in_playback_recorded_car ${1} ${2}', {false, false})
-- INI: 070C=1,explode_car_without_radius_damage %1d%
Opcode.register(0x070c, SanAndreasOpcodeCar.explodeInCutscene, 1, 'explode_car_in_cutscene ${1}', {false})
-- INI: 0714=2,unknown_car %1d% flag %2h%
Opcode.register(0x0714, SanAndreasOpcodeCar.setStayInSlowLane, 2, 'set_car_stay_in_slow_lane ${1} ${2}', {false, false})
-- INI: 0730=2,car %1d% damage_door %2h%
Opcode.register(0x0730, SanAndreasOpcodeCar.damagePanel, 2, 'damage_car_panel ${1} ${2}', {false, false})
-- INI: 0731=2,set_car %1d% y_angle_to %2d%
Opcode.register(0x0731, SanAndreasOpcodeCar.setRoll, 2, 'set_car_roll ${1} ${2}', {false, true})
-- INI: 073B=2,unknown_car %1d% flag %2h%
Opcode.register(0x073b, SanAndreasOpcodeCar.setCanGoAgainstTraffic, 2, 'set_car_can_go_against_traffic ${1} ${2}', {false, false})
-- INI: 073C=2,car %1d% damage_componentB %2h%
Opcode.register(0x073c, SanAndreasOpcodeCar.damageDoor, 2, 'damage_car_door ${1} ${2}', {false, false})
-- INI: 0763=1,add_car_reference %1d% ; mission only
Opcode.register(0x0763, SanAndreasOpcodeCar.setAsMissionCar, 1, 'set_car_as_mission_car ${1}', {false})
-- INI: 077D=2,%2d% = car %1d% x_angle
Opcode.register(0x077d, SanAndreasOpcodeCar.getPitch, 2, '${2} = get_car_pitch ${1}', {false, true})
-- INI: 07C5=5,get_car %1d% axis_angle_relation_to %2d% %3d% %4d% %5d%
Opcode.register(0x07c5, SanAndreasOpcodeCar.getQuaternion, 5, '${2}, ${3}, ${4}, ${5} = get_vehicle_quaternion ${1}', {false, true, true, true, true})
-- INI: 07C6=5,set_car %1d% axis_angle_relation_to %2d% %3d% %4d% %5d%
Opcode.register(0x07c6, SanAndreasOpcodeCar.setQuaternion, 5, 'set_vehicle_quaternion ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 07D5=7,set_car %1d% velocity_in_direction_XYZ %2d% %3d% %4d% rotation_velocitiesXY %5d% %6d% unk %7d%
Opcode.register(0x07d5, SanAndreasOpcodeCar.applyForce, 7, 'apply_force_to_car ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 07DA=4,set_car %1d% rotation_velocity_XYZ %2d% %3d% %4d% through_center_of_body
Opcode.register(0x07da, SanAndreasOpcodeCar.addToRotationVelocity, 4, 'add_to_car_rotation_velocity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 07DB=4,set_car %1d% rotation_velocity_XYZ %2d% %3d% %4d% through_center_of_mass
Opcode.register(0x07db, SanAndreasOpcodeCar.setRotationVelocity, 4, 'set_car_rotation_velocity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 07EE=2,car %1d% enable_tire_marks %2h%
Opcode.register(0x07ee, SanAndreasOpcodeCar.setAlwaysCreateSkids, 2, 'set_car_always_create_skids ${1} ${2}', {false, false})
-- INI: 07F5=5,car %1d% control_hydraulics %2d% %3d% %4d% %5d%
Opcode.register(0x07f5, SanAndreasOpcodeCar.controlHydraulics, 5, 'control_car_hydraulics ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 07F8=3,car %1d% follow_car %2d% radius %3d%
Opcode.register(0x07f8, SanAndreasOpcodeCar.setFollowCar, 3, 'set_car_follow_car ${1} ${2} ${3}', {false, false, false})
-- INI: 07FF=2,set_car %1d% hydraulics %2h%
Opcode.register(0x07ff, SanAndreasOpcodeCar.setHydraulics, 2, 'set_car_hydraulics ${1} ${2}', {false, false})
-- INI: 0803=1,  car %1d% have_hydraulics
Opcode.register(0x0803, SanAndreasOpcodeCar.doesHaveHydraulics, 1, 'does_car_have_hydraulics ${1}', {false})
-- INI: 081D=2,set_car %1d% engine_broken %2h%
Opcode.register(0x081d, SanAndreasOpcodeCar.setEngineBroken, 2, 'set_car_engine_broken ${1} ${2}', {false, false})
-- INI: 083F=2,get_car %1d% vertical_deviation_to %2d%
Opcode.register(0x083f, SanAndreasOpcodeCar.getUprightValue, 2, '${2} = get_car_upright_value ${1}', {false, true})
-- INI: 0840=2,link_car %1d% to_interior %2d%
Opcode.register(0x0840, SanAndreasOpcodeCar.setAreaVisible, 2, 'set_vehicle_area_visible ${1} ${2}', {false, false})
-- INI: 0841=2,flying_vehicle %1d% use_secondary_gun %2h%
Opcode.register(0x0841, SanAndreasOpcodeCar.selectWeapons, 2, 'select_weapons_for_vehicle ${1} ${2}', {false, false})
-- INI: 084E=2,flying_vehicle %1d% use_primary_gun %2h%
Opcode.register(0x084e, SanAndreasOpcodeCar.setCanBeTargeted, 2, 'set_vehicle_can_be_targetted ${1} ${2}', {false, false})
-- INI: 0852=2,set_car %1d% damages_visible %2h%
Opcode.register(0x0852, SanAndreasOpcodeCar.setCanBeVisiblyDamaged, 2, 'set_car_can_be_visibly_damaged ${1} ${2}', {false, false})
-- INI: 085E=2,assign_car %1d% to_looped_path %2d%
Opcode.register(0x085e, SanAndreasOpcodeCar.startPlaybackLooped, 2, 'start_playback_recorded_car_looped ${1} ${2}', {false, false})
-- INI: 0878=2,set_car %1d% dirt_level %2d%
Opcode.register(0x0878, SanAndreasOpcodeCar.setDirtLevel, 2, 'set_vehicle_dirt_level ${1} ${2}', {false, false})
-- INI: 088B=2,set_car %1d% form_drag_multiplier_to %2d%
Opcode.register(0x088b, SanAndreasOpcodeCar.setAirResistanceMultiplier, 2, 'set_vehicle_air_resistance_multiplier ${1} ${2}', {false, false})
-- INI: 088C=4,put_car %1d% at %2d% %3d% %4d% ; versionB
Opcode.register(0x088c, SanAndreasOpcodeCar.setCoordinatesNoOffset, 4, 'set_car_coordinates_no_offset ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0897=2,  car %1d% collided_with_object %2d%
Opcode.register(0x0897, SanAndreasOpcodeCar.isTouchingObject, 2, 'is_vehicle_touching_object ${1} ${2}', {false, false})
-- INI: 08A4=2,set_car %1d% extra_parts_angle_to %2d%
Opcode.register(0x08a4, SanAndreasOpcodeCar.controlMovablePart, 2, 'control_movable_vehicle_part ${1} ${2}', {false, false})
-- INI: 08A5=2,set_car %1d% attractive_to_magnet %2h%
Opcode.register(0x08a5, SanAndreasOpcodeCar.winchCanPickUp, 2, 'winch_can_pick_vehicle_up ${1} ${2}', {false, false})
-- INI: 08A6=3,set_car %1d% door %2h% rotation_to %3d%
Opcode.register(0x08a6, SanAndreasOpcodeCar.openDoorABit, 3, 'open_car_door_a_bit ${1} ${2} ${3}', {false, false, false})
-- INI: 08A7=2,  car %1d% componentB %2h% opened_or_not_present
Opcode.register(0x08a7, SanAndreasOpcodeCar.isDoorFullyOpen, 2, 'is_car_door_fully_open ${1} ${2}', {false, false})
-- INI: 08CB=4,explode_car %1d% shake %2h% effect %3h% sound %4h%
Opcode.register(0x08cb, SanAndreasOpcodeCar.explodeInCutsceneShakeAndBits, 4, 'explode_car_in_cutscene_shake_and_bits ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 08EC=2,%2d% = car %1d% class
Opcode.register(0x08ec, SanAndreasOpcodeCar.getClass, 2, '${2} = get_vehicle_class ${1}', {false, true})
-- INI: 08F2=2,set_car %1d% targettable_by_heatseeker %2h%
Opcode.register(0x08f2, SanAndreasOpcodeCar.canBeTargetedByHsMissile, 2, 'vehicle_can_be_targetted_by_hs_missile ${1} ${2}', {false, false})
-- INI: 08F3=2,set_car %1d% contains_goodies %2h%
Opcode.register(0x08f3, SanAndreasOpcodeCar.setFreebies, 2, 'set_freebies_in_vehicle ${1} ${2}', {false, false})
-- INI: 0918=2,set_car %1d% engine_operation %2h%
Opcode.register(0x0918, SanAndreasOpcodeCar.setEngineOn, 2, 'set_car_engine_on ${1} ${2}', {false, false})
-- INI: 0919=2,enable_car %1d% parking_lights %2h%
Opcode.register(0x0919, SanAndreasOpcodeCar.setLightsOn, 2, 'set_car_lights_on ${1} ${2}', {false, false})
-- INI: 0939=8,attach_car %1d% to_object %2d% with_offset %3d% %4d% %5d% rotation %6d% %7d% %8d%
Opcode.register(0x0939, SanAndreasOpcodeCar.attachToObject, 8, 'attach_car_to_object ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0957=2,set_car %1d% provides_cover_from_gunfire %2h%
Opcode.register(0x0957, SanAndreasOpcodeCar.doesProvideCover, 2, 'vehicle_does_provide_cover ${1} ${2}', {false, false})
-- INI: 095E=4,set_car %1d% door %2h% unlatch %3h% angle %4d%
Opcode.register(0x095e, SanAndreasOpcodeCar.controlDoor, 4, 'control_car_door ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 095F=3,get_car %1d% door %2h% angle_to %3d%
Opcode.register(0x095f, SanAndreasOpcodeCar.getDoorAngleRatio, 3, '${3} = get_door_angle_ratio ${1} ${2}', {false, false, true})
-- INI: 0969=1,  car %1d% is_big
Opcode.register(0x0969, SanAndreasOpcodeCar.isBig, 1, 'is_big_vehicle ${1}', {false})
-- INI: 096B=0,save_current_modparts
Opcode.register(0x096b, SanAndreasOpcodeCar.storeModState, 0, 'store_car_mod_state', {})
-- INI: 096C=0,restore_current_modparts
Opcode.register(0x096c, SanAndreasOpcodeCar.restoreModState, 0, 'restore_car_mod_state', {})
-- INI: 096D=3,get_car %1d% component_on_slot %2h% model_to %3d%
Opcode.register(0x096d, SanAndreasOpcodeCar.getCurrentMod, 3, '${3} = get_current_car_mod ${1} ${2}', {false, false, true})
-- INI: 096E=1,  car %1d% lowrider
Opcode.register(0x096e, SanAndreasOpcodeCar.isLowRider, 1, 'is_car_low_rider ${1}', {false})
-- INI: 096F=1,  car %1d% street_racing_car
Opcode.register(0x096f, SanAndreasOpcodeCar.isStreetRacer, 1, 'is_car_street_racer ${1}', {false})
-- INI: 0975=1,  car %1d% emergency_vehicle
Opcode.register(0x0975, SanAndreasOpcodeCar.isEmergencyServices, 1, 'is_emergency_services_vehicle ${1}', {false})
-- INI: 097D=2,get_car %1d% number_of_color_indices_to %2h%
Opcode.register(0x097d, SanAndreasOpcodeCar.getNumColors, 2, '${2} = get_num_car_colours ${1}', {false, true})
-- INI: 0987=2,get_car_blocking_car %1d% store_to %2d%
Opcode.register(0x0987, SanAndreasOpcodeCar.getBlockingCar, 2, '${2} = get_car_blocking_car ${1}', {false, true})
-- INI: 0988=2,get_car %1d% paintjob %2d%
Opcode.register(0x0988, SanAndreasOpcodeCar.getCurrentPaintjob, 2, '${2} = get_current_vehicle_paintjob ${1}', {false, true})
-- INI: 098D=2,get_car %1d% extra_parts_angle %2d%
Opcode.register(0x098d, SanAndreasOpcodeCar.getMovingComponentOffset, 2, '${1} = get_car_moving_component_offset ${2}', {false, false})
-- INI: 099A=2,set_car %1d% collision_detection %2h%
Opcode.register(0x099a, SanAndreasOpcodeCar.setCollision, 2, 'set_car_collision ${1} ${2}', {false, false})
-- INI: 099B=1,unknown_enable_car %1d% collision_on_path
Opcode.register(0x099b, SanAndreasOpcodeCar.changePlaybackToUseAi, 1, 'change_playback_to_use_ai ${1}', {false})
-- INI: 09AB=2,set_passengers_in_car %1d% speak_from_audio_table %2h% ; similar to 0947
Opcode.register(0x09ab, SanAndreasOpcodeCar.randomPassengerSay, 2, 'random_passenger_say ${1} ${2}', {false, false})
-- INI: 09B0=2,set_car %1d% accessible_for_player_using_controller %2h%
Opcode.register(0x09b0, SanAndreasOpcodeCar.setIsConsideredByPlayer, 2, 'set_vehicle_is_considered_by_player ${1} ${2}', {false, false})
-- INI: 09B3=2,get_car %1d% door_status %2d%
Opcode.register(0x09b3, SanAndreasOpcodeCar.getDoorLockStatus, 2, '${1} = get_car_door_lock_status ${2}', {false, false})
-- INI: 09BB=2,  car %1d% has_visible_damage_on_component %2h%
Opcode.register(0x09bb, SanAndreasOpcodeCar.isDoorDamaged, 2, 'is_car_door_damaged ${1} ${2}', {false, false})
-- INI: 09C4=2,set_car %1d% gas_tank_explosion_enabled %2h%
Opcode.register(0x09c4, SanAndreasOpcodeCar.setPetrolTankWeakpoint, 2, 'set_petrol_tank_weakpoint ${1} ${2}', {false, false})
-- INI: 09CB=2,  vehicle %1d% colliding_with_vehicle %2d%
Opcode.register(0x09cb, SanAndreasOpcodeCar.isTouchingCar, 2, 'is_car_touching_car ${1} ${2}', {false, false})
-- INI: 09D0=1,  car %1d% on_wheels
Opcode.register(0x09d0, SanAndreasOpcodeCar.isOnAllWheels, 1, 'is_vehicle_on_all_wheels ${1}', {false})
-- INI: 09E1=2,get_car_model %1o% price_to %2d%
Opcode.register(0x09e1, SanAndreasOpcodeCar.getModelValue, 2, '${1} = get_car_model_value ${vehicle.2}', {false, false})
-- INI: 09E9=1,car %1d% set_single_nitro
Opcode.register(0x09e9, SanAndreasOpcodeCar.giveNonPlayerNitro, 1, 'give_non_player_car_nitro ${1}', {false})
-- INI: 09FE=1,reset_hydraulics_on_car %1d%
Opcode.register(0x09fe, SanAndreasOpcodeCar.resetHydraulics, 1, 'reset_vehicle_hydraulics ${1}', {false})
-- INI: 0A11=3,set_car %1d% tertiary_color_to %2d% quaternary_color_to %3d%
Opcode.register(0x0a11, SanAndreasOpcodeCar.setExtraColors, 3, 'set_extra_car_colours ${1} ${2} ${3}', {false, false, false})
-- INI: 0A12=3,get_car %1d% tertiary_color_to %2d% quaternary_color_to %3d%
Opcode.register(0x0a12, SanAndreasOpcodeCar.getExtraColors, 3, '${1}, ${2} = get_extra_car_colours ${3}', {false, false, false})
-- INI: 0A15=1,  is_car_affected_by_cheats %1d%
Opcode.register(0x0a15, SanAndreasOpcodeCar.hasBeenResprayed, 1, 'has_car_been_resprayed ${1}', {false})
-- INI: 0A21=2,set_car %1d% not_affected_by_cheats %2h%
Opcode.register(0x0a21, SanAndreasOpcodeCar.improveByCheating, 2, 'improve_car_by_cheating ${1} ${2}', {false, false})
-- INI: 0A30=1,repair_car %1d%
Opcode.register(0x0a30, SanAndreasOpcodeCar.fix, 1, 'fix_car ${1}', {false})
-- INI: 0AB7=2,get_car %1d% number_of_gears_to %2d%
Opcode.register(0x0ab7, SanAndreasOpcodeCar.getNumberOfGears, 2, '${2} = get_car_number_of_gears ${1}', {false, true})
-- INI: 0AB8=2,get_car %1d% current_gear_to %2d%
Opcode.register(0x0ab8, SanAndreasOpcodeCar.getCurrentGear, 2, '${2} = get_car_current_gear ${1}', {false, true})
-- INI: 0ABD=1,  car %1d% siren_on
Opcode.register(0x0abd, SanAndreasOpcodeCar.isSirenOn, 1, 'is_car_siren_on ${1}', {false})
-- INI: 0ABE=1,  car %1d% engine_on
Opcode.register(0x0abe, SanAndreasOpcodeCar.isEngineOn, 1, 'is_car_engine_on ${1}', {false})
-- INI: 0ABF=2,set_car %1d% engine_state_to %2d%
Opcode.register(0x0abf, SanAndreasOpcodeCar.cleoSetEngineOn, 2, 'cleo_set_car_engine_on ${1} ${2}', {false, false})
-- INI: 0D0F=2,set_car %1d% model_alpha %2d% // IF and SET
Opcode.register(0x0d0f, SanAndreasOpcodeCar.setModelAlpha, 2, 'set_car_model_alpha ${1} ${2}', {false, false})
-- INI: 0D33=3,set_car %1d% door %2d% window_state %3d%
Opcode.register(0x0d33, SanAndreasOpcodeCar.setDoorWindowState, 3, 'set_car_door_window_state ${1} ${2} ${3}', {false, false, false})
-- INI: 0E00=2,get_car_alarm %1d% mode_to %2d%
Opcode.register(0x0e00, SanAndreasOpcodeCar.getAlarm, 2, '${2} = get_car_alarm ${1}', {false, true})
-- INI: 0E08=1,is_car_script_controlled %1d%
Opcode.register(0x0e08, SanAndreasOpcodeCar.isScriptControlled, 1, 'is_car_script_controlled ${1}', {false})
-- INI: 0E09=1,mark_car_as_needed %1d%
Opcode.register(0x0e09, SanAndreasOpcodeCar.markAsNeeded, 1, 'mark_car_as_needed ${1}', {false})
-- INI: 0E12=2,get_vehicle %1d% subclass_to %2d%
Opcode.register(0x0e12, SanAndreasOpcodeCar.getSubclass, 2, '${2} = get_vehicle_subclass ${1}', {false, true})
-- INI: 0E17=3,init_extended_car_vars %1d% id %2d% new_vars %3d%
Opcode.register(0x0e17, SanAndreasOpcodeCar.initExtendedVars, 3, 'init_extended_car_vars ${1} ${2} ${3}', {false, false, false})
-- INI: 0E18=4,set_extended_car_var %1d% id %2d% var %3d% value %4d%
Opcode.register(0x0e18, SanAndreasOpcodeCar.setExtendedVar, 4, 'set_extended_car_var ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0E19=4,get_extended_car_var %1d% id %2d% var %3d% to %4d%
Opcode.register(0x0e19, SanAndreasOpcodeCar.getExtendedCarVar, 4, '${4} = get_extended_car_var ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0E59=2,get_trailer_from_car %1d% trailer %2d%
Opcode.register(0x0e59, SanAndreasOpcodeCar.getTrailer, 2, '${2} = get_trailer_from_car ${1}', {false, true})
-- INI: 0E5A=2,get_car_from_trailer %1d% store_to %2d%
Opcode.register(0x0e5a, SanAndreasOpcodeCar.getTractor, 2, '${2} = get_car_from_trailer ${1}', {false, true})
-- INI: 0E5B=7,get_car_dummy_coord %1d% dummy %2d% world_coords %3d% invert_x %4d% store_to %5d% %6d% %7d% // same as NewOpcodes but this is adapted to VehFuncs
Opcode.register(0x0e5b, SanAndreasOpcodeCar.getDummyCoord, 7, '${5}, ${6}, ${7} = get_car_dummy_coord ${1} ${2} ${3} ${4}', {false, false, false, false, true, true, true})
-- INI: 0E5F=1,car_horn %1d%
Opcode.register(0x0e5f, SanAndreasOpcodeCar.playHorn, 1, 'car_horn ${1}', {false})
-- INI: 0E61=2,set_car_alarm %1d% mode %2d%
Opcode.register(0x0e61, SanAndreasOpcodeCar.setAlarm, 2, 'set_car_alarm ${1} ${2}', {false, false})
-- INI: 0E65=2,get_car_collision_intensity %1d% store_to %2d%
Opcode.register(0x0e65, SanAndreasOpcodeCar.getCollisionIntensity, 2, '${2} = get_car_collision_intensity ${1}', {false, true})
-- INI: 0E66=4,get_car_collision_coordinates %1d% store_to %2d% %3d% %4d%
Opcode.register(0x0e66, SanAndreasOpcodeCar.getCollisionCoordinates, 4, '${2}, ${3}, ${4} = get_car_collision_coordinates ${1}', {false, true, true, true})
-- INI: 0E82=2,does_car_have_part_node %1d% %2d%
Opcode.register(0x0e82, SanAndreasOpcodeCar.doesHavePartNode, 2, 'does_car_have_part_node ${1} ${2}', {false, false})
-- INI: 0E90=2,get_car_collision_surface %1d% store_to %2d%
Opcode.register(0x0e90, SanAndreasOpcodeCar.getCollisionSurface, 2, '${2} = get_car_collision_surface ${1}', {false, true})
-- INI: 0E91=2,get_car_collision_lighting %1d% store_to %2d%
Opcode.register(0x0e91, SanAndreasOpcodeCar.getCollisionLighting, 2, '${2} = get_car_collision_lighting ${1}', {false, true})
-- INI: 0E93=1,is_car_really_in_air %1d%
Opcode.register(0x0e93, SanAndreasOpcodeCar.isReallyInAir, 1, 'is_car_really_in_air ${1}', {false})
-- INI: 0EAD=6,get_car_proofs %1d% bullet %2d% fire %3d% explosion %4d% collision %5d% melee %6d%
Opcode.register(0x0ead, SanAndreasOpcodeCar.getProofs, 6, '${2}, ${3}, ${4}, ${5}, ${6} = get_car_proofs ${1}', {false, true, true, true, true, true})
-- INI: 0EB4=4,set_car_coordinates_simple %1d% position %2d% %3d% %4d%
Opcode.register(0x0eb4, SanAndreasOpcodeCar.setCoordinatesSimple, 4, 'set_car_coordinates_simple ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0EB6=4,get_car_weapon_damage_last_frame %1d% char %2d% type %3d% intensity %4d%
Opcode.register(0x0eb6, SanAndreasOpcodeCar.getWeaponDamageLastFrame, 4, '${2}, ${3}, ${4} = get_car_weapon_damage_last_frame ${1}', {false, true, true, true})
-- INI: 0EC9=2,get_car_random_seed %1d% store_to %2d%
Opcode.register(0x0ec9, SanAndreasOpcodeCar.getRandomSeed, 2, '${1} = get_car_random_seed ${2}', {true, false})
-- INI: 0ECD=2,dont_delete_car_until_time %1d% %2d%
Opcode.register(0x0ecd, SanAndreasOpcodeCar.dontDeleteUntilTime, 2, 'dont_delete_car_until_time ${1} ${2}', {false, false})
-- INI: 0ECF=2,get_time_car_is_dead %1d% store_to %2d%
Opcode.register(0x0ecf, SanAndreasOpcodeCar.getTimeIsDead, 2, '${1} = get_time_car_is_dead ${2}', {true, false})
-- INI: 0EE7=3,locate_car_distance_to_object %1d% object %2d% radius %3d%
Opcode.register(0x0ee7, SanAndreasOpcodeCar.locateDistanceToObject, 3, 'locate_car_distance_to_object ${1} ${2} ${3}', {false, false, false})
-- INI: 0EE8=3,locate_car_distance_to_car %1d% car %2d% radius %3d%
Opcode.register(0x0ee8, SanAndreasOpcodeCar.locateDistanceToCar, 3, 'locate_car_distance_to_car ${1} ${2} ${3}', {false, false, false})
-- INI: 0EEB=5,locate_car_distance_to_coordinates %1d% pos %2d% %3d% %4d% radius %5d%
Opcode.register(0x0eeb, SanAndreasOpcodeCar.locateDistanceToCoordinates, 5, 'locate_car_distance_to_coordinates ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0EF5=1,is_car_owned_by_player %1d%
Opcode.register(0x0ef5, SanAndreasOpcodeCar.isOwnedByPlayer, 1, 'is_car_owned_by_player ${1}', {false})
-- INI: 0EF6=2,set_car_owned_by_player %1d% %2d%
Opcode.register(0x0ef6, SanAndreasOpcodeCar.setOwnedByPlayer, 2, 'set_car_owned_by_player ${1} ${2}', {false, false})
-- INI: 0EF9=2,get_car_animgroup %1d% store_to %2d%
Opcode.register(0x0ef9, SanAndreasOpcodeCar.getAnimGroup, 2, '${1} = get_car_animgroup ${2}', {true, false})
-- INI: 0EFB=1,is_car_double_convertible %1d%
Opcode.register(0x0efb, SanAndreasOpcodeCar.isConvertible, 1, 'is_car_convertible ${1}', {false})
-- INI: 0EFC=2,get_car_value %1d% store_to %2d%
Opcode.register(0x0efc, SanAndreasOpcodeCar.getValue, 2, '${1} = get_car_value ${2}', {true, false})
-- INI: 0EFD=3,get_car_pedals %1d% gas_to %2d% break_to %3d%
Opcode.register(0x0efd, SanAndreasOpcodeCar.getPedals, 3, '${1}, ${2} = get_car_pedals ${3}', {false, false, false})
-- INI: 0D0C=3,get_car %1d% component %2s% matrix_to %3d% // IF and SET
Opcode.register(0x0d0c, SanAndreasOpcodeCar.getComponentMatrix, 3, '${3} = get_car_component_matrix ${1} ${2}', {false, false, true})
-- INI: 0D0D=3,%3d% = get_car %1d% component %2s% // IF and SET
Opcode.register(0x0d0d, SanAndreasOpcodeCar.getComponent, 3, '${3} = get_car_component ${1} ${2}', {false, false, true})
-- INI: 0D12=3,set_car %1d% component %2s% alpha %3d% // IF and SET
Opcode.register(0x0d12, SanAndreasOpcodeCar.setComponentModelAlpha, 3, 'set_car_component_model_alpha ${1} ${2} ${3}', {false, false, false})
