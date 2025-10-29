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


Opcode.register(0x0623, SanAndreasOpcodeStat.incrementInt, 'increment_int_stat {id} [StatId] {value} [int]')
Opcode.register(0x0624, SanAndreasOpcodeStat.incrementFloat, 'increment_float_stat {id} [StatId] {value} [float]')
Opcode.register(0x0625, SanAndreasOpcodeStat.decrementInt, 'decrement_int_stat {id} [StatId] {value} [int]')
Opcode.register(0x0626, SanAndreasOpcodeStat.decrementFloat, 'decrement_float_stat {id} [StatId] {value} [float]')
Opcode.register(0x0627, SanAndreasOpcodeStat.registerInt, 'register_int_stat {id} [StatId] {value} [int]')
Opcode.register(0x0628, SanAndreasOpcodeStat.registerFloat, 'register_float_stat {id} [StatId] {value} [float]')
Opcode.register(0x0629, SanAndreasOpcodeStat.setInt, 'set_int_stat {id} [StatId] {value} [int]')
Opcode.register(0x062a, SanAndreasOpcodeStat.setFloat, 'set_float_stat {id} [StatId] {value} [float]')
Opcode.register(0x0652, SanAndreasOpcodeStat.getInt, '[var value: int] = get_int_stat {id} [StatId]')
Opcode.register(0x0653, SanAndreasOpcodeStat.getFloat, '[var value: float] = get_float_stat {id} [StatId]')
Opcode.register(0x08e1, SanAndreasOpcodeStat.findNumberTagsTagged, '[var numTags: int] = find_number_tags_tagged')
Opcode.register(0x08e2, SanAndreasOpcodeStat.getTerritoryUnderControlPercentage, '[var percentage: int] = get_territory_under_control_percentage')
Opcode.register(0x08f8, SanAndreasOpcodeStat.showUpdateStats, 'show_update_stats {state} [bool]')
Opcode.register(0x0997, SanAndreasOpcodeStat.setMissionRespectTotal, 'set_mission_respect_total {totalRespect} [int]')
Opcode.register(0x0998, SanAndreasOpcodeStat.awardPlayerMissionRespect, 'award_player_mission_respect {value} [int]')
Opcode.register(0x0a10, SanAndreasOpcodeStat.incrementIntNoMessage, 'increment_int_stat_no_message {id} [StatId] {value} [int]')
Opcode.register(0x0a1f, SanAndreasOpcodeStat.incrementFloatNoMessage, 'increment_float_stat_no_message {id} [StatId] {value} [float]')
