ViceCityOpcodeZone = {}
ViceCityOpcodeZone.__index = ViceCityOpcodeZone

-- Opcode: 0x0152
-- Instruction: set_zone_car_info {zone} [zone_key] {dayOrNight} [DayOrNight] {density} [int] {cuban} [int] {haitian} [int] {street} [int] {diaz} [int] {security} [int] {biker} [int] {player} [int] {golfer} [int] {gang9} [int] {cop} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0152
function ViceCityOpcodeZone.setCarInfo(_, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x015C
-- Instruction: set_zone_ped_info {zone} [zone_key] {dayOrNight} [DayOrNight] {density} [int] {cuban} [int] {haitian} [int] {street} [int] {diaz} [int] {security} [int] {biker} [int] {player} [int] {golfer} [int] {gang9} [int] {cop} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/015C
function ViceCityOpcodeZone.setPedInfo(_, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0324
-- Instruction: set_zone_group {zone} [zone_key] {dayOrNight} [DayOrNight] {pedGroup} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0324
function ViceCityOpcodeZone.setGroup(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04EC
-- Instruction: set_zone_civilian_car_info {zone} [zone_key] {dayOrNight} [DayOrNight] {normal} [int] {poor} [int] {rich} [int] {exec} [int] {worker} [int] {big} [int] {taxi} [int] {moped} [int] {motorbike} [int] {leisureBoat} [int] {workerBoat} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04EC
function ViceCityOpcodeZone.setCivilianCarInfo(_, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0152=13,set_zone_car_info %1s% %2b:day/night% %3h% %4h% %5h% %6h% %7h% %8h% %9h% %10h% %11h% %12h% %13h%
Opcode.register(0x0152, ViceCityOpcodeZone.setCarInfo, 13, 'set_zone_car_info ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13}', {false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 015c=13,set_zone_gang_info %1s% %2b:day/night% %3h% %4h% %5h% %6h% %7h% %8h% %9h% %10h% %11h% %12h% %13d%
Opcode.register(0x015c, ViceCityOpcodeZone.setPedInfo, 13, 'set_zone_ped_info ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13}', {false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0324=3,set_zone_pedgroup_info %1z% %2b:day/night% %3u%
Opcode.register(0x0324, ViceCityOpcodeZone.setGroup, 3, 'set_zone_group ${1} ${2} ${3}', {false, false, false})
-- INI: 04ec=13,set_zone_car_class_info %1s% %2h% %3d% %4h% %5d% %6d% %7h% %8h% %9h% %10h% %11h% %12d% %13d%
Opcode.register(0x04ec, ViceCityOpcodeZone.setCivilianCarInfo, 13, 'set_zone_civilian_car_info ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13}', {false, false, false, false, false, false, false, false, false, false, false, false, false})
