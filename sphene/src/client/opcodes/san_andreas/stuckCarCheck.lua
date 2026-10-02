SanAndreasOpcodeStuckCarCheck = {}
SanAndreasOpcodeStuckCarCheck.__index = SanAndreasOpcodeStuckCarCheck

-- Opcode: 0x072F
-- Instruction: add_stuck_car_check_with_warp {vehicle} [Car] {distance} [float] {time} [int] {stuck} [bool] {flipped} [bool] {warp} [bool] {pathId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/072F
function SanAndreasOpcodeStuckCarCheck.addWithWarp(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 072F=7,enable_car %1d% stuck_check_distance %2d% time %3d% and_restore_if stuck %4h% flipped %5h% unk_place_on_road_properly %6h% to_path %7h% ; extended 03CC
Opcode.register(0x072f, SanAndreasOpcodeStuckCarCheck.addWithWarp, 7, 'add_stuck_car_check_with_warp ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
