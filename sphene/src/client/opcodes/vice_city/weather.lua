ViceCityOpcodeWeather = {}
ViceCityOpcodeWeather.__index = ViceCityOpcodeWeather

-- Opcode: 0x0607
-- Instruction: release_path_nodes
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0607
function ViceCityOpcodeWeather.getCurrent()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x057C
-- Instruction: set_allow_hurricanes {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/057C
function ViceCityOpcodeWeather.setAllowHurricanes(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0607=1, %1d% = get_current_weather
Opcode.register(0x0607, ViceCityOpcodeWeather.getCurrent, 0, 'release_path_nodes', {})
-- INI: 057c=1,set_allow_hurricanes %1h%
Opcode.register(0x057c, ViceCityOpcodeWeather.setAllowHurricanes, 1, 'set_allow_hurricanes ${1}', {false})
