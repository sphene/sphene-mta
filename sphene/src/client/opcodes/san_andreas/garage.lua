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


-- INI: 0299=1,activate_garage %1d%
Opcode.register(0x0299, SanAndreasOpcodeGarage.activate, 1, 'activate_garage ${1}', {false})
-- INI: 02b9=1,deactivate_garage %1d%
Opcode.register(0x02b9, SanAndreasOpcodeGarage.deactivate, 1, 'deactivate_garage ${1}', {false})
-- INI: 093A=2,set_paynspray %1g% type_to_girlfriend %2h%
Opcode.register(0x093a, SanAndreasOpcodeGarage.setResprayFree, 2, 'set_garage_respray_free ${1} ${2}', {false, false})
