SanAndreasOpcodeKillFrenzy = {}
SanAndreasOpcodeKillFrenzy.__index = SanAndreasOpcodeKillFrenzy

-- Opcode: 0x09C2
-- Instruction: fail_kill_frenzy
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09C2
function SanAndreasOpcodeKillFrenzy.fail()
   return Script.setOpcodeUnimplemented()
end


-- INI: 09C2=0,cancel_rampage
Opcode.register(0x09c2, SanAndreasOpcodeKillFrenzy.fail, 0, 'fail_kill_frenzy', {})
