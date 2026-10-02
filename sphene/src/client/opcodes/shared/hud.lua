SharedOpcodeHud = {}
SharedOpcodeHud.__index = SharedOpcodeHud

-- Opcode: 0x014E
-- Instruction: display_onscreen_timer {var_timer} [global var int] {direction} [TimerDirection]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/014E
function SharedOpcodeHud.displayTimer(_, type)
    Text.setTimerText("", type, Thread.currentThread:getLastOpcode().params[1])
end

-- Opcode: 0x014F
-- Instruction: clear_onscreen_timer {var_timer} [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/014F
function SharedOpcodeHud.clearTimer(timer)
    Text.removeTimerText(Thread.currentThread:getLastOpcode().params[1])
end

-- Opcode: 0x0151
-- Instruction: clear_onscreen_counter {var_counter} [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0151
function SharedOpcodeHud.clearCounter(_)
    Text.removeStatusText(Thread.currentThread:getLastOpcode().params[1])
end

-- Opcode: 0x02A3
-- Instruction: switch_widescreen {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02A3
function SharedOpcodeHud.switchWidescreen(widescreen)
    Script.setOpcodePartiallyImplemented()

    if (widescreen == 1) then
        showPlayerHudComponent("all", false)
    else
        showPlayerHudComponent("all", true)
    end

    return true
end

-- Opcode: 0x038D
-- Instruction: draw_sprite {memorySlot} [int] {offsetLeft} [float] {offsetTop} [float] {width} [float] {height} [float] {r} [int] {g} [int] {b} [int] {a} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/038D
function SharedOpcodeHud.drawSprite(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x038E
-- Instruction: draw_rect {x} [float] {y} [float] {width} [float] {height} [float] {r} [int] {g} [int] {b} [int] {a} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/038E
function SharedOpcodeHud.drawRect(x, y, width, height, r, g, b, a)
    TextDraw.drawRectangle(x, y, width, height, r, g, b, a)
end

-- Opcode: 0x0396
-- Instruction: freeze_onscreen_timer {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0396
function SharedOpcodeHud.freezeTimer(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03C3
-- Instruction: display_onscreen_timer_with_string {var_timer} [global var int] {direction} [TimerDirection] {text} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03C3
function SharedOpcodeHud.displayTimerWithString(_, type, label)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label), true)
    Text.setTimerText(text, type, Thread.currentThread:getLastOpcode().params[1])
end

-- Opcode: 0x03C4
-- Instruction: display_onscreen_counter_with_string {var_counter} [global var int] {display} [CounterDisplay] {text} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03C4
function SharedOpcodeHud.displayCounterWithString(_, type, label)
    local text = Text.getFormattedTextFromHash(CRC32.getKey(label), true)
    Text.setStatusText(text, type, Thread.currentThread:getLastOpcode().params[1])
end

-- Opcode: 0x03E3
-- Instruction: set_sprites_draw_before_fade {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03E3
function SharedOpcodeHud.setSpritesDrawBeforeFade(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03E7
-- Instruction: flash_hud_object {object} [HudObject]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03E7
function SharedOpcodeHud.flashObject(component)
    Hud.flash(component)
end

-- Opcode: 0x04F7
-- Instruction: display_nth_onscreen_counter_with_string {var_counter} [global var int] {display} [CounterDisplay] {slot} [int] {text} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04F7
function SharedOpcodeHud.displayNthCounterWithString(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0581
-- Instruction: display_radar {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0581
function SharedOpcodeHud.displayRadar(toggle)
    if (toggle == 1) then
        showPlayerHudComponent("radar", true)
    else
        showPlayerHudComponent("radar", false)
    end

    return
end


-- INI: 014e=2,start_timer_at %1d% count_in_direction %2h%
Opcode.register(0x014e, SharedOpcodeHud.displayTimer, 2, 'display_onscreen_timer ${1} ${2}', {false, true})
-- INI: 014f=1,stop_timer %1d%
Opcode.register(0x014f, SharedOpcodeHud.clearTimer, 1, 'clear_onscreen_timer ${1}', {false})
-- INI: 0151=1,remove_status_text %1d%
Opcode.register(0x0151, SharedOpcodeHud.clearCounter, 1, 'clear_onscreen_counter ${1}', {false})
-- INI: 02a3=1,enable_widescreen %1d%
Opcode.register(0x02a3, SharedOpcodeHud.switchWidescreen, 1, 'switch_widescreen ${1}', {false})
-- INI: 038d=9,draw_texture %1h% position %2d% %3d% size %4d% %5d% RGBA %6d% %7d% %8d% %9d%  ;; never used in VC or GTA 3
Opcode.register(0x038d, SharedOpcodeHud.drawSprite, 9, 'draw_sprite ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 038e=8,draw_box_position %1d% %2d% size %3d% %4d% RGBA %5h% %6h% %7h% %8d%  ;; never used in VC or GTA 3
Opcode.register(0x038e, SharedOpcodeHud.drawRect, 8, 'draw_rect ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0396=1,pause_timer %1d%
Opcode.register(0x0396, SharedOpcodeHud.freezeTimer, 1, 'freeze_onscreen_timer ${1}', {false})
-- INI: 03c3=3,set_timer_with_text_to %1d% type %2h% text %3g%
Opcode.register(0x03c3, SharedOpcodeHud.displayTimerWithString, 3, 'display_onscreen_timer_with_string ${1} ${2} ${3}', {true, false, false})
-- INI: 03c4=3,set_status_text_to %1d% %2b:bar/number% %3g%
Opcode.register(0x03c4, SharedOpcodeHud.displayCounterWithString, 3, 'display_onscreen_counter_with_string ${1} ${2} ${3}', {true, false, false})
-- INI: 03e3=1,set_sprites_draw_before_fade %1d%
Opcode.register(0x03e3, SharedOpcodeHud.setSpritesDrawBeforeFade, 1, 'set_sprites_draw_before_fade ${1}', {false})
-- INI: 03e7=1,flash_hud %1d%
Opcode.register(0x03e7, SharedOpcodeHud.flashObject, 1, 'flash_hud_object ${1}', {false})
-- INI: 04f7=4,status_text %1d% %2h% line %3h% %4g%
Opcode.register(0x04f7, SharedOpcodeHud.displayNthCounterWithString, 4, 'display_nth_onscreen_counter_with_string ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0581=1,enable_radar %1d%
Opcode.register(0x0581, SharedOpcodeHud.displayRadar, 1, 'display_radar ${1}', {false})
