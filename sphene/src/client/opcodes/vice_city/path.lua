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


Opcode.register(0x01e2, ViceCityOpcodePath.addRoutePoint, 'add_route_point {routeId} [int] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x03ac, ViceCityOpcodePath.removeRoute, 'remove_route {routeId} [int]')
