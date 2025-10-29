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


Opcode.register(0x0d7e, SanAndreasOpcodeSprite.draw2D, 'draw_2d_sprite {texture} [int] {cornerAx} [float] {cornerAy} [float] {cornerBx} [float] {cornerBy} [float] {red} [int] {blue} [int] {green} [int] {aplha} [int] {angle} [float]')
Opcode.register(0x0d7f, SanAndreasOpcodeSprite.draw2DWithGradient, 'draw_2d_sprite_with_gradient {texture} [int] {cornerAx} [float] {cornerAy} [float] {cornerBx} [float] {cornerBy} [float] {red0} [int] {green0} [int] {blue0} [int] {alpha0} [int] {red1} [int] {green1} [int] {blue1} [int] {alpha1} [int] {red2} [int] {green2} [int] {blue2} [int] {alpha2} [int] {red3} [int] {green3} [int] {blue3} [int] {alpha3} [int] {angle} [float]')
