ViceCityOpcodePhone = {}
ViceCityOpcodePhone.__index = ViceCityOpcodePhone

-- Opcode: 0x024A
-- Instruction: [var handle: Phone] = grab_phone {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/024A
function ViceCityOpcodePhone.grab(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x024E
-- Instruction: turn_phone_off [Phone]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/024E
function ViceCityOpcodePhone.turnOff(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0405
-- Instruction: turn_phone_on [Phone]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0405
function ViceCityOpcodePhone.turnOn(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 024a=3,%3d% = get_phone_at %1d% %2d%
Opcode.register(0x024a, ViceCityOpcodePhone.grab, 3, '${3} = grab_phone ${1} ${2}', {false, false, true})
-- INI: 024e=1,disable_phone %1d%
Opcode.register(0x024e, ViceCityOpcodePhone.turnOff, 1, 'turn_phone_off ${1}', {false})
-- INI: 0405=1,enable_phone %1d%
Opcode.register(0x0405, ViceCityOpcodePhone.turnOn, 1, 'turn_phone_on ${1}', {false})
