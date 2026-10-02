SanAndreasOpcodeCleoBlip = {}
SanAndreasOpcodeCleoBlip.__index = SanAndreasOpcodeCleoBlip

-- Opcode: 0x0E2A
-- Instruction: [var handle: CleoBlip] = add_cleo_blip {rwTextureOrRadarSprite} [any] {x} [float] {y} [float] {short} [bool] {red} [int] {green} [int] {blue} [int] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E2A
function SanAndreasOpcodeCleoBlip.add(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E2B
-- Instruction: remove_cleo_blip [CleoBlip]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E2B
function SanAndreasOpcodeCleoBlip.remove(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0E2A=9,add_cleo_blip %1d% position %2d% %3d% is_short %4d% RGBA %5d% %6d% %7d% %8d% store_to %9d%
Opcode.register(0x0e2a, SanAndreasOpcodeCleoBlip.add, 9, '${9} = add_cleo_blip ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false, true})
-- INI: 0E2B=1,remove_cleo_blip %1d%
Opcode.register(0x0e2b, SanAndreasOpcodeCleoBlip.remove, 1, 'remove_cleo_blip ${1}', {false})
