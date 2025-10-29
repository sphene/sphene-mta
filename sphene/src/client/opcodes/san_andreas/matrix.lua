SanAndreasOpcodeMatrix = {}
SanAndreasOpcodeMatrix.__index = SanAndreasOpcodeMatrix

-- Opcode: 0x0D01
-- Instruction: rotate_matrix_on_axis {matrix} [int] {x} [float] {y} [float] {z} [float] {angle} [float] {rwCombine} [RwCombine]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D01
function SanAndreasOpcodeMatrix.rotateOnAxis(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D02
-- Instruction: [var angle: float] = get_matrix_x_angle {matrix} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D02
function SanAndreasOpcodeMatrix.getXAngle(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D03
-- Instruction: [var angle: float] = get_matrix_y_angle {matrix} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D03
function SanAndreasOpcodeMatrix.getYAngle(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D04
-- Instruction: [var angle: float] = get_matrix_z_angle {matrix} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D04
function SanAndreasOpcodeMatrix.getZAngle(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D0A
-- Instruction: [var x: float], [var y: float], [var z: float] = get_offset_from_matrix_in_world_coords {matrix} [int] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D0A
function SanAndreasOpcodeMatrix.getOffset(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D00
-- Instruction: [var handle: Matrix] = multiply_matrices {matrixA} [Matrix] {matrixB} [Matrix]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D00
function SanAndreasOpcodeMatrix.multiply(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D05
-- Instruction: set_matrix_position [Matrix] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D05
function SanAndreasOpcodeMatrix.setPosition(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D08
-- Instruction: set_matrix_rotation [Matrix] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D08
function SanAndreasOpcodeMatrix.rotate(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D09
-- Instruction: copy_matrix [Matrix] {destination} [Matrix]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D09
function SanAndreasOpcodeMatrix.copy(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0d01, SanAndreasOpcodeMatrix.rotateOnAxis, 'rotate_matrix_on_axis {matrix} [int] {x} [float] {y} [float] {z} [float] {angle} [float] {rwCombine} [RwCombine]')
Opcode.register(0x0d02, SanAndreasOpcodeMatrix.getXAngle, '[var angle: float] = get_matrix_x_angle {matrix} [int]')
Opcode.register(0x0d03, SanAndreasOpcodeMatrix.getYAngle, '[var angle: float] = get_matrix_y_angle {matrix} [int]')
Opcode.register(0x0d04, SanAndreasOpcodeMatrix.getZAngle, '[var angle: float] = get_matrix_z_angle {matrix} [int]')
Opcode.register(0x0d0a, SanAndreasOpcodeMatrix.getOffset, '[var x: float], [var y: float], [var z: float] = get_offset_from_matrix_in_world_coords {matrix} [int] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0d00, SanAndreasOpcodeMatrix.multiply, '[var handle: Matrix] = multiply_matrices {matrixA} [Matrix] {matrixB} [Matrix]')
Opcode.register(0x0d05, SanAndreasOpcodeMatrix.setPosition, 'set_matrix_position [Matrix] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0d08, SanAndreasOpcodeMatrix.rotate, 'set_matrix_rotation [Matrix] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0d09, SanAndreasOpcodeMatrix.copy, 'copy_matrix [Matrix] {destination} [Matrix]')
