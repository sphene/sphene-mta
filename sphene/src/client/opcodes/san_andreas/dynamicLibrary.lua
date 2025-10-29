SanAndreasOpcodeDynamicLibrary = {}
SanAndreasOpcodeDynamicLibrary.__index = SanAndreasOpcodeDynamicLibrary

-- Opcode: 0x0EFE
-- Instruction: [var handle: DynamicLibrary] = get_loaded_library {fileName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EFE
function SanAndreasOpcodeDynamicLibrary.getLoadedLibrary(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0efe, SanAndreasOpcodeDynamicLibrary.getLoadedLibrary, '[var handle: DynamicLibrary] = get_loaded_library {fileName} [string]')
