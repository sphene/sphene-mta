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


Opcode.register(0x0950, SanAndreasOpcodeSkip.setUp, 'set_up_skip {x} [float] {y} [float] {z} [float] {heading} [float]')
Opcode.register(0x0951, SanAndreasOpcodeSkip.clear, 'clear_skip')
Opcode.register(0x09af, SanAndreasOpcodeSkip.setUpAfterMission, 'set_up_skip_after_mission {x} [float] {y} [float] {z} [float] {heading} [float]')
Opcode.register(0x09e0, SanAndreasOpcodeSkip.setUpForSpecificVehicle, 'set_up_skip_for_specific_vehicle {x} [float] {y} [float] {z} [float] {heading} [float] {handle} [Car]')
Opcode.register(0x0a35, SanAndreasOpcodeSkip.setUpForVehicleFinishedByScript, 'set_up_skip_for_vehicle_finished_by_script {x} [float] {y} [float] {z} [float] {heading} [float] {vehicle} [Car]')
Opcode.register(0x0a36, SanAndreasOpcodeSkip.isWaitingForScriptToFadeIn, 'is_skip_waiting_for_script_to_fade_in')
