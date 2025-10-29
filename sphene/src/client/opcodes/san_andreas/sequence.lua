SanAndreasOpcodeSequence = {}
SanAndreasOpcodeSequence.__index = SanAndreasOpcodeSequence

-- Opcode: 0x0615
-- Instruction: [var handle: Sequence] = open_sequence_task
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0615
function SanAndreasOpcodeSequence.open(_)
    Script.storeValueAtIndex(1, Sequence.createSequence())
end

-- Opcode: 0x0616
-- Instruction: close_sequence_task [Sequence]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0616
function SanAndreasOpcodeSequence.close(sequence)
    if sequence then
        sequence:close()
    end
end

-- Opcode: 0x061B
-- Instruction: clear_sequence_task [Sequence]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/061B
function SanAndreasOpcodeSequence.clear(sequence)
    if sequence then
        sequence:clear()
    end
end

-- Opcode: 0x0643
-- Instruction: set_sequence_to_repeat [Sequence] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0643
function SanAndreasOpcodeSequence.setToRepeat(sequence, shouldRepeat)
    if sequence then
        sequence:setShouldRepeat(shouldRepeat)
    end
end

Opcode.register(0x0615, SanAndreasOpcodeSequence.open, '[var handle: Sequence] = open_sequence_task')
Opcode.register(0x0616, SanAndreasOpcodeSequence.close, 'close_sequence_task [Sequence]')
Opcode.register(0x061b, SanAndreasOpcodeSequence.clear, 'clear_sequence_task [Sequence]')
Opcode.register(0x0643, SanAndreasOpcodeSequence.setToRepeat, 'set_sequence_to_repeat [Sequence] {state} [bool]')
