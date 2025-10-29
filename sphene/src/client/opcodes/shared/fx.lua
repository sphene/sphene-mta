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


Opcode.register(0x016f, SharedOpcodeFx.drawShadow, 'draw_shadow {textureType} [ShadowTextureType] {x} [float] {y} [float] {z} [float] {angle} [float] {length} [float] {intensity} [int] {r} [int] {g} [int] {b} [int]')
Opcode.register(0x020c, SharedOpcodeFx.addExplosion, 'add_explosion {x} [float] {y} [float] {z} [float] {type} [ExplosionType]')
Opcode.register(0x024f, SharedOpcodeFx.drawCorona, 'draw_corona {x} [float] {y} [float] {z} [float] {size} [float] {coronaType} [CoronaType] {flareType} [FlareType] {r} [int] {g} [int] {b} [int]')
Opcode.register(0x04d5, SharedOpcodeFx.drawWeaponshopCorona, 'draw_weaponshop_corona {x} [float] {y} [float] {z} [float] {size} [float] {coronaType} [CoronaType] {flareType} [FlareType] {r} [int] {g} [int] {b} [int]')
Opcode.register(0x0565, SharedOpcodeFx.addExplosionNoSound, 'add_explosion_no_sound {x} [float] {y} [float] {z} [float] {type} [ExplosionType]')
Opcode.register(0x058a, SharedOpcodeFx.addBigGunFlash, 'add_big_gun_flash {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float]')
