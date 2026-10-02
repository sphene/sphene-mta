SharedOpcodeChar = {}
SharedOpcodeChar.__index = SharedOpcodeChar

-- Opcode: 0x009A
-- Instruction: [var handle: Char] = create_char {pedType} [PedType] {modelId} [model_char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/009A
function SharedOpcodeChar.create(pedType, model, posX, posY, posZ, _)
    if (model == 299) then
        model = 269
    end

    actor = ActorElement:create(model)
    actor:spawn(posX, posY, posZ)
    actor:setPedType(pedType)

    if (Thread.currentThread:isMissionThread()) then
        Thread.currentThread:addToCleanupList(actor)
    end

    return actor
end

-- Opcode: 0x009B
-- Instruction: delete_char [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/009B
function SharedOpcodeChar.delete(actor)
    if (type(actor) ~= "table") then
        return false
    end

    Thread.currentThread:removeFromCleanupList(actor)
    actor:setAlpha(0)

    return actor:destroy()
end

-- Opcode: 0x00A0
-- Instruction: [var x: float], [var y: float], [var z: float] = get_char_coordinates [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00A0
function SharedOpcodeChar.getCoordinates(actor, _, _, _)
    local posX, posY, posZ = 0, 0, 0

    if (type(actor) == "table") then
        posX, posY, posZ = actor:getPosition()
    end

    return posX, posY, posZ
end

-- Opcode: 0x00A1
-- Instruction: set_char_coordinates [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00A1
function SharedOpcodeChar.setCoordinates(actor, posX, posY, posZ)
    if (type(actor) ~= "table") then
        return false
    end

    actor:clearTasks()
    actor:setPosition(posX, posY, posZ)
    return true
end

-- Opcode: 0x00A3
-- Instruction: is_char_in_area_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00A3
function SharedOpcodeChar.isInArea2D(actor, cornerAX, cornerAY, cornerBX, cornerBY, showSphere)
    if (type(actor) ~= "table") then
        Logger.error('OPCODE', 'Invalid actor! Actual type received: {}', type(actor))
        Script.panic('Invalid actor!')

        return false
    end

    Script.setOpcodePartiallyImplemented()
    return actor:isInRectangle(cornerAX, cornerAY, cornerBX, cornerBY)
end

-- Opcode: 0x00A4
-- Instruction: is_char_in_area_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00A4
function SharedOpcodeChar.isInArea3D(actor, leftBottomX, leftBottomY, leftBottomZ, rightTopX, rightTopY, rightTopZ, showSphere)
    if (type(actor) ~= "table") then
        return false
    end

    Script.setOpcodePartiallyImplemented()
    return actor:isInCube(leftBottomX, leftBottomY, leftBottomZ, rightTopX, rightTopY, rightTopZ)
end

-- Opcode: 0x00D9
-- Instruction: [var handle: Car] = store_car_char_is_in [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00D9
function SharedOpcodeChar.storeCarIsIn(actor)
    return actor:getOccupiedVehicle()
end

-- Opcode: 0x00DB
-- Instruction: is_char_in_car [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00DB
function SharedOpcodeChar.isInCar(actor, car)
    if (type(actor) ~= "table") then
        return false
    end

    if (actor:getOccupiedVehicle() == car) then
        return true
    end

    return false
end

-- Opcode: 0x00DD
-- Instruction: is_char_in_model [Char] {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00DD
function SharedOpcodeChar.isInModel(actor, model)
    if (type(actor) ~= "table") then
        return false
    end
    if (actor:isInVehicle()) then
        local vehicle = actor:getOccupiedVehicle()

        if (vehicle:getModel() == model) then
            return true
        end
    end

    return false
end

-- Opcode: 0x00DF
-- Instruction: is_char_in_any_car [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00DF
function SharedOpcodeChar.isInAnyCar(actor)
    return actor:isInVehicle()
end

-- Opcode: 0x00EC
-- Instruction: locate_char_any_means_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00EC
function SharedOpcodeChar.locateAnyMeans2D(actor, posX, posY, xRadius, yRadius, showSphere)
    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, nil, xRadius)
    end

    if (type(actor) ~= "table") then
        return false
    end

    local actorX, actorY, _ = actor:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius) then
        return true
    end

    return false
end

-- Opcode: 0x00ED
-- Instruction: locate_char_on_foot_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00ED
function SharedOpcodeChar.locateOnFoot2D(actor, posX, posY, xRadius, yRadius, showSphere)
    if (actor:isInVehicle()) then
        return false
    end

    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, nil, xRadius)
    end

    if (type(actor) ~= "table") then
        return false
    end

    local actorX, actorY, _ = actor:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius) then
        return true
    end

    return false
end

-- Opcode: 0x00EE
-- Instruction: locate_char_in_car_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00EE
function SharedOpcodeChar.locateInCar2D(actor, posX, posY, xRadius, yRadius, showSphere)
    if (not actor:isInVehicle()) then
        return false
    end

    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, nil, xRadius)
    end

    if (type(actor) ~= "table") then
        return false
    end

    local actorX, actorY, _ = actor:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius) then
        return true
    end

    return false
end

-- Opcode: 0x00EF
-- Instruction: locate_stopped_char_any_means_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00EF
function SharedOpcodeChar.locateStoppedAnyMeans2D(actor, posX, posY, xRadius, yRadius, showSphere)
    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, nil, xRadius)
    end

    if (type(actor) ~= "table") then
        return false
    end

    local actorX, actorY, _ = actor:getPosition()
    local velX, velY, velZ = actor:getVelocity()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius
        and velX == 0 and velY == 0 and velZ == 0) then
        return true
    end

    return false
end

-- Opcode: 0x00F0
-- Instruction: locate_stopped_char_on_foot_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00F0
function SharedOpcodeChar.locateStoppedOnFoot2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00F1
-- Instruction: locate_stopped_char_in_car_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00F1
function SharedOpcodeChar.locateStoppedInCar2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00F2
-- Instruction: locate_char_any_means_char_2d [Char] {target} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00F2
function SharedOpcodeChar.locateAnyMeansChar2D(actor, checkActor, xRadius, yRadius, zRadius)
    if (type(actor) ~= "table") then
        return false
    end

    local actorX, actorY, actorZ = actor:getPosition()
    local checkActorX, checkActorY, checkActorZ = checkActor:getPosition()

    if ((getDistanceBetweenPoints2D(actorX, 0, checkActorX, 0) < xRadius or xRadius == 0)
        and (getDistanceBetweenPoints2D(0, actorY, 0, checkActorY) < yRadius or yRadius == 0)
        and (getDistanceBetweenPoints3D(0, 0, actorZ, 0, 0, checkActorZ) < zRadius or zRadius == 0)) then
        return true
    end

    return false
end

-- Opcode: 0x00F3
-- Instruction: locate_char_on_foot_char_2d [Char] {target} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00F3
function SharedOpcodeChar.locateOnFootChar2D(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00F4
-- Instruction: locate_char_in_car_char_2d [Char] {otherChar} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00F4
function SharedOpcodeChar.locateInCarChar2D(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00FE
-- Instruction: locate_char_any_means_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00FE
function SharedOpcodeChar.locateAnyMeans3D(actor, posX, posY, posZ, xRadius, yRadius, zRadius, showSphere)
    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, posZ, xRadius)
    end

    if (type(actor) ~= "table") then
        return false
    end

    local actorX, actorY, actorZ = actor:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius
        and getDistanceBetweenPoints3D(0, 0, posZ, 0, 0, actorZ) < zRadius) then
        return true
    end

    return false
