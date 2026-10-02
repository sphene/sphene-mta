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


-- INI: 08DF=5,override_restart_if_wasted_at %1d% %2d% %3d% within_radius %4d% angle %5d%
Opcode.register(0x08df, SanAndreasOpcodeRestart.setExtraHospitalRestartPoint, 5, 'set_extra_hospital_restart_point ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 08E0=5,override_restart_if_busted_at %1d% %2d% %3d% within_radius %4d% angle %5d%
Opcode.register(0x08e0, SanAndreasOpcodeRestart.setExtraPoliceStationRestartPoint, 5, 'set_extra_police_station_restart_point ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 09FF=3,set_restart_closest_to %1d% %2d% %3d%
Opcode.register(0x09ff, SanAndreasOpcodeRestart.setRespawnPointForDurationOfMission, 3, 'set_respawn_point_for_duration_of_mission ${1} ${2} ${3}', {false, false, false})
