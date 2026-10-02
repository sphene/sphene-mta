ViceCityOpcodeMemory = {}
ViceCityOpcodeMemory.__index = ViceCityOpcodeMemory

-- Opcode: 0x0606
-- Instruction: load_path_nodes_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0606
function ViceCityOpcodeMemory.setOffset(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0606=3, set_memory_offset memory_pointer %1d% memory_to_point %2d% virtual_protect %3d%
Opcode.register(0x0606, ViceCityOpcodeMemory.setOffset, 4, 'load_path_nodes_in_area ${1} ${2} ${3} ${4}', {false, true, true, false})
