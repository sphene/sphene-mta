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


Opcode.register(0x0d3a, SanAndreasOpcodeColPoint.getCollisionBetweenPoints, '[var handle: ColPoint], [var outX: float], [var outY: float], [var outZ: float], [var entity: int] = get_collision_between_points {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {buildings} [bool] {vehicles} [bool] {peds} [bool] {objects} [bool] {dummies} [bool] {seeThroughCheck} [bool] {cameraIgnoreCheck} [bool] {shotThroughCheck} [bool] {entityToIgnore} [int]')
Opcode.register(0x0d3b, SanAndreasOpcodeColPoint.getNormalVector, '[var x: float], [var y: float], [var z: float] = get_colpoint_normal_vector [ColPoint]')
Opcode.register(0x0d3c, SanAndreasOpcodeColPoint.getSurface, '[var surfaceType: SurfaceType] = get_colpoint_surface [ColPoint]')
Opcode.register(0x0d3e, SanAndreasOpcodeColPoint.getDepth, '[var depth: float] = get_colpoint_depth [ColPoint]')
Opcode.register(0x0e6b, SanAndreasOpcodeColPoint.getLighting, '[var lighting: int] = get_colpoint_lighting [ColPoint] {fromNight} [bool]')
Opcode.register(0x0ee1, SanAndreasOpcodeColPoint.getCoordinates, '[var x: float], [var y: float], [var z: float] = get_colpoint_coordinates [ColPoint]')
