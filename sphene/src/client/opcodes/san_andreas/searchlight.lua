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


-- INI: 06B1=9,%9d% = create_searchlight_at %1d% %2d% %3d% radius %8d% target %4d% %5d% %6d% radius %7d%
Opcode.register(0x06b1, SanAndreasOpcodeSearchlight.create, 9, '${9} = create_searchlight ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false, true})
-- INI: 06B2=1,destroy_searchlight %1d%
Opcode.register(0x06b2, SanAndreasOpcodeSearchlight.delete, 1, 'delete_searchlight ${1}', {false})
-- INI: 06B3=1,  searchlight %1d% active
Opcode.register(0x06b3, SanAndreasOpcodeSearchlight.doesExist, 1, 'does_searchlight_exist ${1}', {false})
-- INI: 06B4=8,set_searchlight %1d% path_between %2d% %3d% %4d% and %5d% %6d% %7d% speed %8d%
Opcode.register(0x06b4, SanAndreasOpcodeSearchlight.moveBetweenCoords, 8, 'move_searchlight_between_coords ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 06B5=5,set_searchlight %1d% travel_to %2d% %3d% %4d% speed %5d%
Opcode.register(0x06b5, SanAndreasOpcodeSearchlight.pointAtCoord, 5, 'point_searchlight_at_coord ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 06B6=3,set_searchlight %1d% follow_actor %2d% speed %3d%
Opcode.register(0x06b6, SanAndreasOpcodeSearchlight.pointAtChar, 3, 'point_searchlight_at_char ${1} ${2} ${3}', {false, false, false})
-- INI: 06B7=2,  searchlight %1d% spotted_actor %2d%
Opcode.register(0x06b7, SanAndreasOpcodeSearchlight.isCharIn, 2, 'is_char_in_searchlight ${1} ${2}', {false, false})
-- INI: 06BF=3,set_searchlight %1d% follow_car %2d% speed %3d%
Opcode.register(0x06bf, SanAndreasOpcodeSearchlight.pointAtVehicle, 3, 'point_searchlight_at_vehicle ${1} ${2} ${3}', {false, false, false})
-- INI: 06C0=2,  searchlight %1d% spotted_car %2d%
Opcode.register(0x06c0, SanAndreasOpcodeSearchlight.isVehicleIn, 2, 'is_vehicle_in_searchlight ${1} ${2}', {false, false})
-- INI: 06C1=10,create_searchlight %10d% on_car %1d% with_offset %2d% %3d% %4d% radius %9d% target %5d% %6d% %7d% radius %8d%
Opcode.register(0x06c1, SanAndreasOpcodeSearchlight.createOnVehicle, 10, '${10} = create_searchlight_on_vehicle ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false, true})
-- INI: 06CA=7,attach_searchlight %1d% to_tower %2d% to_housing %3d% to_bulb %4d% with_offset %5d% %6d% %7d%
Opcode.register(0x06ca, SanAndreasOpcodeSearchlight.attachToObject, 7, 'attach_searchlight_to_searchlight_object ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 0941=2,unknown_searchlight %1d% flag %2h%
Opcode.register(0x0941, SanAndreasOpcodeSearchlight.setClipIfColliding, 2, 'set_searchlight_clip_if_colliding ${1} ${2}', {false, false})
-- INI: 0A02=2,set_searchlight %1d% lights_through_obstacles %2h%
Opcode.register(0x0a02, SanAndreasOpcodeSearchlight.switchOnGround, 2, 'switch_on_ground_searchlight ${1} ${2}', {false, false})
