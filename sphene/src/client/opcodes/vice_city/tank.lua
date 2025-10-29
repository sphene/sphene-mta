ViceCityOpcodeTank = {}
ViceCityOpcodeTank.__index = ViceCityOpcodeTank

-- Opcode: 0x0493
-- Instruction: set_tank_detonate_cars [Tank] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0493
function ViceCityOpcodeTank.setDetonateCars(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0493, ViceCityOpcodeTank.setDetonateCars, 'set_tank_detonate_cars [Tank] {state} [bool]')
