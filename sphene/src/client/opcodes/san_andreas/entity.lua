SanAndreasOpcodeEntity = {}
SanAndreasOpcodeEntity.__index = SanAndreasOpcodeEntity

-- Opcode: 0x0E13
-- Instruction: [var type: EntityType] = get_entity_type {entity} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E13
function SanAndreasOpcodeEntity.getType(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EED
-- Instruction: locate_entity_distance_to_entity {entityA} [int] {entityB} [int] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EED
function SanAndreasOpcodeEntity.locateDistanceToEntity(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EEE
-- Instruction: [var x: float], [var y: float], [var z: float] = get_entity_coordinates {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EEE
function SanAndreasOpcodeEntity.getCoordinates(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EEF
-- Instruction: [var heading: float] = get_entity_heading {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EEF
function SanAndreasOpcodeEntity.getHeading(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0e13, SanAndreasOpcodeEntity.getType, '[var type: EntityType] = get_entity_type {entity} [any]')
Opcode.register(0x0eed, SanAndreasOpcodeEntity.locateDistanceToEntity, 'locate_entity_distance_to_entity {entityA} [int] {entityB} [int] {radius} [float]')
Opcode.register(0x0eee, SanAndreasOpcodeEntity.getCoordinates, '[var x: float], [var y: float], [var z: float] = get_entity_coordinates {address} [int]')
Opcode.register(0x0eef, SanAndreasOpcodeEntity.getHeading, '[var heading: float] = get_entity_heading {address} [int]')
