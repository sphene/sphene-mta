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


Opcode.register(0x00e2, SanAndreasOpcodePad.getState, '[var state: int] = get_pad_state {pad} [PadId] {buttonId} [Button]')
Opcode.register(0x015b, SanAndreasOpcodePad.shake, 'shake_pad {pad} [PadId] {time} [int] {intensity} [int]')
Opcode.register(0x07cc, SanAndreasOpcodePad.setPlayerEnterCarButton, 'set_player_enter_car_button {playerId} [Player] {state} [bool]')
Opcode.register(0x082a, SanAndreasOpcodePad.setPlayerDuckButton, 'set_player_duck_button {playerId} [Player] {state} [bool]')
Opcode.register(0x0881, SanAndreasOpcodePad.setPlayerFireButton, 'set_player_fire_button {playerId} [Player] {state} [bool]')
Opcode.register(0x08d0, SanAndreasOpcodePad.isSkipCutsceneButtonPressed, 'is_skip_cutscene_button_pressed')
Opcode.register(0x0901, SanAndreasOpcodePad.setPlayerJumpButton, 'set_player_jump_button {playerId} [Player] {state} [bool]')
Opcode.register(0x0960, SanAndreasOpcodePad.setPlayerDisplayVitalStatsButton, 'set_player_display_vital_stats_button {playerId} [Player] {state} [bool]')
Opcode.register(0x0992, SanAndreasOpcodePad.setPlayerCycleWeaponButton, 'set_player_cycle_weapon_button {playerId} [Player] {state} [bool]')
Opcode.register(0x0e3d, SanAndreasOpcodePad.isKeyJustPressed, 'is_key_just_pressed {keyCode} [KeyCode]')
Opcode.register(0x0e3e, SanAndreasOpcodePad.isButtonJustPressed, 'is_button_just_pressed {pad} [PadId] {buttonId} [Button]')
Opcode.register(0x0e67, SanAndreasOpcodePad.isAimButtonPressed, 'is_aim_button_pressed {pad} [PadId]')
Opcode.register(0x0e68, SanAndreasOpcodePad.setControl, 'set_player_control_pad {pad} [PadId] {enabled} [bool]')
Opcode.register(0x0e69, SanAndreasOpcodePad.setMovement, 'set_player_control_pad_movement {pad} [PadId] {movement} [bool]')
Opcode.register(0x0e8d, SanAndreasOpcodePad.isAnyFireButtonPressed, 'is_any_fire_button_pressed {pad} [PadId]')
Opcode.register(0x0f13, SanAndreasOpcodePad.getTimeNotTouching, '[var timeInMs: int] = get_time_not_touching_pad {pad} [PadId]')
