SharedOpcodeDebugger = {}
SharedOpcodeDebugger.__index = SharedOpcodeDebugger

-- Opcode: 0x00C3
-- Instruction: debug_on
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00C3
function SharedOpcodeDebugger.enable()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00C4
-- Instruction: debug_off
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00C4
function SharedOpcodeDebugger.disable()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x00c3, SharedOpcodeDebugger.enable, 'debug_on')
Opcode.register(0x00c4, SharedOpcodeDebugger.disable, 'debug_off')
