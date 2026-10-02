SharedOpcodeZone = {}
SharedOpcodeZone.__index = SharedOpcodeZone

-- Opcode: 0x02DD
-- Instruction: [var handle: Char] = get_random_char_in_zone {zone} [zone_key] {civilian} [bool] {gang} [bool] {criminalOrProstitute} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02DD
function SharedOpcodeZone.getRandomChar(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 02dd=5,get_random_actor %5d% in_zone %1s% %2h% %3h% %4h%
Opcode.register(0x02dd, SharedOpcodeZone.getRandomChar, 5, '${5} = get_random_char_in_zone ${1} ${2} ${3} ${4}', {false, false, false, false, true})
