SharedOpcodeClock = {}
SharedOpcodeClock.__index = SharedOpcodeClock

-- Opcode: 0x00BF
-- Instruction: [var hours: int], [var minutes: int] = get_time_of_day
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00BF
function SharedOpcodeClock.getTimeOfDay(_, _)
    local hours, minutes = Game.getTime()

    Script.storeValueAtIndex(1, hours)
    Script.storeValueAtIndex(2, minutes)
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


Opcode.register(0x00bf, SharedOpcodeClock.getTimeOfDay, '[var hours: int], [var minutes: int] = get_time_of_day')
Opcode.register(0x00c0, SharedOpcodeClock.setTimeOfDay, 'set_time_of_day {hours} [int] {minutes} [int]')
Opcode.register(0x00c1, SharedOpcodeClock.getMinutesToTimeOfDay, '[var minutesLeft: int] = get_minutes_to_time_of_day {hours} [int] {minutes} [int]')
Opcode.register(0x015d, SharedOpcodeClock.setTimeScale, 'set_time_scale {scale} [float]')
Opcode.register(0x01bd, SharedOpcodeClock.getGameTimer, '[var time: int] = get_game_timer')
Opcode.register(0x0253, SharedOpcodeClock.store, 'store_clock')
Opcode.register(0x0254, SharedOpcodeClock.restore, 'restore_clock')
