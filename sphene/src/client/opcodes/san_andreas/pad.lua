SanAndreasOpcodePad = {}
SanAndreasOpcodePad.__index = SanAndreasOpcodePad

-- Opcode: 0x00E2
-- Instruction: [var state: int] = get_pad_state {pad} [PadId] {buttonId} [Button]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00E2
function SanAndreasOpcodePad.getState(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x015B
-- Instruction: shake_pad {pad} [PadId] {time} [int] {intensity} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/015B
function SanAndreasOpcodePad.shake(_, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07CC
-- Instruction: set_player_enter_car_button {playerId} [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07CC
function SanAndreasOpcodePad.setPlayerEnterCarButton(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x082A
-- Instruction: set_player_duck_button {playerId} [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/082A
function SanAndreasOpcodePad.setPlayerDuckButton(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0881
-- Instruction: set_player_fire_button {playerId} [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0881
function SanAndreasOpcodePad.setPlayerFireButton(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08D0
-- Instruction: is_skip_cutscene_button_pressed
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08D0
function SanAndreasOpcodePad.isSkipCutsceneButtonPressed(_)
    return Game.isSkipping
end

-- Opcode: 0x0901
-- Instruction: set_player_jump_button {playerId} [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0901
function SanAndreasOpcodePad.setPlayerJumpButton(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0960
-- Instruction: set_player_display_vital_stats_button {playerId} [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0960
function SanAndreasOpcodePad.setPlayerDisplayVitalStatsButton(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0992
-- Instruction: set_player_cycle_weapon_button {playerId} [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0992
function SanAndreasOpcodePad.setPlayerCycleWeaponButton(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E3D
-- Instruction: is_key_just_pressed {keyCode} [KeyCode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E3D
function SanAndreasOpcodePad.isKeyJustPressed(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E3E
-- Instruction: is_button_just_pressed {pad} [PadId] {buttonId} [Button]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E3E
function SanAndreasOpcodePad.isButtonJustPressed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E67
-- Instruction: is_aim_button_pressed {pad} [PadId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E67
function SanAndreasOpcodePad.isAimButtonPressed(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E68
-- Instruction: set_player_control_pad {pad} [PadId] {enabled} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E68
function SanAndreasOpcodePad.setControl(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E69
-- Instruction: set_player_control_pad_movement {pad} [PadId] {movement} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E69
function SanAndreasOpcodePad.setMovement(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E8D
-- Instruction: is_any_fire_button_pressed {pad} [PadId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E8D
function SanAndreasOpcodePad.isAnyFireButtonPressed(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F13
-- Instruction: [var timeInMs: int] = get_time_not_touching_pad {pad} [PadId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F13
function SanAndreasOpcodePad.getTimeNotTouching()
   return Script.setOpcodeUnimplemented()
end


-- INI: 00e2=3,get_player %1d% key %2d% state_to %3d%
Opcode.register(0x00e2, SanAndreasOpcodePad.getState, 3, '${3} = get_pad_state ${1} ${2}', {false, false, true})
-- INI: 015b=3,shake_player_controller %1h% time %2d% intensity %3d%
Opcode.register(0x015b, SanAndreasOpcodePad.shake, 3, 'shake_pad ${1} ${2} ${3}', {false, false, false})
-- INI: 07CC=2,set_player %1d% can_enter_exit_vehicles %2h%
Opcode.register(0x07cc, SanAndreasOpcodePad.setPlayerEnterCarButton, 2, 'set_player_enter_car_button ${1} ${2}', {false, false})
-- INI: 082A=2,set_player %1d% able_to_use_crouch_button %2h%
Opcode.register(0x082a, SanAndreasOpcodePad.setPlayerDuckButton, 2, 'set_player_duck_button ${1} ${2}', {false, false})
-- INI: 0881=2,set_player %1d% able_to_shoot_weapons %2h%
Opcode.register(0x0881, SanAndreasOpcodePad.setPlayerFireButton, 2, 'set_player_fire_button ${1} ${2}', {false, true})
-- INI: 08D0=0,  should_skip_cutscene
Opcode.register(0x08d0, SanAndreasOpcodePad.isSkipCutsceneButtonPressed, 0, 'is_skip_cutscene_button_pressed', {})
-- INI: 0901=2,enable_player %1d% jump_key %2h%
Opcode.register(0x0901, SanAndreasOpcodePad.setPlayerJumpButton, 2, 'set_player_jump_button ${1} ${2}', {false, false})
-- INI: 0960=2,enable_player %1d% stats_box %2h%
Opcode.register(0x0960, SanAndreasOpcodePad.setPlayerDisplayVitalStatsButton, 2, 'set_player_display_vital_stats_button ${1} ${2}', {false, false})
-- INI: 0992=2,set_player %1d% weapons_scrollable %2h%
Opcode.register(0x0992, SanAndreasOpcodePad.setPlayerCycleWeaponButton, 2, 'set_player_cycle_weapon_button ${1} ${2}', {false, false})
-- INI: 0E3D=1,is_key_just_pressed %1d%
Opcode.register(0x0e3d, SanAndreasOpcodePad.isKeyJustPressed, 1, 'is_key_just_pressed ${1}', {false})
-- INI: 0E3E=2,is_button_just_pressed %1d% button %2d%
Opcode.register(0x0e3e, SanAndreasOpcodePad.isButtonJustPressed, 2, 'is_button_just_pressed ${1} ${2}', {false, false})
-- INI: 0E67=1,is_aim_button_pressed %1d%
Opcode.register(0x0e67, SanAndreasOpcodePad.isAimButtonPressed, 1, 'is_aim_button_pressed ${1}', {false})
-- INI: 0E68=2,set_player_control_pad %1d% %2d%
Opcode.register(0x0e68, SanAndreasOpcodePad.setControl, 2, 'set_player_control_pad ${1} ${2}', {false, false})
-- INI: 0E69=2,set_player_control_pad_movement %1d% %2d%
Opcode.register(0x0e69, SanAndreasOpcodePad.setMovement, 2, 'set_player_control_pad_movement ${1} ${2}', {false, false})
-- INI: 0E8D=1,is_any_fire_button_pressed %1d%
Opcode.register(0x0e8d, SanAndreasOpcodePad.isAnyFireButtonPressed, 1, 'is_any_fire_button_pressed ${1}', {false})
Opcode.register(0x0f13, SanAndreasOpcodePad.getTimeNotTouching, 2, '${1} = get_time_not_touching_pad ${2}')
