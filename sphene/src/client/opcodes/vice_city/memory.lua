ViceCityOpcodeMemory = {}
ViceCityOpcodeMemory.__index = ViceCityOpcodeMemory

-- Opcode: 0x0606
-- Instruction: load_path_nodes_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0606
function ViceCityOpcodeMemory.setOffset(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0606, ViceCityOpcodeMemory.setOffset, 'load_path_nodes_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float]')
