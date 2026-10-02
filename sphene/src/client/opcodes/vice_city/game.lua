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


-- INI: 02ec=3,put_hidden_package_at %1d% %2d% %3d%
Opcode.register(0x02ec, ViceCityOpcodeGame.createCollectable, 3, 'create_collectable1 ${1} ${2} ${3}', {false, false, false})
-- INI: 03e1=1,%1d% = packages_found
Opcode.register(0x03e1, ViceCityOpcodeGame.getCollectablesCollected, 1, '${1} = get_collectable1s_collected', {true})
-- INI: 03f1=2,pedtype %1e% add_threat %2e%
Opcode.register(0x03f1, ViceCityOpcodeGame.setThreatForPedType, 2, 'set_threat_for_ped_type ${1} ${2}', {false, false})
-- INI: 03f2=2,pedtype %1e% remove_threat %2e%
Opcode.register(0x03f2, ViceCityOpcodeGame.clearThreatForPedType, 2, 'clear_threat_for_ped_type ${1} ${2}', {false, false})
-- INI: 03f9=3,make_actors %1d% %2d% converse_in %3d% ms
Opcode.register(0x03f9, ViceCityOpcodeGame.setCharsChatting, 3, 'set_chars_chatting ${1} ${2} ${3}', {false, false, false})
-- INI: 040b=0,  french_game
Opcode.register(0x040b, ViceCityOpcodeGame.isFrench, 0, 'is_french_game', {})
-- INI: 0552=1,set_riot_noise %1d%
Opcode.register(0x0552, ViceCityOpcodeGame.setRiotIntensity, 1, 'set_riot_intensity ${1}', {false})
-- INI: 05e5=1,%1d% = game_version
Opcode.register(0x05e5, ViceCityOpcodeGame.getVersion, 1, '${1} = get_game_version', {true})