end

-- Opcode: 0x00FF
-- Instruction: locate_char_on_foot_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00FF
function SharedOpcodeChar.locateOnFoot3D(actor, posX, posY, posZ, xRadius, yRadius, zRadius, showSphere)
    if (opcodes[0x00FE](actor, posX, posY, posZ, xRadius, yRadius, zRadius, showSphere)
        and actor:getOccupiedVehicle() == false) then
        return true
    end

    return false
end

-- Opcode: 0x0100
-- Instruction: locate_char_in_car_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0100
function SharedOpcodeChar.locateInCar3D(actor, posX, posY, posZ, xRadius, yRadius, zRadius, showSphere)
    if (opcodes[0x00FE](actor, posX, posY, posZ, xRadius, yRadius, zRadius, showSphere)
        and actor:getOccupiedVehicle() ~= false) then
        return true
    end

    return false
end

-- Opcode: 0x0101
-- Instruction: locate_stopped_char_any_means_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0101
function SharedOpcodeChar.locateStoppedAnyMeans3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0102
-- Instruction: locate_stopped_char_on_foot_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0102
function SharedOpcodeChar.locateStoppedOnFoot3D(actor, posX, posY, posZ, xRadius, yRadius, zRadius, showSphere)
    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, posZ, xRadius)
    end

    if (type(actor) ~= "table") then
        return false
    end

    if (not actor:isStopped()) then
        return false
    end

    local actorX, actorY, actorZ = actor:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius
        and getDistanceBetweenPoints3D(0, 0, posZ, 0, 0, actorZ) < zRadius) then
        return true
    end

    return false
end

-- Opcode: 0x0103
-- Instruction: locate_stopped_char_in_car_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0103
function SharedOpcodeChar.locateStoppedInCar3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0104
-- Instruction: locate_char_any_means_char_3d [Char] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0104
function SharedOpcodeChar.locateAnyMeansChar3D(actor, checkActor, xRadius, yRadius, zRadius, showSphere)
    local posX, posY, posZ = checkActor:getPosition()

    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, posZ, xRadius)
    end

    if (type(actor) ~= "table") then
        return false
    end

    local actorX, actorY, actorZ = actor:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius
        and getDistanceBetweenPoints3D(0, 0, posZ, 0, 0, actorZ) < zRadius) then
        return true
    end

    return false
end

