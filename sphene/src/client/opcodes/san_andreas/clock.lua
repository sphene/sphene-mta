SanAndreasOpcodeClock = {}
SanAndreasOpcodeClock.__index = SanAndreasOpcodeClock

-- Opcode: 0x07D0
-- Instruction: [var day: int] = get_current_day_of_week
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07D0
function SanAndreasOpcodeClock.getCurrentDayOfWeek(_)
    Script.setOpcodePartiallyImplemented()
    return 1
end

-- Opcode: 0x0835
-- Instruction: [var day: int], [var month: int] = get_current_date
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0835
function SanAndreasOpcodeClock.getCurrentDate(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x088E
-- Instruction: set_time_one_day_forward
-- https://library.sannybuilder.com/#/sa/script/extensions/default/088E
function SanAndreasOpcodeClock.setTimeOneDayForward()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D2D
-- Instruction: [var year: int], [var month: int], [var weekDay: int], [var day: int], [var hour: int], [var minute: int], [var second: int], [var millisecond: int] = get_local_time
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D2D
function SanAndreasOpcodeClock.getLocalTime(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E40
-- Instruction: [var hour: int] = get_current_hour
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E40
function SanAndreasOpcodeClock.getCurrentHour(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E41
-- Instruction: [var minute: int] = get_current_minute
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E41
function SanAndreasOpcodeClock.getCurrentMinute(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EBB
-- Instruction: pass_time {minutes} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EBB
function SanAndreasOpcodeClock.passTime(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 07D0=1,%1d% = weekday
Opcode.register(0x07d0, SanAndreasOpcodeClock.getCurrentDayOfWeek, 1, '${1} = get_current_day_of_week', {true})
-- INI: 0835=2,get_month_day_to %1d% get_month_to %2d%
Opcode.register(0x0835, SanAndreasOpcodeClock.getCurrentDate, 2, '${1}, ${2} = get_current_date', {true, true})
-- INI: 088E=0,set_next_day
Opcode.register(0x088e, SanAndreasOpcodeClock.setTimeOneDayForward, 0, 'set_time_one_day_forward', {})
-- INI: 0D2D=8,get_local_time_year_to %1d% month_to %2d% day_of_week_to %3d% day_to %4d% hour_to %5d% minute_to %6d% second_to %7d% milliseconds_to %8d%
Opcode.register(0x0d2d, SanAndreasOpcodeClock.getLocalTime, 8, '${1}, ${2}, ${3}, ${4}, ${5}, ${6}, ${7}, ${8} = get_local_time', {true, true, true, true, true, true, true, true})
-- INI: 0E40=1,get_current_hour %1d%
Opcode.register(0x0e40, SanAndreasOpcodeClock.getCurrentHour, 1, '${1} = get_current_hour', {false})
-- INI: 0E41=1,get_current_minute %1d%
Opcode.register(0x0e41, SanAndreasOpcodeClock.getCurrentMinute, 1, '${1} = get_current_minute', {false})
-- INI: 0EBB=1,pass_time %1d%
Opcode.register(0x0ebb, SanAndreasOpcodeClock.passTime, 1, 'pass_time ${1}', {false})
