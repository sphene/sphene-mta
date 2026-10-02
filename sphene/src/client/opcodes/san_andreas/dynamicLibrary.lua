SanAndreasOpcodeDynamicLibrary = {}
SanAndreasOpcodeDynamicLibrary.__index = SanAndreasOpcodeDynamicLibrary

-- Opcode: 0x0EFE
-- Instruction: [var handle: DynamicLibrary] = get_loaded_library {fileName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EFE
function SanAndreasOpcodeDynamicLibrary.getLoadedLibrary(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0EFE=2,get_loaded_library %1d% store_to %2d%
Opcode.register(0x0efe, SanAndreasOpcodeDynamicLibrary.getLoadedLibrary, 2, '${1} = get_loaded_library ${2}', {true, false})
