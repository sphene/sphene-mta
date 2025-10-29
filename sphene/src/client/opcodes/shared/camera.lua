SharedOpcodeCamera = {}
SharedOpcodeCamera.__index = SharedOpcodeCamera

-- Opcode: 0x0003
-- Instruction: shake_cam {intensity} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0003
function SharedOpcodeCamera.shake(intensity)
    Camera.setShakeLevel(intensity)
end

-- Opcode: 0x00C2
-- Instruction: is_point_on_screen {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00C2
function SharedOpcodeCamera.isPointOnScreen(x, y, z, radius)
   return getScreenFromWorldPosition(x, y, z, radius) ~= false
end

-- Opcode: 0x0158
-- Instruction: point_camera_at_car {vehicle} [Car] {mode} [CameraMode] {switchStyle} [SwitchType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0158
function SharedOpcodeCamera.pointAtCar(car, _, _)
    Camera.setTarget(car)
    --Camera.setTarget(car, mode, switchStyle)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0159
-- Instruction: point_camera_at_char {char} [Char] {mode} [CameraMode] {switchStyle} [SwitchType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0159
function SharedOpcodeCamera.pointAtChar(_, _, _)
    --Camera.setTarget(ped, mode, switchStyle)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x015A
-- Instruction: restore_camera
-- https://library.sannybuilder.com/#/sa/script/extensions/default/015A
function SharedOpcodeCamera.restore()
    Camera.restore()
end

-- Opcode: 0x015F
-- Instruction: set_fixed_camera_position {x} [float] {y} [float] {z} [float] {upVecOffsetX} [float] {upVecOffsetY} [float] {upVecOffsetZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/015F
function SharedOpcodeCamera.setFixedPosition(posX, posY, posZ, rotX, rotY, rotZ)
    Camera.setPosition(posX, posY, posZ)
    Camera.setRotation(rotX, rotY, rotZ)
end

-- Opcode: 0x0160
-- Instruction: point_camera_at_point {x} [float] {y} [float] {z} [float] {switchStyle} [SwitchType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0160
function SharedOpcodeCamera.pointAtPoint(posX, posY, posZ, switchStyle)
    Camera.pointWithSwitchStyle(posX, posY, posZ, switchStyle)
end

-- Opcode: 0x0169
-- Instruction: set_fading_colour {r} [int] {g} [int] {b} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0169
function SharedOpcodeCamera.setFadingColor(r, g, b)
    Camera.setFadeColor(r, g, b)
end

-- Opcode: 0x016A
-- Instruction: do_fade {time} [int] {direction} [Fade]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/016A
function SharedOpcodeCamera.doFade(fadeTime, fade)
    Camera.fade(fade == 1, fadeTime)
end

-- Opcode: 0x016B
-- Instruction: get_fading_status
-- https://library.sannybuilder.com/#/sa/script/extensions/default/016B
function SharedOpcodeCamera.getFadingStatus()
    return Camera.isFading()
end

-- Opcode: 0x02EB
-- Instruction: restore_camera_jumpcut
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02EB
function SharedOpcodeCamera.restoreJumpcut()
    Camera.restore(true)
end

-- Opcode: 0x032A
-- Instruction: set_camera_zoom {zoom} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/032A
function SharedOpcodeCamera.setZoom(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0373
-- Instruction: set_camera_behind_player
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0373
function SharedOpcodeCamera.setBehindPlayer()
    Camera.setTarget(PlayerElement.getLocalPlayer())
end

-- Opcode: 0x03C8
-- Instruction: set_camera_in_front_of_player
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03C8
function SharedOpcodeCamera.setInFrontOfPlayer()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x041D
-- Instruction: set_near_clip {distance} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/041D
function SharedOpcodeCamera.setNearClip()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0454
-- Instruction: [var x: float], [var y: float], [var z: float] = get_debug_camera_coordinates
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0454
function SharedOpcodeCamera.getDebugCoordinates(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0460
-- Instruction: set_interpolation_parameters {_p1} [float] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0460
function SharedOpcodeCamera.setInterpolationParameters(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0463
-- Instruction: [var x: float], [var y: float], [var z: float] = get_debug_camera_point_at
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0463
function SharedOpcodeCamera.getDebugPointAt(_, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0003, SharedOpcodeCamera.shake, 'shake_cam {intensity} [int]')
Opcode.register(0x00c2, SharedOpcodeCamera.isPointOnScreen, 'is_point_on_screen {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x0158, SharedOpcodeCamera.pointAtCar, 'point_camera_at_car {vehicle} [Car] {mode} [CameraMode] {switchStyle} [SwitchType]')
Opcode.register(0x0159, SharedOpcodeCamera.pointAtChar, 'point_camera_at_char {char} [Char] {mode} [CameraMode] {switchStyle} [SwitchType]')
Opcode.register(0x015a, SharedOpcodeCamera.restore, 'restore_camera')
Opcode.register(0x015f, SharedOpcodeCamera.setFixedPosition, 'set_fixed_camera_position {x} [float] {y} [float] {z} [float] {upVecOffsetX} [float] {upVecOffsetY} [float] {upVecOffsetZ} [float]')
Opcode.register(0x0160, SharedOpcodeCamera.pointAtPoint, 'point_camera_at_point {x} [float] {y} [float] {z} [float] {switchStyle} [SwitchType]')
Opcode.register(0x0169, SharedOpcodeCamera.setFadingColor, 'set_fading_colour {r} [int] {g} [int] {b} [int]')
Opcode.register(0x016a, SharedOpcodeCamera.doFade, 'do_fade {time} [int] {direction} [Fade]')
Opcode.register(0x016b, SharedOpcodeCamera.getFadingStatus, 'get_fading_status')
Opcode.register(0x02eb, SharedOpcodeCamera.restoreJumpcut, 'restore_camera_jumpcut')
Opcode.register(0x032a, SharedOpcodeCamera.setZoom, 'set_camera_zoom {zoom} [int]')
Opcode.register(0x0373, SharedOpcodeCamera.setBehindPlayer, 'set_camera_behind_player')
Opcode.register(0x03c8, SharedOpcodeCamera.setInFrontOfPlayer, 'set_camera_in_front_of_player')
Opcode.register(0x041d, SharedOpcodeCamera.setNearClip, 'set_near_clip {distance} [float]')
Opcode.register(0x0454, SharedOpcodeCamera.getDebugCoordinates, '[var x: float], [var y: float], [var z: float] = get_debug_camera_coordinates')
Opcode.register(0x0460, SharedOpcodeCamera.setInterpolationParameters, 'set_interpolation_parameters {_p1} [float] {time} [int]')
Opcode.register(0x0463, SharedOpcodeCamera.getDebugPointAt, '[var x: float], [var y: float], [var z: float] = get_debug_camera_point_at')
