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


-- INI: 0162=4,%4d% = create_marker_above_actor %1d% color %2d% display %3d%
Opcode.register(0x0162, ViceCityOpcodeBlip.addForCharOld, 4, '${4} = add_blip_for_char_old ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0166=2,set_marker %1d% brightness_to %2d%
Opcode.register(0x0166, ViceCityOpcodeBlip.dim, 2, 'dim_blip ${1} ${2}', {false, true})
-- INI: 0189=4,%4d% = create_checkpoint_and_sphere_at %1d% %2d% %3d%
Opcode.register(0x0189, ViceCityOpcodeBlip.addForContactPoint, 4, '${4} = add_blip_for_contact_point ${1} ${2} ${3}', {false, false, false, true})
