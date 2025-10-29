SanAndreasOpcodeStuckCarCheck = {}
SanAndreasOpcodeStuckCarCheck.__index = SanAndreasOpcodeStuckCarCheck

-- Opcode: 0x072F
-- Instruction: add_stuck_car_check_with_warp {vehicle} [Car] {distance} [float] {time} [int] {stuck} [bool] {flipped} [bool] {warp} [bool] {pathId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/072F
function SanAndreasOpcodeStuckCarCheck.addWithWarp(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x072f, SanAndreasOpcodeStuckCarCheck.addWithWarp, 'add_stuck_car_check_with_warp {vehicle} [Car] {distance} [float] {time} [int] {stuck} [bool] {flipped} [bool] {warp} [bool] {pathId} [int]')
