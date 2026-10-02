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


-- INI: 049c=3,%3d% = scripted_path_file %1h% width %2d%
Opcode.register(0x049c, ViceCityOpcodeObjectPath.initialise, 3, '${3} = initialise_object_path ${1} ${2}', {false, false, true})
-- INI: 049d=2,attach_scripted_file %2d% with_object %1d%
Opcode.register(0x049d, ViceCityOpcodeObjectPath.start, 2, 'start_object_on_path ${1} ${2}', {false, false})
-- INI: 049e=2,set_scripted_file %1d% speed_to %2d%
Opcode.register(0x049e, ViceCityOpcodeObjectPath.setSpeed, 2, 'set_object_path_speed ${1} ${2}', {false, true})
-- INI: 049f=2,set_scripted_file %1d% distance_along_path_to %2d%
Opcode.register(0x049f, ViceCityOpcodeObjectPath.setPosition, 2, 'set_object_path_position ${1} ${2}', {false, true})
-- INI: 04a1=1,release_scripted_file %1d%
Opcode.register(0x04a1, ViceCityOpcodeObjectPath.clear, 1, 'clear_object_path ${1}', {false})