-- Opcode: 0x0105
-- Instruction: locate_char_on_foot_char_3d [Char] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0105
function SharedOpcodeChar.locateOnFootChar3D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0106
-- Instruction: locate_char_in_car_char_3d [Char] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0106
function SharedOpcodeChar.locateInCarChar3D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0114
-- Instruction: add_ammo_to_char [Char] {weaponType} [WeaponType] {ammo} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0114
function SharedOpcodeChar.addAmmo(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0118
-- Instruction: is_char_dead {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0118
function SharedOpcodeChar.isDead(actor)
    if (type(actor) ~= "table") then
        return false
    end

    return actor:isDead()
end

-- Opcode: 0x0129
-- Instruction: [var handle: Char] = create_char_inside_car {vehicle} [Car] {pedType} [PedType] {modelId} [model_char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0129
function SharedOpcodeChar.createInsideCar(car, pedType, model, _)
    local posX, posY, posZ = car:getPosition()
    local actor = opcodes[0x009A](pedType, model, posX, posY + 50, posZ)

    actor:warpIntoVehicle(car, 0)

    return actor
end

-- Opcode: 0x0154
-- Instruction: is_char_in_zone [Char] {zone} [zone_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0154
function SharedOpcodeChar.isInZone(_)
    Script.setOpcodePartiallyImplemented()
    return false
end

-- Opcode: 0x0172
-- Instruction: [var heading: float] = get_char_heading [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0172
function SharedOpcodeChar.getHeading(actor, _)
    local _, _, zAngle = actor:getRotation()
    return zAngle
end

-- Opcode: 0x0173
-- Instruction: set_char_heading [Char] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0173
function SharedOpcodeChar.setHeading(actor, zAngle)
    local rotX, rotY, _ = actor:getRotation()
    return actor:setRotation(rotX, rotY, zAngle)
end

-- Opcode: 0x0184
-- Instruction: is_char_health_greater [Char] {health} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0184
function SharedOpcodeChar.isHealthGreater(actor, health)
   return actor:getHealth() >= health
end

-- Opcode: 0x01A1
-- Instruction: is_char_in_area_on_foot_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01A1
function SharedOpcodeChar.isInAreaOnFoot2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01A2
-- Instruction: is_char_in_area_in_car_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01A2
function SharedOpcodeChar.isInAreaInCar2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01A3
-- Instruction: is_char_stopped_in_area_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01A3
function SharedOpcodeChar.isStoppedInArea2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01A4
-- Instruction: is_char_stopped_in_area_on_foot_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01A4
function SharedOpcodeChar.isStoppedInAreaOnFoot2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01A5
-- Instruction: is_char_stopped_in_area_in_car_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01A5
function SharedOpcodeChar.isStoppedInAreaInCar2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01A6
-- Instruction: is_char_in_area_on_foot_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01A6
function SharedOpcodeChar.isInAreaOnFoot3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01A7
-- Instruction: is_char_in_area_in_car_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01A7
function SharedOpcodeChar.isInAreaInCar3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01A8
-- Instruction: is_char_stopped_in_area_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01A8
function SharedOpcodeChar.isStoppedInArea3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01A9
-- Instruction: is_char_stopped_in_area_on_foot_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01A9
function SharedOpcodeChar.isStoppedInAreaOnFoot3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01AA
-- Instruction: is_char_stopped_in_area_in_car_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01AA
function SharedOpcodeChar.isStoppedInAreaInCar3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01B2
-- Instruction: give_weapon_to_char [Char] {weaponType} [WeaponType] {ammo} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01B2
function SharedOpcodeChar.giveWeapon(actor, weapon, ammo)
    actor:giveWeapon(weapon, ammo)
end

-- Opcode: 0x01B9
-- Instruction: set_current_char_weapon [Char] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01B9
function SharedOpcodeChar.setCurrentWeapon(actor, weapon)
    return actor:setWeapon(weapon)
end

-- Opcode: 0x01C2
-- Instruction: mark_char_as_no_longer_needed [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01C2
function SharedOpcodeChar.markAsNoLongerNeeded(object)
    if (Thread.currentThread:isMissionThread()) then
        Thread.currentThread:removeFromCleanupList(object)
    end
    --object:removeReferences()
end

-- Opcode: 0x01C5
-- Instruction: dont_remove_char [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01C5
function SharedOpcodeChar.dontRemove(actor)
    if (Thread.currentThread:isMissionThread()) then
        Thread.currentThread:removeFromCleanupList(actor)
    end

    return true
end

-- Opcode: 0x01C8
-- Instruction: [var handle: Char] = create_char_as_passenger {vehicle} [Car] {pedType} [PedType] {modelId} [model_char] {seat} [SeatId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01C8
function SharedOpcodeChar.createAsPassenger(car, pedType, model, seat, _)
    local posX, posY, posZ = car:getPosition()
    local actor = opcodes[0x009A](pedType, model, posX, posY + 50, posZ)

    actor:warpIntoVehicle(car, seat + 1)

    return actor
end

-- Opcode: 0x0202
-- Instruction: locate_char_any_means_car_2d [Char] {vehicle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0202
function SharedOpcodeChar.locateAnyMeansCar2D(actor, car, xRadius, yRadius, showSphere)
    local posX, posY, posZ = car:getPosition()

    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, posZ, xRadius)
    end

    local actorX, actorY, _ = actor:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius) then
        return true
    end

    return false
end

-- Opcode: 0x0203
-- Instruction: locate_char_on_foot_car_2d [Char] {vehicle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0203
function SharedOpcodeChar.locateOnFootCar2D(actor, car, xRadius, yRadius, showSphere)
    if (not actor:isInVehicle()) then
        return false
    end

    local posX, posY, posZ = car:getPosition()

    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, posZ, xRadius)
    end

    local actorX, actorY, _ = actor:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius) then
        return true
    end

    return false
end

-- Opcode: 0x0204
-- Instruction: locate_char_in_car_car_2d [Char] {handle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0204
function SharedOpcodeChar.locateInCarCar2D(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0205
-- Instruction: locate_char_any_means_car_3d [Char] {vehicle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0205
function SharedOpcodeChar.locateAnyMeansCar3D(actor, checkCar, xRadius, yRadius, zRadius, showSphere)
    local posX, posY, posZ = checkCar:getPosition()

    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, posZ, xRadius)
    end

    local actorX, actorY, actorZ = actor:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius
        and getDistanceBetweenPoints3D(0, 0, posZ, 0, 0, actorZ) < zRadius) then
        return true
    end

    return false
end

-- Opcode: 0x0206
-- Instruction: locate_char_on_foot_car_3d [Char] {vehicle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0206
function SharedOpcodeChar.locateOnFootCar3D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0207
-- Instruction: locate_char_in_car_car_3d [Char] {vehicle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0207
function SharedOpcodeChar.locateInCarCar3D(actor, car, xRadius, yRadius, zRadius, showSphere)
    if (not actor:isInVehicle()) then
        return false
    end

    local posX, posY, posZ = car:getPosition()

    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, posZ, xRadius)
    end

    if (type(actor) ~= "table") then
        return false
    end

    local actorX, actorY, actorZ = actor:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, actorX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, actorY) < yRadius
        and getDistanceBetweenPoints3D(0, 0, posZ, 0, 0, actorZ) < zRadius) then
        return true
    end

    return false
end

-- Opcode: 0x0223
-- Instruction: set_char_health [Char] {health} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0223
function SharedOpcodeChar.setHealth(actor, health)
    return actor:setHealth(health)
end

-- Opcode: 0x0226
-- Instruction: [var health: int] = get_char_health [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0226
function SharedOpcodeChar.getHealth(actor, _)
    if (type(actor) ~= "table") then
        return 0
    end

    return actor:getHealth()
end

-- Opcode: 0x0245
-- Instruction: set_anim_group_for_char [Char] {animGroup} [AnimGroup]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0245
function SharedOpcodeChar.setAnimGroup(actor, style)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02A9
-- Instruction: set_char_only_damaged_by_player [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02A9
function SharedOpcodeChar.setOnlyDamagedByPlayer(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02AB
-- Instruction: set_char_proofs [Char] {bulletProof} [bool] {fireProof} [bool] {explosionProof} [bool] {collisionProof} [bool] {meleeProof} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02AB
function SharedOpcodeChar.setProofs()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02CB
-- Instruction: is_char_on_screen [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02CB
function SharedOpcodeChar.isOnScreen(_)
    Script.setOpcodePartiallyImplemented()
    return true
end

-- Opcode: 0x02D8
-- Instruction: is_current_char_weapon [Char] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02D8
function SharedOpcodeChar.isCurrentWeapon(actor, weapon)
    return (actor:getWeapon() == weapon)
end

-- Opcode: 0x02E0
-- Instruction: is_char_shooting [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02E0
function SharedOpcodeChar.isShooting(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02E2
-- Instruction: set_char_accuracy [Char] {accuracy} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02E2
function SharedOpcodeChar.setAccuracy(actor, weaponAccuracy)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02F2
-- Instruction: is_char_model [Char] {modelId} [model_char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02F2
function SharedOpcodeChar.isModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x031D
-- Instruction: has_char_been_damaged_by_weapon [Char] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/031D
function SharedOpcodeChar.hasBeenDamagedByWeapon(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0321
-- Instruction: explode_char_head [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0321
function SharedOpcodeChar.explodeHead(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0332
-- Instruction: set_char_bleeding [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0332
function SharedOpcodeChar.setBleeding(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0337
-- Instruction: set_char_visible [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0337
function SharedOpcodeChar.setVisible(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x034F
-- Instruction: remove_char_elegantly [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/034F
function SharedOpcodeChar.removeElegantly(actor)
    actor:destroy(true)
end

-- Opcode: 0x0350
-- Instruction: set_char_stay_in_same_place [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0350
function SharedOpcodeChar.setStayInSamePlace(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x035F
-- Instruction: add_armour_to_char [Char] {amount} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/035F
function SharedOpcodeChar.addArmor(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0362
-- Instruction: warp_char_from_car_to_coord [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0362
function SharedOpcodeChar.warpFromCarToCoord(actor, posX, posY, posZ)
    actor:setPosition(posX, posY, posZ, true)
end

-- Opcode: 0x036A
-- Instruction: warp_char_into_car [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/036A
function SharedOpcodeChar.warpIntoCar(actor, car)
    actor:clearTasks()
    actor:warpIntoVehicle(car, 0)
end

-- Opcode: 0x0376
-- Instruction: [var handle: Char] = create_random_char {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0376
function SharedOpcodeChar.createRandom(_, _, _, _)
    -- return ActorElement.createRandom(posX, posY, posZ)
    return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x039E
-- Instruction: set_char_cant_be_dragged_out [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/039E
function SharedOpcodeChar.setCantBeDraggedOut()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03A3
-- Instruction: is_char_male [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03A3
function SharedOpcodeChar.isMale(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03C0
-- Instruction: [var handle: Car] = store_car_char_is_in_no_save [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03C0
function SharedOpcodeChar.storeCarIsInNoSave(actor, _)
    if (actor:getOccupiedVehicle() == false) then
        return false
    end

    return actor:getOccupiedVehicle()
end

-- Opcode: 0x03FE
-- Instruction: set_char_money [Char] {amount} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03FE
function SharedOpcodeChar.setMoney(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0433
-- Instruction: set_char_is_chris_criminal [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0433
function SharedOpcodeChar.setIsChrisCriminal(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0446
-- Instruction: set_char_suffers_critical_hits [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0446
function SharedOpcodeChar.setSuffersCriticalHits(actor, toggle)
    actor:setData("beast_headshots_possible", toggle)
    return true
end

-- Opcode: 0x0448
-- Instruction: is_char_sitting_in_car [Char] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0448
function SharedOpcodeChar.isSittingInCar(actor, car)
    return (actor:getOccupiedVehicle() == car)
end

-- Opcode: 0x0449
-- Instruction: is_char_sitting_in_any_car [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0449
function SharedOpcodeChar.isSittingInAnyCar(actor)
    if (actor:getOccupiedVehicle() ~= false) then
        return true
    end

    return false
end

-- Opcode: 0x044B
-- Instruction: is_char_on_foot [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/044B
function SharedOpcodeChar.isOnFoot(actor)
    if (actor:getOccupiedVehicle() == false) then
        return true
    end

    return false
end

-- Opcode: 0x0464
-- Instruction: attach_char_to_car [Char] {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {position} [int] {angleLimit} [float] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0464
function SharedOpcodeChar.attachToCar(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0465
-- Instruction: detach_char_from_car [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0465
function SharedOpcodeChar.detachFromCar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0467
-- Instruction: clear_char_last_weapon_damage [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0467
function SharedOpcodeChar.clearLastWeaponDamage(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x046D
-- Instruction: [var number: int] = get_number_of_followers [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/046D
function SharedOpcodeChar.getNumberOfFollowers(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0470
-- Instruction: [var weaponType: WeaponType] = get_current_char_weapon [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0470
function SharedOpcodeChar.getCurrentWeapon(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0471
-- Instruction: locate_char_any_means_object_2d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0471
function SharedOpcodeChar.locateAnyMeansObject2D(actor, object, xRadius, yRadius, isSphere)
    Script.setOpcodePartiallyImplemented()
    local actorX, actorY, _ = actor:getPosition()
    local objectX, objectY, _ = object:getPosition()

    if (actorX >= (objectX - xRadius) and
        actorX <= (objectX + xRadius) and
        actorY >= (objectY - yRadius) and
        actorY <= (objectY + yRadius)) then
        return true
    end

    return false
end

-- Opcode: 0x0472
-- Instruction: locate_char_on_foot_object_2d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0472
function SharedOpcodeChar.locateOnFootObject2D(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0473
-- Instruction: locate_char_in_car_object_2d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0473
function SharedOpcodeChar.locateInCarObject2D(_, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0474
-- Instruction: locate_char_any_means_object_3d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0474
function SharedOpcodeChar.locateAnyMeansObject3D(actor, object, xRadius, yRadius, zRadius, drawSphere)
    local actorX, actorY, actorZ = actor:getPosition()
    local objectX, objectY, objectZ = object:getPosition()

    if drawSphere == 1 then
        CheckpointFrameElement.draw(Thread.currentThread, objectX, objectY, objectZ, xRadius)
    end

    if actorX >= (objectX - xRadius) and
        actorX <= (objectX + xRadius) and
        actorY >= (objectY - yRadius) and
        actorY <= (objectY + yRadius) and
        actorZ >= (objectZ - zRadius) and
        actorZ <= (objectZ + zRadius) then
        return true
    end

    return false
end

-- Opcode: 0x0475
-- Instruction: locate_char_on_foot_object_3d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0475
function SharedOpcodeChar.locateOnFootObject3D(_, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0476
-- Instruction: locate_char_in_car_object_3d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0476
function SharedOpcodeChar.locateInCarObject3D(_, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x047A
-- Instruction: is_char_on_any_bike [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/047A
function SharedOpcodeChar.isOnAnyBike(actor)
    local vehicle = actor:getOccupiedVehicle()

    if (vehicle) then
        return vehicle:getVehicleType() == 'bike'
    end

    return false
end

-- Opcode: 0x0480
-- Instruction: can_char_see_dead_char [Char] {pedType} [PedType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0480
function SharedOpcodeChar.canSeeDeadChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0489
-- Instruction: shut_char_up [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0489
function SharedOpcodeChar.shutUp(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x048F
-- Instruction: remove_all_char_weapons [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/048F
function SharedOpcodeChar.removeAllWeapons(actor)
    return actor:removeAllWeapons()
end

-- Opcode: 0x04AD
-- Instruction: is_char_in_water [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04AD
function SharedOpcodeChar.isInWater(actor)
   return actor:isInWater()
end

-- Opcode: 0x04B8
-- Instruction: [var weaponType: WeaponType], [var weaponAmmo: int], [var weaponModel: model_object] = get_char_weapon_in_slot [Char] {weaponSlotId} [WeaponSlot]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04B8
function SharedOpcodeChar.getWeaponInSlot(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04C4
-- Instruction: [var x: float], [var y: float], [var z: float] = get_offset_from_char_in_world_coords [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04C4
function SharedOpcodeChar.getOffsetInWorldCoords(actor, offsetX, offsetY, offsetZ, _, _, _)
    local actorX, actorY, actorZ = 0, 0, 0

    if (type(actor) == "table") then
        actorX, actorY, actorZ = actor:getPosition()
    end

    return actorX + offsetX, actorY + offsetY, actorZ + offsetZ
end

-- Opcode: 0x04C5
-- Instruction: has_char_been_photographed [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04C5
function SharedOpcodeChar.hasBeenPhotographed(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04D7
-- Instruction: freeze_char_position [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04D7
function SharedOpcodeChar.freezePosition(actor, locked)
    if (locked == 1) then
        locked = true
    else
        locked = false
    end

    return actor:setFrozen(locked)
end

-- Opcode: 0x04D8
-- Instruction: set_char_drowns_in_water [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04D8
function SharedOpcodeChar.setDrownsInWater(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x04DD
-- Instruction: [var armor: int] = get_char_armour [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04DD
function SharedOpcodeChar.getArmor(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04F0
-- Instruction: is_char_waiting_for_world_collision [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04F0
function SharedOpcodeChar.isWaitingForWorldCollision(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04F4
-- Instruction: attach_char_to_object [Char] {handle} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {orientation} [int] {angleLimit} [float] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04F4
function SharedOpcodeChar.attachToObject(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x051A
-- Instruction: has_char_been_damaged_by_char [Char] {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/051A
function SharedOpcodeChar.hasBeenDamagedByChar(_)
    Script.setOpcodePartiallyImplemented()
    return false
end

-- Opcode: 0x0526
-- Instruction: set_char_stay_in_car_when_jacked [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0526
function SharedOpcodeChar.setStayInCarWhenJacked()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x054A
-- Instruction: set_char_can_be_shot_in_vehicle [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/054A
function SharedOpcodeChar.setCanBeShotInVehicle(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x054E
-- Instruction: clear_char_last_damage_entity [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/054E
function SharedOpcodeChar.clearLastDamageEntity(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0560
-- Instruction: [var handle: Char] = create_random_char_as_driver {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0560
function SharedOpcodeChar.createRandomAsDriver(car, handleAs)
    Script.setOpcodePartiallyImplemented()
    local posX, posY, posZ = car:getPosition()

    local validPeds = getValidPedModels()
    local model = false

    while (model == false or model >= 290) do
        model = validPeds[math.random(1, #validPeds)]
    end

    local actor = opcodes[0x009A](1, model, posX, posY + 50, posZ)
    actor:warpIntoVehicle(car, 0)

    return actor
end

-- Opcode: 0x0561
-- Instruction: [var handle: Char] = create_random_char_as_passenger {vehicle} [Car] {seat} [SeatId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0561
function SharedOpcodeChar.createRandomAsPassenger(car, seat, _)
    Script.setOpcodePartiallyImplemented()
    local posX, posY, posZ = car:getPosition()

    local validPeds = getValidPedModels()
    local model = false

    while (model == false or model >= 290) do
        model = validPeds[math.random(1, #validPeds)]
    end

    local actor = opcodes[0x009A](1, model, posX, posY + 50, posZ)
    actor:warpIntoVehicle(car, (seat + 1))

    return actor
end

-- Opcode: 0x0568
-- Instruction: set_char_never_targetted [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0568
function SharedOpcodeChar.setNeverTargeted(_)
    return true
end

-- Opcode: 0x056C
-- Instruction: is_char_in_any_police_vehicle [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/056C
function SharedOpcodeChar.isInAnyPoliceVehicle(actor)
    local vehicle = actor:getOccupiedVehicle()

    if (vehicle) then
        return vehicle:getVehicleType() == 'car' and vehicle:getVehicleClass() == 'police_car'
    end

    return false
end

-- Opcode: 0x056D
-- Instruction: does_char_exist {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/056D
function SharedOpcodeChar.doesExist(actor)
    if (type(actor) == "table" and actor:hasSpawned()) then
        return true
    end

    return false
end

-- Opcode: 0x0588
-- Instruction: set_load_collision_for_char_flag [Char] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0588
function SharedOpcodeChar.setLoadCollisionFlag(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0597
-- Instruction: is_char_ducking [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0597
function SharedOpcodeChar.isDucking(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 009a=6,%6d% = create_actor_pedtype %1d% model %2m% at %3d% %4d% %5d%
Opcode.register(0x009a, SharedOpcodeChar.create, 6, '${6} = create_char ${1} ${pedmodel.2} ${3} ${4} ${5}', {false, false, false, false, false, true})
-- INI: 009b=1,destroy_actor_instantly %1d%
Opcode.register(0x009b, SharedOpcodeChar.delete, 1, 'delete_char ${1}', {false})
-- INI: 00a0=4,store_actor %1d% position_to %2d% %3d% %4d%
Opcode.register(0x00a0, SharedOpcodeChar.getCoordinates, 4, '${2}, ${3}, ${4} = get_char_coordinates ${1}', {false, true, true, true})
-- INI: 00a1=4,put_actor %1d% at %2d% %3d% %4d%
Opcode.register(0x00a1, SharedOpcodeChar.setCoordinates, 4, 'set_char_coordinates ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 00a3=6,  actor %1d% %6b:in-sphere/%in_rectangle %2d% %3d% %4d% %5d%
Opcode.register(0x00a3, SharedOpcodeChar.isInArea2D, 6, 'is_char_in_area_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00a4=8,  actor %1d% %8b:in-sphere/%in_cube %2d% %3d% %4d% %5d% %6d% %7d%
Opcode.register(0x00a4, SharedOpcodeChar.isInArea3D, 8, 'is_char_in_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 00d9=2,%2d% = actor %1d% car ; add to mission cleanup
Opcode.register(0x00d9, SharedOpcodeChar.storeCarIsIn, 2, '${2} = store_car_char_is_in ${1}', {false, true})
-- INI: 00db=2,  actor %1d% in_car %2d%
Opcode.register(0x00db, SharedOpcodeChar.isInCar, 2, 'is_char_in_car ${1} ${2}', {false, false})
-- INI: 00dd=2,  actor %1d% driving_vehicle_type %2m%
Opcode.register(0x00dd, SharedOpcodeChar.isInModel, 2, 'is_char_in_model ${1} ${vehicle.2}', {false, false})
-- INI: 00df=1,  actor %1d% in_any_car
Opcode.register(0x00df, SharedOpcodeChar.isInAnyCar, 1, 'is_char_in_any_car ${1}', {false})
-- INI: 00ec=6,  actor %1d% %6b:in-sphere/%near_point %2d% %3d% radius %4d% %5d%
Opcode.register(0x00ec, SharedOpcodeChar.locateAnyMeans2D, 6, 'locate_char_any_means_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00ed=6,  actor %1d% %6b:in-sphere/%near_point_on_foot %2d% %3d% radius %4d% %5d%
Opcode.register(0x00ed, SharedOpcodeChar.locateOnFoot2D, 6, 'locate_char_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00ee=6,  actor %1d% %6b:in-sphere/%near_point_in_car %2d% %3d% radius %4d% %5d%
Opcode.register(0x00ee, SharedOpcodeChar.locateInCar2D, 6, 'locate_char_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00ef=6,  actor %1d% sphere %6b:in-sphere/%near_point %2d% %3d% radius %4d% %5d%  ;; never used in VC
Opcode.register(0x00ef, SharedOpcodeChar.locateStoppedAnyMeans2D, 6, 'locate_stopped_char_any_means_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00f0=6,  actor %1d% stopped %6b:in-sphere/%near_point_on_foot %2d% %3d% radius %4d% %5d%
Opcode.register(0x00f0, SharedOpcodeChar.locateStoppedOnFoot2D, 6, 'locate_stopped_char_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00f1=6,  actor %1d% stopped %6b:in-sphere/%near_point_in_car %2d% %3d% radius %4d% %5d%  ;; never used in VC
Opcode.register(0x00f1, SharedOpcodeChar.locateStoppedInCar2D, 6, 'locate_stopped_char_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00f2=5,  actor %1d% near_actor %2d% radius %3d% %4d% %5h%
Opcode.register(0x00f2, SharedOpcodeChar.locateAnyMeansChar2D, 5, 'locate_char_any_means_char_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 00f3=5,  actor %1d% near_actor_on_foot %2d% radius %3d% %4d% %5h%
Opcode.register(0x00f3, SharedOpcodeChar.locateOnFootChar2D, 5, 'locate_char_on_foot_char_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 00f4=5,  actor %1d% near_actor_in_car %2d% radius %3d% %4d% %5h%  ;; never used in VC or GTA 3
Opcode.register(0x00f4, SharedOpcodeChar.locateInCarChar2D, 5, 'locate_char_in_car_char_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 00fe=8,  actor %1d% %8b:in-sphere/%near_point %2d% %3d% %4d% radius %5d% %6d% %7d%
Opcode.register(0x00fe, SharedOpcodeChar.locateAnyMeans3D, 8, 'locate_char_any_means_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 00ff=8,  actor %1d% %8b:in-sphere/%near_point_on_foot %2d% %3d% %4d% radius %5d% %6d% %7d%
Opcode.register(0x00ff, SharedOpcodeChar.locateOnFoot3D, 8, 'locate_char_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0100=8,  actor %1d% near_point_in_car %2d% %3d% %4d% radius %5d% %6d% %7d% sphere %8h%
Opcode.register(0x0100, SharedOpcodeChar.locateInCar3D, 8, 'locate_char_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0101=8,  actor %1d% stopped_near_point %2d% %3d% %4d% radius %5d% %6d% %7d% sphere %8h%
Opcode.register(0x0101, SharedOpcodeChar.locateStoppedAnyMeans3D, 8, 'locate_stopped_char_any_means_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0102=8,  actor %1d% stopped_near_point_on_foot %2d% %3d% %4d% radius %5d% %6d% %7d% sphere %8h%
Opcode.register(0x0102, SharedOpcodeChar.locateStoppedOnFoot3D, 8, 'locate_stopped_char_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0103=8,  actor %1d% stopped_near_point_in_car %2d% %3d% %4d% radius %5d% %6d% %7d% sphere %8d%  ;; never used in VC
Opcode.register(0x0103, SharedOpcodeChar.locateStoppedInCar3D, 8, 'locate_stopped_char_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0104=6,  actor %1d% near_actor %2d% radius %3d% %4d% %5d% sphere %6h%
Opcode.register(0x0104, SharedOpcodeChar.locateAnyMeansChar3D, 6, 'locate_char_any_means_char_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0105=6,  actor %1d% near_actor_on_foot %2d% radius %3d% %4d% %5d% sphere %6h%  ;; never used in VC or gta 3
Opcode.register(0x0105, SharedOpcodeChar.locateOnFootChar3D, 6, 'locate_char_on_foot_char_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0106=6,  actor %1d% near_actor_in_car %2d% radius %3d% %4d% %5d% %6h%  ;; never used in VC or gta 3
Opcode.register(0x0106, SharedOpcodeChar.locateInCarChar3D, 6, 'locate_char_in_car_char_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0114=3,add_ammo_to_actor %1d% weapon %2h% ammo %3d%
Opcode.register(0x0114, SharedOpcodeChar.addAmmo, 3, 'add_ammo_to_char ${1} ${2} ${3}', {true, true, true})
-- INI: 0118=1,  actor %1d% dead
Opcode.register(0x0118, SharedOpcodeChar.isDead, 1, 'is_char_dead ${1}', {false})
-- INI: 0129=4,%4d% = create_actor %2d% %3m% in_car %1d% driverseat
Opcode.register(0x0129, SharedOpcodeChar.createInsideCar, 4, '${4} = create_char_inside_car ${2} ${1} ${pedmodel.3}', {false, false, false, true})
-- INI: 0154=2,  actor %1d% in_zone %2z%
Opcode.register(0x0154, SharedOpcodeChar.isInZone, 2, 'is_char_in_zone ${1} ${2}', {false, false})
-- INI: 0172=2,%2d% = actor %1d% z_angle
Opcode.register(0x0172, SharedOpcodeChar.getHeading, 2, '${2} = get_char_heading ${1}', {false, true})
-- INI: 0173=2,set_actor %1d% z_angle_to %2d%
Opcode.register(0x0173, SharedOpcodeChar.setHeading, 2, 'set_char_heading ${1} ${2}', {false, false})
-- INI: 0184=2,  actor %1d% health > %2d%
Opcode.register(0x0184, SharedOpcodeChar.isHealthGreater, 2, 'is_char_health_greater ${1} ${2}', {false, false})
-- INI: 01a1=6,  actor %1d% sphere %6b:in-sphere/%in_rectangle_on_foot %2d% %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x01a1, SharedOpcodeChar.isInAreaOnFoot2D, 6, 'is_char_in_area_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 01a2=6,  actor %1d% %6b:in-sphere/%in_rectangle_in_car %2d% %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x01a2, SharedOpcodeChar.isInAreaInCar2D, 6, 'is_char_in_area_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 01a3=6,  actor %1d% stopped %6b:in-sphere/%in_rectangle %2d% %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x01a3, SharedOpcodeChar.isStoppedInArea2D, 6, 'is_char_stopped_in_area_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 01a4=6,  actor %1d% stopped %6b:in-sphere/%in_rectangle_on_foot %2d% %3d% %4d% %5d%  ; never used in VC
Opcode.register(0x01a4, SharedOpcodeChar.isStoppedInAreaOnFoot2D, 6, 'is_char_stopped_in_area_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 01a5=6,  actor %1d% stopped %6b:in-sphere/%in_rectangle_in_car %2d% %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x01a5, SharedOpcodeChar.isStoppedInAreaInCar2D, 6, 'is_char_stopped_in_area_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 01a6=8,  actor %1d% %8b:in-sphere/%in_cube_on_foot %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x01a6, SharedOpcodeChar.isInAreaOnFoot3D, 8, 'is_char_in_area_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 01a7=8,  actor %1d% %8b:in-sphere/%in_cube_in_car %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x01a7, SharedOpcodeChar.isInAreaInCar3D, 8, 'is_char_in_area_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 01a8=8,  actor %1d% stopped %8b:in-sphere/%in_cube %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x01a8, SharedOpcodeChar.isStoppedInArea3D, 8, 'is_char_stopped_in_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 01a9=8,  actor %1d% stopped %8b:in-sphere/%in_cube_on_foot %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x01a9, SharedOpcodeChar.isStoppedInAreaOnFoot3D, 8, 'is_char_stopped_in_area_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 01aa=8,  actor %1d% stopped %8b:in-sphere/%in_cube_in_car %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x01aa, SharedOpcodeChar.isStoppedInAreaInCar3D, 8, 'is_char_stopped_in_area_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 01b2=3,give_actor %1d% weapon %2c% ammo %3d%  ;; Load the weapon model before using this
Opcode.register(0x01b2, SharedOpcodeChar.giveWeapon, 3, 'give_weapon_to_char ${1} ${2} ${3}', {false, false, false})
-- INI: 01b9=2,set_actor %1d% armed_weapon_to %2c%
Opcode.register(0x01b9, SharedOpcodeChar.setCurrentWeapon, 2, 'set_current_char_weapon ${1} ${2}', {false, true})
-- INI: 01c2=1,mark_actor_as_no_longer_needed %1d%
Opcode.register(0x01c2, SharedOpcodeChar.markAsNoLongerNeeded, 1, 'mark_char_as_no_longer_needed ${1}', {false})
-- INI: 01c5=1,remove_actor_from_mission_cleanup_list %1d%
Opcode.register(0x01c5, SharedOpcodeChar.dontRemove, 1, 'dont_remove_char ${1}', {false})
-- INI: 01c8=5,%5d% = create_actor_pedtype %2d% model %3m% in_car %1d% passenger_seat %4d%
Opcode.register(0x01c8, SharedOpcodeChar.createAsPassenger, 5, '${5} = create_char_as_passenger ${1} ${2} ${pedmodel.3} ${4}', {false, false, false, false, true})
-- INI: 0202=5,  actor %1d% near_car %2d% radius %3d% %4d% sphere %5d%
Opcode.register(0x0202, SharedOpcodeChar.locateAnyMeansCar2D, 5, 'locate_char_any_means_car_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0203=5,  actor %1d% near_car_on_foot %2d% radius %3d% %4d% unknown %5d%
Opcode.register(0x0203, SharedOpcodeChar.locateOnFootCar2D, 5, 'locate_char_on_foot_car_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0204=5,  actor %1d% near_car_in_car %2d% radius %3d% %4d% unknown %5d%  ;; never used in VC
Opcode.register(0x0204, SharedOpcodeChar.locateInCarCar2D, 5, 'locate_char_in_car_car_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0205=6,  actor %1d% near_car %2d% radius %3d% %4d% %5d% unknown %6h%
Opcode.register(0x0205, SharedOpcodeChar.locateAnyMeansCar3D, 6, 'locate_char_any_means_car_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0206=6,  actor %1d% near_car_on_foot %2d% radius %3d% %4d% %5d% unknown %6h%  ;; never used in VC
Opcode.register(0x0206, SharedOpcodeChar.locateOnFootCar3D, 6, 'locate_char_on_foot_car_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0207=6,  actor %1d% near_car_in_car %2d% radius %3d% %4d% %5d% unknown %6h%  ;; never used in VC
Opcode.register(0x0207, SharedOpcodeChar.locateInCarCar3D, 6, 'locate_char_in_car_car_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0223=2,set_actor %1d% health_to %2d%
Opcode.register(0x0223, SharedOpcodeChar.setHealth, 2, 'set_char_health ${1} ${2}', {false, false})
-- INI: 0226=2,%2d% = actor %1d% health
Opcode.register(0x0226, SharedOpcodeChar.getHealth, 2, '${2} = get_char_health ${1}', {false, true})
-- INI: 0245=2,set_actor %1d% walk_style_to %2d%
Opcode.register(0x0245, SharedOpcodeChar.setAnimGroup, 2, 'set_anim_group_for_char ${1} ${2}', {false, false})
-- INI: 02a9=2,set_actor %1d% immune_to_nonplayer %2d%
Opcode.register(0x02a9, SharedOpcodeChar.setOnlyDamagedByPlayer, 2, 'set_char_only_damaged_by_player ${1} ${2}', {false, false})
-- INI: 02ab=6,set_actor %1d% immunities BP %2d% FP %3d% EP %4d% CP %5d% MP %6d%
Opcode.register(0x02ab, SharedOpcodeChar.setProofs, 6, 'set_char_proofs ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 02cb=1,  actor %1d% bounding_sphere_visible
Opcode.register(0x02cb, SharedOpcodeChar.isOnScreen, 1, 'is_char_on_screen ${1}', {false})
-- INI: 02d8=2,  actor %1d% current_weapon == %2c%
Opcode.register(0x02d8, SharedOpcodeChar.isCurrentWeapon, 2, 'is_current_char_weapon ${1} ${2}', {false, false})
-- INI: 02e0=1,  actor %1d% firing_weapon
Opcode.register(0x02e0, SharedOpcodeChar.isShooting, 1, 'is_char_shooting ${1}', {false})
-- INI: 02e2=2,set_actor %1d% weapon_accuracy_to %2d%
Opcode.register(0x02e2, SharedOpcodeChar.setAccuracy, 2, 'set_char_accuracy ${1} ${2}', {false, false})
-- INI: 02f2=2,  actor %1d% model == %2m%
Opcode.register(0x02f2, SharedOpcodeChar.isModel, 2, 'is_char_model ${1} ${ped.2}', {false, false})
-- INI: 031d=2,  actor %1d% hit_by_weapon %2d%
Opcode.register(0x031d, SharedOpcodeChar.hasBeenDamagedByWeapon, 2, 'has_char_been_damaged_by_weapon ${1} ${2}', {false, false})
-- INI: 0321=1,kill_actor %1d%
Opcode.register(0x0321, SharedOpcodeChar.explodeHead, 1, 'explode_char_head ${1}', {false})
-- INI: 0332=2,set_actor %1d% bleeding_to %2b:true/false%
Opcode.register(0x0332, SharedOpcodeChar.setBleeding, 2, 'set_char_bleeding ${1} ${2}', {false, false})
-- INI: 0337=2,set_actor %1d% visibility %2h%
Opcode.register(0x0337, SharedOpcodeChar.setVisible, 2, 'set_char_visible ${1} ${2}', {false, false})
-- INI: 034f=1,destroy_actor_with_fade %1d%  ;; The actor fades away like a ghost
Opcode.register(0x034f, SharedOpcodeChar.removeElegantly, 1, 'remove_char_elegantly ${1}', {false})
-- INI: 0350=2,set_actor %1d% maintain_position_when_attacked %2d%
Opcode.register(0x0350, SharedOpcodeChar.setStayInSamePlace, 2, 'set_char_stay_in_same_place ${1} ${2}', {false, false})
-- INI: 035f=2,set_actor %1d% armour_to %2d%
Opcode.register(0x035f, SharedOpcodeChar.addArmor, 2, 'add_armour_to_char ${1} ${2}', {false, false})
-- INI: 0362=4,put_actor %1d% at %2d% %3d% %4d% and_remove_from_car
Opcode.register(0x0362, SharedOpcodeChar.warpFromCarToCoord, 4, 'warp_char_from_car_to_coord ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 036a=2,put_actor %1d% in_car %2d%
Opcode.register(0x036a, SharedOpcodeChar.warpIntoCar, 2, 'warp_char_into_car ${1} ${2}', {false, false})
-- INI: 0376=4,%4d% = create_random_actor %1d% %2d% %3d%
Opcode.register(0x0376, SharedOpcodeChar.createRandom, 4, '${4} = create_random_char ${1} ${2} ${3}', {false, false, false, true})
-- INI: 039e=2,set_actor %1d% locked_while_in_vehicle %2d%
Opcode.register(0x039e, SharedOpcodeChar.setCantBeDraggedOut, 2, 'set_char_cant_be_dragged_out ${1} ${2}', {false, false})
-- INI: 03a3=1,  actor %1d% male
Opcode.register(0x03a3, SharedOpcodeChar.isMale, 1, 'is_char_male ${1}', {false})
-- INI: 03c0=2,%2d% = actor %1d% car_no_save
Opcode.register(0x03c0, SharedOpcodeChar.storeCarIsInNoSave, 2, '${2} = store_car_char_is_in_no_save ${1}', {false, true})
-- INI: 03fe=2,set_actor %1d% money %2d%
Opcode.register(0x03fe, SharedOpcodeChar.setMoney, 2, 'set_char_money ${1} ${2}', {false, false})
-- INI: 0433=2,set_actor %1d% is_criminal %2d%
Opcode.register(0x0433, SharedOpcodeChar.setIsChrisCriminal, 2, 'set_char_is_chris_criminal ${1} ${2}', {false, false})
-- INI: 0446=2,set_actor %1d% dismemberment_possible %2d%
Opcode.register(0x0446, SharedOpcodeChar.setSuffersCriticalHits, 2, 'set_char_suffers_critical_hits ${1} ${2}', {false, false})
-- INI: 0448=2,  actor %1d% sitting_in_car %2d%
Opcode.register(0x0448, SharedOpcodeChar.isSittingInCar, 2, 'is_char_sitting_in_car ${1} ${2}', {false, false})
-- INI: 0449=1,  actor %1d% sitting_in_any_car
Opcode.register(0x0449, SharedOpcodeChar.isSittingInAnyCar, 1, 'is_char_sitting_in_any_car ${1}', {false})
-- INI: 044b=1,  actor %1d% on_foot
Opcode.register(0x044b, SharedOpcodeChar.isOnFoot, 1, 'is_char_on_foot ${1}', {false})
-- INI: 0464=8,put_actor %1d% into_turret_on_car %2d% at_car_offset %3d% %4d% %5d% position %6h% angle %7d% with_weapon %8h%
Opcode.register(0x0464, SharedOpcodeChar.attachToCar, 8, 'attach_char_to_car ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0465=1,remove_actor %1d% from_turret_mode
Opcode.register(0x0465, SharedOpcodeChar.detachFromCar, 1, 'detach_char_from_car ${1}', {false})
-- INI: 0467=1,set_actor %1d% clear_last_weapon_damage
Opcode.register(0x0467, SharedOpcodeChar.clearLastWeaponDamage, 1, 'clear_char_last_weapon_damage ${1}', {false})
-- INI: 046d=2,%2d% = actor %1d% car_free_seats ; members_in_group
Opcode.register(0x046d, SharedOpcodeChar.getNumberOfFollowers, 2, '${2} = get_number_of_followers ${1}', {false, true})
-- INI: 0470=2,%2d% = actor %1d% armed_weapon
Opcode.register(0x0470, SharedOpcodeChar.getCurrentWeapon, 2, '${2} = get_current_char_weapon ${1}', {false, true})
-- INI: 0471=5,  actor %1d% within_object %2d% rectangle %3d% %4d% sphere %5h%
Opcode.register(0x0471, SharedOpcodeChar.locateAnyMeansObject2D, 5, 'locate_char_any_means_object_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0472=5,  actor %1d% within_object_on_foot %2d% rectangle %3d% %4d% sphere %5h%
Opcode.register(0x0472, SharedOpcodeChar.locateOnFootObject2D, 5, 'locate_char_on_foot_object_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0473=5,  actor %1d% within_object_in_car %2d% rectangle %3d% %4d% sphere %5h%
Opcode.register(0x0473, SharedOpcodeChar.locateInCarObject2D, 5, 'locate_char_in_car_object_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0474=6,  actor %1d% near_object_in_cube %2d% radius %3d% %4d% %5d% sphere %6h%
Opcode.register(0x0474, SharedOpcodeChar.locateAnyMeansObject3D, 6, 'locate_char_any_means_object_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0475=6,  actor %1d% near_object_in_cube %2d% radius %3d% %4d% %5d% sphere %6h% on_foot
Opcode.register(0x0475, SharedOpcodeChar.locateOnFootObject3D, 6, 'locate_char_on_foot_object_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0476=6,  actor %1d% near_object_in_cube %2d% radius %3d% %4d% %5d% sphere %6h% in_car
Opcode.register(0x0476, SharedOpcodeChar.locateInCarObject3D, 6, 'locate_char_in_car_object_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 047a=1,  actor %1d% on_any_bike
Opcode.register(0x047a, SharedOpcodeChar.isOnAnyBike, 1, 'is_char_on_any_bike ${1}', {false})
-- INI: 0480=2,  actor %1d% looking_at_death_of_actor_with_pedtype %2h%
Opcode.register(0x0480, SharedOpcodeChar.canSeeDeadChar, 2, 'can_char_see_dead_char ${1} ${2}', {false, false})
-- INI: 0489=2,set_actor %1d% muted %2h%
Opcode.register(0x0489, SharedOpcodeChar.shutUp, 2, 'shut_char_up ${1} ${2}', {false, false})
-- INI: 048f=1,actor %1d% remove_weapons
Opcode.register(0x048f, SharedOpcodeChar.removeAllWeapons, 1, 'remove_all_char_weapons ${1}', {false})
-- INI: 04ad=1,  actor %1d% in_water
Opcode.register(0x04ad, SharedOpcodeChar.isInWater, 1, 'is_char_in_water ${1}', {false})
-- INI: 04b8=5,get_weapon_data_from_actor %1d% slot %2h% weapon %3d% ammo %4d% model %5d%
Opcode.register(0x04b8, SharedOpcodeChar.getWeaponInSlot, 5, '${3}, ${4}, ${5} = get_char_weapon_in_slot ${1} ${2}', {false, false, true, true, true})
-- INI: 04c4=7,create_coordinate %5d% %6d% %7d% from_actor %1d% offset %2d% %3d% %4d%
Opcode.register(0x04c4, SharedOpcodeChar.getOffsetInWorldCoords, 7, '${5}, ${6}, ${7} = get_offset_from_char_in_world_coords ${1} ${2} ${3} ${4}', {false, false, false, false, true, true, true})
-- INI: 04c5=1,  actor %1d% photographed
Opcode.register(0x04c5, SharedOpcodeChar.hasBeenPhotographed, 1, 'has_char_been_photographed ${1}', {false})
-- INI: 04d7=2,lock_actor %1d% in_current_position %2h%
Opcode.register(0x04d7, SharedOpcodeChar.freezePosition, 2, 'freeze_char_position ${1} ${2}', {false, false})
-- INI: 04d8=2,set_actor %1d% drown %2h%
Opcode.register(0x04d8, SharedOpcodeChar.setDrownsInWater, 2, 'set_char_drowns_in_water ${1} ${2}', {false, false})
-- INI: 04dd=2,%2d% = actor %1d% armour
Opcode.register(0x04dd, SharedOpcodeChar.getArmor, 2, '${2} = get_char_armour ${1}', {false, true})
-- INI: 04f0=1,  is_actor_waiting_for_world_collision %1d%
Opcode.register(0x04f0, SharedOpcodeChar.isWaitingForWorldCollision, 1, 'is_char_waiting_for_world_collision ${1}', {false})
-- INI: 04f4=8,put_actor %1d% into_turret_on_object %2d% at_object_offset %3d% %4d% %5d% position %6h% shooting_angle %7d% with_weapon %8h%
Opcode.register(0x04f4, SharedOpcodeChar.attachToObject, 8, 'attach_char_to_object ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 051a=2,  actor %1d% damaged_by_actor %2d%
Opcode.register(0x051a, SharedOpcodeChar.hasBeenDamagedByChar, 2, 'has_char_been_damaged_by_char ${1} ${2}', {false, false})
-- INI: 0526=2,set_actor %1d% stay_in_car_when_jacked %2d%
Opcode.register(0x0526, SharedOpcodeChar.setStayInCarWhenJacked, 2, 'set_char_stay_in_car_when_jacked ${1} ${2}', {false, false})
-- INI: 054a=2,set_actor %1d% can_be_shot_in_a_car %2h%
Opcode.register(0x054a, SharedOpcodeChar.setCanBeShotInVehicle, 2, 'set_char_can_be_shot_in_vehicle ${1} ${2}', {false, false})
-- INI: 054e=1,clear_actor %1d% damage
Opcode.register(0x054e, SharedOpcodeChar.clearLastDamageEntity, 1, 'clear_char_last_damage_entity ${1}', {false})
-- INI: 0560=2,create_random_actor_in_vehicle %1d% in_driverseat_handle_as %2d%
Opcode.register(0x0560, SharedOpcodeChar.createRandomAsDriver, 2, '${2} = create_random_char_as_driver ${1}', {false, true})
-- INI: 0561=3,%3d% = create_random_ped_in_vehicle %1d% passengerseat %2h%
Opcode.register(0x0561, SharedOpcodeChar.createRandomAsPassenger, 3, '${3} = create_random_char_as_passenger ${1} ${2}', {false, false, true})
-- INI: 0568=2,set_actor %1d% untargetable %2h%
Opcode.register(0x0568, SharedOpcodeChar.setNeverTargeted, 2, 'set_char_never_targeted ${1} ${2}', {false, false})
-- INI: 056c=1,  actor %1d% in_any_police_vehicle
Opcode.register(0x056c, SharedOpcodeChar.isInAnyPoliceVehicle, 1, 'is_char_in_any_police_vehicle ${1}', {false})
-- INI: 056d=1,  actor %1d% defined
Opcode.register(0x056d, SharedOpcodeChar.doesExist, 1, 'does_char_exist ${1}', {false})
-- INI: 0588=2,set_load_collision_for_actor %1d% flag %2h%
Opcode.register(0x0588, SharedOpcodeChar.setLoadCollisionFlag, 2, 'set_load_collision_for_char_flag ${1} ${2}', {false, false})
-- INI: 0597=1,  actor %1d% ducking  ;; never used in VC
Opcode.register(0x0597, SharedOpcodeChar.isDucking, 1, 'is_char_ducking ${1}', {false})
