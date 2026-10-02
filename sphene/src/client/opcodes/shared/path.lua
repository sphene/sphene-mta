SharedOpcodePath = {}
SharedOpcodePath.__index = SharedOpcodePath

-- Opcode: 0x01E7
-- Instruction: switch_roads_on {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01E7
function SharedOpcodePath.switchRoadsOn(_, _, _, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x01E8
-- Instruction: switch_roads_off {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01E8
function SharedOpcodePath.switchRoadsOff(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x022A
-- Instruction: switch_ped_roads_on {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/022A
function SharedOpcodePath.switchPedRoadsOn()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x022B
-- Instruction: switch_ped_roads_off {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/022B
function SharedOpcodePath.switchPedRoadsOff()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02C0
-- Instruction: [var nodeX: float], [var nodeY: float], [var nodeZ: float] = get_closest_char_node {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02C0
function SharedOpcodePath.getClosestCharNode(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02C1
-- Instruction: [var nodeX: float], [var nodeY: float], [var nodeZ: float] = get_closest_car_node {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02C1
function SharedOpcodePath.getClosestCarNode(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03D3
-- Instruction: [var nodeX: float], [var nodeY: float], [var nodeZ: float], [var angle: float] = get_closest_car_node_with_heading {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03D3
function SharedOpcodePath.getClosestCarNodeWithHeading(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04B9
-- Instruction: [var node1X: float], [var node1Y: float], [var node1Z: float], [var node2X: float], [var node2Y: float], [var node2Z: float], [var angle: float] = get_closest_straight_road {x} [float] {y} [float] {z} [float] {minDist} [float] {maxDist} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04B9
function SharedOpcodePath.getClosestStraightRoad(_, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04D3
-- Instruction: [var x: float], [var y: float], [var z: float] = get_nth_closest_car_node {fromX} [float] {fromY} [float] {fromZ} [float] {n} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04D3
function SharedOpcodePath.getNthClosestCarNode(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 01e7=6,remove_forbidden_for_cars_cube %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x01e7, SharedOpcodePath.switchRoadsOn, 6, 'switch_roads_on ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 01e8=6,create_forbidden_for_cars_cube %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x01e8, SharedOpcodePath.switchRoadsOff, 6, 'switch_roads_off ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 022a=6,remove_forbidden_for_peds_cube %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x022a, SharedOpcodePath.switchPedRoadsOn, 6, 'switch_ped_roads_on ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 022b=6,create_forbidden_for_peds_cube %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x022b, SharedOpcodePath.switchPedRoadsOff, 6, 'switch_ped_roads_off ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 02c0=6,set %4d% %5d% %6d% to_ped_path_coords_closest_to %1d% %2d% %3d%
Opcode.register(0x02c0, SharedOpcodePath.getClosestCharNode, 6, '${4}, ${5}, ${6} = get_closest_char_node ${1} ${2} ${3}', {false, false, false, true, true, true})
-- INI: 02c1=6,set %4d% %5d% %6d% to_car_path_coords_closest_to %1d% %2d% %3d%
Opcode.register(0x02c1, SharedOpcodePath.getClosestCarNode, 6, '${4}, ${5}, ${6} = get_closest_car_node ${1} ${2} ${3}', {false, false, false, true, true, true})
-- INI: 03d3=7,point %1d% %2d% %3d% get_nearby_vector %4d% %5d% %6d% %7d%
Opcode.register(0x03d3, SharedOpcodePath.getClosestCarNodeWithHeading, 7, '${4}, ${5}, ${6}, ${7} = get_closest_car_node_with_heading ${1} ${2} ${3}', {false, false, false, true, true, true, true})
-- INI: 04b9=12,get_closest_straight_road %1d% %2d% %3d% %4d% %5d% %6d% %7d% %8d% %9d% %10d% %11d% %12d%
Opcode.register(0x04b9, SharedOpcodePath.getClosestStraightRoad, 12, '${8}, ${9}, ${10}, ${11}, ${12}, ${6}, ${7} = get_closest_straight_road ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false, true, true, true, true, true, true, true})
-- INI: 04d3=7,get_nearest_car_path_coords_from %1d% %2d% %3d% type %4h% store_to %5d% %6d% %7d%
Opcode.register(0x04d3, SharedOpcodePath.getNthClosestCarNode, 7, '${5}, ${6}, ${7} = get_nth_closest_car_node ${4} ${1} ${2} ${3}', {false, false, false, false, true, true, true})
