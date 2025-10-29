SanAndreasOpcodeSearchlight = {}
SanAndreasOpcodeSearchlight.__index = SanAndreasOpcodeSearchlight

-- Opcode: 0x06B1
-- Instruction: [var handle: Searchlight] = create_searchlight {x} [float] {y} [float] {z} [float] {xPoint} [float] {yPoint} [float] {zPoint} [float] {radius} [float] {radiusPoint} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06B1
function SanAndreasOpcodeSearchlight.create(posX, posY, posZ, targetX, targetY, targetZ, targetRadius, radius, _)
    return SearchLightElement:create(posX, posY, posZ, targetX, targetY, targetZ, radius, targetRadius)
end

-- Opcode: 0x06B2
-- Instruction: delete_searchlight [Searchlight]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06B2
function SanAndreasOpcodeSearchlight.delete(searchlight)
    return searchlight:destroy()
end

-- Opcode: 0x06B3
-- Instruction: does_searchlight_exist {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06B3
function SanAndreasOpcodeSearchlight.doesExist(searchlight)
    if (type(searchlight) ~= "table" or searchlight:getType() ~= 'searchlight' or not searchlight.element) then
        return false
    end

    return searchlight.spawned
end

-- Opcode: 0x06B4
-- Instruction: move_searchlight_between_coords [Searchlight] {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {speed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06B4
function SanAndreasOpcodeSearchlight.moveBetweenCoords(_)
    return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06B5
-- Instruction: point_searchlight_at_coord [Searchlight] {x} [float] {y} [float] {z} [float] {speed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06B5
function SanAndreasOpcodeSearchlight.pointAtCoord(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06B6
-- Instruction: point_searchlight_at_char [Searchlight] {handle} [Char] {speed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06B6
function SanAndreasOpcodeSearchlight.pointAtChar(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06B7
-- Instruction: is_char_in_searchlight [Searchlight] {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06B7
function SanAndreasOpcodeSearchlight.isCharIn(searchlight, actor)
   return searchlight:hasSpotted(actor)
end

-- Opcode: 0x06BF
-- Instruction: point_searchlight_at_vehicle [Searchlight] {handle} [Car] {speed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06BF
function SanAndreasOpcodeSearchlight.pointAtVehicle(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06C0
-- Instruction: is_vehicle_in_searchlight [Searchlight] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06C0
function SanAndreasOpcodeSearchlight.isVehicleIn(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06C1
-- Instruction: [var handle: Searchlight] = create_searchlight_on_vehicle {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xPoint} [float] {yPoint} [float] {zPoint} [float] {pointRadius} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06C1
function SanAndreasOpcodeSearchlight.createOnVehicle(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06CA
-- Instruction: attach_searchlight_to_searchlight_object [Searchlight] {spotTower} [Object] {spotHousing} [Object] {spotBulb} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06CA
function SanAndreasOpcodeSearchlight.attachToObject(light, tower, housing, bulb, offsetX, offsetY, offsetZ)
    Script.setOpcodePartiallyImplemented()
    return light:attach(bulb, offsetX, offsetY, offsetZ)
end

-- Opcode: 0x0941
-- Instruction: set_searchlight_clip_if_colliding [Searchlight] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0941
function SanAndreasOpcodeSearchlight.setClipIfColliding(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A02
-- Instruction: switch_on_ground_searchlight [Searchlight] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A02
function SanAndreasOpcodeSearchlight.switchOnGround(_)
    return Script.setOpcodePartiallyImplemented()
end


Opcode.register(0x06b1, SanAndreasOpcodeSearchlight.create, '[var handle: Searchlight] = create_searchlight {x} [float] {y} [float] {z} [float] {xPoint} [float] {yPoint} [float] {zPoint} [float] {radius} [float] {radiusPoint} [float]')
Opcode.register(0x06b2, SanAndreasOpcodeSearchlight.delete, 'delete_searchlight [Searchlight]')
Opcode.register(0x06b3, SanAndreasOpcodeSearchlight.doesExist, 'does_searchlight_exist {handle} [any]')
Opcode.register(0x06b4, SanAndreasOpcodeSearchlight.moveBetweenCoords, 'move_searchlight_between_coords [Searchlight] {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {speed} [float]')
Opcode.register(0x06b5, SanAndreasOpcodeSearchlight.pointAtCoord, 'point_searchlight_at_coord [Searchlight] {x} [float] {y} [float] {z} [float] {speed} [float]')
Opcode.register(0x06b6, SanAndreasOpcodeSearchlight.pointAtChar, 'point_searchlight_at_char [Searchlight] {handle} [Char] {speed} [float]')
Opcode.register(0x06b7, SanAndreasOpcodeSearchlight.isCharIn, 'is_char_in_searchlight [Searchlight] {handle} [Char]')
Opcode.register(0x06bf, SanAndreasOpcodeSearchlight.pointAtVehicle, 'point_searchlight_at_vehicle [Searchlight] {handle} [Car] {speed} [float]')
Opcode.register(0x06c0, SanAndreasOpcodeSearchlight.isVehicleIn, 'is_vehicle_in_searchlight [Searchlight] {handle} [Car]')
Opcode.register(0x06c1, SanAndreasOpcodeSearchlight.createOnVehicle, '[var handle: Searchlight] = create_searchlight_on_vehicle {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xPoint} [float] {yPoint} [float] {zPoint} [float] {pointRadius} [float] {radius} [float]')
Opcode.register(0x06ca, SanAndreasOpcodeSearchlight.attachToObject, 'attach_searchlight_to_searchlight_object [Searchlight] {spotTower} [Object] {spotHousing} [Object] {spotBulb} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float]')
Opcode.register(0x0941, SanAndreasOpcodeSearchlight.setClipIfColliding, 'set_searchlight_clip_if_colliding [Searchlight] {state} [bool]')
Opcode.register(0x0a02, SanAndreasOpcodeSearchlight.switchOnGround, 'switch_on_ground_searchlight [Searchlight] {state} [bool]')
