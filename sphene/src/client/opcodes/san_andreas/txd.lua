SanAndreasOpcodeTxd = {}
SanAndreasOpcodeTxd.__index = SanAndreasOpcodeTxd

-- Opcode: 0x0E1E
-- Instruction: draw_texture_plus {rwTextureOrSprite} [int] {drawEvent} [DrawEvent] {posX} [float] {posY} [float] {sizeX} [float] {sizeY} [float] {angle} [float] {depth} [float] {fixAr} [bool] {maskVertCount} [int] {maskVertArray} [int] {red} [int] {green} [int] {blue} [int] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E1E
function SanAndreasOpcodeTxd.drawTexturePlus(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E3C
-- Instruction: [var rwTexture: int] = get_texture_from_sprite {sprite} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E3C
function SanAndreasOpcodeTxd.getTextureFromSprite(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0e1e, SanAndreasOpcodeTxd.drawTexturePlus, 'draw_texture_plus {rwTextureOrSprite} [int] {drawEvent} [DrawEvent] {posX} [float] {posY} [float] {sizeX} [float] {sizeY} [float] {angle} [float] {depth} [float] {fixAr} [bool] {maskVertCount} [int] {maskVertArray} [int] {red} [int] {green} [int] {blue} [int] {alpha} [int]')
Opcode.register(0x0e3c, SanAndreasOpcodeTxd.getTextureFromSprite, '[var rwTexture: int] = get_texture_from_sprite {sprite} [int]')
