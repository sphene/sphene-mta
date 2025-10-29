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


Opcode.register(0x064b, SanAndreasOpcodeParticle.create, '[var handle: Particle] = create_fx_system {name} [string] {x} [float] {y} [float] {z} [float] {ignoreBoundingChecks} [bool]')
Opcode.register(0x064c, SanAndreasOpcodeParticle.play, 'play_fx_system [Particle]')
Opcode.register(0x064e, SanAndreasOpcodeParticle.stop, 'stop_fx_system [Particle]')
Opcode.register(0x064f, SanAndreasOpcodeParticle.playAndKill, 'play_and_kill_fx_system [Particle]')
Opcode.register(0x0650, SanAndreasOpcodeParticle.kill, 'kill_fx_system [Particle]')
Opcode.register(0x0669, SanAndreasOpcodeParticle.createOnChar, '[var handle: Particle] = create_fx_system_on_char {name} [string] {char} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {ignoreBoundingChecks} [bool]')
Opcode.register(0x066a, SanAndreasOpcodeParticle.createOnCharWithDirection, '[var handle: Particle] = create_fx_system_on_char_with_direction {name} [string] {char} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xDirection} [float] {yDirection} [float] {zDirection} [float] {ignoreBoundingChecks} [bool]')
Opcode.register(0x066b, SanAndreasOpcodeParticle.createOnCar, '[var handle: Particle] = create_fx_system_on_car {name} [string] {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {ignoreBoundingChecks} [bool]')
Opcode.register(0x066c, SanAndreasOpcodeParticle.createOnCarWithDirection, '[var handle: Particle] = create_fx_system_on_car_with_direction {name} [string] {vehicle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xDirection} [float] {yDirection} [float] {zDirection} [float] {ignoreBoundingChecks} [bool]')
Opcode.register(0x066d, SanAndreasOpcodeParticle.createOnObject, '[var handle: Particle] = create_fx_system_on_object {name} [string] {object} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {ignoreBoundingChecks} [bool]')
Opcode.register(0x066e, SanAndreasOpcodeParticle.createOnObjectWithDirection, '[var handle: Particle] = create_fx_system_on_object_with_direction {name} [string] {object} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xDirection} [float] {yDirection} [float] {zDirection} [float] {ignoreBoundingChecks} [bool]')
Opcode.register(0x0883, SanAndreasOpcodeParticle.attachToCharBone, 'attach_fx_system_to_char_bone [Particle] {handle} [Char] {boneId} [int]')
Opcode.register(0x0976, SanAndreasOpcodeParticle.killNow, 'kill_fx_system_now [Particle]')
