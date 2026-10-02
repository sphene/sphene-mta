ViceCityOpcodeRc = {}
ViceCityOpcodeRc.__index = ViceCityOpcodeRc

-- Opcode: 0x010C
-- Instruction: give_remote_controlled_car_to_player {player} [Player] {x} [float] {y} [float] {z} [float] {angle} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/010C
function ViceCityOpcodeRc.giveCarToPlayer(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0409
-- Instruction: blow_up_rc_buggy
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0409
function ViceCityOpcodeRc.blowUpBuggy()
   return Script.setOpcodeUnimplemented()
end


-- INI: 010c=5,change_player_into_rc_buggy %1d% at %2d% %3d% %4d% %5d%
Opcode.register(0x010c, ViceCityOpcodeRc.giveCarToPlayer, 5, 'give_remote_controlled_car_to_player ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0409=0,blow_up_rc_buggy
Opcode.register(0x0409, ViceCityOpcodeRc.blowUpBuggy, 0, 'blow_up_rc_buggy', {})
