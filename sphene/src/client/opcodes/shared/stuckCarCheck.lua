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


Opcode.register(0x03cc, SharedOpcodeStuckCarCheck.add, 'add_stuck_car_check {vehicle} [Car] {distance} [float] {time} [int]')
Opcode.register(0x03cd, SharedOpcodeStuckCarCheck.remove, 'remove_stuck_car_check {vehicle} [Car]')
Opcode.register(0x03ce, SharedOpcodeStuckCarCheck.isCarStuck, 'is_car_stuck {vehicle} [Car]')
