SanAndreasOpcodeParticle = {}
SanAndreasOpcodeParticle.__index = SanAndreasOpcodeParticle

-- Opcode: 0x064B
-- Instruction: [var handle: Particle] = create_fx_system {name} [string] {x} [float] {y} [float] {z} [float] {ignoreBoundingChecks} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/064B
function SanAndreasOpcodeParticle.create(_, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x064C
-- Instruction: play_fx_system [Particle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/064C
function SanAndreasOpcodeParticle.play(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x064E
-- Instruction: stop_fx_system [Particle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/064E
function SanAndreasOpcodeParticle.stop(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x064F
-- Instruction: play_and_kill_fx_system [Particle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/064F
function SanAndreasOpcodeParticle.playAndKill(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0650
-- Instruction: kill_fx_system [Particle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0650
function SanAndreasOpcodeParticle.kill(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0669
-- Instruction: [var handle: Particle] = create_fx_system_on_char {name} [string] {char} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {ignoreBoundingChecks} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0669
function SanAndreasOpcodeParticle.createOnChar(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x066A
-- Instruction: [var handle: Particle] = create_fx_system_on_char_with_direction {name} [string] {char} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xDirection} [float] {yDirection} [float] {zDirection} [float] {ignoreBoundingChecks} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/066A
function SanAndreasOpcodeParticle.createOnCharWithDirection(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x066B
-- Instruction: [var handle: Particle] = create_fx_system_on_car {name} [string] {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {ignoreBoundingChecks} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/066B
function SanAndreasOpcodeParticle.createOnCar(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x066C
-- Instruction: [var handle: Particle] = create_fx_system_on_car_with_direction {name} [string] {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xDirection} [float] {yDirection} [float] {zDirection} [float] {ignoreBoundingChecks} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/066C
function SanAndreasOpcodeParticle.createOnCarWithDirection(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x066D
-- Instruction: [var handle: Particle] = create_fx_system_on_object {name} [string] {object} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {ignoreBoundingChecks} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/066D
function SanAndreasOpcodeParticle.createOnObject(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x066E
-- Instruction: [var handle: Particle] = create_fx_system_on_object_with_direction {name} [string] {object} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xDirection} [float] {yDirection} [float] {zDirection} [float] {ignoreBoundingChecks} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/066E
function SanAndreasOpcodeParticle.createOnObjectWithDirection(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0883
-- Instruction: attach_fx_system_to_char_bone [Particle] {handle} [Char] {boneId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0883
function SanAndreasOpcodeParticle.attachToCharBone(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0976
-- Instruction: kill_fx_system_now [Particle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0976
function SanAndreasOpcodeParticle.killNow(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 064B=6,%6d% = create_particle %1h% at %2d% %3d% %4d% type %5h%
Opcode.register(0x064b, SanAndreasOpcodeParticle.create, 6, '${6} = create_fx_system ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false, true})
-- INI: 064C=1,make_particle %1d% visible
Opcode.register(0x064c, SanAndreasOpcodeParticle.play, 1, 'play_fx_system ${1}', {false})
-- INI: 064E=1,stop_particle %1d%
Opcode.register(0x064e, SanAndreasOpcodeParticle.stop, 1, 'stop_fx_system ${1}', {false})
-- INI: 064F=1,remove_references_to_particle %1d%
Opcode.register(0x064f, SanAndreasOpcodeParticle.playAndKill, 1, 'play_and_kill_fx_system ${1}', {false})
-- INI: 0650=1,destroy_particle %1d%
Opcode.register(0x0650, SanAndreasOpcodeParticle.kill, 1, 'kill_fx_system ${1}', {false})
-- INI: 0669=7,%7d% = attach_particle %1h% to_actor %2d% with_offset %3d% %4d% %5d% type %6h%
Opcode.register(0x0669, SanAndreasOpcodeParticle.createOnChar, 7, '${7} = create_fx_system_on_char ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 066A=10,%10d% = attach_particle %1h% to_actor %2d% with_offset %3d% %4d% %5d% rotation %6d% %7d% %8d% type %9h%
Opcode.register(0x066a, SanAndreasOpcodeParticle.createOnCharWithDirection, 10, '${10} = create_fx_system_on_char_with_direction ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false, true})
-- INI: 066B=7,%7d% = attach_particle %1h% to_car %2d% with_offset %3d% %4d% %5d% type %6h%
Opcode.register(0x066b, SanAndreasOpcodeParticle.createOnCar, 7, '${7} = create_fx_system_on_car ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 066C=10,%10d% = attach_particle %1h% to_car %2d% with_offset %3d% %4d% %5d% rotation %6d% %7d% %8d% type %9h%
Opcode.register(0x066c, SanAndreasOpcodeParticle.createOnCarWithDirection, 10, '${10} = create_fx_system_on_car_with_direction ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false, true})
-- INI: 066D=7,%7d% = attach_particle %1h% to_object %2d% with_offset %3d% %4d% %5d% type %6h%
Opcode.register(0x066d, SanAndreasOpcodeParticle.createOnObject, 7, '${7} = create_fx_system_on_object ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 066E=10,create_particle %1h% attached_to_object %2d% with_offset %3d% %4d% %5d% rotation %6d% %7d% %8d% flag %9h% store_to %10d%
Opcode.register(0x066e, SanAndreasOpcodeParticle.createOnObjectWithDirection, 10, '${10} = create_fx_system_on_object_with_direction ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false, true})
-- INI: 0883=3,attach_particle %1d% to_actor %2d% mode %3h%
Opcode.register(0x0883, SanAndreasOpcodeParticle.attachToCharBone, 3, 'attach_fx_system_to_char_bone ${1} ${2} ${3}', {false, false, false})
-- INI: 0976=1,destroy_particle %1d%
Opcode.register(0x0976, SanAndreasOpcodeParticle.killNow, 1, 'kill_fx_system_now ${1}', {false})
