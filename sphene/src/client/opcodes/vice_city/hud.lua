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


-- INI: 0150=2,set_status_text %1d% type %2d%  ;; never used in VC or GTA 3
Opcode.register(0x0150, ViceCityOpcodeHud.displayCounter, 2, 'display_onscreen_counter ${1} ${2}', {false, false})
-- INI: 044d=1,load_splash %1d%
Opcode.register(0x044d, ViceCityOpcodeHud.loadSplash, 1, 'load_splash_screen ${1}', {false})
-- INI: 057b=0,  wanted_level_suspended
Opcode.register(0x057b, ViceCityOpcodeHud.areWantedStarsFlashing, 0, 'wanted_stars_are_flashing', {})
