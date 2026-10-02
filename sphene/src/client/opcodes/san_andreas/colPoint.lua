SanAndreasOpcodeColPoint = {}
SanAndreasOpcodeColPoint.__index = SanAndreasOpcodeColPoint

-- Opcode: 0x0D3A
-- Instruction: [var handle: ColPoint], [var outX: float], [var outY: float], [var outZ: float], [var entity: int] = get_collision_between_points {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {buildings} [bool] {vehicles} [bool] {peds} [bool] {objects} [bool] {dummies} [bool] {seeThroughCheck} [bool] {cameraIgnoreCheck} [bool] {shotThroughCheck} [bool] {entityToIgnore} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D3A
function SanAndreasOpcodeColPoint.getCollisionBetweenPoints(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D3B
-- Instruction: [var x: float], [var y: float], [var z: float] = get_colpoint_normal_vector [ColPoint]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D3B
function SanAndreasOpcodeColPoint.getNormalVector(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D3C
-- Instruction: [var surfaceType: SurfaceType] = get_colpoint_surface [ColPoint]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D3C
function SanAndreasOpcodeColPoint.getSurface(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D3E
-- Instruction: [var depth: float] = get_colpoint_depth [ColPoint]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D3E
function SanAndreasOpcodeColPoint.getDepth(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E6B
-- Instruction: [var lighting: int] = get_colpoint_lighting [ColPoint] {fromNight} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E6B
function SanAndreasOpcodeColPoint.getLighting(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EE1
-- Instruction: [var x: float], [var y: float], [var z: float] = get_colpoint_coordinates [ColPoint]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EE1
function SanAndreasOpcodeColPoint.getCoordinates(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0D3A=20,get_collision_between_points %1d% %2d% %3d% and %4d% %5d% %6d% flags %7d% %8d% %9d% %10d% %11d% %12d% %13d% %14d% ignore_entity %15d% store_point_to %17d% %18d% %19d% entity_to %20d% colpoint_data_to %16d% // IF and SET
Opcode.register(0x0d3a, SanAndreasOpcodeColPoint.getCollisionBetweenPoints, 20, '${16}, ${17}, ${18}, ${19}, ${20} = get_collision_between_points ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, true, true, true, true, true})
-- INI: 0D3B=4,get_colpoint_data %1d% normal_XYZ_to %2d% %3d% %4d%
Opcode.register(0x0d3b, SanAndreasOpcodeColPoint.getNormalVector, 4, '${2}, ${3}, ${4} = get_colpoint_normal_vector ${1}', {false, true, true, true})
-- INI: 0D3C=2,get_colpoint_data %1d% surface_to %2d%
Opcode.register(0x0d3c, SanAndreasOpcodeColPoint.getSurface, 2, '${1} = get_colpoint_surface ${2}', {false, false})
-- INI: 0D3E=2,get_colpoint_data %1d% depth_to %2d%
Opcode.register(0x0d3e, SanAndreasOpcodeColPoint.getDepth, 2, '${1} = get_colpoint_depth ${2}', {false, false})
-- INI: 0E6B=3,get_colpoint_lighting %1d% from_night %2d% store_to %3d%
Opcode.register(0x0e6b, SanAndreasOpcodeColPoint.getLighting, 3, '${3} = get_colpoint_lighting ${1} ${2}', {false, false, true})
-- INI: 0EE1=4,get_colpoint_coordinates %1d% store_to %2d% %3d% %4d%
Opcode.register(0x0ee1, SanAndreasOpcodeColPoint.getCoordinates, 4, '${1}, ${2}, ${3} = get_colpoint_coordinates ${4}', {false, true, true, true})
