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

    Script.storeValueAtIndex(2, posX)
    Script.storeValueAtIndex(3, posY)
    Script.storeValueAtIndex(4, posZ)

    return true
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
function SharedOpcodeChar.locateAnyMeansObject3D(_, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
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

    Script.storeValueAtIndex(5, actorX + offsetX)
    Script.storeValueAtIndex(6, actorY + offsetY)
    Script.storeValueAtIndex(7, actorZ + offsetZ)
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

    Script.storeValueAtIndex(2, actor)

    return true
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


Opcode.register(0x009a, SharedOpcodeChar.create, '[var handle: Char] = create_char {pedType} [PedType] {modelId} [model_char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x009b, SharedOpcodeChar.delete, 'delete_char [Char]')
Opcode.register(0x00a0, SharedOpcodeChar.getCoordinates, '[var x: float], [var y: float], [var z: float] = get_char_coordinates [Char]')
Opcode.register(0x00a1, SharedOpcodeChar.setCoordinates, 'set_char_coordinates [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x00a3, SharedOpcodeChar.isInArea2D, 'is_char_in_area_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x00a4, SharedOpcodeChar.isInArea3D, 'is_char_in_area_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x00d9, SharedOpcodeChar.storeCarIsIn, '[var handle: Car] = store_car_char_is_in [Char]')
Opcode.register(0x00db, SharedOpcodeChar.isInCar, 'is_char_in_car [Char] {vehicle} [Car]')
Opcode.register(0x00dd, SharedOpcodeChar.isInModel, 'is_char_in_model [Char] {modelId} [model_vehicle]')
Opcode.register(0x00df, SharedOpcodeChar.isInAnyCar, 'is_char_in_any_car [Char]')
Opcode.register(0x00ec, SharedOpcodeChar.locateAnyMeans2D, 'locate_char_any_means_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00ed, SharedOpcodeChar.locateOnFoot2D, 'locate_char_on_foot_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00ee, SharedOpcodeChar.locateInCar2D, 'locate_char_in_car_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00ef, SharedOpcodeChar.locateStoppedAnyMeans2D, 'locate_stopped_char_any_means_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00f0, SharedOpcodeChar.locateStoppedOnFoot2D, 'locate_stopped_char_on_foot_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00f1, SharedOpcodeChar.locateStoppedInCar2D, 'locate_stopped_char_in_car_2d [Char] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00f2, SharedOpcodeChar.locateAnyMeansChar2D, 'locate_char_any_means_char_2d [Char] {target} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00f3, SharedOpcodeChar.locateOnFootChar2D, 'locate_char_on_foot_char_2d [Char] {target} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00f4, SharedOpcodeChar.locateInCarChar2D, 'locate_char_in_car_char_2d [Char] {otherChar} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00fe, SharedOpcodeChar.locateAnyMeans3D, 'locate_char_any_means_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00ff, SharedOpcodeChar.locateOnFoot3D, 'locate_char_on_foot_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0100, SharedOpcodeChar.locateInCar3D, 'locate_char_in_car_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0101, SharedOpcodeChar.locateStoppedAnyMeans3D, 'locate_stopped_char_any_means_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0102, SharedOpcodeChar.locateStoppedOnFoot3D, 'locate_stopped_char_on_foot_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0103, SharedOpcodeChar.locateStoppedInCar3D, 'locate_stopped_char_in_car_3d [Char] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0104, SharedOpcodeChar.locateAnyMeansChar3D, 'locate_char_any_means_char_3d [Char] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0105, SharedOpcodeChar.locateOnFootChar3D, 'locate_char_on_foot_char_3d [Char] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0106, SharedOpcodeChar.locateInCarChar3D, 'locate_char_in_car_char_3d [Char] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0114, SharedOpcodeChar.addAmmo, 'add_ammo_to_char [Char] {weaponType} [WeaponType] {ammo} [int]')
Opcode.register(0x0118, SharedOpcodeChar.isDead, 'is_char_dead {handle} [any]')
Opcode.register(0x0129, SharedOpcodeChar.createInsideCar, '[var handle: Char] = create_char_inside_car {vehicle} [Car] {pedType} [PedType] {modelId} [model_char]')
Opcode.register(0x0154, SharedOpcodeChar.isInZone, 'is_char_in_zone [Char] {zone} [zone_key]')
Opcode.register(0x0172, SharedOpcodeChar.getHeading, '[var heading: float] = get_char_heading [Char]')
Opcode.register(0x0173, SharedOpcodeChar.setHeading, 'set_char_heading [Char] {heading} [float]')
Opcode.register(0x0184, SharedOpcodeChar.isHealthGreater, 'is_char_health_greater [Char] {health} [int]')
Opcode.register(0x01a1, SharedOpcodeChar.isInAreaOnFoot2D, 'is_char_in_area_on_foot_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x01a2, SharedOpcodeChar.isInAreaInCar2D, 'is_char_in_area_in_car_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x01a3, SharedOpcodeChar.isStoppedInArea2D, 'is_char_stopped_in_area_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x01a4, SharedOpcodeChar.isStoppedInAreaOnFoot2D, 'is_char_stopped_in_area_on_foot_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x01a5, SharedOpcodeChar.isStoppedInAreaInCar2D, 'is_char_stopped_in_area_in_car_2d [Char] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x01a6, SharedOpcodeChar.isInAreaOnFoot3D, 'is_char_in_area_on_foot_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x01a7, SharedOpcodeChar.isInAreaInCar3D, 'is_char_in_area_in_car_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x01a8, SharedOpcodeChar.isStoppedInArea3D, 'is_char_stopped_in_area_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x01a9, SharedOpcodeChar.isStoppedInAreaOnFoot3D, 'is_char_stopped_in_area_on_foot_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x01aa, SharedOpcodeChar.isStoppedInAreaInCar3D, 'is_char_stopped_in_area_in_car_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x01b2, SharedOpcodeChar.giveWeapon, 'give_weapon_to_char [Char] {weaponType} [WeaponType] {ammo} [int]')
Opcode.register(0x01b9, SharedOpcodeChar.setCurrentWeapon, 'set_current_char_weapon [Char] {weaponType} [WeaponType]')
Opcode.register(0x01c2, SharedOpcodeChar.markAsNoLongerNeeded, 'mark_char_as_no_longer_needed [Char]')
Opcode.register(0x01c5, SharedOpcodeChar.dontRemove, 'dont_remove_char [Char]')
Opcode.register(0x01c8, SharedOpcodeChar.createAsPassenger, '[var handle: Char] = create_char_as_passenger {vehicle} [Car] {pedType} [PedType] {modelId} [model_char] {seat} [SeatId]')
Opcode.register(0x0202, SharedOpcodeChar.locateAnyMeansCar2D, 'locate_char_any_means_car_2d [Char] {vehicle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0203, SharedOpcodeChar.locateOnFootCar2D, 'locate_char_on_foot_car_2d [Char] {vehicle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0204, SharedOpcodeChar.locateInCarCar2D, 'locate_char_in_car_car_2d [Char] {handle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0205, SharedOpcodeChar.locateAnyMeansCar3D, 'locate_char_any_means_car_3d [Char] {vehicle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0206, SharedOpcodeChar.locateOnFootCar3D, 'locate_char_on_foot_car_3d [Char] {vehicle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0207, SharedOpcodeChar.locateInCarCar3D, 'locate_char_in_car_car_3d [Char] {vehicle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0223, SharedOpcodeChar.setHealth, 'set_char_health [Char] {health} [int]')
Opcode.register(0x0226, SharedOpcodeChar.getHealth, '[var health: int] = get_char_health [Char]')
Opcode.register(0x0245, SharedOpcodeChar.setAnimGroup, 'set_anim_group_for_char [Char] {animGroup} [AnimGroup]')
Opcode.register(0x02a9, SharedOpcodeChar.setOnlyDamagedByPlayer, 'set_char_only_damaged_by_player [Char] {state} [bool]')
Opcode.register(0x02ab, SharedOpcodeChar.setProofs, 'set_char_proofs [Char] {bulletProof} [bool] {fireProof} [bool] {explosionProof} [bool] {collisionProof} [bool] {meleeProof} [bool]')
Opcode.register(0x02cb, SharedOpcodeChar.isOnScreen, 'is_char_on_screen [Char]')
Opcode.register(0x02d8, SharedOpcodeChar.isCurrentWeapon, 'is_current_char_weapon [Char] {weaponType} [WeaponType]')
Opcode.register(0x02e0, SharedOpcodeChar.isShooting, 'is_char_shooting [Char]')
Opcode.register(0x02e2, SharedOpcodeChar.setAccuracy, 'set_char_accuracy [Char] {accuracy} [int]')
Opcode.register(0x02f2, SharedOpcodeChar.isModel, 'is_char_model [Char] {modelId} [model_char]')
Opcode.register(0x031d, SharedOpcodeChar.hasBeenDamagedByWeapon, 'has_char_been_damaged_by_weapon [Char] {weaponType} [WeaponType]')
Opcode.register(0x0321, SharedOpcodeChar.explodeHead, 'explode_char_head [Char]')
Opcode.register(0x0332, SharedOpcodeChar.setBleeding, 'set_char_bleeding [Char] {state} [bool]')
Opcode.register(0x0337, SharedOpcodeChar.setVisible, 'set_char_visible [Char] {state} [bool]')
Opcode.register(0x034f, SharedOpcodeChar.removeElegantly, 'remove_char_elegantly [Char]')
Opcode.register(0x0350, SharedOpcodeChar.setStayInSamePlace, 'set_char_stay_in_same_place [Char] {state} [bool]')
Opcode.register(0x035f, SharedOpcodeChar.addArmor, 'add_armour_to_char [Char] {amount} [int]')
Opcode.register(0x0362, SharedOpcodeChar.warpFromCarToCoord, 'warp_char_from_car_to_coord [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x036a, SharedOpcodeChar.warpIntoCar, 'warp_char_into_car [Char] {vehicle} [Car]')
Opcode.register(0x0376, SharedOpcodeChar.createRandom, '[var handle: Char] = create_random_char {x} [float] {y} [float] {z} [float]')
Opcode.register(0x039e, SharedOpcodeChar.setCantBeDraggedOut, 'set_char_cant_be_dragged_out [Char] {state} [bool]')
Opcode.register(0x03a3, SharedOpcodeChar.isMale, 'is_char_male [Char]')
Opcode.register(0x03c0, SharedOpcodeChar.storeCarIsInNoSave, '[var handle: Car] = store_car_char_is_in_no_save [Char]')
Opcode.register(0x03fe, SharedOpcodeChar.setMoney, 'set_char_money [Char] {amount} [int]')
Opcode.register(0x0433, SharedOpcodeChar.setIsChrisCriminal, 'set_char_is_chris_criminal [Char] {state} [bool]')
Opcode.register(0x0446, SharedOpcodeChar.setSuffersCriticalHits, 'set_char_suffers_critical_hits [Char] {state} [bool]')
Opcode.register(0x0448, SharedOpcodeChar.isSittingInCar, 'is_char_sitting_in_car [Char] {vehicle} [Car]')
Opcode.register(0x0449, SharedOpcodeChar.isSittingInAnyCar, 'is_char_sitting_in_any_car [Char]')
Opcode.register(0x044b, SharedOpcodeChar.isOnFoot, 'is_char_on_foot [Char]')
Opcode.register(0x0464, SharedOpcodeChar.attachToCar, 'attach_char_to_car [Char] {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {position} [int] {angleLimit} [float] {weaponType} [WeaponType]')
Opcode.register(0x0465, SharedOpcodeChar.detachFromCar, 'detach_char_from_car [Char]')
Opcode.register(0x0467, SharedOpcodeChar.clearLastWeaponDamage, 'clear_char_last_weapon_damage [Char]')
Opcode.register(0x046d, SharedOpcodeChar.getNumberOfFollowers, '[var number: int] = get_number_of_followers [Char]')
Opcode.register(0x0470, SharedOpcodeChar.getCurrentWeapon, '[var weaponType: WeaponType] = get_current_char_weapon [Char]')
Opcode.register(0x0471, SharedOpcodeChar.locateAnyMeansObject2D, 'locate_char_any_means_object_2d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0472, SharedOpcodeChar.locateOnFootObject2D, 'locate_char_on_foot_object_2d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0473, SharedOpcodeChar.locateInCarObject2D, 'locate_char_in_car_object_2d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0474, SharedOpcodeChar.locateAnyMeansObject3D, 'locate_char_any_means_object_3d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0475, SharedOpcodeChar.locateOnFootObject3D, 'locate_char_on_foot_object_3d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0476, SharedOpcodeChar.locateInCarObject3D, 'locate_char_in_car_object_3d [Char] {object} [Object] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x047a, SharedOpcodeChar.isOnAnyBike, 'is_char_on_any_bike [Char]')
Opcode.register(0x0480, SharedOpcodeChar.canSeeDeadChar, 'can_char_see_dead_char [Char] {pedType} [PedType]')
Opcode.register(0x0489, SharedOpcodeChar.shutUp, 'shut_char_up [Char] {state} [bool]')
Opcode.register(0x048f, SharedOpcodeChar.removeAllWeapons, 'remove_all_char_weapons [Char]')
Opcode.register(0x04ad, SharedOpcodeChar.isInWater, 'is_char_in_water [Char]')
Opcode.register(0x04b8, SharedOpcodeChar.getWeaponInSlot, '[var weaponType: WeaponType], [var weaponAmmo: int], [var weaponModel: model_object] = get_char_weapon_in_slot [Char] {weaponSlotId} [WeaponSlot]')
Opcode.register(0x04c4, SharedOpcodeChar.getOffsetInWorldCoords, '[var x: float], [var y: float], [var z: float] = get_offset_from_char_in_world_coords [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float]')
Opcode.register(0x04c5, SharedOpcodeChar.hasBeenPhotographed, 'has_char_been_photographed [Char]')
Opcode.register(0x04d7, SharedOpcodeChar.freezePosition, 'freeze_char_position [Char] {state} [bool]')
Opcode.register(0x04d8, SharedOpcodeChar.setDrownsInWater, 'set_char_drowns_in_water [Char] {state} [bool]')
Opcode.register(0x04dd, SharedOpcodeChar.getArmor, '[var armor: int] = get_char_armour [Char]')
Opcode.register(0x04f0, SharedOpcodeChar.isWaitingForWorldCollision, 'is_char_waiting_for_world_collision [Char]')
Opcode.register(0x04f4, SharedOpcodeChar.attachToObject, 'attach_char_to_object [Char] {handle} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {orientation} [int] {angleLimit} [float] {weaponType} [WeaponType]')
Opcode.register(0x051a, SharedOpcodeChar.hasBeenDamagedByChar, 'has_char_been_damaged_by_char [Char] {handle} [Char]')
Opcode.register(0x0526, SharedOpcodeChar.setStayInCarWhenJacked, 'set_char_stay_in_car_when_jacked [Char] {state} [bool]')
Opcode.register(0x054a, SharedOpcodeChar.setCanBeShotInVehicle, 'set_char_can_be_shot_in_vehicle [Char] {state} [bool]')
Opcode.register(0x054e, SharedOpcodeChar.clearLastDamageEntity, 'clear_char_last_damage_entity [Char]')
Opcode.register(0x0560, SharedOpcodeChar.createRandomAsDriver, '[var handle: Char] = create_random_char_as_driver {vehicle} [Car]')
Opcode.register(0x0561, SharedOpcodeChar.createRandomAsPassenger, '[var handle: Char] = create_random_char_as_passenger {vehicle} [Car] {seat} [SeatId]')
Opcode.register(0x0568, SharedOpcodeChar.setNeverTargeted, 'set_char_never_targeted [Char] {state} [bool]')
Opcode.register(0x056c, SharedOpcodeChar.isInAnyPoliceVehicle, 'is_char_in_any_police_vehicle [Char]')
Opcode.register(0x056d, SharedOpcodeChar.doesExist, 'does_char_exist {handle} [any]')
Opcode.register(0x0588, SharedOpcodeChar.setLoadCollisionFlag, 'set_load_collision_for_char_flag [Char] {state} [bool]')
Opcode.register(0x0597, SharedOpcodeChar.isDucking, 'is_char_ducking [Char]')
