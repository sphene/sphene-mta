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


-- INI: 06D8=6,%6d% = create_train_at %2d% %3d% %4d% type %1h% direction %5h%
Opcode.register(0x06d8, SanAndreasOpcodeTrain.create, 6, '${6} = create_mission_train ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false, true})
-- INI: 06DC=2,set_train %1d% acc %2d%
Opcode.register(0x06dc, SanAndreasOpcodeTrain.setSpeed, 2, 'set_train_speed ${1} ${2}', {false, false})
-- INI: 06DD=2,set_train %1d% speed %2d%
Opcode.register(0x06dd, SanAndreasOpcodeTrain.setCruiseSpeed, 2, 'set_train_cruise_speed ${1} ${2}', {false, false})
-- INI: 06DE=2,%2d% = get_train %1d% last_carriage_handle
Opcode.register(0x06de, SanAndreasOpcodeTrain.getCaboose, 2, '${1} = get_train_caboose ${2}', {true, false})
-- INI: 078A=3,%3d% = get_train %1d% carriage %2h% handle
Opcode.register(0x078a, SanAndreasOpcodeTrain.getCarriage, 3, '${3} = get_train_carriage ${1} ${2}', {false, false, true})
-- INI: 07BD=1,destroy_train %1d%
Opcode.register(0x07bd, SanAndreasOpcodeTrain.delete, 1, 'delete_mission_train ${1}', {false})
-- INI: 07BE=1,remove_references_to_train %1d%
Opcode.register(0x07be, SanAndreasOpcodeTrain.markAsNoLongerNeeded, 1, 'mark_mission_train_as_no_longer_needed ${1}', {false})
-- INI: 07C7=4,put_train %1d% at %2d% %3d% %4d%
Opcode.register(0x07c7, SanAndreasOpcodeTrain.setCoordinates, 4, 'set_mission_train_coordinates ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0981=1,  train %1d% wrecked
Opcode.register(0x0981, SanAndreasOpcodeTrain.hasDerailed, 1, 'has_train_derailed ${1}', {false})
-- INI: 09CF=2,set_train %1d% stop_at_stations %2h%
Opcode.register(0x09cf, SanAndreasOpcodeTrain.setForcedToSlowDown, 2, 'set_train_forced_to_slow_down ${1} ${2}', {false, false})
-- INI: 09E3=1,  train %1d% traveling_clockwise
Opcode.register(0x09e3, SanAndreasOpcodeTrain.findDirection, 1, 'find_train_direction ${1}', {false})
-- INI: 0A06=1,  train %1d% next_station_unlocked
Opcode.register(0x0a06, SanAndreasOpcodeTrain.isNextStationAllowed, 1, 'is_next_station_allowed ${1}', {false})
-- INI: 0A07=1,put_train %1d% at_next_station
Opcode.register(0x0a07, SanAndreasOpcodeTrain.skipToNextAllowedStation, 1, 'skip_to_next_allowed_station ${1}', {false})
