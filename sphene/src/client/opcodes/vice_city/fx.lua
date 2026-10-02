ViceCityOpcodeFx = {}
ViceCityOpcodeFx.__index = ViceCityOpcodeFx

-- Opcode: 0x039D
-- Instruction: add_moving_particle_effect {particle} [ParticleObject] {x} [float] {y} [float] {z} [float] {strengthX} [float] {strengthY} [float] {strengthZ} [float] {scale} [float] {r} [int] {g} [int] {b} [int] {durationInMs} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/039D
function ViceCityOpcodeFx.addMovingParticleEffect(_, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0437
-- Instruction: create_single_particle {type} [int] {x} [float] {y} [float] {z} [float] {strengthX} [float] {strengthY} [float] {strengthZ} [float] {scale} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0437
function ViceCityOpcodeFx.createSingleParticle(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 039d=12,scatter_particles %1a% %8d% %9d% %10d% %11d% %12d% at %2d% %3d% %4d% %5d% %6d% %7d%
Opcode.register(0x039d, ViceCityOpcodeFx.addMovingParticleEffect, 12, 'add_moving_particle_effect ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12}', {false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0437=8,scatter_particle %1a% %8d% at %2d% %3d% %4d% %5d% %6d% %7d%
Opcode.register(0x0437, ViceCityOpcodeFx.createSingleParticle, 8, 'create_single_particle ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
