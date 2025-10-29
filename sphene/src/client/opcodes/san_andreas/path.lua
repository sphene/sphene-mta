SanAndreasOpcodePath = {}
SanAndreasOpcodePath.__index = SanAndreasOpcodePath

-- Opcode: 0x05D6
-- Instruction: flush_route
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05D6
function SanAndreasOpcodePath.flushRoute()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x05D7
-- Instruction: extend_route {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05D7
function SanAndreasOpcodePath.extendRoute(_, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0606
-- Instruction: load_path_nodes_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0606
function SanAndreasOpcodePath.loadPathNodesInArea(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0607
-- Instruction: release_path_nodes
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0607
function SanAndreasOpcodePath.releaseNodes()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06F8
-- Instruction: [var x: float], [var y: float], [var z: float], [var heading: float] = get_nth_closest_car_node_with_heading {xCoord} [float] {yCoord} [float] {zCoord} [float] {nth} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06F8
function SanAndreasOpcodePath.getNthClosestCarNodeWithHeading(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0754
-- Instruction: flush_patrol_route
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0754
function SanAndreasOpcodePath.flushPatrolRoute(_)
    return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0755
-- Instruction: extend_patrol_route {x} [float] {y} [float] {z} [float] {animationName} [string] {animationFile} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0755
function SanAndreasOpcodePath.extendPatrolRoute(_)
    return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x091D
-- Instruction: switch_roads_back_to_original {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/091D
function SanAndreasOpcodePath.switchRoadsBackToOriginal(_)
return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x091E
-- Instruction: switch_ped_roads_back_to_original {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/091E
function SanAndreasOpcodePath.switchPedRoadsBackToOriginal(_, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0994
-- Instruction: mark_road_node_as_dont_wander {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0994
function SanAndreasOpcodePath.markRoadNodeAsDontWander(_, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0995
-- Instruction: unmark_all_road_nodes_as_dont_wander
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0995
function SanAndreasOpcodePath.unmarkAllRoadNodesAsDontWander()
   return Script.setOpcodePartiallyImplemented()
end


Opcode.register(0x05d6, SanAndreasOpcodePath.flushRoute, 'flush_route')
Opcode.register(0x05d7, SanAndreasOpcodePath.extendRoute, 'extend_route {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0606, SanAndreasOpcodePath.loadPathNodesInArea, 'load_path_nodes_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float]')
Opcode.register(0x0607, SanAndreasOpcodePath.releaseNodes, 'release_path_nodes')
Opcode.register(0x06f8, SanAndreasOpcodePath.getNthClosestCarNodeWithHeading, '[var x: float], [var y: float], [var z: float], [var heading: float] = get_nth_closest_car_node_with_heading {xCoord} [float] {yCoord} [float] {zCoord} [float] {nth} [int]')
Opcode.register(0x0754, SanAndreasOpcodePath.flushPatrolRoute, 'flush_patrol_route')
Opcode.register(0x0755, SanAndreasOpcodePath.extendPatrolRoute, 'extend_patrol_route {x} [float] {y} [float] {z} [float] {animationName} [string] {animationFile} [string]')
Opcode.register(0x091d, SanAndreasOpcodePath.switchRoadsBackToOriginal, 'switch_roads_back_to_original {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x091e, SanAndreasOpcodePath.switchPedRoadsBackToOriginal, 'switch_ped_roads_back_to_original {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x0994, SanAndreasOpcodePath.markRoadNodeAsDontWander, 'mark_road_node_as_dont_wander {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0995, SanAndreasOpcodePath.unmarkAllRoadNodesAsDontWander, 'unmark_all_road_nodes_as_dont_wander')
