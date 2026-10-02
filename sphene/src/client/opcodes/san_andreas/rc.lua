SanAndreasOpcodeRc = {}
SanAndreasOpcodeRc.__index = SanAndreasOpcodeRc

-- Opcode: 0x0715
-- Instruction: take_remote_control_of_car {player} [Player] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0715
function SanAndreasOpcodeRc.takeCar(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0715=2,put_player %1d% in_RC_mode_in_car %2d%  ; on foot version
Opcode.register(0x0715, SanAndreasOpcodeRc.takeCar, 2, 'take_remote_control_of_car ${1} ${2}', {false, false})
