SanAndreasOpcodeGarage = {}
SanAndreasOpcodeGarage.__index = SanAndreasOpcodeGarage

-- Opcode: 0x0299
-- Instruction: activate_garage {garageId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0299
function SanAndreasOpcodeGarage.activate(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02B9
-- Instruction: deactivate_garage {garageId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02B9
function SanAndreasOpcodeGarage.deactivate(garage)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x093A
-- Instruction: set_garage_respray_free {garageId} [string] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/093A
function SanAndreasOpcodeGarage.setResprayFree(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0299, SanAndreasOpcodeGarage.activate, 'activate_garage {garageId} [string]')
Opcode.register(0x02b9, SanAndreasOpcodeGarage.deactivate, 'deactivate_garage {garageId} [string]')
Opcode.register(0x093a, SanAndreasOpcodeGarage.setResprayFree, 'set_garage_respray_free {garageId} [string] {state} [bool]')
