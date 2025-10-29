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


Opcode.register(0x0603, ViceCityOpcodeCamera.isInWidescreenMode, 'task_go_to_coord_any_means {char} [Char] {x} [float] {y} [float] {z} [float] {speed} [MoveState] {vehicle} [Car]')
Opcode.register(0x0157, ViceCityOpcodeCamera.pointAtPlayer, 'point_camera_at_player {player} [Player] {mode} [CameraMode] {switchStyle} [SwitchType]')
Opcode.register(0x03ea, ViceCityOpcodeCamera.setGenerateCarsAround, 'set_generate_cars_around_camera {state} [bool]')
Opcode.register(0x04c7, ViceCityOpcodeCamera.switchSecurity, 'switch_security_camera {state} [bool]')
Opcode.register(0x0507, ViceCityOpcodeCamera.switchLift, 'switch_lift_camera {state} [bool]')
