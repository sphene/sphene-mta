SharedOpcodeZone = {}
SharedOpcodeZone.__index = SharedOpcodeZone

-- Opcode: 0x02DD
-- Instruction: [var handle: Char] = get_random_char_in_zone {zone} [zone_key] {civilian} [bool] {gang} [bool] {criminalOrProstitute} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02DD
function SharedOpcodeZone.getRandomChar(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x02dd, SharedOpcodeZone.getRandomChar, '[var handle: Char] = get_random_char_in_zone {zone} [zone_key] {civilian} [bool] {gang} [bool] {criminalOrProstitute} [bool]')
