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


Opcode.register(0x07d0, SanAndreasOpcodeClock.getCurrentDayOfWeek, '[var day: int] = get_current_day_of_week')
Opcode.register(0x0835, SanAndreasOpcodeClock.getCurrentDate, '[var day: int], [var month: int] = get_current_date')
Opcode.register(0x088e, SanAndreasOpcodeClock.setTimeOneDayForward, 'set_time_one_day_forward')
Opcode.register(0x0d2d, SanAndreasOpcodeClock.getLocalTime, '[var year: int], [var month: int], [var weekDay: int], [var day: int], [var hour: int], [var minute: int], [var second: int], [var millisecond: int] = get_local_time')
Opcode.register(0x0e40, SanAndreasOpcodeClock.getCurrentHour, '[var hour: int] = get_current_hour')
Opcode.register(0x0e41, SanAndreasOpcodeClock.getCurrentMinute, '[var minute: int] = get_current_minute')
Opcode.register(0x0ebb, SanAndreasOpcodeClock.passTime, 'pass_time {minutes} [int]')
