SharedOpcodeMath = {}
SharedOpcodeMath.__index = SharedOpcodeMath

-- Opcode: 0x0097
-- Instruction: [local var number: float] = abs_lvar_float
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0097
function SharedOpcodeMath.abs(_)
   Script.storeValueAtIndex(1, math.abs(Script.getValueAtIndex(1)))
end

-- Opcode: 0x0099
-- Instruction: [var int] = generate_random_int
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0099
function SharedOpcodeMath.random(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01FB
-- Instruction: [var result: float] = sqrt {num} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01FB
function SharedOpcodeMath.sqrt(value, _)
    return math.sqrt(value)
end

-- Opcode: 0x0208
-- Instruction: [var result: float] = generate_random_float_in_range {min} [float] {max} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0208
function SharedOpcodeMath.randomFloatInRange(numb1, numb2, _)
    return randomFloat(numb1, numb2 - 1, 3)
end

-- Opcode: 0x0209
-- Instruction: [var result: int] = generate_random_int_in_range {min} [int] {max} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0209
function SharedOpcodeMath.randomIntInRange(numb1, numb2, _)
    return math.random(numb1, numb2 - 1)
end

-- Opcode: 0x02F6
-- Instruction: [var result: float] = sin {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02F6
function SharedOpcodeMath.sin(value, _)
    return math.sin(value)
end

-- Opcode: 0x02F7
-- Instruction: [var result: float] = cos {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02F7
function SharedOpcodeMath.cos(value, _)
    return math.cos(value)
end

-- Opcode: 0x042D
-- Instruction: [var feet: int] = convert_metres_to_feet_int {meters} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/042D
function SharedOpcodeMath.convertMetersToFeet(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0509
-- Instruction: [var distance: float] = get_distance_between_coords_2d {fromX} [float] {fromY} [float] {toX} [float] {toZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0509
function SharedOpcodeMath.getDistanceBetweenCoords2D(posX, posY, checkX, checkY, _)
    return getDistanceBetweenPoints2D(posX, posY, checkX, checkY)
end

-- Opcode: 0x050A
-- Instruction: [var distance: float] = get_distance_between_coords_3d {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/050A
function SharedOpcodeMath.getDistanceBetweenCoords3D(posX, posY, posZ, checkX, checkY, checkZ, _)
    return getDistanceBetweenPoints3D(posX, posY, posZ, checkX, checkY, checkZ)
end

-- Opcode: 0x0AEE
-- Instruction: [var result: float] = pow {number} [float] {power} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AEE
function SharedOpcodeMath.pow(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AEF
-- Instruction: [var result: float] = log {number} [float] {base} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AEF
function SharedOpcodeMath.log(_, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0097, SharedOpcodeMath.abs, '[local var number: float] = abs_lvar_float')
Opcode.register(0x0099, SharedOpcodeMath.random, '[var int] = generate_random_int')
Opcode.register(0x01fb, SharedOpcodeMath.sqrt, '[var result: float] = sqrt {num} [float]')
Opcode.register(0x0208, SharedOpcodeMath.randomFloatInRange, '[var result: float] = generate_random_float_in_range {min} [float] {max} [float]')
Opcode.register(0x0209, SharedOpcodeMath.randomIntInRange, '[var result: int] = generate_random_int_in_range {min} [int] {max} [int]')
Opcode.register(0x02f6, SharedOpcodeMath.sin, '[var result: float] = sin {angle} [float]')
Opcode.register(0x02f7, SharedOpcodeMath.cos, '[var result: float] = cos {angle} [float]')
Opcode.register(0x042d, SharedOpcodeMath.convertMetersToFeet, '[var feet: int] = convert_metres_to_feet_int {meters} [int]')
Opcode.register(0x0509, SharedOpcodeMath.getDistanceBetweenCoords2D, '[var distance: float] = get_distance_between_coords_2d {fromX} [float] {fromY} [float] {toX} [float] {toZ} [float]')
Opcode.register(0x050a, SharedOpcodeMath.getDistanceBetweenCoords3D, '[var distance: float] = get_distance_between_coords_3d {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float]')
Opcode.register(0x0aee, SharedOpcodeMath.pow, '[var result: float] = pow {number} [float] {power} [float]')
Opcode.register(0x0aef, SharedOpcodeMath.log, '[var result: float] = log {number} [float] {base} [float]')
