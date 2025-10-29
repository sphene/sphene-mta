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


Opcode.register(0x0152, ViceCityOpcodeZone.setCarInfo, 'set_zone_car_info {zone} [zone_key] {dayOrNight} [DayOrNight] {density} [int] {cuban} [int] {haitian} [int] {street} [int] {diaz} [int] {security} [int] {biker} [int] {player} [int] {golfer} [int] {gang9} [int] {cop} [int]')
Opcode.register(0x015c, ViceCityOpcodeZone.setPedInfo, 'set_zone_ped_info {zone} [zone_key] {dayOrNight} [DayOrNight] {density} [int] {cuban} [int] {haitian} [int] {street} [int] {diaz} [int] {security} [int] {biker} [int] {player} [int] {golfer} [int] {gang9} [int] {cop} [int]')
Opcode.register(0x0324, ViceCityOpcodeZone.setGroup, 'set_zone_group {zone} [zone_key] {dayOrNight} [DayOrNight] {pedGroup} [int]')
Opcode.register(0x04ec, ViceCityOpcodeZone.setCivilianCarInfo, 'set_zone_civilian_car_info {zone} [zone_key] {dayOrNight} [DayOrNight] {normal} [int] {poor} [int] {rich} [int] {exec} [int] {worker} [int] {big} [int] {taxi} [int] {moped} [int] {motorbike} [int] {leisureBoat} [int] {workerBoat} [int]')
