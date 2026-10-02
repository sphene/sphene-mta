ViceCityOpcodeCamera = {}
ViceCityOpcodeCamera.__index = ViceCityOpcodeCamera

-- Opcode: 0x0603
-- Instruction: task_go_to_coord_any_means {char} [Char] {x} [float] {y} [float] {z} [float] {speed} [MoveState] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0603
function ViceCityOpcodeCamera.isInWidescreenMode(_, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0157
-- Instruction: point_camera_at_player {player} [Player] {mode} [CameraMode] {switchStyle} [SwitchType]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0157
function ViceCityOpcodeCamera.pointAtPlayer(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03EA
-- Instruction: set_generate_cars_around_camera {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03EA
function ViceCityOpcodeCamera.setGenerateCarsAround(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04C7
-- Instruction: switch_security_camera {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04C7
function ViceCityOpcodeCamera.switchSecurity(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0507
-- Instruction: switch_lift_camera {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0507
function ViceCityOpcodeCamera.switchLift(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0603=0, is_camera_in_widescreen_mode
Opcode.register(0x0603, ViceCityOpcodeCamera.isInWidescreenMode, 6, 'task_go_to_coord_any_means ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0157=3,camera_on_player %1d% mode %2d% switchstyle %3d%
Opcode.register(0x0157, ViceCityOpcodeCamera.pointAtPlayer, 3, 'point_camera_at_player ${1} ${2} ${3}', {false, false, false})
-- INI: 03ea=1,generate_cars_around_camera %1d%
Opcode.register(0x03ea, ViceCityOpcodeCamera.setGenerateCarsAround, 1, 'set_generate_cars_around_camera ${1}', {false})
-- INI: 04c7=1,toggle_camera_green_scanlines %1h%
Opcode.register(0x04c7, ViceCityOpcodeCamera.switchSecurity, 1, 'switch_security_camera ${1}', {false})
-- INI: 0507=1,set_camera_interference %1h%
Opcode.register(0x0507, ViceCityOpcodeCamera.switchLift, 1, 'switch_lift_camera ${1}', {false})
