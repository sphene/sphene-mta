SanAndreasOpcodeComponent = {}
SanAndreasOpcodeComponent.__index = SanAndreasOpcodeComponent

-- Opcode: 0x0D1F
-- Instruction: [var child: Component] = get_component_child_component [Component]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D1F
function SanAndreasOpcodeComponent.getChildComponent(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D20
-- Instruction: [var nextComponent: Component] = get_component_next_component [Component]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D20
function SanAndreasOpcodeComponent.getNextComponent(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D21
-- Instruction: [var name: string] = get_component_name [Component]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D21
function SanAndreasOpcodeComponent.getName(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D22
-- Instruction: [var worldMatrix: any] = get_component_world_matrix [Component]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D22
function SanAndreasOpcodeComponent.getWorldMatrix(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D23
-- Instruction: [var modellingMatrix: any] = get_component_modelling_matrix [Component]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D23
function SanAndreasOpcodeComponent.getModellingMatrix(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D74
-- Instruction: [var parentComponent: Component] = get_component_parent_component [Component]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D74
function SanAndreasOpcodeComponent.getParentComponent(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D75
-- Instruction: [var numObjects: int] = get_component_num_objects [Component]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D75
function SanAndreasOpcodeComponent.getNumObjects(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0D1F=2,%2d% = component %1d% child
Opcode.register(0x0d1f, SanAndreasOpcodeComponent.getChildComponent, 2, '${1} = get_component_child_component ${2}', {true, false})
-- INI: 0D20=2,%2d% = component %1d% next_component
Opcode.register(0x0d20, SanAndreasOpcodeComponent.getNextComponent, 2, '${1} = get_component_next_component ${2}', {true, false})
-- INI: 0D21=2,%2s% = component %1d% name
Opcode.register(0x0d21, SanAndreasOpcodeComponent.getName, 2, '${1} = get_component_name ${2}', {true, false})
-- INI: 0D22=2,%2d% = component %1d% ltm
Opcode.register(0x0d22, SanAndreasOpcodeComponent.getWorldMatrix, 2, '${1} = get_component_world_matrix ${2}', {true, false})
-- INI: 0D23=2,%2d% = component %1d% modelling_matrix
Opcode.register(0x0d23, SanAndreasOpcodeComponent.getModellingMatrix, 2, '${1} = get_component_modelling_matrix ${2}', {true, false})
-- INI: 0D74=2,%2d% = component %1d% parent_component
Opcode.register(0x0d74, SanAndreasOpcodeComponent.getParentComponent, 2, '${1} = get_component_parent_component ${2}', {true, false})
-- INI: 0D75=2,%2d% = component %1d% num_objects
Opcode.register(0x0d75, SanAndreasOpcodeComponent.getNumObjects, 2, '${1} = get_component_num_objects ${2}', {true, false})
