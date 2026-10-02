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


-- INI: 0D01=6,rotate_matrix %1d% on_axis %2d% %3d% %4d% angle %5d% combine_op %6d%
Opcode.register(0x0d01, SanAndreasOpcodeMatrix.rotateOnAxis, 6, 'rotate_matrix_on_axis ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0D02=2,%2d% = matrix %1d% x_angle
Opcode.register(0x0d02, SanAndreasOpcodeMatrix.getXAngle, 2, '${1} = get_matrix_x_angle ${2}', {true, false})
-- INI: 0D03=2,%2d% = matrix %1d% y_angle
Opcode.register(0x0d03, SanAndreasOpcodeMatrix.getYAngle, 2, '${1} = get_matrix_y_angle ${2}', {true, false})
-- INI: 0D04=2,%2d% = matrix %1d% z_angle
Opcode.register(0x0d04, SanAndreasOpcodeMatrix.getZAngle, 2, '${1} = get_matrix_z_angle ${2}', {true, false})
-- INI: 0D0A=7,store_coords_to %5d% %6d% %7d% from_matrix %1d% with_offsets %2d% %3d% %4d%
Opcode.register(0x0d0a, SanAndreasOpcodeMatrix.getOffset, 7, '${5}, ${6}, ${7} = get_offset_from_matrix_in_world_coords ${1} ${2} ${3} ${4}', {false, false, false, false, true, true, true})
-- INI: 0D00=3,matrix %3d% = matrix %1d% * matrix %2d%
Opcode.register(0x0d00, SanAndreasOpcodeMatrix.multiply, 3, '${3} = multiply_matrices ${1} ${2}', {false, false, true})
-- INI: 0D05=4,set_matrix %1d% position %2d% %3d% %4d%
Opcode.register(0x0d05, SanAndreasOpcodeMatrix.setPosition, 4, 'set_matrix_position ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0D08=4,set_matrix %1d% angles_XYZ %2d% %3d% %4d%
Opcode.register(0x0d08, SanAndreasOpcodeMatrix.rotate, 4, 'set_matrix_rotation ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0D09=2,copy_matrix %1d% to %2d%
Opcode.register(0x0d09, SanAndreasOpcodeMatrix.copy, 2, 'copy_matrix ${1} ${2}', {false, false})
