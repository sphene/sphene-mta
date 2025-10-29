ViceCityOpcodeBlip = {}
ViceCityOpcodeBlip.__index = ViceCityOpcodeBlip

-- Opcode: 0x0162
-- Instruction: [var handle: Blip] = add_blip_for_char_old {char} [Char] {color} [BlipColor] {display} [BlipDisplay]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0162
function ViceCityOpcodeBlip.addForCharOld(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0166
-- Instruction: dim_blip [Blip] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0166
function ViceCityOpcodeBlip.dim(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0189
-- Instruction: [var handle: Blip] = add_blip_for_contact_point {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0189
function ViceCityOpcodeBlip.addForContactPoint(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0162, ViceCityOpcodeBlip.addForCharOld, '[var handle: Blip] = add_blip_for_char_old {char} [Char] {color} [BlipColor] {display} [BlipDisplay]')
Opcode.register(0x0166, ViceCityOpcodeBlip.dim, 'dim_blip [Blip] {state} [bool]')
Opcode.register(0x0189, ViceCityOpcodeBlip.addForContactPoint, '[var handle: Blip] = add_blip_for_contact_point {x} [float] {y} [float] {z} [float]')
