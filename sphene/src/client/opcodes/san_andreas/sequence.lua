SanAndreasOpcodeSequence = {}
SanAndreasOpcodeSequence.__index = SanAndreasOpcodeSequence

-- Opcode: 0x0615
-- Instruction: [var handle: Sequence] = open_sequence_task
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0615
function SanAndreasOpcodeSequence.open(_)
    return Sequence.createSequence()
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

-- INI: 0615=1,define_AS_pack_begin %1d%
Opcode.register(0x0615, SanAndreasOpcodeSequence.open, 1, '${1} = open_sequence_task', {true})
-- INI: 0616=1,define_AS_pack_end %1d%
Opcode.register(0x0616, SanAndreasOpcodeSequence.close, 1, 'close_sequence_task ${1}', {false})
-- INI: 061B=1,remove_references_to_AS_pack %1d%
Opcode.register(0x061b, SanAndreasOpcodeSequence.clear, 1, 'clear_sequence_task ${1}', {false})
-- INI: 0643=2,set_AS_pack %1d% loop %2h%
Opcode.register(0x0643, SanAndreasOpcodeSequence.setToRepeat, 2, 'set_sequence_to_repeat ${1} ${2}', {false, false})
