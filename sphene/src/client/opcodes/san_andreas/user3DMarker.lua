SanAndreasOpcodeUser3DMarker = {}
SanAndreasOpcodeUser3DMarker.__index = SanAndreasOpcodeUser3DMarker

-- Opcode: 0x0A40
-- Instruction: [var handle: User3DMarker] = create_user_3d_marker {x} [float] {y} [float] {z} [float] {color} [HudColors]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A40
function SanAndreasOpcodeUser3DMarker.create(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A41
-- Instruction: remove_user_3d_marker [User3DMarker]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A41
function SanAndreasOpcodeUser3DMarker.remove(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0a40, SanAndreasOpcodeUser3DMarker.create, '[var handle: User3DMarker] = create_user_3d_marker {x} [float] {y} [float] {z} [float] {color} [HudColors]')
Opcode.register(0x0a41, SanAndreasOpcodeUser3DMarker.remove, 'remove_user_3d_marker [User3DMarker]')
