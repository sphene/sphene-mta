SharedOpcodeStuckCarCheck = {}
SharedOpcodeStuckCarCheck.__index = SharedOpcodeStuckCarCheck

-- Opcode: 0x03CC
-- Instruction: add_stuck_car_check {vehicle} [Car] {distance} [float] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03CC
function SharedOpcodeStuckCarCheck.add()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03CD
-- Instruction: remove_stuck_car_check {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03CD
function SharedOpcodeStuckCarCheck.remove()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03CE
-- Instruction: is_car_stuck {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03CE
function SharedOpcodeStuckCarCheck.isCarStuck()
    Script.setOpcodePartiallyImplemented()
    return false
end


-- INI: 03cc=3,add_stuck_car_check %1d% distance %2d% time %3d%
Opcode.register(0x03cc, SharedOpcodeStuckCarCheck.add, 3, 'add_stuck_car_check ${1} ${2} ${3}', {false, false, false})
-- INI: 03cd=1,car %1d% remove_from_stuck_car_check
Opcode.register(0x03cd, SharedOpcodeStuckCarCheck.remove, 1, 'remove_stuck_car_check ${1}', {false})
-- INI: 03ce=1,  car %1d% stuck
Opcode.register(0x03ce, SharedOpcodeStuckCarCheck.isCarStuck, 1, 'is_car_stuck ${1}', {false})
