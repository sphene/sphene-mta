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


Opcode.register(0x0ba2, ViceCityOpcodeMemoryLibrary.load, '[var handle: MemoryLibrary] = memory_load_dynamic_library {address} [int]')
Opcode.register(0x0ba3, ViceCityOpcodeMemoryLibrary.free, 'memory_free_dynamic_library [MemoryLibrary]')
Opcode.register(0x0ba4, ViceCityOpcodeMemoryLibrary.getProcedure, '[var address: int] = memory_get_dynamic_library_procedure {procName} [string] [MemoryLibrary]')
