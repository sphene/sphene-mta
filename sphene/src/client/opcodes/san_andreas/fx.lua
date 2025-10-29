SanAndreasOpcodeFx = {}
SanAndreasOpcodeFx.__index = SanAndreasOpcodeFx

-- Opcode: 0x08EB
-- Instruction: add_sparks {x} [float] {y} [float] {z} [float] {velocityX} [float] {velocityY} [float] {velocityZ} [float] {density} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08EB
function SanAndreasOpcodeFx.addSparks(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0948
-- Instruction: add_explosion_variable_shake {x} [float] {y} [float] {z} [float] {type} [int] {shake} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0948
function SanAndreasOpcodeFx.addExplosionVariableShake(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x095C
-- Instruction: add_smoke_particle {x} [float] {y} [float] {z} [float] {velocityX} [float] {velocityY} [float] {velocityZ} [float] {red} [int] {green} [int] {blue} [int] {alpha} [int] {size} [float] {lastFactor} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/095C
function SanAndreasOpcodeFx.addSmokeParticle(_, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09B8
-- Instruction: add_blood {x} [float] {y} [float] {z} [float] {offsetX} [float] {offsetY} [float] {offsetZ} [float] {density} [int] {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09B8
function SanAndreasOpcodeFx.addBlood(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09E5
-- Instruction: draw_light_with_range {x} [float] {y} [float] {z} [float] {red} [int] {green} [int] {blue} [int] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09E5
function SanAndreasOpcodeFx.drawLightWithRange(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EBF
-- Instruction: [var address: int] = get_fx_system_pointer {particle} [Particle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EBF
function SanAndreasOpcodeFx.getAddress(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EC0
-- Instruction: add_fx_system_particle {particle} [Particle] {posX} [float] {posY} [float] {posZ} [float] {velX} [float] {velY} [float] {velZ} [float] {size} [float] {brightness} [float] {r} [float] {g} [float] {b} [float] {a} [float] {lastFactor} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EC0
function SanAndreasOpcodeFx.addParticle(_, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EC1
-- Instruction: is_fx_system_available_with_name {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EC1
function SanAndreasOpcodeFx.isAvailableWithName(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x08eb, SanAndreasOpcodeFx.addSparks, 'add_sparks {x} [float] {y} [float] {z} [float] {velocityX} [float] {velocityY} [float] {velocityZ} [float] {density} [int]')
Opcode.register(0x0948, SanAndreasOpcodeFx.addExplosionVariableShake, 'add_explosion_variable_shake {x} [float] {y} [float] {z} [float] {type} [int] {shake} [float]')
Opcode.register(0x095c, SanAndreasOpcodeFx.addSmokeParticle, 'add_smoke_particle {x} [float] {y} [float] {z} [float] {velocityX} [float] {velocityY} [float] {velocityZ} [float] {red} [int] {green} [int] {blue} [int] {alpha} [int] {size} [float] {lastFactor} [float]')
Opcode.register(0x09b8, SanAndreasOpcodeFx.addBlood, 'add_blood {x} [float] {y} [float] {z} [float] {offsetX} [float] {offsetY} [float] {offsetZ} [float] {density} [int] {handle} [Char]')
Opcode.register(0x09e5, SanAndreasOpcodeFx.drawLightWithRange, 'draw_light_with_range {x} [float] {y} [float] {z} [float] {red} [int] {green} [int] {blue} [int] {radius} [float]')
Opcode.register(0x0ebf, SanAndreasOpcodeFx.getAddress, '[var address: int] = get_fx_system_pointer {particle} [Particle]')
Opcode.register(0x0ec0, SanAndreasOpcodeFx.addParticle, 'add_fx_system_particle {particle} [Particle] {posX} [float] {posY} [float] {posZ} [float] {velX} [float] {velY} [float] {velZ} [float] {size} [float] {brightness} [float] {r} [float] {g} [float] {b} [float] {a} [float] {lastFactor} [float]')
Opcode.register(0x0ec1, SanAndreasOpcodeFx.isAvailableWithName, 'is_fx_system_available_with_name {name} [string]')
