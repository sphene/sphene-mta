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


-- INI: 0AA2=2,%2d% = load_dynamic_library %1d% ; IF and SET
Opcode.register(0x0aa2, SharedOpcodeDynamicLibrary.load, 2, '${1} = load_dynamic_library ${2}', {true, false})
-- INI: 0AA3=1,free_dynamic_library %1h%
Opcode.register(0x0aa3, SharedOpcodeDynamicLibrary.free, 1, 'free_dynamic_library ${1}', {false})
-- INI: 0AA4=3,%3d% = get_dynamic_library_procedure %1s% library %2d% ; IF and SET
Opcode.register(0x0aa4, SharedOpcodeDynamicLibrary.getProcedure, 3, '${3} = get_dynamic_library_procedure ${1} ${2}', {false, false, true})
