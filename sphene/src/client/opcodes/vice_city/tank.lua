ViceCityOpcodeTank = {}
ViceCityOpcodeTank.__index = ViceCityOpcodeTank

-- Opcode: 0x0493
-- Instruction: set_tank_detonate_cars [Tank] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0493
function ViceCityOpcodeTank.setDetonateCars(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0493=2,set_tank %1d% contact_explosion %2h%
Opcode.register(0x0493, ViceCityOpcodeTank.setDetonateCars, 2, 'set_tank_detonate_cars ${1} ${2}', {false, false})
