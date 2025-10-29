SanAndreasOpcodeCrane = {}
SanAndreasOpcodeCrane.__index = SanAndreasOpcodeCrane

-- Opcode: 0x079D
-- Instruction: player_entered_dock_crane
-- https://library.sannybuilder.com/#/sa/script/extensions/default/079D
function SanAndreasOpcodeCrane.playerEnteredDockCrane()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x079E
-- Instruction: player_entered_buildingsite_crane
-- https://library.sannybuilder.com/#/sa/script/extensions/default/079E
function SanAndreasOpcodeCrane.playerEnteredBuildingsiteCrane()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x079F
-- Instruction: player_left_crane
-- https://library.sannybuilder.com/#/sa/script/extensions/default/079F
function SanAndreasOpcodeCrane.playerLeftCrane()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07F9
-- Instruction: player_entered_quarry_crane
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07F9
function SanAndreasOpcodeCrane.playerEnteredQuarryCrane()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07FA
-- Instruction: player_entered_las_vegas_crane
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07FA
function SanAndreasOpcodeCrane.playerEnteredLasVegasCrane()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0898
-- Instruction: enable_crane_controls {up} [bool] {down} [bool] {release} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0898
function SanAndreasOpcodeCrane.enableControls(_, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x079d, SanAndreasOpcodeCrane.playerEnteredDockCrane, 'player_entered_dock_crane')
Opcode.register(0x079e, SanAndreasOpcodeCrane.playerEnteredBuildingsiteCrane, 'player_entered_buildingsite_crane')
Opcode.register(0x079f, SanAndreasOpcodeCrane.playerLeftCrane, 'player_left_crane')
Opcode.register(0x07f9, SanAndreasOpcodeCrane.playerEnteredQuarryCrane, 'player_entered_quarry_crane')
Opcode.register(0x07fa, SanAndreasOpcodeCrane.playerEnteredLasVegasCrane, 'player_entered_las_vegas_crane')
Opcode.register(0x0898, SanAndreasOpcodeCrane.enableControls, 'enable_crane_controls {up} [bool] {down} [bool] {release} [bool]')
