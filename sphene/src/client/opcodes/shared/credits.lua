SharedOpcodeCredits = {}
SharedOpcodeCredits.__index = SharedOpcodeCredits

-- Opcode: 0x0434
-- Instruction: start_credits
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0434
function SharedOpcodeCredits.start()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0435
-- Instruction: stop_credits
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0435
function SharedOpcodeCredits.stop()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0436
-- Instruction: are_credits_finished
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0436
function SharedOpcodeCredits.areFinished()
   return Script.setOpcodeUnimplemented()
end


-- INI: 0434=0,show_credits
Opcode.register(0x0434, SharedOpcodeCredits.start, 0, 'start_credits', {})
-- INI: 0435=0,end_credits
Opcode.register(0x0435, SharedOpcodeCredits.stop, 0, 'stop_credits', {})
-- INI: 0436=0,  reached_end_of_credits
Opcode.register(0x0436, SharedOpcodeCredits.areFinished, 0, 'are_credits_finished', {})
