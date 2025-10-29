SharedOpcodeObject = {}
SharedOpcodeObject.__index = SharedOpcodeObject

-- Opcode: 0x0107
-- Instruction: [var handle: Object] = create_object {modelId} [model_object] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0107
function SharedOpcodeObject.create(model, posX, posY, posZ, _)
    return opcodes[0x029B](model, posX, posY, posZ, nil)
end

-- Opcode: 0x0108
-- Instruction: delete_object [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0108
function SharedOpcodeObject.delete(object)
    if (type(object) ~= "table") then
        return false
    end

    Thread.currentThread:removeFromCleanupList(object)
    return object:destroy()
end

-- Opcode: 0x0176
-- Instruction: [var heading: float] = get_object_heading [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0176
function SharedOpcodeObject.getHeading(object, _)
    local _, _, zAngle = object:getRotation()
    return zAngle
end

-- Opcode: 0x0177
-- Instruction: set_object_heading [Object] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0177
function SharedOpcodeObject.setHeading(object, zAngle)
    local rotX, rotY, _ = object:getRotation()
    return object:setRotation(rotX, rotY, zAngle)
end

-- Opcode: 0x01BB
-- Instruction: [var x: float], [var y: float], [var z: float] = get_object_coordinates [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01BB
function SharedOpcodeObject.getCoordinates(object, _, _, _)
    local posX, posY, posZ = object:getPosition()

    Script.storeValueAtIndex(2, posX)
    Script.storeValueAtIndex(3, posY)
    Script.storeValueAtIndex(4, posZ)

    return true
end

-- Opcode: 0x01BC
-- Instruction: set_object_coordinates [Object] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01BC
function SharedOpcodeObject.setCoordinates(object, posX, posY, posZ)
    return object:setPosition(posX, posY, posZ)
end

-- Opcode: 0x01C4
-- Instruction: mark_object_as_no_longer_needed [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01C4
function SharedOpcodeObject.markAsNoLongerNeeded(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01C7
-- Instruction: dont_remove_object [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01C7
function SharedOpcodeObject.dontRemove(object)
    if (Thread.currentThread:isMissionThread()) then
        Thread.currentThread:removeFromCleanupList(object)
    end

    return true
end

-- Opcode: 0x029B
-- Instruction: [var handle: Object] = create_object_no_offset {modelId} [model_object] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/029B
function SharedOpcodeObject.createNoOffset(model, posX, posY, posZ, _)
    local object = ObjectElement:create(model)
    object:spawn(posX, posY, posZ)

    if (Thread.currentThread:isMissionThread()) then
        Thread.currentThread:addToCleanupList(object)
    end

    return object
end

-- Opcode: 0x02CC
-- Instruction: is_object_on_screen [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02CC
function SharedOpcodeObject.isOnScreen(_)
    Script.setOpcodePartiallyImplemented()
    return true
end

-- Opcode: 0x034D
-- Instruction: rotate_object [Object] {fromAngle} [float] {toAngle} [float] {collisionCheck} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/034D
function SharedOpcodeObject.rotate(object, startAngle, endAngle, flag)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x034E
-- Instruction: slide_object [Object] {fromX} [float] {fromY} [float] {fromZ} [float] {xSpeed} [float] {ySpeed} [float] {zSpeed} [float] {collisionCheck} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/034E
function SharedOpcodeObject.slide(object, destX, destY, destZ, speedX, speedY, speedZ, collisionCheck)
    return object:moveTo(destX, destY, destZ, speedX, speedY, speedZ, collisionCheck == 1)
end

-- Opcode: 0x035C
-- Instruction: place_object_relative_to_car [Object] {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/035C
function SharedOpcodeObject.placeRelativeToCar(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x035D
-- Instruction: make_object_targettable [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/035D
function SharedOpcodeObject.makeTargetable(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0366
-- Instruction: has_object_been_damaged [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0366
function SharedOpcodeObject.hasBeenDamaged(object)
   return object:isDamaged()
end

-- Opcode: 0x0381
-- Instruction: set_object_velocity [Object] {xSpeed} [float] {ySpeed} [float] {zSpeed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0381
function SharedOpcodeObject.setVelocity(object, offX, offY, offZ)
    Script.setOpcodePartiallyImplemented()
    -- The only logical way, but not sure if it's the correct one; need more testing
    return object:setVelocity(offX, offY, offZ)
end

-- Opcode: 0x0382
-- Instruction: set_object_collision [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0382
function SharedOpcodeObject.setCollision(object, toggle)
    object:setCollisionsEnabled(toggle == 1)
end

-- Opcode: 0x038C
-- Instruction: add_to_object_velocity [Object] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/038C
function SharedOpcodeObject.addToVelocity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0392
-- Instruction: set_object_dynamic [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0392
function SharedOpcodeObject.setDynamic(object, moveable)
    object:setFrozen(moveable ~= 1)
end

-- Opcode: 0x03CA
-- Instruction: does_object_exist {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03CA
function SharedOpcodeObject.doesExist(object)
    if (type(object) ~= "table") then
        return false
    end

    return object.spawned
end

-- Opcode: 0x0400
-- Instruction: [var x: float], [var y: float], [var z: float] = get_offset_from_object_in_world_coords [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0400
function SharedOpcodeObject.getOffsetInWorldCoords(object, offX, offY, offZ, posX, posY, posZ)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0418
-- Instruction: set_object_draw_last [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0418
function SharedOpcodeObject.setDrawLast(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0453
-- Instruction: set_object_rotation [Object] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0453
function SharedOpcodeObject.setRotation(object, rotX, rotY, rotZ)
    return object:setRotation(rotX, rotY, rotZ)
end

-- Opcode: 0x04D9
-- Instruction: set_object_records_collisions [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04D9
function SharedOpcodeObject.setRecordsCollisions(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04DA
-- Instruction: has_object_collided_with_anything [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04DA
function SharedOpcodeObject.hasCollidedWithAnything(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04E5
-- Instruction: locate_object_2d [Object] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04E5
function SharedOpcodeObject.locate2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04E6
-- Instruction: locate_object_3d [Object] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04E6
function SharedOpcodeObject.locate3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04E7
-- Instruction: is_object_in_water [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04E7
function SharedOpcodeObject.isInWater(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04E9
-- Instruction: is_object_in_area_2d [Object] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04E9
function SharedOpcodeObject.isInArea2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04EA
-- Instruction: is_object_in_area_3d [Object] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04EA
function SharedOpcodeObject.isInArea3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x050E
-- Instruction: sort_out_object_collision_with_car [Object] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/050E
function SharedOpcodeObject.sortOutCollisionWithCar(object, car)
   object:setCollidableWith(car, false)
end

-- Opcode: 0x0550
-- Instruction: freeze_object_position [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0550
function SharedOpcodeObject.freezePosition(_)
    return true
end

-- Opcode: 0x0566
-- Instruction: set_object_area_visible [Object] {areaId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0566
function SharedOpcodeObject.setAreaVisible(object, interior)
    return object:setInterior(interior)
end


Opcode.register(0x0107, SharedOpcodeObject.create, '[var handle: Object] = create_object {modelId} [model_object] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0108, SharedOpcodeObject.delete, 'delete_object [Object]')
Opcode.register(0x0176, SharedOpcodeObject.getHeading, '[var heading: float] = get_object_heading [Object]')
Opcode.register(0x0177, SharedOpcodeObject.setHeading, 'set_object_heading [Object] {heading} [float]')
Opcode.register(0x01bb, SharedOpcodeObject.getCoordinates, '[var x: float], [var y: float], [var z: float] = get_object_coordinates [Object]')
Opcode.register(0x01bc, SharedOpcodeObject.setCoordinates, 'set_object_coordinates [Object] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x01c4, SharedOpcodeObject.markAsNoLongerNeeded, 'mark_object_as_no_longer_needed [Object]')
Opcode.register(0x01c7, SharedOpcodeObject.dontRemove, 'dont_remove_object [Object]')
Opcode.register(0x029b, SharedOpcodeObject.createNoOffset, '[var handle: Object] = create_object_no_offset {modelId} [model_object] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x02cc, SharedOpcodeObject.isOnScreen, 'is_object_on_screen [Object]')
Opcode.register(0x034d, SharedOpcodeObject.rotate, 'rotate_object [Object] {fromAngle} [float] {toAngle} [float] {collisionCheck} [bool]')
Opcode.register(0x034e, SharedOpcodeObject.slide, 'slide_object [Object] {fromX} [float] {fromY} [float] {fromZ} [float] {xSpeed} [float] {ySpeed} [float] {zSpeed} [float] {collisionCheck} [bool]')
Opcode.register(0x035c, SharedOpcodeObject.placeRelativeToCar, 'place_object_relative_to_car [Object] {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float]')
Opcode.register(0x035d, SharedOpcodeObject.makeTargetable, 'make_object_targettable [Object] {state} [bool]')
Opcode.register(0x0366, SharedOpcodeObject.hasBeenDamaged, 'has_object_been_damaged [Object]')
Opcode.register(0x0381, SharedOpcodeObject.setVelocity, 'set_object_velocity [Object] {xSpeed} [float] {ySpeed} [float] {zSpeed} [float]')
Opcode.register(0x0382, SharedOpcodeObject.setCollision, 'set_object_collision [Object] {state} [bool]')
Opcode.register(0x038c, SharedOpcodeObject.addToVelocity, 'add_to_object_velocity [Object] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0392, SharedOpcodeObject.setDynamic, 'set_object_dynamic [Object] {state} [bool]')
Opcode.register(0x03ca, SharedOpcodeObject.doesExist, 'does_object_exist {handle} [any]')
Opcode.register(0x0400, SharedOpcodeObject.getOffsetInWorldCoords, '[var x: float], [var y: float], [var z: float] = get_offset_from_object_in_world_coords [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float]')
Opcode.register(0x0418, SharedOpcodeObject.setDrawLast, 'set_object_draw_last [Object] {state} [bool]')
Opcode.register(0x0453, SharedOpcodeObject.setRotation, 'set_object_rotation [Object] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x04d9, SharedOpcodeObject.setRecordsCollisions, 'set_object_records_collisions [Object] {state} [bool]')
Opcode.register(0x04da, SharedOpcodeObject.hasCollidedWithAnything, 'has_object_collided_with_anything [Object]')
Opcode.register(0x04e5, SharedOpcodeObject.locate2D, 'locate_object_2d [Object] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x04e6, SharedOpcodeObject.locate3D, 'locate_object_3d [Object] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x04e7, SharedOpcodeObject.isInWater, 'is_object_in_water [Object]')
Opcode.register(0x04e9, SharedOpcodeObject.isInArea2D, 'is_object_in_area_2d [Object] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x04ea, SharedOpcodeObject.isInArea3D, 'is_object_in_area_3d [Object] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x050e, SharedOpcodeObject.sortOutCollisionWithCar, 'sort_out_object_collision_with_car [Object] {handle} [Car]')
Opcode.register(0x0550, SharedOpcodeObject.freezePosition, 'freeze_object_position [Object] {state} [bool]')
Opcode.register(0x0566, SharedOpcodeObject.setAreaVisible, 'set_object_area_visible [Object] {areaId} [int]')
