SanAndreasOpcodeSprite = {}
SanAndreasOpcodeSprite.__index = SanAndreasOpcodeSprite

-- Opcode: 0x0D7E
-- Instruction: draw_2d_sprite {texture} [int] {cornerAx} [float] {cornerAy} [float] {cornerBx} [float] {cornerBy} [float] {red} [int] {blue} [int] {green} [int] {aplha} [int] {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D7E
function SanAndreasOpcodeSprite.draw2D(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D7F
-- Instruction: draw_2d_sprite_with_gradient {texture} [int] {cornerAx} [float] {cornerAy} [float] {cornerBx} [float] {cornerBy} [float] {red0} [int] {green0} [int] {blue0} [int] {alpha0} [int] {red1} [int] {green1} [int] {blue1} [int] {alpha1} [int] {red2} [int] {green2} [int] {blue2} [int] {alpha2} [int] {red3} [int] {green3} [int] {blue3} [int] {alpha3} [int] {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D7F
function SanAndreasOpcodeSprite.draw2DWithGradient(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0D7E=10,draw_sprite_with_texture %1d% at_cornerA %2d% %3d% cornerB %4d% %5d% color %6d% %7d% %8d% %9d% angle %10d%
Opcode.register(0x0d7e, SanAndreasOpcodeSprite.draw2D, 10, 'draw_2d_sprite ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10}', {false, false, false, false, false, false, false, false, false, false})
-- INI: 0D7F=22,draw_gradient_sprite_with_texture %1d% at_cornerA %2d% %3d% cornerB %4d% %5d% colors %6d% %7d% %8d% %9d%  %10d% %11d% %12d% %13d%  %14d% %15d% %16d% %17d%  %18d% %19d% %20d% %21d% angle %22d%
Opcode.register(0x0d7f, SanAndreasOpcodeSprite.draw2DWithGradient, 22, 'draw_2d_sprite_with_gradient ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} ${21} ${22}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false})
