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


-- INI: 0A40=5,%5d% = create_entrance_marker_at %1d% %2d% %3d% color %4h%
Opcode.register(0x0a40, SanAndreasOpcodeUser3DMarker.create, 5, '${5} = create_user_3d_marker ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 0A41=1,destroy_entrance_marker %1d%
Opcode.register(0x0a41, SanAndreasOpcodeUser3DMarker.remove, 1, 'remove_user_3d_marker ${1}', {false})
