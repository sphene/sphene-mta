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


-- INI: 0E1E=15,draw_texture_plus %1d% event %2d% pos %3d% %4d% size %5d% %6d% angle %7d% depth %8d% fix_aspect_ratio %9d% maskTrisCount %10d% maskTrisArray %11d% rgba %12d% %13d% %14d% %15d%
Opcode.register(0x0e1e, SanAndreasOpcodeTxd.drawTexturePlus, 15, 'draw_texture_plus ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0E3C=2,get_texture_from_sprite %1d% store_to %2d%
Opcode.register(0x0e3c, SanAndreasOpcodeTxd.getTextureFromSprite, 2, '${1} = get_texture_from_sprite ${2}', {true, false})
