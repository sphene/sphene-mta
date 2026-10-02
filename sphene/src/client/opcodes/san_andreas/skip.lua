SanAndreasOpcodeSkip = {}
SanAndreasOpcodeSkip.__index = SanAndreasOpcodeSkip

-- Opcode: 0x0950
-- Instruction: set_up_skip {x} [float] {y} [float] {z} [float] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0950
function SanAndreasOpcodeSkip.setUp(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0951
-- Instruction: clear_skip
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0951
function SanAndreasOpcodeSkip.clear()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09AF
-- Instruction: set_up_skip_after_mission {x} [float] {y} [float] {z} [float] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09AF
function SanAndreasOpcodeSkip.setUpAfterMission(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09E0
-- Instruction: set_up_skip_for_specific_vehicle {x} [float] {y} [float] {z} [float] {heading} [float] {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09E0
function SanAndreasOpcodeSkip.setUpForSpecificVehicle(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A35
-- Instruction: set_up_skip_for_vehicle_finished_by_script {x} [float] {y} [float] {z} [float] {heading} [float] {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A35
function SanAndreasOpcodeSkip.setUpForVehicleFinishedByScript(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A36
-- Instruction: is_skip_waiting_for_script_to_fade_in
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A36
function SanAndreasOpcodeSkip.isWaitingForScriptToFadeIn()
   return Script.setOpcodeUnimplemented()
end


-- INI: 0950=4,set_trip_skip %1d% %2d% %3d% angle %4d%
Opcode.register(0x0950, SanAndreasOpcodeSkip.setUp, 4, 'set_up_skip ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0951=0,disable_trip_skip
Opcode.register(0x0951, SanAndreasOpcodeSkip.clear, 0, 'clear_skip', {})
-- INI: 09AF=4,set_trip_skip_after_mission %1d% %2d% %3d% angle %4d%
Opcode.register(0x09af, SanAndreasOpcodeSkip.setUpAfterMission, 4, 'set_up_skip_after_mission ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 09E0=5,trip_skip %1d% %2d% %3d% angle %4d% when_in_car %5d%
Opcode.register(0x09e0, SanAndreasOpcodeSkip.setUpForSpecificVehicle, 5, 'set_up_skip_for_specific_vehicle ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0A35=5,trip_skip %1d% %2d% %3d% angle %4d% when_in_car %5d% finished_by_script
Opcode.register(0x0a35, SanAndreasOpcodeSkip.setUpForVehicleFinishedByScript, 5, 'set_up_skip_for_vehicle_finished_by_script ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0A36=0,  trip_skip_finished_by_script_is_ready_to_fade_in
Opcode.register(0x0a36, SanAndreasOpcodeSkip.isWaitingForScriptToFadeIn, 0, 'is_skip_waiting_for_script_to_fade_in', {})
