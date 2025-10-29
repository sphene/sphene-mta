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


Opcode.register(0x05a4, SanAndreasOpcodeMath.getAngleBetween2DVectors, '[var angle: float] = get_angle_between_2d_vectors {x1} [float] {y1} [float] {x2} [float] {y2} [float]')
Opcode.register(0x05a5, SanAndreasOpcodeMath.do2DRectanglesCollide, 'do_2d_rectangles_collide {rectangle1PositionX} [float] {rectangle1PositionY} [float] {rectangle1SizeX} [float] {rectangle1SizeY} [float] {rectangle2PositionX} [float] {rectangle2PositionY} [float] {rectangle2SizeX} [float] {rectangle2SizeY} [float]')
Opcode.register(0x05b0, SanAndreasOpcodeMath.get2DLinesIntersectPoint, '[var intersectPointX: float], [var intersectPointY: float] = get_2d_lines_intersect_point {line1StartX} [float] {line1StartY} [float] {line1EndX} [float] {line1EndY} [float] {line2StartX} [float] {line2StartY} [float] {line2EndX} [float] {line2EndY} [float]')
Opcode.register(0x0604, SanAndreasOpcodeMath.getHeadingFromVector2D, '[var heading: float] = get_heading_from_vector_2d {x} [float] {y} [float]')
Opcode.register(0x0656, SanAndreasOpcodeMath.limitAngle, '[var result: float] = limit_angle {value} [float]')
Opcode.register(0x0e03, SanAndreasOpcodeMath.perlinNoise, '[var result: float] = perlin_noise {x} [float]')
Opcode.register(0x0e1f, SanAndreasOpcodeMath.ease, '[var result: float] = ease {k} [float] {mode} [EaseMode] {way} [EaseWay]')
Opcode.register(0x0e27, SanAndreasOpcodeMath.getAngleFromTwoCoords, '[var angle: float] = get_angle_from_two_coords {x1} [float] {y1} [float] {x2} [float] {y2} [float]')
Opcode.register(0x0e29, SanAndreasOpcodeMath.perlinNoiseFractal, '[var result: float] = perlin_noise_fractal {x} [float] {octaves} [int] {frequency} [float] {amplitude} [float] {lacunarity} [float] {persistence} [float]')
Opcode.register(0x0e4d, SanAndreasOpcodeMath.randomPercent, 'random_percent {percent} [int]')
Opcode.register(0x0ebc, SanAndreasOpcodeMath.generateRandomIntInRangeWithSeed, '[var randomInteger: int] = generate_random_int_in_range_with_seed {seed} [int] {min} [int] {max} [int]')
Opcode.register(0x0ebd, SanAndreasOpcodeMath.generateRandomFloatInRangeWithSeed, '[var randomFloat: float] = generate_random_float_in_range_with_seed {seed} [int] {min} [float] {max} [float]')
Opcode.register(0x0ef1, SanAndreasOpcodeMath.perlinNoiseFractal2D, '[var result: float] = perlin_noise_fractal_2d {x} [float] {y} [float] {octaves} [int] {frequency} [float] {amplitude} [float] {lacunarity} [float] {persistence} [float]')
Opcode.register(0x0ef2, SanAndreasOpcodeMath.perlinNoiseFractal3D, '[var result: float] = perlin_noise_fractal_3d {x} [float] {y} [float] {z} [float] {octaves} [int] {frequency} [float] {amplitude} [float] {lacunarity} [float] {persistence} [float]')
Opcode.register(0x0ef4, SanAndreasOpcodeMath.clampFloat, '[var clamped: float] = clamp_float {float} [float] {min} [float] {max} [float]')
Opcode.register(0x0ef7, SanAndreasOpcodeMath.clampInt, '[var clamped: int] = clamp_int {integer} [int] {min} [int] {max} [int]')
Opcode.register(0x0b1e, SanAndreasOpcodeMath.signExtend, 'sign_extend {var_value} [var int] {fromSize} [int]')
Opcode.register(0x2700, SanAndreasOpcodeMath.isBitSet, 'is_bit_set {number} [int] {bitIndex} [int]')
Opcode.register(0x2701, SanAndreasOpcodeMath.setBit, 'set_bit {var_number} [var int] {bitIndex} [int]')
Opcode.register(0x2702, SanAndreasOpcodeMath.clearBit, 'clear_bit {var_number} [var int] {bitIndex} [int]')
Opcode.register(0x2703, SanAndreasOpcodeMath.toggleBit, 'toggle_bit {var_number} [var int] {bitIndex} [int] {state} [bool]')
Opcode.register(0x2704, SanAndreasOpcodeMath.isTruthy, 'is_truthy {value} [any]')
