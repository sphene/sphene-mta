SanAndreasOpcodeMath = {}
SanAndreasOpcodeMath.__index = SanAndreasOpcodeMath

-- Opcode: 0x05A4
-- Instruction: [var angle: float] = get_angle_between_2d_vectors {x1} [float] {y1} [float] {x2} [float] {y2} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05A4
function SanAndreasOpcodeMath.getAngleBetween2DVectors(x, y, endX, endY, _)
    return findRotation(x, y, endX, endY)
end

-- Opcode: 0x05A5
-- Instruction: do_2d_rectangles_collide {rectangle1PositionX} [float] {rectangle1PositionY} [float] {rectangle1SizeX} [float] {rectangle1SizeY} [float] {rectangle2PositionX} [float] {rectangle2PositionY} [float] {rectangle2SizeX} [float] {rectangle2SizeY} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05A5
function SanAndreasOpcodeMath.do2DRectanglesCollide(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05B0
-- Instruction: [var intersectPointX: float], [var intersectPointY: float] = get_2d_lines_intersect_point {line1StartX} [float] {line1StartY} [float] {line1EndX} [float] {line1EndY} [float] {line2StartX} [float] {line2StartY} [float] {line2EndX} [float] {line2EndY} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05B0
function SanAndreasOpcodeMath.get2DLinesIntersectPoint(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0604
-- Instruction: [var heading: float] = get_heading_from_vector_2d {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0604
function SanAndreasOpcodeMath.getHeadingFromVector2D(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0656
-- Instruction: [var result: float] = limit_angle {value} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0656
function SanAndreasOpcodeMath.limitAngle(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E03
-- Instruction: [var result: float] = perlin_noise {x} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E03
function SanAndreasOpcodeMath.perlinNoise(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E1F
-- Instruction: [var result: float] = ease {k} [float] {mode} [EaseMode] {way} [EaseWay]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E1F
function SanAndreasOpcodeMath.ease(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E27
-- Instruction: [var angle: float] = get_angle_from_two_coords {x1} [float] {y1} [float] {x2} [float] {y2} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E27
function SanAndreasOpcodeMath.getAngleFromTwoCoords(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E29
-- Instruction: [var result: float] = perlin_noise_fractal {x} [float] {octaves} [int] {frequency} [float] {amplitude} [float] {lacunarity} [float] {persistence} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E29
function SanAndreasOpcodeMath.perlinNoiseFractal(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E4D
-- Instruction: random_percent {percent} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E4D
function SanAndreasOpcodeMath.randomPercent(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EBC
-- Instruction: [var randomInteger: int] = generate_random_int_in_range_with_seed {seed} [int] {min} [int] {max} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EBC
function SanAndreasOpcodeMath.generateRandomIntInRangeWithSeed(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EBD
-- Instruction: [var randomFloat: float] = generate_random_float_in_range_with_seed {seed} [int] {min} [float] {max} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EBD
function SanAndreasOpcodeMath.generateRandomFloatInRangeWithSeed(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EF1
-- Instruction: [var result: float] = perlin_noise_fractal_2d {x} [float] {y} [float] {octaves} [int] {frequency} [float] {amplitude} [float] {lacunarity} [float] {persistence} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EF1
function SanAndreasOpcodeMath.perlinNoiseFractal2D(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EF2
-- Instruction: [var result: float] = perlin_noise_fractal_3d {x} [float] {y} [float] {z} [float] {octaves} [int] {frequency} [float] {amplitude} [float] {lacunarity} [float] {persistence} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EF2
function SanAndreasOpcodeMath.perlinNoiseFractal3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EF4
-- Instruction: [var clamped: float] = clamp_float {float} [float] {min} [float] {max} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EF4
function SanAndreasOpcodeMath.clampFloat(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EF7
-- Instruction: [var clamped: int] = clamp_int {integer} [int] {min} [int] {max} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EF7
function SanAndreasOpcodeMath.clampInt(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B1E
-- Instruction: sign_extend {var_value} [var int] {fromSize} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B1E
function SanAndreasOpcodeMath.signExtend()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2700
-- Instruction: is_bit_set {number} [int] {bitIndex} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2700
function SanAndreasOpcodeMath.isBitSet()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2701
-- Instruction: set_bit {var_number} [var int] {bitIndex} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2701
function SanAndreasOpcodeMath.setBit()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2702
-- Instruction: clear_bit {var_number} [var int] {bitIndex} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2702
function SanAndreasOpcodeMath.clearBit()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2703
-- Instruction: toggle_bit {var_number} [var int] {bitIndex} [int] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2703
function SanAndreasOpcodeMath.toggleBit()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2704
-- Instruction: is_truthy {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2704
function SanAndreasOpcodeMath.isTruthy()
   return Script.setOpcodeUnimplemented()
end


-- INI: 05a4=5,get_angle_between_vectors_origin_to %1d% %2d% and_origin_to %3d% %4d% store_to %5d%  ;; never used in VC
Opcode.register(0x05a4, SanAndreasOpcodeMath.getAngleBetween2DVectors, 5, '${5} = get_angle_between_2d_vectors ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 05a5=8,  is_area_center %1d% %2d% scale %3d% %4d% overlaping_area_center %5d% %6d% scale %7d% %8d%
Opcode.register(0x05a5, SanAndreasOpcodeMath.do2DRectanglesCollide, 8, 'do_2d_rectangles_collide ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 05B0=10,  unknown_calculate %1d% %2d% %3d% and %4d% %5d% %6d% %7d% %8d% store_to %9d% %10d% // IF and SET
Opcode.register(0x05b0, SanAndreasOpcodeMath.get2DLinesIntersectPoint, 10, '${9}, ${10} = get_2d_lines_intersect_point ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false, true, true})
-- INI: 0604=2, %2d% = weapon %1d% model
Opcode.register(0x0604, SanAndreasOpcodeMath.getHeadingFromVector2D, 3, '${3} = get_heading_from_vector_2d ${1} ${2}', {false, false, true})
-- INI: 0656=2,get_angle %1d% absolute_degrees_to %2d%
Opcode.register(0x0656, SanAndreasOpcodeMath.limitAngle, 2, '${2} = limit_angle ${1}', {false, true})
-- INI: 0E03=2,perlin_noise %1d% store_to %2d%
Opcode.register(0x0e03, SanAndreasOpcodeMath.perlinNoise, 2, '${1} = perlin_noise ${2}', {true, false})
-- INI: 0E1F=4,ease %1d% mode %2d% way %3d% to %4d%
Opcode.register(0x0e1f, SanAndreasOpcodeMath.ease, 4, '${4} = ease ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0E27=5,get_angle_from_two_coords %1d% %2d% and %3d% %4d% to %5d%
Opcode.register(0x0e27, SanAndreasOpcodeMath.getAngleFromTwoCoords, 5, '${5} = get_angle_from_two_coords ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 0E29=7,perlin_noise %1d% octaves %2d% frequency %3d% amplitude %4d% lacunarity %5d% persistence %6d% store_to %7d%
Opcode.register(0x0e29, SanAndreasOpcodeMath.perlinNoiseFractal, 7, '${7} = perlin_noise_fractal ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 0E4D=1,random_percent %1d%
Opcode.register(0x0e4d, SanAndreasOpcodeMath.randomPercent, 1, 'random_percent ${1}', {false})
-- INI: 0EBC=4,generate_random_int_in_range_with_seed %1d% min %2d% max %3d% store_to %4d%
Opcode.register(0x0ebc, SanAndreasOpcodeMath.generateRandomIntInRangeWithSeed, 4, '${4} = generate_random_int_in_range_with_seed ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0EBD=4,generate_random_float_in_range_with_seed %1d% min %2d% max %3d% store_to %4d%
Opcode.register(0x0ebd, SanAndreasOpcodeMath.generateRandomFloatInRangeWithSeed, 4, '${4} = generate_random_float_in_range_with_seed ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0EF1=8,perlin_noise_fractal_2d x %1d% y %2d% octaves %3d% frequency %4d% amplitude %5d% lacunarity %6d% persistence %7d% store_to %8d%
Opcode.register(0x0ef1, SanAndreasOpcodeMath.perlinNoiseFractal2D, 8, '${8} = perlin_noise_fractal_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false, true})
-- INI: 0EF2=9,perlin_noise_fractal_3d x %1d% y %2d% z %3d% octaves %4d% frequency %5d% amplitude %6d% lacunarity %7d% persistence %8d% store_to %9d%
Opcode.register(0x0ef2, SanAndreasOpcodeMath.perlinNoiseFractal3D, 9, '${9} = perlin_noise_fractal_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false, true})
-- INI: 0EF4=4,clamp_float %1d% min %2d% max %3d% store_to %4d%
Opcode.register(0x0ef4, SanAndreasOpcodeMath.clampFloat, 4, '${4} = clamp_float ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0EF7=4,clamp_int %1d% min %2d% max %3d% store_to %4d%
Opcode.register(0x0ef7, SanAndreasOpcodeMath.clampInt, 4, '${4} = clamp_int ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0B1E=2,sign_extend %1d% size %2d%
Opcode.register(0x0b1e, SanAndreasOpcodeMath.signExtend, 2, 'sign_extend ${1} ${2}', {false, false})
Opcode.register(0x2700, SanAndreasOpcodeMath.isBitSet, 2, 'is_bit_set ${1} ${2}')
Opcode.register(0x2701, SanAndreasOpcodeMath.setBit, 2, 'set_bit ${1} ${2}')
Opcode.register(0x2702, SanAndreasOpcodeMath.clearBit, 2, 'clear_bit ${1} ${2}')
Opcode.register(0x2703, SanAndreasOpcodeMath.toggleBit, 3, 'toggle_bit ${1} ${2} ${3}')
Opcode.register(0x2704, SanAndreasOpcodeMath.isTruthy, 1, 'is_truthy ${1}')
