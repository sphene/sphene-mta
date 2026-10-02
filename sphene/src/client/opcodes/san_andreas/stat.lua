SanAndreasOpcodeStat = {}
SanAndreasOpcodeStat.__index = SanAndreasOpcodeStat

-- Opcode: 0x0623
-- Instruction: increment_int_stat {id} [StatId] {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0623
function SanAndreasOpcodeStat.incrementInt(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0624
-- Instruction: increment_float_stat {id} [StatId] {value} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0624
function SanAndreasOpcodeStat.incrementFloat(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0625
-- Instruction: decrement_int_stat {id} [StatId] {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0625
function SanAndreasOpcodeStat.decrementInt(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0626
-- Instruction: decrement_float_stat {id} [StatId] {value} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0626
function SanAndreasOpcodeStat.decrementFloat(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0627
-- Instruction: register_int_stat {id} [StatId] {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0627
function SanAndreasOpcodeStat.registerInt(stat, value)
    Game.setStat(stat, value)
end

-- Opcode: 0x0628
-- Instruction: register_float_stat {id} [StatId] {value} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0628
function SanAndreasOpcodeStat.registerFloat(stat, value)
    Game.setStat(stat, value)
end

-- Opcode: 0x0629
-- Instruction: set_int_stat {id} [StatId] {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0629
function SanAndreasOpcodeStat.setInt(stat, value)
    Game.setStat(stat, value)
end

-- Opcode: 0x062A
-- Instruction: set_float_stat {id} [StatId] {value} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/062A
function SanAndreasOpcodeStat.setFloat(stat, value)
    Game.setStat(stat, value)
end

-- Opcode: 0x0652
-- Instruction: [var value: int] = get_int_stat {id} [StatId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0652
function SanAndreasOpcodeStat.getInt(stat, _)
    return Game.getStat(stat)
end

-- Opcode: 0x0653
-- Instruction: [var value: float] = get_float_stat {id} [StatId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0653
function SanAndreasOpcodeStat.getFloat(stat, _)
    return Game.getStat(stat)
end

-- Opcode: 0x08E1
-- Instruction: [var numTags: int] = find_number_tags_tagged
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08E1
function SanAndreasOpcodeStat.findNumberTagsTagged(_)
    return Game.getStat(138)
end

-- Opcode: 0x08E2
-- Instruction: [var percentage: int] = get_territory_under_control_percentage
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08E2
function SanAndreasOpcodeStat.getTerritoryUnderControlPercentage(_)
    return 0
end

-- Opcode: 0x08F8
-- Instruction: show_update_stats {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08F8
function SanAndreasOpcodeStat.showUpdateStats(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0997
-- Instruction: set_mission_respect_total {totalRespect} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0997
function SanAndreasOpcodeStat.setMissionRespectTotal(totalRespectPoints)
    Game.setTotalRespectPoints(totalRespectPoints)
end

-- Opcode: 0x0998
-- Instruction: award_player_mission_respect {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0998
function SanAndreasOpcodeStat.awardPlayerMissionRespect(respect)
    Game.setTotalRespectPoints(Game.getTotalRespectPoints() + respect)
end

-- Opcode: 0x0A10
-- Instruction: increment_int_stat_no_message {id} [StatId] {value} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A10
function SanAndreasOpcodeStat.incrementIntNoMessage(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A1F
-- Instruction: increment_float_stat_no_message {id} [StatId] {value} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A1F
function SanAndreasOpcodeStat.incrementFloatNoMessage(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0623=2,add %2d% to_integer_stat %1d%
Opcode.register(0x0623, SanAndreasOpcodeStat.incrementInt, 2, 'increment_int_stat ${1} ${2}', {false, false})
-- INI: 0624=2,add %2d% to_float_stat %1d%
Opcode.register(0x0624, SanAndreasOpcodeStat.incrementFloat, 2, 'increment_float_stat ${1} ${2}', {false, false})
-- INI: 0625=2,decrease_integer_stat %1d% by %2d%
Opcode.register(0x0625, SanAndreasOpcodeStat.decrementInt, 2, 'decrement_int_stat ${1} ${2}', {false, false})
-- INI: 0626=2,decrease_float_stat %1d% by %2d%
Opcode.register(0x0626, SanAndreasOpcodeStat.decrementFloat, 2, 'decrement_float_stat ${1} ${2}', {false, false})
-- INI: 0627=2,update_integer_stat %1d% to %2d%
Opcode.register(0x0627, SanAndreasOpcodeStat.registerInt, 2, 'register_int_stat ${1} ${2}', {false, false})
-- INI: 0628=2,update_float_stat_to %2d% stat_id %1h%
Opcode.register(0x0628, SanAndreasOpcodeStat.registerFloat, 2, 'register_float_stat ${1} ${2}', {false, true})
-- INI: 0629=2,change_integer_stat %1d% to %2h%
Opcode.register(0x0629, SanAndreasOpcodeStat.setInt, 2, 'set_int_stat ${1} ${2}', {false, false})
-- INI: 062A=2,change_float_stat %1d% to %2d%
Opcode.register(0x062a, SanAndreasOpcodeStat.setFloat, 2, 'set_float_stat ${1} ${2}', {false, false})
-- INI: 0652=2,%2d% = integer_stat %1d%
Opcode.register(0x0652, SanAndreasOpcodeStat.getInt, 2, '${2} = get_int_stat ${1}', {false, true})
-- INI: 0653=2,%2d% = float_stat %1d%
Opcode.register(0x0653, SanAndreasOpcodeStat.getFloat, 2, '${2} = get_float_stat ${1}', {false, true})
-- INI: 08E1=1,%1d% = total_tags_sprayed
Opcode.register(0x08e1, SanAndreasOpcodeStat.findNumberTagsTagged, 1, '${1} = find_number_tags_tagged', {true})
-- INI: 08E2=1,%1d% = territories_controlled_percentage
Opcode.register(0x08e2, SanAndreasOpcodeStat.getTerritoryUnderControlPercentage, 1, '${1} = get_territory_under_control_percentage', {true})
-- INI: 08F8=1,display_stat_update_box %1h%
Opcode.register(0x08f8, SanAndreasOpcodeStat.showUpdateStats, 1, 'show_update_stats ${1}', {false})
-- INI: 0997=1,set_total_respect_points_to %1d%
Opcode.register(0x0997, SanAndreasOpcodeStat.setMissionRespectTotal, 1, 'set_mission_respect_total ${1}', {true})
-- INI: 0998=1,add_respect %1h%
Opcode.register(0x0998, SanAndreasOpcodeStat.awardPlayerMissionRespect, 1, 'award_player_mission_respect ${1}', {false})
-- INI: 0A10=2,increase_integer_stat %1d% by %2h%
Opcode.register(0x0a10, SanAndreasOpcodeStat.incrementIntNoMessage, 2, 'increment_int_stat_no_message ${1} ${2}', {false, false})
-- INI: 0A1F=2,increase_float_stat %1h% by %2d%
Opcode.register(0x0a1f, SanAndreasOpcodeStat.incrementFloatNoMessage, 2, 'increment_float_stat_no_message ${1} ${2}', {false, false})
