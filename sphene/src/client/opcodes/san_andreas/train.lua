SanAndreasOpcodeTrain = {}
SanAndreasOpcodeTrain.__index = SanAndreasOpcodeTrain

-- Opcode: 0x06D8
-- Instruction: [var handle: Train] = create_mission_train {type} [int] {x} [float] {y} [float] {z} [float] {direction} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06D8
function SanAndreasOpcodeTrain.create(type, x, y, z, direction, _)
    local train = TrainElement:create(type)
    train:spawn(x, y, z, direction)

    return train
end

-- Opcode: 0x06DC
-- Instruction: set_train_speed [Train] {speed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06DC
function SanAndreasOpcodeTrain.setSpeed(train, speed)
    return train:setSpeed(speed * 0.02)
end

-- Opcode: 0x06DD
-- Instruction: set_train_cruise_speed [Train] {speed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06DD
function SanAndreasOpcodeTrain.setCruiseSpeed(train, speed)
    return train:setCruiseSpeed(speed * 0.02)
end

-- Opcode: 0x06DE
-- Instruction: [var caboose: Car] = get_train_caboose [Train]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06DE
function SanAndreasOpcodeTrain.getCaboose(train, _)
    return train:getLastCarriage()
end

-- Opcode: 0x078A
-- Instruction: [var carriage: Car] = get_train_carriage [Train] {number} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/078A
function SanAndreasOpcodeTrain.getCarriage(train, carriage, _)
   return train:getCarriage(carriage)
end

-- Opcode: 0x07BD
-- Instruction: delete_mission_train [Train]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07BD
function SanAndreasOpcodeTrain.delete(train)
   return train:destroy()
end

-- Opcode: 0x07BE
-- Instruction: mark_mission_train_as_no_longer_needed [Train]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07BE
function SanAndreasOpcodeTrain.markAsNoLongerNeeded(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07C7
-- Instruction: set_mission_train_coordinates [Train] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07C7
function SanAndreasOpcodeTrain.setCoordinates(train, posX, posY, posZ)
   return train:setPosition(posX, posY, posZ)
end

-- Opcode: 0x0981
-- Instruction: has_train_derailed [Train]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0981
function SanAndreasOpcodeTrain.hasDerailed(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09CF
-- Instruction: set_train_forced_to_slow_down [Train] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09CF
function SanAndreasOpcodeTrain.setForcedToSlowDown(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09E3
-- Instruction: find_train_direction [Train]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09E3
function SanAndreasOpcodeTrain.findDirection(train)
   return train:getDirection()
end

-- Opcode: 0x0A06
-- Instruction: is_next_station_allowed [Train]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A06
function SanAndreasOpcodeTrain.isNextStationAllowed(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0A07
-- Instruction: skip_to_next_allowed_station [Train]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A07
function SanAndreasOpcodeTrain.skipToNextAllowedStation(_)
   return Script.setOpcodePartiallyImplemented()
end


Opcode.register(0x06d8, SanAndreasOpcodeTrain.create, '[var handle: Train] = create_mission_train {type} [int] {x} [float] {y} [float] {z} [float] {direction} [bool]')
Opcode.register(0x06dc, SanAndreasOpcodeTrain.setSpeed, 'set_train_speed [Train] {speed} [float]')
Opcode.register(0x06dd, SanAndreasOpcodeTrain.setCruiseSpeed, 'set_train_cruise_speed [Train] {speed} [float]')
Opcode.register(0x06de, SanAndreasOpcodeTrain.getCaboose, '[var caboose: Car] = get_train_caboose [Train]')
Opcode.register(0x078a, SanAndreasOpcodeTrain.getCarriage, '[var carriage: Car] = get_train_carriage [Train] {number} [int]')
Opcode.register(0x07bd, SanAndreasOpcodeTrain.delete, 'delete_mission_train [Train]')
Opcode.register(0x07be, SanAndreasOpcodeTrain.markAsNoLongerNeeded, 'mark_mission_train_as_no_longer_needed [Train]')
Opcode.register(0x07c7, SanAndreasOpcodeTrain.setCoordinates, 'set_mission_train_coordinates [Train] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0981, SanAndreasOpcodeTrain.hasDerailed, 'has_train_derailed [Train]')
Opcode.register(0x09cf, SanAndreasOpcodeTrain.setForcedToSlowDown, 'set_train_forced_to_slow_down [Train] {state} [bool]')
Opcode.register(0x09e3, SanAndreasOpcodeTrain.findDirection, 'find_train_direction [Train]')
Opcode.register(0x0a06, SanAndreasOpcodeTrain.isNextStationAllowed, 'is_next_station_allowed [Train]')
Opcode.register(0x0a07, SanAndreasOpcodeTrain.skipToNextAllowedStation, 'skip_to_next_allowed_station [Train]')
