SharedOpcodeBlip = {}
SharedOpcodeBlip.__index = SharedOpcodeBlip

-- Opcode: 0x0161
-- Instruction: [var handle: Blip] = add_blip_for_car_old {vehicle} [Car] {color} [BlipColor] {display} [BlipDisplay]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0161
function SharedOpcodeBlip.addForCarOld(car, color, visibility)
    Script.setOpcodePartiallyImplemented()
    local marker = MarkerElement:create(0, 0, 0, "arrow", 1, 255, 0, 0)

    marker:setAlpha(0xE4)
    marker:attachAbove(car)
    marker:setColor(color)

    local icon = BlipElement:create(0, 0, 0, 0, 1, 255, 0, 0)
    icon:setVisibleDistance(65535)
    icon:attach(marker)
    icon:setColor(color)

    marker:assignBlip(icon)

    return marker
end

-- Opcode: 0x0164
-- Instruction: remove_blip [Blip]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0164
function SharedOpcodeBlip.remove(marker)
    Script.setOpcodePartiallyImplemented()

    if (type(marker) ~= "table") then
        return false
    end

    return marker:destroy()
end

-- Opcode: 0x0165
-- Instruction: change_blip_colour [Blip] {color} [BlipColor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0165
function SharedOpcodeBlip.changeColor(marker, color)
    marker:setColor(color)
end

-- Opcode: 0x0167
-- Instruction: [var handle: Blip] = add_blip_for_coord_old {x} [float] {y} [float] {z} [float] {colour} [BlipColor] {display} [BlipDisplay]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0167
function SharedOpcodeBlip.addForCoordOld(posX, posY, posZ, color, flag, _)
    Script.setOpcodePartiallyImplemented()
    local icon = BlipElement:create(posX, posY, posZ, 0, 1, 231, 193, 99, 255)
    icon:setVisibleDistance(65535)

    return icon
end

-- Opcode: 0x0168
-- Instruction: change_blip_scale [Blip] {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0168
function SharedOpcodeBlip.changeScale(marker, size)
    marker:setSize(size)
end

-- Opcode: 0x0186
-- Instruction: [var handle: Blip] = add_blip_for_car {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0186
function SharedOpcodeBlip.addForCar(car, _)
    local marker = MarkerElement:create(0, 0, 0, "arrow", 1, 255, 0, 0)

    marker:setAlpha(0xE4)
    marker:attachAbove(car)
    marker:setColor(2)

    local icon = BlipElement:create(0, 0, 0, 0, 1, 255, 0, 0)
    icon:setVisibleDistance(65535)
    icon:attach(marker)
    icon:setColor(2)

    marker:assignBlip(icon)

    return marker
end

-- Opcode: 0x0187
-- Instruction: [var handle: Blip] = add_blip_for_char {char} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0187
function SharedOpcodeBlip.addForChar(actor, _)
    local marker = MarkerElement:create(0, 0, 0, "arrow", 1, 255, 0, 0)

    marker:setAlpha(0xE4)
    marker:attachAbove(actor)

    local icon = BlipElement:create(0, 0, 0, 0, 1, 255, 0, 0)
    icon:setVisibleDistance(65535)
    icon:attach(marker)

    marker:assignBlip(icon)

    return marker
end

-- Opcode: 0x0188
-- Instruction: [var handle: Blip] = add_blip_for_object {object} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0188
function SharedOpcodeBlip.addForObject(object, _)
    local marker = MarkerElement:create(0, 0, 0, "arrow", 1, 255, 0, 0)

    marker:setAlpha(0xE4)
    marker:attachAbove(object)
    marker:setColor(1)

    local icon = BlipElement:create(0, 0, 0, 0, 1, 255, 0, 0)
    icon:setVisibleDistance(65535)
    icon:attach(marker)
    icon:setColor(1)

    marker:assignBlip(icon)

    return marker
end

-- Opcode: 0x018A
-- Instruction: [var handle: Blip] = add_blip_for_coord {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/018A
function SharedOpcodeBlip.addForCoord(posX, posY, posZ, _)
    local icon = BlipElement:create(posX, posY, posZ, 0, 2, 231, 193, 99, 255)
    icon:setVisibleDistance(65535)

    return icon
end

-- Opcode: 0x018B
-- Instruction: change_blip_display [Blip] {display} [BlipDisplay]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/018B
function SharedOpcodeBlip.changeDisplay(marker, mode)
    if (type(marker) ~= "table") then
        return false
    end

    marker:setMode(mode)
end

-- Opcode: 0x02A7
-- Instruction: [var handle: Blip] = add_sprite_blip_for_contact_point {x} [float] {y} [float] {z} [float] {sprite} [RadarSprite]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02A7
function SharedOpcodeBlip.addSpriteForContactPoint(posX, posY, posZ, icon, _)
    local marker = MarkerElement:create(posX, posY, posZ, "cylinder", 2, 225, 0, 0)
    marker:setAlpha(0xE4)
    marker:setHiddenInMission(true, marker:getAlpha())

    icon = BlipElement:create(posX, posY, posZ, icon, 1, 231, 193, 99)
    icon:setVisibleDistance(65535)
    icon:attach(marker)
    icon:setHiddenInMission(true, icon:getAlpha())

    marker:assignBlip(icon)

    return marker
end

-- Opcode: 0x02A8
-- Instruction: [var handle: Blip] = add_sprite_blip_for_coord {x} [float] {y} [float] {z} [float] {sprite} [RadarSprite]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02A8
function SharedOpcodeBlip.addSpriteForCoord(posX, posY, posZ, icon, _)
    Script.setOpcodePartiallyImplemented()

    icon = BlipElement:create(posX, posY, posZ, icon, 1, 231, 193, 99, 255)
    icon:setVisibleDistance(65535)

    return icon
end

-- Opcode: 0x03DC
-- Instruction: [var handle: Blip] = add_blip_for_pickup {pickup} [Pickup]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03DC
function SharedOpcodeBlip.addForPickup(pickup, _)
    local marker = MarkerElement:create(0, 0, 0, "arrow", 1, 255, 0, 0)

    marker:setAlpha(0xE4)
    marker:attachAbove(pickup)
    marker:setColor(1)

    icon = BlipElement:create(0, 0, 0, 0, 1, 255, 0, 0)
    icon:setVisibleDistance(65535)
    icon:attach(marker)
    icon:setColor(1)

    marker:assignBlip(icon)

    return marker
end

-- Opcode: 0x04CE
-- Instruction: [var handle: Blip] = add_short_range_sprite_blip_for_coord {x} [float] {y} [float] {z} [float] {sprite} [RadarSprite]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04CE
function SharedOpcodeBlip.addShortRangeSpriteForCoord(posX, posY, posZ, icon, _)
    return BlipElement:create(posX, posY, posZ, icon, 1, 231, 193, 99, 255, 0, 0, 255, 0, 100)
end

-- Opcode: 0x0570
-- Instruction: [var handle: Blip] = add_short_range_sprite_blip_for_contact_point {x} [float] {y} [float] {z} [float] {sprite} [RadarSprite]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0570
function SharedOpcodeBlip.addShortRangeSpriteForContactPoint(posX, posY, posZ, icon, _)
    local blip = BlipElement:create(posX, posY, posZ, icon)
    blip:setHiddenInMission(true, blip:getAlpha())

    return blip
end


Opcode.register(0x0161, SharedOpcodeBlip.addForCarOld, '[var handle: Blip] = add_blip_for_car_old {vehicle} [Car] {color} [BlipColor] {display} [BlipDisplay]')
Opcode.register(0x0164, SharedOpcodeBlip.remove, 'remove_blip [Blip]')
Opcode.register(0x0165, SharedOpcodeBlip.changeColor, 'change_blip_colour [Blip] {color} [BlipColor]')
Opcode.register(0x0167, SharedOpcodeBlip.addForCoordOld, '[var handle: Blip] = add_blip_for_coord_old {x} [float] {y} [float] {z} [float] {colour} [BlipColor] {display} [BlipDisplay]')
Opcode.register(0x0168, SharedOpcodeBlip.changeScale, 'change_blip_scale [Blip] {size} [int]')
Opcode.register(0x0186, SharedOpcodeBlip.addForCar, '[var handle: Blip] = add_blip_for_car {vehicle} [Car]')
Opcode.register(0x0187, SharedOpcodeBlip.addForChar, '[var handle: Blip] = add_blip_for_char {char} [Char]')
Opcode.register(0x0188, SharedOpcodeBlip.addForObject, '[var handle: Blip] = add_blip_for_object {object} [Object]')
Opcode.register(0x018a, SharedOpcodeBlip.addForCoord, '[var handle: Blip] = add_blip_for_coord {x} [float] {y} [float] {z} [float]')
Opcode.register(0x018b, SharedOpcodeBlip.changeDisplay, 'change_blip_display [Blip] {display} [BlipDisplay]')
Opcode.register(0x02a7, SharedOpcodeBlip.addSpriteForContactPoint, '[var handle: Blip] = add_sprite_blip_for_contact_point {x} [float] {y} [float] {z} [float] {sprite} [RadarSprite]')
Opcode.register(0x02a8, SharedOpcodeBlip.addSpriteForCoord, '[var handle: Blip] = add_sprite_blip_for_coord {x} [float] {y} [float] {z} [float] {sprite} [RadarSprite]')
Opcode.register(0x03dc, SharedOpcodeBlip.addForPickup, '[var handle: Blip] = add_blip_for_pickup {pickup} [Pickup]')
Opcode.register(0x04ce, SharedOpcodeBlip.addShortRangeSpriteForCoord, '[var handle: Blip] = add_short_range_sprite_blip_for_coord {x} [float] {y} [float] {z} [float] {sprite} [RadarSprite]')
Opcode.register(0x0570, SharedOpcodeBlip.addShortRangeSpriteForContactPoint, '[var handle: Blip] = add_short_range_sprite_blip_for_contact_point {x} [float] {y} [float] {z} [float] {sprite} [RadarSprite]')
