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


-- INI: 05D6=0,clear_scmpath
Opcode.register(0x05d6, SanAndreasOpcodePath.flushRoute, 0, 'flush_route', {})
-- INI: 05D7=3,add_point_to_scmpath %1d% %2d% %3d%
Opcode.register(0x05d7, SanAndreasOpcodePath.extendRoute, 3, 'extend_route ${1} ${2} ${3}', {false, false, false})
-- INI: 0606=3, set_memory_offset memory_pointer %1d% memory_to_point %2d% virtual_protect %3d%
Opcode.register(0x0606, SanAndreasOpcodePath.loadPathNodesInArea, 4, 'load_path_nodes_in_area ${1} ${2} ${3} ${4}', {false, true, true, false})
-- INI: 0607=1, %1d% = get_current_weather
Opcode.register(0x0607, SanAndreasOpcodePath.releaseNodes, 0, 'release_path_nodes', {})
-- INI: 06F8=8,get_nearest_route_for %1d% %2d% %3d% in_direction %4h% store_to %5d% %6d% %7d% Z_angle_to %8d%
Opcode.register(0x06f8, SanAndreasOpcodePath.getNthClosestCarNodeWithHeading, 8, '${5}, ${6}, ${7}, ${8} = get_nth_closest_car_node_with_heading ${1} ${2} ${3} ${4}', {false, false, false, false, true, true, true, true})
-- INI: 0754=0,define_new_animation_path
Opcode.register(0x0754, SanAndreasOpcodePath.flushPatrolRoute, 0, 'flush_patrol_route', {})
-- INI: 0755=5,add_animation_path_3D_coord %1d% %2d% %3d% animation %4h% IFP_file %5h%
Opcode.register(0x0755, SanAndreasOpcodePath.extendPatrolRoute, 5, 'extend_patrol_route ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 091D=6,remove_forbidden_for_boats_cube_cornerA %1d% %2d% %3d% cornerB %4d% %5d% %6d%
Opcode.register(0x091d, SanAndreasOpcodePath.switchRoadsBackToOriginal, 6, 'switch_roads_back_to_original ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 091E=6,create_forbidden_for_boats_cube_cornerA %1d% %2d% %3d% cornerB %4d% %5d% %6d%
Opcode.register(0x091e, SanAndreasOpcodePath.switchPedRoadsBackToOriginal, 6, 'switch_ped_roads_back_to_original ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0994=3,unknown_create_escape_at %1d% %2d% %3d%
Opcode.register(0x0994, SanAndreasOpcodePath.markRoadNodeAsDontWander, 3, 'mark_road_node_as_dont_wander ${1} ${2} ${3}', {false, false, false})
-- INI: 0995=0,unknown_remove_escapes
Opcode.register(0x0995, SanAndreasOpcodePath.unmarkAllRoadNodesAsDontWander, 0, 'unmark_all_road_nodes_as_dont_wander', {})
