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


Opcode.register(0x01e7, SharedOpcodePath.switchRoadsOn, 'switch_roads_on {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x01e8, SharedOpcodePath.switchRoadsOff, 'switch_roads_off {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x022a, SharedOpcodePath.switchPedRoadsOn, 'switch_ped_roads_on {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x022b, SharedOpcodePath.switchPedRoadsOff, 'switch_ped_roads_off {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x02c0, SharedOpcodePath.getClosestCharNode, '[var nodeX: float], [var nodeY: float], [var nodeZ: float] = get_closest_char_node {x} [float] {y} [float] {z} [float]')
Opcode.register(0x02c1, SharedOpcodePath.getClosestCarNode, '[var nodeX: float], [var nodeY: float], [var nodeZ: float] = get_closest_car_node {x} [float] {y} [float] {z} [float]')
Opcode.register(0x03d3, SharedOpcodePath.getClosestCarNodeWithHeading, '[var nodeX: float], [var nodeY: float], [var nodeZ: float], [var angle: float] = get_closest_car_node_with_heading {x} [float] {y} [float] {z} [float]')
Opcode.register(0x04b9, SharedOpcodePath.getClosestStraightRoad, '[var node1X: float], [var node1Y: float], [var node1Z: float], [var node2X: float], [var node2Y: float], [var node2Z: float], [var angle: float] = get_closest_straight_road {x} [float] {y} [float] {z} [float] {minDist} [float] {maxDist} [float]')
Opcode.register(0x04d3, SharedOpcodePath.getNthClosestCarNode, '[var x: float], [var y: float], [var z: float] = get_nth_closest_car_node {fromX} [float] {fromY} [float] {fromZ} [float] {n} [int]')
