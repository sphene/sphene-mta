ViceCityOpcodeMemoryLibrary = {}
ViceCityOpcodeMemoryLibrary.__index = ViceCityOpcodeMemoryLibrary

-- Opcode: 0x0BA2
-- Instruction: [var handle: MemoryLibrary] = memory_load_dynamic_library {address} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0BA2
function ViceCityOpcodeMemoryLibrary.load()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0BA3
-- Instruction: memory_free_dynamic_library [MemoryLibrary]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0BA3
function ViceCityOpcodeMemoryLibrary.free()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0BA4
-- Instruction: [var address: int] = memory_get_dynamic_library_procedure {procName} [string] [MemoryLibrary]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0BA4
function ViceCityOpcodeMemoryLibrary.getProcedure()
   return Script.setOpcodeUnimplemented()
end


-- INI: 0BA2=2,%2h% = memory_load_library %1s%
Opcode.register(0x0ba2, ViceCityOpcodeMemoryLibrary.load, 2, '${1} = memory_load_dynamic_library ${2}', {true, false})
-- INI: 0BA3=1,memory_free_library %1h%
Opcode.register(0x0ba3, ViceCityOpcodeMemoryLibrary.free, 1, 'memory_free_dynamic_library ${1}', {false})
-- INI: 0BA4=3,%3d% = memory_get_proc_address %1s% library %2d%
Opcode.register(0x0ba4, ViceCityOpcodeMemoryLibrary.getProcedure, 3, '${3} = memory_get_dynamic_library_procedure ${1} ${2}', {false, false, true})
