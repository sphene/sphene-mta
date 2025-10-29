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


Opcode.register(0x030c, SharedOpcodeStat.playerMadeProgress, 'player_made_progress {progress} [int]')
Opcode.register(0x030d, SharedOpcodeStat.setProgressTotal, 'set_progress_total {maxProgress} [int]')
Opcode.register(0x0317, SharedOpcodeStat.registerMissionGiven, 'register_mission_given')
Opcode.register(0x0318, SharedOpcodeStat.registerMissionPassed, 'register_mission_passed {key} [gxt_key]')
Opcode.register(0x042c, SharedOpcodeStat.setTotalNumberOfMissions, 'set_total_number_of_missions {numMissions} [int]')
Opcode.register(0x042e, SharedOpcodeStat.registerFastestTime, 'register_fastest_time {id} [StatId] {value} [int]')
Opcode.register(0x0582, SharedOpcodeStat.registerBestPosition, 'register_best_position {id} [StatId] {position} [int]')
Opcode.register(0x058c, SharedOpcodeStat.getProgressPercentage, '[var percentage: float] = get_progress_percentage')
Opcode.register(0x0595, SharedOpcodeStat.registerOddjobMissionPassed, 'register_oddjob_mission_passed')
