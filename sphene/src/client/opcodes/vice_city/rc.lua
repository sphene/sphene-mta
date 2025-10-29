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


Opcode.register(0x010c, ViceCityOpcodeRc.giveCarToPlayer, 'give_remote_controlled_car_to_player {player} [Player] {x} [float] {y} [float] {z} [float] {angle} [float]')
Opcode.register(0x0409, ViceCityOpcodeRc.blowUpBuggy, 'blow_up_rc_buggy')
