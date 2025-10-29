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


Opcode.register(0x0607, ViceCityOpcodeWeather.getCurrent, 'release_path_nodes')
Opcode.register(0x057c, ViceCityOpcodeWeather.setAllowHurricanes, 'set_allow_hurricanes {state} [bool]')
