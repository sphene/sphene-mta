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


Opcode.register(0x0e2e, SanAndreasOpcodeRenderObject.createToCharBone, '[var handle: RenderObject] = create_render_object_to_char_bone {char} [Char] {modelId} [model_char] {pedBone} [PedBone] {x} [float] {y} [float] {z} [float] {rx} [float] {ry} [float] {rz} [float]')
Opcode.register(0x0e2f, SanAndreasOpcodeRenderObject.delete, 'delete_render_object [RenderObject]')
Opcode.register(0x0e31, SanAndreasOpcodeRenderObject.setVisible, 'set_render_object_visible [RenderObject] {visible} [bool]')
Opcode.register(0x0e35, SanAndreasOpcodeRenderObject.setPosition, 'set_render_object_position [RenderObject] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0e36, SanAndreasOpcodeRenderObject.setRotation, 'set_render_object_rotation [RenderObject] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0e37, SanAndreasOpcodeRenderObject.setScale, 'set_render_object_scale [RenderObject] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0e3a, SanAndreasOpcodeRenderObject.setDistortion, 'set_render_object_distortion [RenderObject] {x} [float] {y} [float] {z} [float] {w} [float]')
