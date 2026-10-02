SanAndreasOpcodeRenderObject = {}
SanAndreasOpcodeRenderObject.__index = SanAndreasOpcodeRenderObject

-- Opcode: 0x0E2E
-- Instruction: [var handle: RenderObject] = create_render_object_to_char_bone {char} [Char] {modelId} [model_char] {pedBone} [PedBone] {x} [float] {y} [float] {z} [float] {rx} [float] {ry} [float] {rz} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E2E
function SanAndreasOpcodeRenderObject.createToCharBone(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E2F
-- Instruction: delete_render_object [RenderObject]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E2F
function SanAndreasOpcodeRenderObject.delete(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E31
-- Instruction: set_render_object_visible [RenderObject] {visible} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E31
function SanAndreasOpcodeRenderObject.setVisible(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E35
-- Instruction: set_render_object_position [RenderObject] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E35
function SanAndreasOpcodeRenderObject.setPosition(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E36
-- Instruction: set_render_object_rotation [RenderObject] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E36
function SanAndreasOpcodeRenderObject.setRotation(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E37
-- Instruction: set_render_object_scale [RenderObject] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E37
function SanAndreasOpcodeRenderObject.setScale(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E3A
-- Instruction: set_render_object_distortion [RenderObject] {x} [float] {y} [float] {z} [float] {w} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E3A
function SanAndreasOpcodeRenderObject.setDistortion(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0E2E=10,create_render_object_to_char_bone %1d% model %2d% bone %3d% offset %4d% %5d% %6d% rotation %7d% %8d% %9d% store_to %10d%
Opcode.register(0x0e2e, SanAndreasOpcodeRenderObject.createToCharBone, 10, '${10} = create_render_object_to_char_bone ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false, true})
-- INI: 0E2F=1,delete_render_object %1d%
Opcode.register(0x0e2f, SanAndreasOpcodeRenderObject.delete, 1, 'delete_render_object ${1}', {false})
-- INI: 0E31=2,set_render_object_visible %1d% %2d%
Opcode.register(0x0e31, SanAndreasOpcodeRenderObject.setVisible, 2, 'set_render_object_visible ${1} ${2}', {false, false})
-- INI: 0E35=4,set_render_object_position %1d% %2d% %3d% %4d%
Opcode.register(0x0e35, SanAndreasOpcodeRenderObject.setPosition, 4, 'set_render_object_position ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0E36=4,set_render_object_rotation %1d% %2d% %3d% %4d%
Opcode.register(0x0e36, SanAndreasOpcodeRenderObject.setRotation, 4, 'set_render_object_rotation ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0E37=4,set_render_object_scale %1d% %2d% %3d% %4d%
Opcode.register(0x0e37, SanAndreasOpcodeRenderObject.setScale, 4, 'set_render_object_scale ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0E3A=5,set_render_object_distortion %1d% %2d% %3d% %4d% %5d%
Opcode.register(0x0e3a, SanAndreasOpcodeRenderObject.setDistortion, 5, 'set_render_object_distortion ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
