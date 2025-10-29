ViceCityOpcodeGame = {}
ViceCityOpcodeGame.__index = ViceCityOpcodeGame

-- Opcode: 0x02EC
-- Instruction: create_collectable1 {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02EC
function ViceCityOpcodeGame.createCollectable(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03E1
-- Instruction: [var num: int] = get_collectable1s_collected
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03E1
function ViceCityOpcodeGame.getCollectablesCollected(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03F1
-- Instruction: set_threat_for_ped_type {type} [PedType] {threatMask} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03F1
function ViceCityOpcodeGame.setThreatForPedType(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03F2
-- Instruction: clear_threat_for_ped_type {type} [PedType] {threatMask} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03F2
function ViceCityOpcodeGame.clearThreatForPedType(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03F9
-- Instruction: set_chars_chatting {char1} [Char] {char2} [Char] {duration} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03F9
function ViceCityOpcodeGame.setCharsChatting(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x040B
-- Instruction: is_french_game
-- https://library.sannybuilder.com/#/vc/script/extensions/default/040B
function ViceCityOpcodeGame.isFrench()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0552
-- Instruction: set_riot_intensity {level} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0552
function ViceCityOpcodeGame.setRiotIntensity(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05E5
-- Instruction: [var versionId: int] = get_game_version
-- https://library.sannybuilder.com/#/vc/script/extensions/default/05E5
function ViceCityOpcodeGame.getVersion(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x02ec, ViceCityOpcodeGame.createCollectable, 'create_collectable1 {x} [float] {y} [float] {z} [float]')
Opcode.register(0x03e1, ViceCityOpcodeGame.getCollectablesCollected, '[var num: int] = get_collectable1s_collected')
Opcode.register(0x03f1, ViceCityOpcodeGame.setThreatForPedType, 'set_threat_for_ped_type {type} [PedType] {threatMask} [int]')
Opcode.register(0x03f2, ViceCityOpcodeGame.clearThreatForPedType, 'clear_threat_for_ped_type {type} [PedType] {threatMask} [int]')
Opcode.register(0x03f9, ViceCityOpcodeGame.setCharsChatting, 'set_chars_chatting {char1} [Char] {char2} [Char] {duration} [int]')
Opcode.register(0x040b, ViceCityOpcodeGame.isFrench, 'is_french_game')
Opcode.register(0x0552, ViceCityOpcodeGame.setRiotIntensity, 'set_riot_intensity {level} [int]')
Opcode.register(0x05e5, ViceCityOpcodeGame.getVersion, '[var versionId: int] = get_game_version')
