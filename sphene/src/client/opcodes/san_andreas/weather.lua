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


Opcode.register(0x08fd, SanAndreasOpcodeWeather.setHeathazeEffect, 'set_heathaze_effect {state} [bool]')
Opcode.register(0x0915, SanAndreasOpcodeWeather.setToAppropriateTypeNow, 'set_weather_to_appropriate_type_now')
Opcode.register(0x0d59, SanAndreasOpcodeWeather.getCurrent, '[var type: WeatherType] = get_current_weather')
Opcode.register(0x0e04, SanAndreasOpcodeWeather.getNext, '[var type: WeatherType] = get_next_weather')
Opcode.register(0x0e05, SanAndreasOpcodeWeather.setNext, 'set_next_weather {type} [WeatherType]')
Opcode.register(0x0e06, SanAndreasOpcodeWeather.getRainIntensity, '[var intensity: float] = get_rain_intensity')
Opcode.register(0x0e07, SanAndreasOpcodeWeather.setRainIntensity, 'set_rain_intensity {intensity} [float]')
Opcode.register(0x0e6c, SanAndreasOpcodeWeather.getDayNightBalance, '[var intensity: float] = get_day_night_balance')
Opcode.register(0x0e6d, SanAndreasOpcodeWeather.getUnderwaterness, '[var intensity: float] = get_underwaterness')
Opcode.register(0x0eb0, SanAndreasOpcodeWeather.getForced, '[var weather: WeatherType] = get_forced_weather')
