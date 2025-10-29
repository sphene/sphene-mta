SanAndreasOpcodeHud = {}
SanAndreasOpcodeHud.__index = SanAndreasOpcodeHud

-- Opcode: 0x059C
-- Instruction: set_onscreen_counter_flash_when_first_displayed {var_counter} [global var int] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/059C
function SanAndreasOpcodeHud.setCounterFlashWhenFirstDisplayed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x074B
-- Instruction: draw_sprite_with_rotation {memorySlot} [int] {offsetLeft} [float] {offsetTop} [float] {width} [float] {height} [float] {angle} [float] {red} [int] {green} [int] {blue} [int] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/074B
function SanAndreasOpcodeHud.drawSpriteWithRotation(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x075B
-- Instruction: set_radar_zoom {zoom} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/075B
function SanAndreasOpcodeHud.setRadarZoom(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0826
-- Instruction: display_hud {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0826
function SanAndreasOpcodeHud.display(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0890
-- Instruction: set_timer_beep_countdown_time {var_timer} [global var int] {timeInSec} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0890
function SanAndreasOpcodeHud.setTimerBeepCountdownTime(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0904
-- Instruction: [var red: int], [var green: int], [var blue: int], [var alpha: int] = get_hud_colour {hudObject} [HudObject]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0904
function SanAndreasOpcodeHud.getColor(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0937
-- Instruction: draw_window {leftTopX} [float] {leftTopY} [float] {rightBottomX} [float] {rightBottomY} [float] {header} [gxt_key] {zIndex} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0937
function SanAndreasOpcodeHud.drawWindow(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09A3
-- Instruction: draw_crosshair {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09A3
function SanAndreasOpcodeHud.drawCrosshair(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09B9
-- Instruction: display_car_names {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09B9
function SanAndreasOpcodeHud.displayCarNames(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09BA
-- Instruction: display_zone_names {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09BA
function SanAndreasOpcodeHud.displayZoneNames(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09EE
-- Instruction: force_big_message_and_counter {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09EE
function SanAndreasOpcodeHud.forceBigMessageAndCounter(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E0F
-- Instruction: [var x: float], [var y: float] = get_fixed_xy_aspect_ratio {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E0F
function SanAndreasOpcodeHud.getFixedXyAspectRatio(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E4E
-- Instruction: display_onscreen_timer_local {var_timer} [var int] {direction} [TimerDirection]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E4E
function SanAndreasOpcodeHud.displayTimerLocal(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E4F
-- Instruction: display_onscreen_timer_with_string_local {var_timer} [var int] {direction} [TimerDirection] {text} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E4F
function SanAndreasOpcodeHud.displayTimerWithStringLocal(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E50
-- Instruction: display_onscreen_counter_local {var_timer} [var int] {display} [CounterDisplay]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E50
function SanAndreasOpcodeHud.displayCounterLocal(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E51
-- Instruction: display_onscreen_counter_with_string_local {var_counter} [var int] {display} [CounterDisplay] {text} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E51
function SanAndreasOpcodeHud.displayCounterWithStringLocal(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E52
-- Instruction: display_two_onscreen_counters_local {var_leftCounter} [var int] {var_rightCounter} [var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E52
function SanAndreasOpcodeHud.displayTwoCountersLocal(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E53
-- Instruction: display_two_onscreen_counters_with_string_local {var_leftCounter} [var int] {var_rightCounter} [var int] {text} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E53
function SanAndreasOpcodeHud.displayTwoCountersWithStringLocal(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E54
-- Instruction: clear_onscreen_timer_local {var_timer} [var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E54
function SanAndreasOpcodeHud.clearTimerLocal(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E55
-- Instruction: clear_onscreen_counter_local {var_counter} [var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E55
function SanAndreasOpcodeHud.clearCounterLocal(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E56
-- Instruction: set_onscreen_counter_flash_when_first_displayed_local {var_counter} [var int] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E56
function SanAndreasOpcodeHud.setCounterFlashWhenFirstDisplayedLocal(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E57
-- Instruction: set_timer_beep_countdown_time_local {var_timer} [var int] {timeInSec} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E57
function SanAndreasOpcodeHud.setTimerBeepCountdownTimeLocal(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E58
-- Instruction: set_onscreen_counter_colour_local {var_counter} [var int] {color} [HudColors]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E58
function SanAndreasOpcodeHud.setCounterColorLocal(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EB8
-- Instruction: is_radar_visible
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EB8
function SanAndreasOpcodeHud.isRadarVisible()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EB9
-- Instruction: is_hud_visible
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EB9
function SanAndreasOpcodeHud.isVisible()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x059c, SanAndreasOpcodeHud.setCounterFlashWhenFirstDisplayed, 'set_onscreen_counter_flash_when_first_displayed {var_counter} [global var int] {state} [bool]')
Opcode.register(0x074b, SanAndreasOpcodeHud.drawSpriteWithRotation, 'draw_sprite_with_rotation {memorySlot} [int] {offsetLeft} [float] {offsetTop} [float] {width} [float] {height} [float] {angle} [float] {red} [int] {green} [int] {blue} [int] {alpha} [int]')
Opcode.register(0x075b, SanAndreasOpcodeHud.setRadarZoom, 'set_radar_zoom {zoom} [int]')
Opcode.register(0x0826, SanAndreasOpcodeHud.display, 'display_hud {state} [bool]')
Opcode.register(0x0890, SanAndreasOpcodeHud.setTimerBeepCountdownTime, 'set_timer_beep_countdown_time {var_timer} [global var int] {timeInSec} [int]')
Opcode.register(0x0904, SanAndreasOpcodeHud.getColor, '[var red: int], [var green: int], [var blue: int], [var alpha: int] = get_hud_colour {hudObject} [HudObject]')
Opcode.register(0x0937, SanAndreasOpcodeHud.drawWindow, 'draw_window {leftTopX} [float] {leftTopY} [float] {rightBottomX} [float] {rightBottomY} [float] {header} [gxt_key] {zIndex} [int]')
Opcode.register(0x09a3, SanAndreasOpcodeHud.drawCrosshair, 'draw_crosshair {state} [bool]')
Opcode.register(0x09b9, SanAndreasOpcodeHud.displayCarNames, 'display_car_names {state} [bool]')
Opcode.register(0x09ba, SanAndreasOpcodeHud.displayZoneNames, 'display_zone_names {state} [bool]')
Opcode.register(0x09ee, SanAndreasOpcodeHud.forceBigMessageAndCounter, 'force_big_message_and_counter {state} [bool]')
Opcode.register(0x0e0f, SanAndreasOpcodeHud.getFixedXyAspectRatio, '[var x: float], [var y: float] = get_fixed_xy_aspect_ratio {x} [float] {y} [float]')
Opcode.register(0x0e4e, SanAndreasOpcodeHud.displayTimerLocal, 'display_onscreen_timer_local {var_timer} [var int] {direction} [TimerDirection]')
Opcode.register(0x0e4f, SanAndreasOpcodeHud.displayTimerWithStringLocal, 'display_onscreen_timer_with_string_local {var_timer} [var int] {direction} [TimerDirection] {text} [gxt_key]')
Opcode.register(0x0e50, SanAndreasOpcodeHud.displayCounterLocal, 'display_onscreen_counter_local {var_timer} [var int] {display} [CounterDisplay]')
Opcode.register(0x0e51, SanAndreasOpcodeHud.displayCounterWithStringLocal, 'display_onscreen_counter_with_string_local {var_counter} [var int] {display} [CounterDisplay] {text} [gxt_key]')
Opcode.register(0x0e52, SanAndreasOpcodeHud.displayTwoCountersLocal, 'display_two_onscreen_counters_local {var_leftCounter} [var int] {var_rightCounter} [var int]')
Opcode.register(0x0e53, SanAndreasOpcodeHud.displayTwoCountersWithStringLocal, 'display_two_onscreen_counters_with_string_local {var_leftCounter} [var int] {var_rightCounter} [var int] {text} [gxt_key]')
Opcode.register(0x0e54, SanAndreasOpcodeHud.clearTimerLocal, 'clear_onscreen_timer_local {var_timer} [var int]')
Opcode.register(0x0e55, SanAndreasOpcodeHud.clearCounterLocal, 'clear_onscreen_counter_local {var_counter} [var int]')
Opcode.register(0x0e56, SanAndreasOpcodeHud.setCounterFlashWhenFirstDisplayedLocal, 'set_onscreen_counter_flash_when_first_displayed_local {var_counter} [var int] {state} [bool]')
Opcode.register(0x0e57, SanAndreasOpcodeHud.setTimerBeepCountdownTimeLocal, 'set_timer_beep_countdown_time_local {var_timer} [var int] {timeInSec} [int]')
Opcode.register(0x0e58, SanAndreasOpcodeHud.setCounterColorLocal, 'set_onscreen_counter_colour_local {var_counter} [var int] {color} [HudColors]')
Opcode.register(0x0eb8, SanAndreasOpcodeHud.isRadarVisible, 'is_radar_visible')
Opcode.register(0x0eb9, SanAndreasOpcodeHud.isVisible, 'is_hud_visible')
