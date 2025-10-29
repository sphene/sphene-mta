SharedOpcodeRestart = {}
SharedOpcodeRestart.__index = SharedOpcodeRestart

-- Opcode: 0x016C
-- Instruction: add_hospital_restart {x} [float] {y} [float] {z} [float] {heading} [float] {townId} [Town]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/016C
function SharedOpcodeRestart.addHospital(posX, posY, posZ, angle, town)
    Game.addHospital(posX, posY, posZ, angle, town)
end

-- Opcode: 0x016D
-- Instruction: add_police_restart {x} [float] {y} [float] {z} [float] {heading} [float] {townId} [Town]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/016D
function SharedOpcodeRestart.addPolice(posX, posY, posZ, angle, town)
    Game.addPoliceStation(posX, posY, posZ, angle, town)
end

-- Opcode: 0x016E
-- Instruction: override_next_restart {x} [float] {y} [float] {z} [float] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/016E
function SharedOpcodeRestart.overrideNext()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x01F6
-- Instruction: cancel_override_restart
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01F6
function SharedOpcodeRestart.cancelOverride()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x016c, SharedOpcodeRestart.addHospital, 'add_hospital_restart {x} [float] {y} [float] {z} [float] {heading} [float] {townId} [Town]')
Opcode.register(0x016d, SharedOpcodeRestart.addPolice, 'add_police_restart {x} [float] {y} [float] {z} [float] {heading} [float] {townId} [Town]')
Opcode.register(0x016e, SharedOpcodeRestart.overrideNext, 'override_next_restart {x} [float] {y} [float] {z} [float] {heading} [float]')
Opcode.register(0x01f6, SharedOpcodeRestart.cancelOverride, 'cancel_override_restart')
