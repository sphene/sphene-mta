ViceCityOpcodeObjectPath = {}
ViceCityOpcodeObjectPath.__index = ViceCityOpcodeObjectPath

-- Opcode: 0x049C
-- Instruction: [var handle: ObjectPath] = initialise_object_path {pathId} [int] {width} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/049C
function ViceCityOpcodeObjectPath.initialise(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x049D
-- Instruction: start_object_on_path [ObjectPath] {object} [Object]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/049D
function ViceCityOpcodeObjectPath.start(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x049E
-- Instruction: set_object_path_speed [ObjectPath] {speed} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/049E
function ViceCityOpcodeObjectPath.setSpeed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x049F
-- Instruction: set_object_path_position [ObjectPath] {position} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/049F
function ViceCityOpcodeObjectPath.setPosition(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04A1
-- Instruction: clear_object_path [ObjectPath]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04A1
function ViceCityOpcodeObjectPath.clear(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x049c, ViceCityOpcodeObjectPath.initialise, '[var handle: ObjectPath] = initialise_object_path {pathId} [int] {width} [float]')
Opcode.register(0x049d, ViceCityOpcodeObjectPath.start, 'start_object_on_path [ObjectPath] {object} [Object]')
Opcode.register(0x049e, ViceCityOpcodeObjectPath.setSpeed, 'set_object_path_speed [ObjectPath] {speed} [float]')
Opcode.register(0x049f, ViceCityOpcodeObjectPath.setPosition, 'set_object_path_position [ObjectPath] {position} [float]')
Opcode.register(0x04a1, ViceCityOpcodeObjectPath.clear, 'clear_object_path [ObjectPath]')
