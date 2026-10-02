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


-- INI: 0E13=2,get_entity %1d% type_to %2d%
Opcode.register(0x0e13, SanAndreasOpcodeEntity.getType, 2, '${1} = get_entity_type ${2}', {false, false})
-- INI: 0EED=5,locate_object_distance_to_coordinates %1d% pos %2d% %3d% %4d% radius %5d%
Opcode.register(0x0eed, SanAndreasOpcodeEntity.locateDistanceToEntity, 3, 'locate_entity_distance_to_entity ${1} ${2} ${3}', {false, false, false})
-- INI: 0EEE=4,get_entity_coordinates %1d% store_to %2d% %3d% %4d%
Opcode.register(0x0eee, SanAndreasOpcodeEntity.getCoordinates, 4, '${1}, ${2}, ${3} = get_entity_coordinates ${4}', {false, true, true, true})
-- INI: 0EEF=2,get_entity_heading %1d% store_to %2d%
Opcode.register(0x0eef, SanAndreasOpcodeEntity.getHeading, 2, '${1} = get_entity_heading ${2}', {true, false})
