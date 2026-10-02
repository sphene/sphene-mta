SharedOpcodeCar = {}
SharedOpcodeCar.__index = SharedOpcodeCar

-- Opcode: 0x00A5
-- Instruction: [var handle: Car] = create_car {modelId} [model_vehicle] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00A5
function SharedOpcodeCar.create(model, posX, posY, posZ, _)
    local car = VehicleElement:create(model)
    car:spawn(posX, posY, posZ)

    if Thread.currentThread and Thread.currentThread:isMissionThread() then
        Thread.currentThread:addToCleanupList(car)
    end

    return car
end

-- Opcode: 0x00A6
-- Instruction: delete_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00A6
function SharedOpcodeCar.delete(car)
    if (type(car) ~= "table") then
        return false
    end

    if Thread.currentThread then
        Thread.currentThread:removeFromCleanupList(car)
    end

    return car:destroy()
end

-- Opcode: 0x00A7
-- Instruction: car_goto_coordinates [Car] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00A7
function SharedOpcodeCar.gotoCoordinates(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00A8
-- Instruction: car_wander_randomly [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00A8
function SharedOpcodeCar.wanderRandomly(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00A9
-- Instruction: car_set_idle [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00A9
function SharedOpcodeCar.setIdle(car)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x00AA
-- Instruction: [var x: float], [var y: float], [var z: float] = get_car_coordinates [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00AA
function SharedOpcodeCar.getCoordinates(car, _, _, _)
    local x, y, z = 0, 0, 0

    if (type(car) == "table") then
        x, y, z = car:getPosition()
    end

    return x, y, z
end

-- Opcode: 0x00AB
-- Instruction: set_car_coordinates [Car] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00AB
function SharedOpcodeCar.setCoordinates(car, x, y, z)
    car:setPosition(x, y, z)
end

-- Opcode: 0x00AD
-- Instruction: set_car_cruise_speed [Car] {maxSpeed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00AD
function SharedOpcodeCar.setCruiseSpeed()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x00AE
-- Instruction: set_car_driving_style [Car] {drivingStyle} [DrivingMode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00AE
function SharedOpcodeCar.setDrivingStyle()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x00AF
-- Instruction: set_car_mission [Car] {carMission} [CarMission]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00AF
function SharedOpcodeCar.setMission()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x00B0
-- Instruction: is_car_in_area_2d [Car] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00B0
function SharedOpcodeCar.isInArea2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00B1
-- Instruction: is_car_in_area_3d [Car] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00B1
function SharedOpcodeCar.isInArea3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0119
-- Instruction: is_car_dead {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0119
function SharedOpcodeCar.isDead(car)
    if (type(car) ~= "table") then
        return true
    end

    return car:isBlown()
end

-- Opcode: 0x0137
-- Instruction: is_car_model [Car] {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0137
function SharedOpcodeCar.isModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0174
-- Instruction: [var heading: float] = get_car_heading [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0174
function SharedOpcodeCar.getHeading(car, _)
    local _, _, zAngle = car:getRotation()
    return zAngle
end

-- Opcode: 0x0175
-- Instruction: set_car_heading [Car] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0175
function SharedOpcodeCar.setHeading(car, zAngle)
    local rotX, rotY, _ = car:getRotation()
    return car:setRotation(rotX, rotY, zAngle)
end

-- Opcode: 0x0185
-- Instruction: is_car_health_greater [Car] {health} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0185
function SharedOpcodeCar.isHealthGreater(car, health)
    return car:getHealth() >= health
end

-- Opcode: 0x018F
-- Instruction: is_car_stuck_on_roof [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/018F
function SharedOpcodeCar.isStuckOnRoof(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0190
-- Instruction: add_upsidedown_car_check [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0190
function SharedOpcodeCar.addUpsidedownCheck(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0191
-- Instruction: remove_upsidedown_car_check [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0191
function SharedOpcodeCar.removeUpsidedownCheck(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01AB
-- Instruction: is_car_stopped_in_area_2d [Car] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01AB
function SharedOpcodeCar.isStoppedInArea2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01AC
-- Instruction: is_car_stopped_in_area_3d [Car] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01AC
function SharedOpcodeCar.isStoppedInArea3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01AD
-- Instruction: locate_car_2d [Car] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01AD
function SharedOpcodeCar.locate2D(car, posX, posY, xRadius, yRadius, showSphere)
    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, nil, xRadius)
    end

    local carX, carY, _ = car:getPosition()

    if ((carX >= (posX - (xRadius / 2)) and carX <= (posX + (xRadius / 2))) and
        (carY >= (posY - (yRadius / 2)) and carY <= (posY + (yRadius / 2)))) then
        return true
    end

    return false
end

-- Opcode: 0x01AE
-- Instruction: locate_stopped_car_2d [Car] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01AE
function SharedOpcodeCar.locateStopped2D(car, posX, posY, xRadius, yRadius, showSphere)
    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, nil, xRadius)
    end

    local carX, carY, _ = car:getPosition()
    local carVelX, carVelY, carVelZ = car:getVelocity()

    if ((carX >= (posX - (xRadius / 2)) and carX <= (posX + (xRadius / 2))) and
        (carY >= (posY - (yRadius / 2)) and carY <= (posY + (yRadius / 2))) and
        (carVelX == 0 and carVelY == 0 and carVelZ == 0)) then
        return true
    end

    return false
end

-- Opcode: 0x01AF
-- Instruction: locate_car_3d [Car] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01AF
function SharedOpcodeCar.locate3D(car, posX, posY, posZ, xRadius, yRadius, zRadius, showSphere)
    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, posZ, xRadius)
    end

    local carX, carY, carZ = car:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, carX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, carY) < yRadius
        and getDistanceBetweenPoints3D(0, 0, posZ, 0, 0, carZ) < zRadius) then
        return true
    end

    return false
end

-- Opcode: 0x01B0
-- Instruction: locate_stopped_car_3d [Car] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01B0
function SharedOpcodeCar.locateStopped3D(car, posX, posY, posZ, xRadius, yRadius, zRadius, showSphere)
    if (opcodes[0x00FE](car, posX, posY, posZ, xRadius, yRadius, zRadius, showSphere)) then
        local velX, velY, velZ = car:getVelocity()

        if (velX == 0 and velY == 0 and velZ == 0) then
            return true
        end
    end

    return false
end

-- Opcode: 0x01C1
-- Instruction: is_car_stopped [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01C1
function SharedOpcodeCar.isStopped(car)
    return car:isStopped()
end

-- Opcode: 0x01C3
-- Instruction: mark_car_as_no_longer_needed [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01C3
function SharedOpcodeCar.markAsNoLongerNeeded(car)
    if (type(car) ~= "table") then
        return
    end

    if (Thread.currentThread and Thread.currentThread:isMissionThread()) then
        Thread.currentThread:removeFromCleanupList(car)
    end
    --car:removeReferences()

    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x01E9
-- Instruction: [var count: int] = get_number_of_passengers [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01E9
function SharedOpcodeCar.getNumberOfPassengers(car, _)
    return car:getPassengerCount()
end

-- Opcode: 0x01EA
-- Instruction: [var count: int] = get_maximum_number_of_passengers [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01EA
function SharedOpcodeCar.getMaximumNumberOfPassengers(car, _)
    return car:getMaxPassengers()
end

-- Opcode: 0x01EC
-- Instruction: set_car_heavy [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01EC
function SharedOpcodeCar.setHeavy(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x01F3
-- Instruction: is_car_in_air_proper [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01F3
function SharedOpcodeCar.isInAirProper(car)
    return car:inAir()
end

-- Opcode: 0x01F4
-- Instruction: is_car_upsidedown [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01F4
function SharedOpcodeCar.isUpsidedown(car)
    return car:isFlipped()
end

-- Opcode: 0x020A
-- Instruction: lock_car_doors [Car] {lockStatus} [CarLock]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/020A
function SharedOpcodeCar.lockDoors()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x020B
-- Instruction: explode_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/020B
function SharedOpcodeCar.explode(car)
    car:blow(true)
end

-- Opcode: 0x020D
-- Instruction: is_car_upright [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/020D
function SharedOpcodeCar.isUpright(car)
    return not car:isFlipped()
end

-- Opcode: 0x0216
-- Instruction: set_taxi_lights [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0216
function SharedOpcodeCar.setTaxiLights(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0224
-- Instruction: set_car_health [Car] {health} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0224
function SharedOpcodeCar.setHealth(car, health)
    return car:setHealth(health)
end

-- Opcode: 0x0227
-- Instruction: [var health: int] = get_car_health [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0227
function SharedOpcodeCar.getHealth(car, _)
    if (type(car) ~= "table") then
        return 0
    end

    return car:getHealth()
end

-- Opcode: 0x0229
-- Instruction: change_car_colour [Car] {color1} [int] {color2} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0229
function SharedOpcodeCar.changeColor(car, primaryColor, secondaryColor)
    primaryColor = VehicleElement.getColorFromPalette(primaryColor)
    secondaryColor = VehicleElement.getColorFromPalette(secondaryColor)

    if (not primaryColor or not secondaryColor) then
        return false
    end

    car:setColor(primaryColor.r, primaryColor.g, primaryColor.b,
        secondaryColor.r, secondaryColor.g, secondaryColor.b)

    return true
end

-- Opcode: 0x0294
-- Instruction: set_can_respray_car [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0294
function SharedOpcodeCar.setCanRespray(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02AA
-- Instruction: set_car_only_damaged_by_player [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02AA
function SharedOpcodeCar.setOnlyDamagedByPlayer(car, toggle)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02AC
-- Instruction: set_car_proofs [Car] {bulletProof} [bool] {fireProof} [bool] {explosionProof} [bool] {collisionProof} [bool] {meleeProof} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02AC
function SharedOpcodeCar.setProofs()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02BF
-- Instruction: is_car_in_water [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02BF
function SharedOpcodeCar.isInWater(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02C2
-- Instruction: car_goto_coordinates_accurate [Car] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02C2
function SharedOpcodeCar.gotoCoordinatesAccurate(_, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02CA
-- Instruction: is_car_on_screen [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02CA
function SharedOpcodeCar.isOnScreen(_)
   Script.setOpcodePartiallyImplemented()
   return true
end

-- Opcode: 0x02E3
-- Instruction: [var speed: float] = get_car_speed [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02E3
function SharedOpcodeCar.getSpeed(car, _)
   return car:getSpeed()
end

-- Opcode: 0x02F8
-- Instruction: [var x: float] = get_car_forward_x [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02F8
function SharedOpcodeCar.getForwardX(vehicle, _)
    local _, _, zAngle = vehicle:getRotation()
    return math.sin(zAngle)
end

-- Opcode: 0x02F9
-- Instruction: [var y: float] = get_car_forward_y [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02F9
function SharedOpcodeCar.getForwardY(vehicle, _)
    local _, _, zAngle = vehicle:getRotation()
    return math.cos(zAngle)
end

-- Opcode: 0x031E
-- Instruction: has_car_been_damaged_by_weapon [Car] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/031E
function SharedOpcodeCar.hasBeenDamagedByWeapon(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0397
-- Instruction: switch_car_siren [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0397
function SharedOpcodeCar.switchSiren(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x039C
-- Instruction: set_car_watertight [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/039C
function SharedOpcodeCar.setWatertight(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x039F
-- Instruction: turn_car_to_face_coord [Car] {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/039F
function SharedOpcodeCar.turnToFaceCoord(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03A2
-- Instruction: set_car_status [Car] {status} [EntityStatus]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03A2
function SharedOpcodeCar.setStatus()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03AB
-- Instruction: set_car_strong [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03AB
function SharedOpcodeCar.setStrong()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03ED
-- Instruction: set_upsidedown_car_not_damaged [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03ED
function SharedOpcodeCar.setUpsidedownNotDamaged()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03F3
-- Instruction: [var color1: int], [var color2: int] = get_car_colours [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03F3
function SharedOpcodeCar.getColors(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03F5
-- Instruction: set_car_can_be_damaged [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03F5
function SharedOpcodeCar.setCanBeDamaged(car, damageable)
    return car:setDamageProof(not damageable)
end

-- Opcode: 0x0407
-- Instruction: [var x: float], [var y: float], [var z: float] = get_offset_from_car_in_world_coords [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0407
function SharedOpcodeCar.getOffsetInWorldCoords(car, offsetX, offsetY, offsetZ, _, _, _)
    local posX, posY, posZ = 0, 0, 0

    if (type(car) == "table") then
        posX, posY, posZ = car:getPosition()
    end

    return posX + offsetX, posY + offsetY, posZ + offsetZ
end

-- Opcode: 0x0423
-- Instruction: set_car_traction [Car] {traction} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0423
function SharedOpcodeCar.setTraction()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0428
-- Instruction: set_car_avoid_level_transitions [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0428
function SharedOpcodeCar.setAvoidLevelTransitions(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0431
-- Instruction: is_car_passenger_seat_free [Car] {seat} [SeatId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0431
function SharedOpcodeCar.isPassengerSeatFree(car, seat)
    if (car:getOccupant(seat + 1) == false) then
        return true
    end

    return false
end

-- Opcode: 0x0441
-- Instruction: [var modelId: model_vehicle] = get_car_model [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0441
function SharedOpcodeCar.getModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0466
-- Instruction: set_car_stay_in_fast_lane [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0466
function SharedOpcodeCar.setStayInFastLane(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0468
-- Instruction: clear_car_last_weapon_damage [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0468
function SharedOpcodeCar.clearLastWeaponDamage(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x046C
-- Instruction: [var handle: Char] = get_driver_of_car [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/046C
function SharedOpcodeCar.getDriver(car, _)
   return car:getOccupant(0) or -1
end

-- Opcode: 0x0477
-- Instruction: set_car_temp_action [Car] {actionId} [TempAction] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0477
function SharedOpcodeCar.setTempAction(_, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x048B
-- Instruction: set_car_random_route_seed [Car] {routeSeed} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/048B
function SharedOpcodeCar.setRandomRouteSeed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0495
-- Instruction: is_car_on_fire [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0495
function SharedOpcodeCar.isOnFire(car)
    return (car:getHealth() <= 250)
end

-- Opcode: 0x0496
-- Instruction: is_car_tyre_burst [Car] {tireId} [WheelId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0496
function SharedOpcodeCar.isTireBurst(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04BA
-- Instruction: set_car_forward_speed [Car] {forwardSpeed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04BA
function SharedOpcodeCar.setForwardSpeed(car, speed)
    Script.setOpcodePartiallyImplemented()
    return car:setSpeed(speed)
end

-- Opcode: 0x04BD
-- Instruction: mark_car_as_convoy_car [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04BD
function SharedOpcodeCar.markAsConvoyCar(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x04E0
-- Instruction: set_car_straight_line_distance [Car] {distance} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04E0
function SharedOpcodeCar.setStraightLineDistance()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x04E1
-- Instruction: pop_car_boot [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04E1
function SharedOpcodeCar.popBoot(car)
    car:setDoorOpenRatio(1, 1)
end

-- Opcode: 0x04F1
-- Instruction: is_car_waiting_for_world_collision [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04F1
function SharedOpcodeCar.isWaitingForWorldCollision(car)
Script.setOpcodePartiallyImplemented()
return false
end

-- Opcode: 0x04FE
-- Instruction: burst_car_tyre [Car] {tireId} [WheelId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04FE
function SharedOpcodeCar.burstTire(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0506
-- Instruction: set_car_model_components {_unused} [model_vehicle] {component1} [int] {component2} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0506
function SharedOpcodeCar.setModelComponents(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0508
-- Instruction: close_all_car_doors [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0508
function SharedOpcodeCar.closeAllDoors(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0519
-- Instruction: freeze_car_position [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0519
function SharedOpcodeCar.freezePosition(car, frozen)
    return car:setFrozen((frozen == 1) and true or false)
end

-- Opcode: 0x053F
-- Instruction: set_can_burst_car_tyres [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/053F
function SharedOpcodeCar.setCanBurstTires()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0574
-- Instruction: freeze_car_position_and_dont_load_collision [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0574
function SharedOpcodeCar.freezePositionAndDontLoadCollision(car, frozen)
    car:setFrozen((frozen == 1) and true or false)
end

-- Opcode: 0x0587
-- Instruction: set_load_collision_for_car_flag [Car] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0587
function SharedOpcodeCar.setLoadCollisionFlag(car, frozen)
    car:setCollisionsEnabled((frozen == 1) and true or false)
end

-- Opcode: 0x0594
-- Instruction: set_vehicle_to_fade_in [Car] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0594
function SharedOpcodeCar.setToFadeIn(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 00a5=5,%5d% = create_car %1m% at %2d% %3d% %4d%
Opcode.register(0x00a5, SharedOpcodeCar.create, 5, '${5} = create_car ${vehicle.1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 00a6=1,destroy_car %1d%
Opcode.register(0x00a6, SharedOpcodeCar.delete, 1, 'delete_car ${1}', {false})
-- INI: 00a7=4,car %1d% drive_to %2d% %3d% %4d%
Opcode.register(0x00a7, SharedOpcodeCar.gotoCoordinates, 4, 'car_goto_coordinates ${1} ${2} ${3} ${4}', {false, true, false, false})
-- INI: 00a8=1,set_car %1d% to_psycho_driver
Opcode.register(0x00a8, SharedOpcodeCar.wanderRandomly, 1, 'car_wander_randomly ${1}', {false})
-- INI: 00a9=1,set_car %1d% to_normal_driver
Opcode.register(0x00a9, SharedOpcodeCar.setIdle, 1, 'car_set_idle ${1}', {false})
-- INI: 00aa=4,store_car %1d% position_to %2d% %3d% %4d%
Opcode.register(0x00aa, SharedOpcodeCar.getCoordinates, 4, '${2}, ${3}, ${4} = get_car_coordinates ${1}', {false, true, true, true})
-- INI: 00ab=4,put_car %1d% at %2d% %3d% %4d%
Opcode.register(0x00ab, SharedOpcodeCar.setCoordinates, 4, 'set_car_coordinates ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 00ad=2,set_car %1d% max_speed_to %2d%
Opcode.register(0x00ad, SharedOpcodeCar.setCruiseSpeed, 2, 'set_car_cruise_speed ${1} ${2}', {false, true})
-- INI: 00ae=2,set_vehicle %1d% traffic_behavior_to %2d%
Opcode.register(0x00ae, SharedOpcodeCar.setDrivingStyle, 2, 'set_car_driving_style ${1} ${2}', {false, true})
-- INI: 00af=2,set_car %1d% driver_behaviour_to %2d%
Opcode.register(0x00af, SharedOpcodeCar.setMission, 2, 'set_car_mission ${1} ${2}', {false, true})
-- INI: 00b0=6,  car %1d% %6b:in-sphere/%in_rectangle %2d% %3d% %4d% %5d%
Opcode.register(0x00b0, SharedOpcodeCar.isInArea2D, 6, 'is_car_in_area_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00b1=8,  car %1d% %8b:in-sphere/%in_cube %2d% %3d% %4d% %5d% %6d% %7d%
Opcode.register(0x00b1, SharedOpcodeCar.isInArea3D, 8, 'is_car_in_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0119=1,  car %1d% wrecked
Opcode.register(0x0119, SharedOpcodeCar.isDead, 1, 'is_car_dead ${1}', {false})
-- INI: 0137=2,  car %1d% model == %2m%
Opcode.register(0x0137, SharedOpcodeCar.isModel, 2, 'is_car_model ${1} ${vehicle.2}', {false, false})
-- INI: 0174=2,%2d% = car %1d% z_angle
Opcode.register(0x0174, SharedOpcodeCar.getHeading, 2, '${2} = get_car_heading ${1}', {false, true})
-- INI: 0175=2,set_car %1d% z_angle_to %2d%
Opcode.register(0x0175, SharedOpcodeCar.setHeading, 2, 'set_car_heading ${1} ${2}', {false, false})
-- INI: 0185=2,  car %1d% health > %2d%
Opcode.register(0x0185, SharedOpcodeCar.isHealthGreater, 2, 'is_car_health_greater ${1} ${2}', {false, false})
-- INI: 018f=1,  is_car_stuck_on_roof %1d%
Opcode.register(0x018f, SharedOpcodeCar.isStuckOnRoof, 1, 'is_car_stuck_on_roof ${1}', {false})
-- INI: 0190=1,add_car %1d% to_upsidedown_check
Opcode.register(0x0190, SharedOpcodeCar.addUpsidedownCheck, 1, 'add_upsidedown_car_check ${1}', {false})
-- INI: 0191=1,remove_car %1d% from_upsidedown_check
Opcode.register(0x0191, SharedOpcodeCar.removeUpsidedownCheck, 1, 'remove_upsidedown_car_check ${1}', {false})
-- INI: 01ab=6,  car %1d% stopped %6b:in-sphere/%in_rectangle %2d% %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x01ab, SharedOpcodeCar.isStoppedInArea2D, 6, 'is_car_stopped_in_area_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 01ac=8,  car %1d% stopped %8b:in-sphere/%in_cube %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x01ac, SharedOpcodeCar.isStoppedInArea3D, 8, 'is_car_stopped_in_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 01ad=6,  car %1d% sphere %6b% near_point %2d% %3d% radius %4d% %5d%
Opcode.register(0x01ad, SharedOpcodeCar.locate2D, 6, 'locate_car_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 01ae=6,  car %1d% stopped %6b:in-sphere/%near_point %2d% %3d% %4d% %5d%
Opcode.register(0x01ae, SharedOpcodeCar.locateStopped2D, 6, 'locate_stopped_car_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 01af=8,  car %1d% %8b:in-sphere/%near_point %2d% %3d% %4d% radius %5d% %6d% %7d%
Opcode.register(0x01af, SharedOpcodeCar.locate3D, 8, 'locate_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 01b0=8,  car %1d% stopped %8b:in-sphere/%near_point %2d% %3d% %4d% radius %5d% %6d% %7d%
Opcode.register(0x01b0, SharedOpcodeCar.locateStopped3D, 8, 'locate_stopped_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 01c1=1,  car %1d% stopped
Opcode.register(0x01c1, SharedOpcodeCar.isStopped, 1, 'is_car_stopped ${1}', {false})
-- INI: 01c3=1,mark_car_as_no_longer_needed %1d%
Opcode.register(0x01c3, SharedOpcodeCar.markAsNoLongerNeeded, 1, 'mark_car_as_no_longer_needed ${1}', {false})
-- INI: 01e9=2,%2d% = car %1d% num_passengers
Opcode.register(0x01e9, SharedOpcodeCar.getNumberOfPassengers, 2, '${2} = get_number_of_passengers ${1}', {false, true})
-- INI: 01ea=2,%2d% = car %1d% max_passengers
Opcode.register(0x01ea, SharedOpcodeCar.getMaximumNumberOfPassengers, 2, '${2} = get_maximum_number_of_passengers ${1}', {false, true})
-- INI: 01ec=2,make_car %1d% very_heavy %2h%
Opcode.register(0x01ec, SharedOpcodeCar.setHeavy, 2, 'set_car_heavy ${1} ${2}', {false, false})
-- INI: 01f3=1,  car %1d% airborne
Opcode.register(0x01f3, SharedOpcodeCar.isInAirProper, 1, 'is_car_in_air_proper ${1}', {false})
-- INI: 01f4=1,  car %1d% flipped
Opcode.register(0x01f4, SharedOpcodeCar.isUpsidedown, 1, 'is_car_upsidedown ${1}', {false})
-- INI: 020a=2,set_car %1d% door_status_to %2d%
Opcode.register(0x020a, SharedOpcodeCar.lockDoors, 2, 'lock_car_doors ${1} ${2}', {false, true})
-- INI: 020b=1,explode_car %1d%
Opcode.register(0x020b, SharedOpcodeCar.explode, 1, 'explode_car ${1}', {false})
-- INI: 020d=1,  car %1d% flipped
Opcode.register(0x020d, SharedOpcodeCar.isUpright, 1, 'is_car_upright ${1}', {false})
-- INI: 0216=2,set_car %1d% taxi_available_light_to %2b:on/off%
Opcode.register(0x0216, SharedOpcodeCar.setTaxiLights, 2, 'set_taxi_lights ${1} ${2}', {false, false})
-- INI: 0224=2,set_car %1d% health_to %2d%
Opcode.register(0x0224, SharedOpcodeCar.setHealth, 2, 'set_car_health ${1} ${2}', {false, true})
-- INI: 0227=2,%2d% = car %1d% health
Opcode.register(0x0227, SharedOpcodeCar.getHealth, 2, '${2} = get_car_health ${1}', {false, true})
-- INI: 0229=3,set_car %1d% color_to %2d% %3d%
Opcode.register(0x0229, SharedOpcodeCar.changeColor, 3, 'change_car_colour ${1} ${2} ${3}', {false, true, false})
-- INI: 0294=2,set_vehicle %1d% sprayable %2d%
Opcode.register(0x0294, SharedOpcodeCar.setCanRespray, 2, 'set_can_respray_car ${1} ${2}', {false, false})
-- INI: 02aa=2,set_car %1d% immune_to_nonplayer %2d%
Opcode.register(0x02aa, SharedOpcodeCar.setOnlyDamagedByPlayer, 2, 'set_car_only_damaged_by_player ${1} ${2}', {false, true})
-- INI: 02ac=6,set_car %1d% immunities %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x02ac, SharedOpcodeCar.setProofs, 6, 'set_car_proofs ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 02bf=1,  car %1d% sunk
Opcode.register(0x02bf, SharedOpcodeCar.isInWater, 1, 'is_car_in_water ${1}', {false})
-- INI: 02c2=4,car %1d% drive_to_point %2d% %3d% %4d%
Opcode.register(0x02c2, SharedOpcodeCar.gotoCoordinatesAccurate, 4, 'car_goto_coordinates_accurate ${1} ${2} ${3} ${4}', {false, true, true, true})
-- INI: 02ca=1,  car %1d% bounding_sphere_visible
Opcode.register(0x02ca, SharedOpcodeCar.isOnScreen, 1, 'is_car_on_screen ${1}', {false})
-- INI: 02e3=2,%2d% = car %1d% speed
Opcode.register(0x02e3, SharedOpcodeCar.getSpeed, 2, '${2} = get_car_speed ${1}', {false, true})
-- INI: 02f8=2,get_vehicle %1d% Z_angle_sine_to %2d%
Opcode.register(0x02f8, SharedOpcodeCar.getForwardX, 2, '${2} = get_car_forward_x ${1}', {false, true})
-- INI: 02f9=2,get_vehicle %1d% Z_angle_cosine_to %2d%
Opcode.register(0x02f9, SharedOpcodeCar.getForwardY, 2, '${2} = get_car_forward_y ${1}', {false, true})
-- INI: 031e=2,  vehicle %1d% hit_by_weapon %2h%
Opcode.register(0x031e, SharedOpcodeCar.hasBeenDamagedByWeapon, 2, 'has_car_been_damaged_by_weapon ${1} ${2}', {false, false})
-- INI: 0397=2,car %1d% siren = %2b:on/off%  ;; never used in VC
Opcode.register(0x0397, SharedOpcodeCar.switchSiren, 2, 'switch_car_siren ${1} ${2}', {true, false})
-- INI: 039c=2,set_car %1d% watertight %2h%
Opcode.register(0x039c, SharedOpcodeCar.setWatertight, 2, 'set_car_watertight ${1} ${2}', {false, false})
-- INI: 039f=3,car %1d% race_to %2d% %3d%
Opcode.register(0x039f, SharedOpcodeCar.turnToFaceCoord, 3, 'turn_car_to_face_coord ${1} ${2} ${3}', {false, true, false})
-- INI: 03a2=2,set_vehicle %1d% action %2h%
Opcode.register(0x03a2, SharedOpcodeCar.setStatus, 2, 'set_car_status ${1} ${2}', {false, false})
-- INI: 03ab=2,set_car %1d% strong %2d%
Opcode.register(0x03ab, SharedOpcodeCar.setStrong, 2, 'set_car_strong ${1} ${2}', {false, false})
-- INI: 03ed=2,set_car %1d% not_damaged_when_upside_down %2h%
Opcode.register(0x03ed, SharedOpcodeCar.setUpsidedownNotDamaged, 2, 'set_upsidedown_car_not_damaged ${1} ${2}', {false, false})
-- INI: 03f3=3,get_car %1d% color %2d% %3d%
Opcode.register(0x03f3, SharedOpcodeCar.getColors, 3, '${2}, ${3} = get_car_colours ${1}', {false, true, true})
-- INI: 03f5=2,set_vehicle %1d% apply_damage_rules %2h%
Opcode.register(0x03f5, SharedOpcodeCar.setCanBeDamaged, 2, 'set_car_can_be_damaged ${1} ${2}', {false, false})
-- INI: 0407=7,create_coordinate %5d% %6d% %7d% from_car %1d% offset %2d% %3d% %4d%
Opcode.register(0x0407, SharedOpcodeCar.getOffsetInWorldCoords, 7, '${5}, ${6}, ${7} = get_offset_from_car_in_world_coords ${1} ${2} ${3} ${4}', {false, false, false, false, true, true, true})
-- INI: 0423=2,car %1d% improve_handling %2d%
Opcode.register(0x0423, SharedOpcodeCar.setTraction, 2, 'set_car_traction ${1} ${2}', {false, false})
-- INI: 0428=2,set_car %1d% avoid_level_transitions %2d%
Opcode.register(0x0428, SharedOpcodeCar.setAvoidLevelTransitions, 2, 'set_car_avoid_level_transitions ${1} ${2}', {false, false})
-- INI: 0431=2,  car %1d% car_passenger_seat_free %2d%
Opcode.register(0x0431, SharedOpcodeCar.isPassengerSeatFree, 2, 'is_car_passenger_seat_free ${1} ${2}', {false, false})
-- INI: 0441=2,%2d% = car %1d% model
Opcode.register(0x0441, SharedOpcodeCar.getModel, 2, '${2} = get_car_model ${1}', {false, true})
-- INI: 0466=2,set_car %1d% change_lane %2h%
Opcode.register(0x0466, SharedOpcodeCar.setStayInFastLane, 2, 'set_car_stay_in_fast_lane ${1} ${2}', {false, false})
-- INI: 0468=1,set_vehicle %1d% clear_last_weapon_damage
Opcode.register(0x0468, SharedOpcodeCar.clearLastWeaponDamage, 1, 'clear_car_last_weapon_damage ${1}', {false})
-- INI: 046c=2,%2d% = car %1d% driver
Opcode.register(0x046c, SharedOpcodeCar.getDriver, 2, '${2} = get_driver_of_car ${1}', {false, true})
-- INI: 0477=3,set_car %1d% action %2h% time %3d%
Opcode.register(0x0477, SharedOpcodeCar.setTempAction, 3, 'set_car_temp_action ${1} ${2} ${3}', {false, false, false})
-- INI: 048b=2,set_car %1d% route_seed %2d%
Opcode.register(0x048b, SharedOpcodeCar.setRandomRouteSeed, 2, 'set_car_random_route_seed ${1} ${2}', {false, false})
-- INI: 0495=1,  vehicle %1d% burning
Opcode.register(0x0495, SharedOpcodeCar.isOnFire, 1, 'is_car_on_fire ${1}', {false})
-- INI: 0496=2,  vehicle %1d% tire %2h% deflated
Opcode.register(0x0496, SharedOpcodeCar.isTireBurst, 2, 'is_car_tyre_burst ${1} ${2}', {false, false})
-- INI: 04ba=2,set_car %1d% speed_instantly %2d%
Opcode.register(0x04ba, SharedOpcodeCar.setForwardSpeed, 2, 'set_car_forward_speed ${1} ${2}', {false, false})
-- INI: 04bd=2,set_car %1d% is_part_of_convoy %2h%
Opcode.register(0x04bd, SharedOpcodeCar.markAsConvoyCar, 2, 'mark_car_as_convoy_car ${1} ${2}', {false, false})
-- INI: 04e0=2,car %1d% abandon_path_radius %2h%
Opcode.register(0x04e0, SharedOpcodeCar.setStraightLineDistance, 2, 'set_car_straight_line_distance ${1} ${2}', {false, false})
-- INI: 04e1=1,open_trunk_of_car_fully %1d%
Opcode.register(0x04e1, SharedOpcodeCar.popBoot, 1, 'pop_car_boot ${1}', {false})
-- INI: 04f1=1,  is_car_waiting_for_world_collision %1d%
Opcode.register(0x04f1, SharedOpcodeCar.isWaitingForWorldCollision, 1, 'is_car_waiting_for_world_collision ${1}', {false})
-- INI: 04fe=2,set_vehicle %1d% deflate_tire %2h%
Opcode.register(0x04fe, SharedOpcodeCar.burstTire, 2, 'burst_car_tyre ${1} ${2}', {false, false})
-- INI: 0506=3,vehicle_model %1m% set_next_variation %2h% %3h%
Opcode.register(0x0506, SharedOpcodeCar.setModelComponents, 3, 'set_car_model_components ${vehicle.1} ${2} ${3}', {false, false, false})
-- INI: 0508=1,vehicle %1d% close_all_doors
Opcode.register(0x0508, SharedOpcodeCar.closeAllDoors, 1, 'close_all_car_doors ${1}', {false})
-- INI: 0519=2,lock_vehicle %1d% in_current_position %2d%
Opcode.register(0x0519, SharedOpcodeCar.freezePosition, 2, 'freeze_car_position ${1} ${2}', {false, false})
-- INI: 053f=2,set_car %1d% tires_vulnerable %2h%
Opcode.register(0x053f, SharedOpcodeCar.setCanBurstTires, 2, 'set_can_burst_car_tyres ${1} ${2}', {false, false})
-- INI: 0574=2,freeze_car %1d% position_and_dont_load_collision %2h%
Opcode.register(0x0574, SharedOpcodeCar.freezePositionAndDontLoadCollision, 2, 'freeze_car_position_and_dont_load_collision ${1} ${2}', {false, false})
-- INI: 0587=2,set_load_collision_for_car %1d% flag %2h%
Opcode.register(0x0587, SharedOpcodeCar.setLoadCollisionFlag, 2, 'set_load_collision_for_car_flag ${1} ${2}', {false, false})
-- INI: 0594=2,set_car %1d% fade_in %2h%
Opcode.register(0x0594, SharedOpcodeCar.setToFadeIn, 2, 'set_vehicle_to_fade_in ${1} ${2}', {false, false})
