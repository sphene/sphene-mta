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

    return posX, posY, posZ
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


-- INI: 0107=5,%5d% = create_object %1o% at %2d% %3d% %4d%
Opcode.register(0x0107, SharedOpcodeObject.create, 5, '${5} = create_object ${object.1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 0108=1,destroy_object %1d%
Opcode.register(0x0108, SharedOpcodeObject.delete, 1, 'delete_object ${1}', {false})
-- INI: 0176=2,%2d% = object %1d% z_angle
Opcode.register(0x0176, SharedOpcodeObject.getHeading, 2, '${2} = get_object_heading ${1}', {false, true})
-- INI: 0177=2,set_object %1d% z_angle_to %2d%
Opcode.register(0x0177, SharedOpcodeObject.setHeading, 2, 'set_object_heading ${1} ${2}', {false, false})
-- INI: 01bb=4,store_object %1d% position_to %2d% %3d% %4d%
Opcode.register(0x01bb, SharedOpcodeObject.getCoordinates, 4, '${2}, ${3}, ${4} = get_object_coordinates ${1}', {false, true, true, true})
-- INI: 01bc=4,put_object %1d% at %2d% %3d% %4d%
Opcode.register(0x01bc, SharedOpcodeObject.setCoordinates, 4, 'set_object_coordinates ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 01c4=1,mark_object_as_no_longer_needed %1d%
Opcode.register(0x01c4, SharedOpcodeObject.markAsNoLongerNeeded, 1, 'mark_object_as_no_longer_needed ${1}', {false})
-- INI: 01c7=1,remove_object_from_mission_cleanup_list %1d%
Opcode.register(0x01c7, SharedOpcodeObject.dontRemove, 1, 'dont_remove_object ${1}', {false})
-- INI: 029b=5,%5d% = init_object %1o% at %2d% %3d% %4d%
Opcode.register(0x029b, SharedOpcodeObject.createNoOffset, 5, '${5} = create_object_no_offset ${object.1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 02cc=1,  object %1d% bounding_sphere_visible
Opcode.register(0x02cc, SharedOpcodeObject.isOnScreen, 1, 'is_object_on_screen ${1}', {false})
-- INI: 034d=4,rotate_object %1d% from_angle %2d% to_angle %3d% flag %4d%
Opcode.register(0x034d, SharedOpcodeObject.rotate, 4, 'rotate_object ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 034e=8,move_object %1d% to %2d% %3d% %4d% speed %5d% %6d% %7d% collision_check %8d%
Opcode.register(0x034e, SharedOpcodeObject.slide, 8, 'slide_object ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 035c=5,place_object %1d% relative_to_car %2d% offset %3d% %4d% %5d%
Opcode.register(0x035c, SharedOpcodeObject.placeRelativeToCar, 5, 'place_object_relative_to_car ${1} ${2} ${3} ${4} ${5}', {false, true, true, true, true})
-- INI: 035d=1,make_object %1d% targetable
Opcode.register(0x035d, SharedOpcodeObject.makeTargetable, 2, 'make_object_targettable ${1} ${2}', {false, false})
-- INI: 0366=1,  object %1d% damaged
Opcode.register(0x0366, SharedOpcodeObject.hasBeenDamaged, 1, 'has_object_been_damaged ${1}', {false})
-- INI: 0381=4,throw_object %1d% distance %2d% %3d% %4d%
Opcode.register(0x0381, SharedOpcodeObject.setVelocity, 4, 'set_object_velocity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0382=2,set_object %1d% collision_detection %2d%
Opcode.register(0x0382, SharedOpcodeObject.setCollision, 2, 'set_object_collision ${1} ${2}', {false, false})
-- INI: 038c=4,object %1d% scatter %2d% %3d% %4d%
Opcode.register(0x038c, SharedOpcodeObject.addToVelocity, 4, 'add_to_object_velocity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0392=2,object %1d% toggle_in_moving_list %2d%
Opcode.register(0x0392, SharedOpcodeObject.setDynamic, 2, 'set_object_dynamic ${1} ${2}', {false, false})
-- INI: 03ca=1,  object %1d% exists
Opcode.register(0x03ca, SharedOpcodeObject.doesExist, 1, 'does_object_exist ${1}', {false})
-- INI: 0400=7,create_coordinate %5d% %6d% %7d% from_object %1d% offset %2d% %3d% %4d%
Opcode.register(0x0400, SharedOpcodeObject.getOffsetInWorldCoords, 7, '${5}, ${6}, ${7} = get_offset_from_object_in_world_coords ${1} ${2} ${3} ${4}', {false, false, false, false, true, true, true})
-- INI: 0418=2,set_object %1d% draw_last %2h%
Opcode.register(0x0418, SharedOpcodeObject.setDrawLast, 2, 'set_object_draw_last ${1} ${2}', {false, false})
-- INI: 0453=4,object %1d% set_rotation %2d% %3d% %4d%
Opcode.register(0x0453, SharedOpcodeObject.setRotation, 4, 'set_object_rotation ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 04d9=2,object %1d% set_scripted_collision_check %2h%
Opcode.register(0x04d9, SharedOpcodeObject.setRecordsCollisions, 2, 'set_object_records_collisions ${1} ${2}', {false, false})
-- INI: 04da=1,  has_object %1d% collided
Opcode.register(0x04da, SharedOpcodeObject.hasCollidedWithAnything, 1, 'has_object_collided_with_anything ${1}', {false})
-- INI: 04e5=6,  object %1d% near_point %2d% %3d% radius %4d% %5d% sphere %6h%
Opcode.register(0x04e5, SharedOpcodeObject.locate2D, 6, 'locate_object_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 04e6=8,  object %1d% near_point %2d% %3d% %4d% radius %5d% %6d% %7d% flag %8h%
Opcode.register(0x04e6, SharedOpcodeObject.locate3D, 8, 'locate_object_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 04e7=1,  object %1d% in_water
Opcode.register(0x04e7, SharedOpcodeObject.isInWater, 1, 'is_object_in_water ${1}', {false})
-- INI: 04e9=6,  object %1d% in_rectangle_cornerA %2d% %3d% cornerB %4d% %5d% sphere %6d%
Opcode.register(0x04e9, SharedOpcodeObject.isInArea2D, 6, 'is_object_in_area_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 04ea=8,  object %1d% in_cube %2d% %3d% %4d% %5d% %6d% %7d% flag %8h%
Opcode.register(0x04ea, SharedOpcodeObject.isInArea3D, 8, 'is_object_in_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 050e=2,sort_out_object %1d% collision_with_car %2d%
Opcode.register(0x050e, SharedOpcodeObject.sortOutCollisionWithCar, 2, 'sort_out_object_collision_with_car ${1} ${2}', {false, false})
-- INI: 0550=2,keep_object %1d% in_memory %2h%
Opcode.register(0x0550, SharedOpcodeObject.freezePosition, 2, 'freeze_object_position ${1} ${2}', {false, false})
-- INI: 0566=2,object %1d% set_interior %2h%
Opcode.register(0x0566, SharedOpcodeObject.setAreaVisible, 2, 'set_object_area_visible ${1} ${2}', {false, false})
