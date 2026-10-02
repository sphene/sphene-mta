ViceCityOpcodePath = {}
ViceCityOpcodePath.__index = ViceCityOpcodePath

-- Opcode: 0x01E2
-- Instruction: add_route_point {routeId} [int] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01E2
function ViceCityOpcodePath.addRoutePoint(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03AC
-- Instruction: remove_route {routeId} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03AC
function ViceCityOpcodePath.removeRoute(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 01e2=4,add_route_point %1d% at %2d% %3d% %4d%
Opcode.register(0x01e2, ViceCityOpcodePath.addRoutePoint, 4, 'add_route_point ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 03ac=1,clear_route %1d%
Opcode.register(0x03ac, ViceCityOpcodePath.removeRoute, 1, 'remove_route ${1}', {false})
