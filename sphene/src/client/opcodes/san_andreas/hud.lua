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


-- INI: 059c=0,NOP
Opcode.register(0x059c, SanAndreasOpcodeHud.setCounterFlashWhenFirstDisplayed, 2, 'set_onscreen_counter_flash_when_first_displayed ${1} ${2}', {false, false})
-- INI: 074B=10,draw_texture %1h% position %2d% %3d% scale %4d% %5d% angle %6d% color_RGBA %7d% %8d% %9d% %10d%
Opcode.register(0x074b, SanAndreasOpcodeHud.drawSpriteWithRotation, 10, 'draw_sprite_with_rotation ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10}', {false, false, false, false, false, false, false, false, false, false})
-- INI: 075B=1,zoom_radar %1h%
Opcode.register(0x075b, SanAndreasOpcodeHud.setRadarZoom, 1, 'set_radar_zoom ${1}', {false})
-- INI: 0826=1,enable_hud %1h%
Opcode.register(0x0826, SanAndreasOpcodeHud.display, 1, 'display_hud ${1}', {false})
-- INI: 0890=2,enable_sound_when_timer %1d% reach %2h% seconds ; global_variable
Opcode.register(0x0890, SanAndreasOpcodeHud.setTimerBeepCountdownTime, 2, 'set_timer_beep_countdown_time ${1} ${2}', {false, false})
-- INI: 0904=5,get_interface %1h% color_RGBA_to %2d% %3d% %4d% %5d%
Opcode.register(0x0904, SanAndreasOpcodeHud.getColor, 5, '${2}, ${3}, ${4}, ${5} = get_hud_colour ${1}', {false, true, true, true, true})
-- INI: 0937=6,text_draw_box_cornerA %1d% %2d% cornerB %3d% %4d% GXT_reference %5g% style %6h%
Opcode.register(0x0937, SanAndreasOpcodeHud.drawWindow, 6, 'draw_window ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 09A3=1,show_siterocket_on_bumper_camera %1h%
Opcode.register(0x09a3, SanAndreasOpcodeHud.drawCrosshair, 1, 'draw_crosshair ${1}', {false})
-- INI: 09B9=1,show_entered_car_name %1h%
Opcode.register(0x09b9, SanAndreasOpcodeHud.displayCarNames, 1, 'display_car_names ${1}', {false})
-- INI: 09BA=1,show_entered_zone_name %1h%
Opcode.register(0x09ba, SanAndreasOpcodeHud.displayZoneNames, 1, 'display_zone_names ${1}', {false})
-- INI: 09EE=1,set_status_text_stay_on_screen %1h%
Opcode.register(0x09ee, SanAndreasOpcodeHud.forceBigMessageAndCounter, 1, 'force_big_message_and_counter ${1}', {false})
-- INI: 0E0F=4,get_fixed_xy_aspect_ratio %1d% %2d% to %3d% %4d%
Opcode.register(0x0e0f, SanAndreasOpcodeHud.getFixedXyAspectRatio, 4, '${3}, ${4} = get_fixed_xy_aspect_ratio ${1} ${2}', {false, false, true, true})
-- INI: 0E4E=2,display_onscreen_timer_local %1d% direction %2d%
Opcode.register(0x0e4e, SanAndreasOpcodeHud.displayTimerLocal, 2, 'display_onscreen_timer_local ${1} ${2}', {false, false})
-- INI: 0E4F=3,display_onscreen_timer_with_string_local %1d% direction %2d% GXT %3d%
Opcode.register(0x0e4f, SanAndreasOpcodeHud.displayTimerWithStringLocal, 3, 'display_onscreen_timer_with_string_local ${1} ${2} ${3}', {false, false, false})
-- INI: 0E50=2,display_onscreen_counter_local %1d% direction %2d%
Opcode.register(0x0e50, SanAndreasOpcodeHud.displayCounterLocal, 2, 'display_onscreen_counter_local ${1} ${2}', {false, false})
-- INI: 0E51=3,display_onscreen_counter_with_string_local %1d% direction %2d% GXT %3d%
Opcode.register(0x0e51, SanAndreasOpcodeHud.displayCounterWithStringLocal, 3, 'display_onscreen_counter_with_string_local ${1} ${2} ${3}', {false, false, false})
-- INI: 0E52=2,display_two_onscreen_counters_local %1d% max_value %2d%
Opcode.register(0x0e52, SanAndreasOpcodeHud.displayTwoCountersLocal, 2, 'display_two_onscreen_counters_local ${1} ${2}', {false, false})
-- INI: 0E53=3,display_two_onscreen_counters_with_string_local %1d% max_value %2d% GXT %3d%
Opcode.register(0x0e53, SanAndreasOpcodeHud.displayTwoCountersWithStringLocal, 3, 'display_two_onscreen_counters_with_string_local ${1} ${2} ${3}', {false, false, false})
-- INI: 0E54=1,clear_onscreen_timer_local %1d%
Opcode.register(0x0e54, SanAndreasOpcodeHud.clearTimerLocal, 1, 'clear_onscreen_timer_local ${1}', {false})
-- INI: 0E55=1,clear_onscreen_counter_local %1d%
Opcode.register(0x0e55, SanAndreasOpcodeHud.clearCounterLocal, 1, 'clear_onscreen_counter_local ${1}', {false})
-- INI: 0E56=2,set_onscreen_counter_flash_when_first_displayed_local %1d% flash %2d%
Opcode.register(0x0e56, SanAndreasOpcodeHud.setCounterFlashWhenFirstDisplayedLocal, 2, 'set_onscreen_counter_flash_when_first_displayed_local ${1} ${2}', {false, false})
-- INI: 0E57=2,set_timer_beep_countdown_time_local %1d% secs %2d%
Opcode.register(0x0e57, SanAndreasOpcodeHud.setTimerBeepCountdownTimeLocal, 2, 'set_timer_beep_countdown_time_local ${1} ${2}', {false, false})
-- INI: 0E58=2,set_onscreen_counter_colour_local %1d% color %2d%
Opcode.register(0x0e58, SanAndreasOpcodeHud.setCounterColorLocal, 2, 'set_onscreen_counter_colour_local ${1} ${2}', {false, false})
-- INI: 0EB8=0,is_radar_visible
Opcode.register(0x0eb8, SanAndreasOpcodeHud.isRadarVisible, 0, 'is_radar_visible', {})
-- INI: 0EB9=0,is_hud_visible
Opcode.register(0x0eb9, SanAndreasOpcodeHud.isVisible, 0, 'is_hud_visible', {})
