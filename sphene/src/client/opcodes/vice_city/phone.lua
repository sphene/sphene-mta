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


Opcode.register(0x024a, ViceCityOpcodePhone.grab, '[var handle: Phone] = grab_phone {x} [float] {y} [float]')
Opcode.register(0x024e, ViceCityOpcodePhone.turnOff, 'turn_phone_off [Phone]')
Opcode.register(0x0405, ViceCityOpcodePhone.turnOn, 'turn_phone_on [Phone]')
