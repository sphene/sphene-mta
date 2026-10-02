SanAndreasOpcodeWeather = {}
SanAndreasOpcodeWeather.__index = SanAndreasOpcodeWeather

-- Opcode: 0x08FD
-- Instruction: set_heathaze_effect {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08FD
function SanAndreasOpcodeWeather.setHeathazeEffect(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0915
-- Instruction: set_weather_to_appropriate_type_now
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0915
function SanAndreasOpcodeWeather.setToAppropriateTypeNow()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D59
-- Instruction: [var type: WeatherType] = get_current_weather
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D59
function SanAndreasOpcodeWeather.getCurrent(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E04
-- Instruction: [var type: WeatherType] = get_next_weather
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E04
function SanAndreasOpcodeWeather.getNext(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E05
-- Instruction: set_next_weather {type} [WeatherType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E05
function SanAndreasOpcodeWeather.setNext(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E06
-- Instruction: [var intensity: float] = get_rain_intensity
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E06
function SanAndreasOpcodeWeather.getRainIntensity(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E07
-- Instruction: set_rain_intensity {intensity} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E07
function SanAndreasOpcodeWeather.setRainIntensity(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E6C
-- Instruction: [var intensity: float] = get_day_night_balance
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E6C
function SanAndreasOpcodeWeather.getDayNightBalance(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E6D
-- Instruction: [var intensity: float] = get_underwaterness
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E6D
function SanAndreasOpcodeWeather.getUnderwaterness(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EB0
-- Instruction: [var weather: WeatherType] = get_forced_weather
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EB0
function SanAndreasOpcodeWeather.getForced(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 08FD=1,enable_heat_visuals %1h%
Opcode.register(0x08fd, SanAndreasOpcodeWeather.setHeathazeEffect, 1, 'set_heathaze_effect ${1}', {false})
-- INI: 0915=0,sync_weather_with_time_and_location_instantly
Opcode.register(0x0915, SanAndreasOpcodeWeather.setToAppropriateTypeNow, 0, 'set_weather_to_appropriate_type_now', {})
-- INI: 0D59=1,%1d% = current_weather
Opcode.register(0x0d59, SanAndreasOpcodeWeather.getCurrent, 1, '${1} = get_current_weather', {true})
-- INI: 0E04=1,get_next_weather_to %1d%
Opcode.register(0x0e04, SanAndreasOpcodeWeather.getNext, 1, '${1} = get_next_weather', {false})
-- INI: 0E05=1,set_next_weather_to %1d%
Opcode.register(0x0e05, SanAndreasOpcodeWeather.setNext, 1, 'set_next_weather ${1}', {false})
-- INI: 0E06=1,get_rain_intensity %1d%
Opcode.register(0x0e06, SanAndreasOpcodeWeather.getRainIntensity, 1, '${1} = get_rain_intensity', {false})
-- INI: 0E07=1,set_rain_intensity %1d%
Opcode.register(0x0e07, SanAndreasOpcodeWeather.setRainIntensity, 1, 'set_rain_intensity ${1}', {false})
-- INI: 0E6C=1,get_day_night_balance %1d%
Opcode.register(0x0e6c, SanAndreasOpcodeWeather.getDayNightBalance, 1, '${1} = get_day_night_balance', {false})
-- INI: 0E6D=1,get_underwaterness %1d%
Opcode.register(0x0e6d, SanAndreasOpcodeWeather.getUnderwaterness, 1, '${1} = get_underwaterness', {false})
-- INI: 0EB0=1,get_forced_weather %1d%
Opcode.register(0x0eb0, SanAndreasOpcodeWeather.getForced, 1, '${1} = get_forced_weather', {false})
