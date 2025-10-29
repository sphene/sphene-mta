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


Opcode.register(0x039d, ViceCityOpcodeFx.addMovingParticleEffect, 'add_moving_particle_effect {particle} [ParticleObject] {x} [float] {y} [float] {z} [float] {strengthX} [float] {strengthY} [float] {strengthZ} [float] {scale} [float] {r} [int] {g} [int] {b} [int] {durationInMs} [int]')
Opcode.register(0x0437, ViceCityOpcodeFx.createSingleParticle, 'create_single_particle {type} [int] {x} [float] {y} [float] {z} [float] {strengthX} [float] {strengthY} [float] {strengthZ} [float] {scale} [float]')
