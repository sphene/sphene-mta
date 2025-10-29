ViceCityOpcodeHud = {}
ViceCityOpcodeHud.__index = ViceCityOpcodeHud

-- Opcode: 0x0150
-- Instruction: display_onscreen_counter {var_counter} [global var int] {display} [CounterDisplay]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0150
function ViceCityOpcodeHud.displayCounter()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x044D
-- Instruction: load_splash_screen {txdName} [string]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/044D
function ViceCityOpcodeHud.loadSplash(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x057B
-- Instruction: wanted_stars_are_flashing
-- https://library.sannybuilder.com/#/vc/script/extensions/default/057B
function ViceCityOpcodeHud.areWantedStarsFlashing()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0150, ViceCityOpcodeHud.displayCounter, 'display_onscreen_counter {var_counter} [global var int] {display} [CounterDisplay]')
Opcode.register(0x044d, ViceCityOpcodeHud.loadSplash, 'load_splash_screen {txdName} [string]')
Opcode.register(0x057b, ViceCityOpcodeHud.areWantedStarsFlashing, 'wanted_stars_are_flashing')
