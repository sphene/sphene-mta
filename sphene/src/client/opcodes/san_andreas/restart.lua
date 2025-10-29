SanAndreasOpcodeRestart = {}
SanAndreasOpcodeRestart.__index = SanAndreasOpcodeRestart

-- Opcode: 0x08DF
-- Instruction: set_extra_hospital_restart_point {x} [float] {y} [float] {z} [float] {radius} [float] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08DF
function SanAndreasOpcodeRestart.setExtraHospitalRestartPoint(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08E0
-- Instruction: set_extra_police_station_restart_point {x} [float] {y} [float] {z} [float] {radius} [float] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08E0
function SanAndreasOpcodeRestart.setExtraPoliceStationRestartPoint(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09FF
-- Instruction: set_respawn_point_for_duration_of_mission {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09FF
function SanAndreasOpcodeRestart.setRespawnPointForDurationOfMission(_)
    return Script.setOpcodePartiallyImplemented()
end


Opcode.register(0x08df, SanAndreasOpcodeRestart.setExtraHospitalRestartPoint, 'set_extra_hospital_restart_point {x} [float] {y} [float] {z} [float] {radius} [float] {heading} [float]')
Opcode.register(0x08e0, SanAndreasOpcodeRestart.setExtraPoliceStationRestartPoint, 'set_extra_police_station_restart_point {x} [float] {y} [float] {z} [float] {radius} [float] {heading} [float]')
Opcode.register(0x09ff, SanAndreasOpcodeRestart.setRespawnPointForDurationOfMission, 'set_respawn_point_for_duration_of_mission {x} [float] {y} [float] {z} [float]')
