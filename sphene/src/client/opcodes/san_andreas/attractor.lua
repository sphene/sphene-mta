SanAndreasOpcodeAttractor = {}
SanAndreasOpcodeAttractor.__index = SanAndreasOpcodeAttractor

-- Opcode: 0x061D
-- Instruction: [var handle: Attractor] = add_attractor {x} [float] {y} [float] {z} [float] {angle} [float] {_p5} [float] {sequence} [Sequence]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/061D
function SanAndreasOpcodeAttractor.add(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x061E
-- Instruction: clear_attractor [Attractor]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/061E
function SanAndreasOpcodeAttractor.clear(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0680
-- Instruction: add_pedtype_as_attractor_user [Attractor] {pedType} [PedType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0680
function SanAndreasOpcodeAttractor.addPedTypeAsUser(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 061D=7,create_AS_origin_at %1d% %2d% %3d% Z_angle %4d% unknown_angle %5d% AS_pack %6d% handle_as %7d%
Opcode.register(0x061d, SanAndreasOpcodeAttractor.add, 7, '${7} = add_attractor ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 061E=1,remove_references_to_AS_origin %1d%
Opcode.register(0x061e, SanAndreasOpcodeAttractor.clear, 1, 'clear_attractor ${1}', {false})
-- INI: 0680=2,unknown_assign_AS_origin %1d% to_actors_pedtype %2h%
Opcode.register(0x0680, SanAndreasOpcodeAttractor.addPedTypeAsUser, 2, 'add_pedtype_as_attractor_user ${1} ${2}', {false, false})
