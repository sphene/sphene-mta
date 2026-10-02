SharedOpcodeWeather = {}
SharedOpcodeWeather.__index = SharedOpcodeWeather

-- Opcode: 0x01B5
-- Instruction: force_weather {type} [WeatherType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01B5
function SharedOpcodeWeather.force(weatherId)
    Script.setOpcodePartiallyImplemented()
    --Weather.set(weatherId, true)
    return setWeather(weatherId)
end

-- Opcode: 0x01B6
-- Instruction: force_weather_now {type} [WeatherType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01B6
SharedOpcodeWeather.forceNow = setWeather

-- Opcode: 0x01B7
-- Instruction: release_weather
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01B7
function SharedOpcodeWeather.release()
    return Script.setOpcodePartiallyImplemented()
end


-- INI: 01b5=1,force_weather %1d%
Opcode.register(0x01b5, SharedOpcodeWeather.force, 1, 'force_weather ${1}', {false})
-- INI: 01b6=1,set_weather %1d%
Opcode.register(0x01b6, SharedOpcodeWeather.forceNow, 1, 'force_weather_now ${1}', {false})
-- INI: 01b7=0,release_weather
Opcode.register(0x01b7, SharedOpcodeWeather.release, 0, 'release_weather', {})
