SharedOpcodeDynamicLibrary = {}
SharedOpcodeDynamicLibrary.__index = SharedOpcodeDynamicLibrary

-- Opcode: 0x0AA2
-- Instruction: [var handle: DynamicLibrary] = load_dynamic_library {fileName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AA2
function SharedOpcodeDynamicLibrary.load(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AA3
-- Instruction: free_dynamic_library [DynamicLibrary]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AA3
function SharedOpcodeDynamicLibrary.free(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AA4
-- Instruction: [var address: int] = get_dynamic_library_procedure {procName} [string] [DynamicLibrary]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AA4
function SharedOpcodeDynamicLibrary.getProcedure(_, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0aa2, SharedOpcodeDynamicLibrary.load, '[var handle: DynamicLibrary] = load_dynamic_library {fileName} [string]')
Opcode.register(0x0aa3, SharedOpcodeDynamicLibrary.free, 'free_dynamic_library [DynamicLibrary]')
Opcode.register(0x0aa4, SharedOpcodeDynamicLibrary.getProcedure, '[var address: int] = get_dynamic_library_procedure {procName} [string] [DynamicLibrary]')
