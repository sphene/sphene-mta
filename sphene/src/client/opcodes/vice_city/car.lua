ViceCityOpcodeCar = {}
ViceCityOpcodeCar.__index = ViceCityOpcodeCar

-- Opcode: 0x032C
-- Instruction: set_car_ram_car [Car] {target} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/032C
function ViceCityOpcodeCar.setRamCar()
    return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0383
-- Instruction: is_icecream_jingle_on [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0383
function ViceCityOpcodeCar.isIcecreamJingleOn(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0450
-- Instruction: set_james_car_on_path_to_player [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0450
function ViceCityOpcodeCar.setOnPathToPlayer(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x045F
-- Instruction: set_all_occupants_of_car_leave_car [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/045F
function ViceCityOpcodeCar.setAllOccupantsLeave(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x050B
-- Instruction: pop_car_boot_using_physics [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/050B
function ViceCityOpcodeCar.popBootUsingPhysics(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x059B
-- Instruction: disarm_car_bomb [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/059B
function ViceCityOpcodeCar.disarmBomb(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x032c, ViceCityOpcodeCar.setRamCar, 'set_car_ram_car [Car] {target} [Car]')
Opcode.register(0x0383, ViceCityOpcodeCar.isIcecreamJingleOn, 'is_icecream_jingle_on [Car]')
Opcode.register(0x0450, ViceCityOpcodeCar.setOnPathToPlayer, 'set_james_car_on_path_to_player [Car]')
Opcode.register(0x045f, ViceCityOpcodeCar.setAllOccupantsLeave, 'set_all_occupants_of_car_leave_car [Car]')
Opcode.register(0x050b, ViceCityOpcodeCar.popBootUsingPhysics, 'pop_car_boot_using_physics [Car]')
Opcode.register(0x059b, ViceCityOpcodeCar.disarmBomb, 'disarm_car_bomb [Car]')
