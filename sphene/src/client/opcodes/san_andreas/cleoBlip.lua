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


Opcode.register(0x0e2a, SanAndreasOpcodeCleoBlip.add, '[var handle: CleoBlip] = add_cleo_blip {rwTextureOrRadarSprite} [any] {x} [float] {y} [float] {short} [bool] {red} [int] {green} [int] {blue} [int] {alpha} [int]')
Opcode.register(0x0e2b, SanAndreasOpcodeCleoBlip.remove, 'remove_cleo_blip [CleoBlip]')
