SharedOpcodeStat = {}
SharedOpcodeStat.__index = SharedOpcodeStat

-- Opcode: 0x030C
-- Instruction: player_made_progress {progress} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/030C
function SharedOpcodeStat.playerMadeProgress(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x030D
-- Instruction: set_progress_total {maxProgress} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/030D
function SharedOpcodeStat.setProgressTotal(maxProgress)
    Game.setMaxProgress(maxProgress)
end

-- Opcode: 0x0317
-- Instruction: register_mission_given
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0317
function SharedOpcodeStat.registerMissionGiven()
    setPedStat(localPlayer, 146, getPedStat(localPlayer, 146) + 1)
    return
end

-- Opcode: 0x0318
-- Instruction: register_mission_passed {key} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0318
function SharedOpcodeStat.registerMissionPassed(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x042C
-- Instruction: set_total_number_of_missions {numMissions} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/042C
function SharedOpcodeStat.setTotalNumberOfMissions(totalMissions)
    Game.setTotalMissions(totalMissions)
end

-- Opcode: 0x042E
-- Instruction: register_fastest_time {id} [StatId] {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/042E
function SharedOpcodeStat.registerFastestTime(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0582
-- Instruction: register_best_position {id} [StatId] {position} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0582
function SharedOpcodeStat.registerBestPosition(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x058C
-- Instruction: [var percentage: float] = get_progress_percentage
-- https://library.sannybuilder.com/#/sa/script/extensions/default/058C
function SharedOpcodeStat.getProgressPercentage(_)
    return getPedStat(localPlayer, 0)
end

-- Opcode: 0x0595
-- Instruction: register_oddjob_mission_passed
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0595
function SharedOpcodeStat.registerOddjobMissionPassed()
   return Script.setOpcodeUnimplemented()
end


-- INI: 030c=1,progress_made += %1d%
Opcode.register(0x030c, SharedOpcodeStat.playerMadeProgress, 1, 'player_made_progress ${1}', {false})
-- INI: 030d=1,set_total_mission_points_to %1d%
Opcode.register(0x030d, SharedOpcodeStat.setProgressTotal, 1, 'set_progress_total ${1}', {true})
-- INI: 0317=0,increment_mission_attempts
Opcode.register(0x0317, SharedOpcodeStat.registerMissionGiven, 0, 'register_mission_given', {})
-- INI: 0318=1,set_latest_mission_passed %1g%
Opcode.register(0x0318, SharedOpcodeStat.registerMissionPassed, 1, 'register_mission_passed ${1}', {false})
-- INI: 042c=1,set_total_missions_to %1d%
Opcode.register(0x042c, SharedOpcodeStat.setTotalNumberOfMissions, 1, 'set_total_number_of_missions ${1}', {true})
-- INI: 042e=2,register_lowest_int_stat %1h% to %2d%
Opcode.register(0x042e, SharedOpcodeStat.registerFastestTime, 2, 'register_fastest_time ${1} ${2}', {false, false})
-- INI: 0582=2,register_hotring_best_result %1h% %2d%
Opcode.register(0x0582, SharedOpcodeStat.registerBestPosition, 2, 'register_best_position ${1} ${2}', {false, false})
-- INI: 058c=1,%1d% = percentage_completed
Opcode.register(0x058c, SharedOpcodeStat.getProgressPercentage, 1, '${1} = get_progress_percentage', {true})
-- INI: 0595=0,mission_complete
Opcode.register(0x0595, SharedOpcodeStat.registerOddjobMissionPassed, 0, 'register_oddjob_mission_passed', {})
