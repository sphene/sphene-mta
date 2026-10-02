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


-- INI: 079D=0,unknown_set_game_controller_to_steer_object_MagnoCrane_03 ; originally SF docks magnocrane
Opcode.register(0x079d, SanAndreasOpcodeCrane.playerEnteredDockCrane, 0, 'player_entered_dock_crane', {})
-- INI: 079E=0,unknown_set_game_controller_to_steer_object_TWRCRANE_M_02 ; originally SF site ballcrane
Opcode.register(0x079e, SanAndreasOpcodeCrane.playerEnteredBuildingsiteCrane, 0, 'player_entered_buildingsite_crane', {})
-- INI: 079F=0,unknown_set_game_controller_to_steer_no_crane_objects
Opcode.register(0x079f, SanAndreasOpcodeCrane.playerLeftCrane, 0, 'player_left_crane', {})
-- INI: 07F9=0,set_game_controller_to_steer_object_QUARRY_CRANEARM ; originally DS quarry magnocrane
Opcode.register(0x07f9, SanAndreasOpcodeCrane.playerEnteredQuarryCrane, 0, 'player_entered_quarry_crane', {})
-- INI: 07FA=0,set_game_controller_to_steer_object_TWRCRANE_M_02 ; originally LV site magnocrane
Opcode.register(0x07fa, SanAndreasOpcodeCrane.playerEnteredLasVegasCrane, 0, 'player_entered_las_vegas_crane', {})
-- INI: 0898=3,set_cranes_controls_enable_UP %1d% enable_DOWN %2d% enable_RELEASE %3d%
Opcode.register(0x0898, SanAndreasOpcodeCrane.enableControls, 3, 'enable_crane_controls ${1} ${2} ${3}', {false, false, false})
