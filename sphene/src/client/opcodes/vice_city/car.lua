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


-- INI: 032c=2,car %1d% ram %2d%
Opcode.register(0x032c, ViceCityOpcodeCar.setRamCar, 2, 'set_car_ram_car ${1} ${2}', {false, false})
-- INI: 0383=1,  player %1d% car_horn_activated == true
Opcode.register(0x0383, ViceCityOpcodeCar.isIcecreamJingleOn, 1, 'is_icecream_jingle_on ${1}', {true})
-- INI: 0450=1,car %1d% warp_to_player
Opcode.register(0x0450, ViceCityOpcodeCar.setOnPathToPlayer, 1, 'set_james_car_on_path_to_player ${1}', {false})
-- INI: 045f=1,set_car %1d% everyone_exit
Opcode.register(0x045f, ViceCityOpcodeCar.setAllOccupantsLeave, 2, 'set_all_occupants_of_car_leave_car ${1}', {false, false})
-- INI: 050b=1,open_trunk_of_car %1d%
Opcode.register(0x050b, ViceCityOpcodeCar.popBootUsingPhysics, 1, 'pop_car_boot_using_physics ${1}', {false})
-- INI: 059b=1,disarm_car_bomb %1d%
Opcode.register(0x059b, ViceCityOpcodeCar.disarmBomb, 1, 'disarm_car_bomb ${1}', {false})
