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


-- INI: 08EB=7,create_sparks_at %1d% %2d% %3d% velocity_direction %4d% %5d% %6d% density %7h%
Opcode.register(0x08eb, SanAndreasOpcodeFx.addSparks, 7, 'add_sparks ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 0948=5,create_explosion_at %1d% %2d% %3d% type %4h% camera_shake %5d%
Opcode.register(0x0948, SanAndreasOpcodeFx.addExplosionVariableShake, 5, 'add_explosion_variable_shake ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 095C=12,create_smoke_at %1d% %2d% %3d% velocity %4d% %5d% %6d% RGBA %7d% %8d% %9d% %10d% size %11d% last_factor %12d%
Opcode.register(0x095c, SanAndreasOpcodeFx.addSmokeParticle, 12, 'add_smoke_particle ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12}', {false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 09B8=8,create_blood_gush_at %1d% %2d% %3d% with_offset %4d% %5d% %6d% density %7h% on_actor %8d%
Opcode.register(0x09b8, SanAndreasOpcodeFx.addBlood, 8, 'add_blood ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 09E5=7,create_flash_light_at %1d% %2d% %3d% RGB_mask %4d% %5d% %6d% radius %7d%
Opcode.register(0x09e5, SanAndreasOpcodeFx.drawLightWithRange, 7, 'draw_light_with_range ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 0EBF=2,get_fx_system_pointer %1d% store_to %2d%
Opcode.register(0x0ebf, SanAndreasOpcodeFx.getAddress, 2, '${1} = get_fx_system_pointer ${2}', {true, false})
-- INI: 0EC0=14,add_fx_system_particle %1d% coord %2d% %3d% %4d% vel %5d% %6d% %7d% size %8d% brightness %9d% rgba %10d% %11d% %12d% %13d% lastFactor %14d%
Opcode.register(0x0ec0, SanAndreasOpcodeFx.addParticle, 14, 'add_fx_system_particle ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0EC1=1,is_fx_system_available_with_name %1s%
Opcode.register(0x0ec1, SanAndreasOpcodeFx.isAvailableWithName, 1, 'is_fx_system_available_with_name ${1}', {false})
