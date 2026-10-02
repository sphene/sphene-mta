SharedOpcodeMath = {}
SharedOpcodeMath.__index = SharedOpcodeMath

-- Opcode: 0x0097
-- Instruction: [local var number: float] = abs_lvar_float
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0097
function SharedOpcodeMath.abs(value)
   return math.abs(value)
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


-- INI: 0097=1,make %1d% absolute_float
Opcode.register(0x0097, SharedOpcodeMath.abs, 1, '${1} = abs_lvar_float', {true})
-- INI: 0099=1,%1d% = random_int_in_ranges_0_to_32767
Opcode.register(0x0099, SharedOpcodeMath.random, 1, '${1} = generate_random_int', {true})
-- INI: 01fb=2,%2d% = square_root %1d%
Opcode.register(0x01fb, SharedOpcodeMath.sqrt, 2, '${2} = sqrt ${1}', {false, true})
-- INI: 0208=3,%3d% = random_float %1d% %2d%
Opcode.register(0x0208, SharedOpcodeMath.randomFloatInRange, 3, '${3} = generate_random_float_in_range ${1} ${2}', {false, false, true})
-- INI: 0209=3,%3d% = random_int_in_ranges %1d% %2d%
Opcode.register(0x0209, SharedOpcodeMath.randomIntInRange, 3, '${3} = generate_random_int_in_range ${1} ${2}', {false, false, true})
-- INI: 02f6=2,%2d% = sine %1d%  // float
Opcode.register(0x02f6, SharedOpcodeMath.sin, 2, '${2} = sin ${1}', {false, true})
-- INI: 02f7=2,%2d% = cosine %1d%  // float
Opcode.register(0x02f7, SharedOpcodeMath.cos, 2, '${2} = cos ${1}', {false, true})
-- INI: 042d=2,%2d% = meters %1d% to_feet  // int
Opcode.register(0x042d, SharedOpcodeMath.convertMetersToFeet, 2, '${2} = convert_metres_to_feet_int ${1}', {false, true})
-- INI: 0509=5,%5d% = distance_between_point %1d% %2d% and_point %3d% %4d%
Opcode.register(0x0509, SharedOpcodeMath.getDistanceBetweenCoords2D, 5, '${5} = get_distance_between_coords_2d ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 050a=7,%7d% = distance_between_point %1d% %2d% %3d% and_point %4d% %5d% %6d% ;; never used in VC
Opcode.register(0x050a, SharedOpcodeMath.getDistanceBetweenCoords3D, 7, '${7} = get_distance_between_coords_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 0AEE=3,%3d% = pow %1d% base %2d% // all floats
Opcode.register(0x0aee, SharedOpcodeMath.pow, 3, '${3} = pow ${1} ${2}', {false, false, true})
-- INI: 0AEF=3,%3d% = log %1d% base %2d% // all floats
Opcode.register(0x0aef, SharedOpcodeMath.log, 3, '${3} = log ${1} ${2}', {false, false, true})
