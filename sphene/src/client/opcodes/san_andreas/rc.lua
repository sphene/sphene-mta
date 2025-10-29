SanAndreasOpcodeRc = {}
SanAndreasOpcodeRc.__index = SanAndreasOpcodeRc

-- Opcode: 0x0715
-- Instruction: take_remote_control_of_car {player} [Player] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0715
function SanAndreasOpcodeRc.takeCar(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0715, SanAndreasOpcodeRc.takeCar, 'take_remote_control_of_car {player} [Player] {vehicle} [Car]')
