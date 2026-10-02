SharedOpcodeFx = {}
SharedOpcodeFx.__index = SharedOpcodeFx

-- Opcode: 0x016F
-- Instruction: draw_shadow {textureType} [ShadowTextureType] {x} [float] {y} [float] {z} [float] {angle} [float] {length} [float] {intensity} [int] {r} [int] {g} [int] {b} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/016F
function SharedOpcodeFx.drawShadow(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x020C
-- Instruction: add_explosion {x} [float] {y} [float] {z} [float] {type} [ExplosionType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/020C
function SharedOpcodeFx.addExplosion(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x024F
-- Instruction: draw_corona {x} [float] {y} [float] {z} [float] {size} [float] {coronaType} [CoronaType] {flareType} [FlareType] {r} [int] {g} [int] {b} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/024F
function SharedOpcodeFx.drawCorona(posX, posY, posZ, radius, type, lensflares, r, g, b, _)
    CoronaFrameElement.draw(Thread.currentThread, posX, posY, posZ, radius, r, g, b)

    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x04D5
-- Instruction: draw_weaponshop_corona {x} [float] {y} [float] {z} [float] {size} [float] {coronaType} [CoronaType] {flareType} [FlareType] {r} [int] {g} [int] {b} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04D5
function SharedOpcodeFx.drawWeaponshopCorona(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0565
-- Instruction: add_explosion_no_sound {x} [float] {y} [float] {z} [float] {type} [ExplosionType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0565
function SharedOpcodeFx.addExplosionNoSound(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x058A
-- Instruction: add_big_gun_flash {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/058A
function SharedOpcodeFx.addBigGunFlash(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 016F=10,draw_shadow %1d% at %2d% %3d% %4d% angle %5d% size %6d% intensity %7d% colour %8d% %9d% %10d%
Opcode.register(0x016f, SharedOpcodeFx.drawShadow, 10, 'draw_shadow ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10}', {false, false, false, false, false, false, false, false, false, false})
-- INI: 020c=4,create_explosion %4d% at %1d% %2d% %3d%
Opcode.register(0x020c, SharedOpcodeFx.addExplosion, 4, 'add_explosion ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 024f=9,create_corona_with_radius %4d% type %5d% lensflares %6d% with_color %7d% %8d% %9d% at %1d% %2d% %3d%
Opcode.register(0x024f, SharedOpcodeFx.drawCorona, 9, 'draw_corona ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 04d5=9,create_corona_at %1d% %2d% %3d% radius %4d% type %5h% flare %6h% RGB %7d% %8h% %9h%
Opcode.register(0x04d5, SharedOpcodeFx.drawWeaponshopCorona, 9, 'draw_weaponshop_corona ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 0565=4,create_temporary_explosion_fire %1d% %2d% %3d% type %4h%
Opcode.register(0x0565, SharedOpcodeFx.addExplosionNoSound, 4, 'add_explosion_no_sound ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 058a=6,create_gun_flash_from %1d% %2d% %3d% to %4d% %5d% %6d%
Opcode.register(0x058a, SharedOpcodeFx.addBigGunFlash, 6, 'add_big_gun_flash ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
