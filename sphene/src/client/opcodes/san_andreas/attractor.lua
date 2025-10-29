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


Opcode.register(0x061d, SanAndreasOpcodeAttractor.add, '[var handle: Attractor] = add_attractor {x} [float] {y} [float] {z} [float] {angle} [float] {_p5} [float] {sequence} [Sequence]')
Opcode.register(0x061e, SanAndreasOpcodeAttractor.clear, 'clear_attractor [Attractor]')
Opcode.register(0x0680, SanAndreasOpcodeAttractor.addPedTypeAsUser, 'add_pedtype_as_attractor_user [Attractor] {pedType} [PedType]')
