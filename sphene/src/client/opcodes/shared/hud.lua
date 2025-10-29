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


Opcode.register(0x014e, SharedOpcodeHud.displayTimer, 'display_onscreen_timer {var_timer} [global var int] {direction} [TimerDirection]')
Opcode.register(0x014f, SharedOpcodeHud.clearTimer, 'clear_onscreen_timer {var_timer} [global var int]')
Opcode.register(0x0151, SharedOpcodeHud.clearCounter, 'clear_onscreen_counter {var_counter} [global var int]')
Opcode.register(0x02a3, SharedOpcodeHud.switchWidescreen, 'switch_widescreen {state} [bool]')
Opcode.register(0x038d, SharedOpcodeHud.drawSprite, 'draw_sprite {memorySlot} [int] {offsetLeft} [float] {offsetTop} [float] {width} [float] {height} [float] {r} [int] {g} [int] {b} [int] {a} [int]')
Opcode.register(0x038e, SharedOpcodeHud.drawRect, 'draw_rect {x} [float] {y} [float] {width} [float] {height} [float] {r} [int] {g} [int] {b} [int] {a} [int]')
Opcode.register(0x0396, SharedOpcodeHud.freezeTimer, 'freeze_onscreen_timer {state} [bool]')
Opcode.register(0x03c3, SharedOpcodeHud.displayTimerWithString, 'display_onscreen_timer_with_string {var_timer} [global var int] {direction} [TimerDirection] {text} [gxt_key]')
Opcode.register(0x03c4, SharedOpcodeHud.displayCounterWithString, 'display_onscreen_counter_with_string {var_counter} [global var int] {display} [CounterDisplay] {text} [gxt_key]')
Opcode.register(0x03e3, SharedOpcodeHud.setSpritesDrawBeforeFade, 'set_sprites_draw_before_fade {state} [bool]')
Opcode.register(0x03e7, SharedOpcodeHud.flashObject, 'flash_hud_object {object} [HudObject]')
Opcode.register(0x04f7, SharedOpcodeHud.displayNthCounterWithString, 'display_nth_onscreen_counter_with_string {var_counter} [global var int] {display} [CounterDisplay] {slot} [int] {text} [gxt_key]')
Opcode.register(0x0581, SharedOpcodeHud.displayRadar, 'display_radar {state} [bool]')
