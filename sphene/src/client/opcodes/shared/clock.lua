SharedOpcodeClock = {}
SharedOpcodeClock.__index = SharedOpcodeClock

-- Opcode: 0x00BF
-- Instruction: [var hours: int], [var minutes: int] = get_time_of_day
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00BF
function SharedOpcodeClock.getTimeOfDay(_, _)
    return Game.getTime()
end

-- Opcode: 0x00C0
-- Instruction: set_time_of_day {hours} [int] {minutes} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00C0
function SharedOpcodeClock.setTimeOfDay(hours, minutes)
    Game.setTime(hours, minutes)
end

-- Opcode: 0x00C1
-- Instruction: [var minutesLeft: int] = get_minutes_to_time_of_day {hours} [int] {minutes} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00C1
function SharedOpcodeClock.getMinutesToTimeOfDay(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x015D
-- Instruction: set_time_scale {scale} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/015D
function SharedOpcodeClock.setTimeScale(speed)
    -- Game.setSpeed(speed)
    return setGameSpeed(speed)
end

-- Opcode: 0x01BD
-- Instruction: [var time: int] = get_game_timer
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01BD
function SharedOpcodeClock.getGameTimer(_)
    return getTickCount() - Game.getStartTick()
end

-- Opcode: 0x0253
-- Instruction: store_clock
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0253
function SharedOpcodeClock.store()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0254
-- Instruction: restore_clock
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0254
function SharedOpcodeClock.restore()
   return Script.setOpcodeUnimplemented()
end


-- INI: 00bf=2,%1d% = current_time_hours, %2d% = current_time_minutes
Opcode.register(0x00bf, SharedOpcodeClock.getTimeOfDay, 2, '${1}, ${2} = get_time_of_day', {true, true})
-- INI: 00c0=2,set_current_time %1d% %2d%
Opcode.register(0x00c0, SharedOpcodeClock.setTimeOfDay, 2, 'set_time_of_day ${1} ${2}', {false, false})
-- INI: 00c1=3,%3d% = minutes_to_current_time %1d% %2d%
Opcode.register(0x00c1, SharedOpcodeClock.getMinutesToTimeOfDay, 3, '${3} = get_minutes_to_time_of_day ${1} ${2}', {false, false, true})
-- INI: 015d=1,set_gamespeed %1d%
Opcode.register(0x015d, SharedOpcodeClock.setTimeScale, 1, 'set_time_scale ${1}', {false})
-- INI: 01bd=1,%1d% = current_time_in_ms
Opcode.register(0x01bd, SharedOpcodeClock.getGameTimer, 1, '${1} = get_game_timer', {true})
-- INI: 0253=0,save_current_time
Opcode.register(0x0253, SharedOpcodeClock.store, 0, 'store_clock', {})
-- INI: 0254=0,restore_current_time
Opcode.register(0x0254, SharedOpcodeClock.restore, 0, 'restore_clock', {})
