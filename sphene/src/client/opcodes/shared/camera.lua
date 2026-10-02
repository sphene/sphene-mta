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


-- INI: 0003=1,shake_camera %1d%
Opcode.register(0x0003, SharedOpcodeCamera.shake, 1, 'shake_cam ${1}', {false})
-- INI: 00c2=4,  sphere_onscreen %1d% %2d% %3d% %4d%
Opcode.register(0x00c2, SharedOpcodeCamera.isPointOnScreen, 4, 'is_point_on_screen ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0158=3,camera_on_vehicle %1d% mode %2d% switchstyle %3d%
Opcode.register(0x0158, SharedOpcodeCamera.pointAtCar, 3, 'point_camera_at_car ${1} ${2} ${3}', {false, false, false})
-- INI: 0159=3,camera_on_ped %1d% mode %2d% switchstyle %3d%
Opcode.register(0x0159, SharedOpcodeCamera.pointAtChar, 3, 'point_camera_at_char ${1} ${2} ${3}', {false, false, false})
-- INI: 015a=0,restore_camera
Opcode.register(0x015a, SharedOpcodeCamera.restore, 0, 'restore_camera', {})
-- INI: 015f=6,set_camera_position %1d% %2d% %3d% rotation %4d% %5d% %6d%
Opcode.register(0x015f, SharedOpcodeCamera.setFixedPosition, 6, 'set_fixed_camera_position ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0160=4,point_camera %1d% %2d% %3d% switchstyle %4d%
Opcode.register(0x0160, SharedOpcodeCamera.pointAtPoint, 4, 'point_camera_at_point ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0169=3,set_fade_color %1d% %2d% %3d%
Opcode.register(0x0169, SharedOpcodeCamera.setFadingColor, 3, 'set_fading_colour ${1} ${2} ${3}', {false, false, false})
-- INI: 016a=2,fade %2b:back/% %1d% ms
Opcode.register(0x016a, SharedOpcodeCamera.doFade, 2, 'do_fade ${1} ${2}', {false, false})
-- INI: 016b=0,  fading
Opcode.register(0x016b, SharedOpcodeCamera.getFadingStatus, 0, 'get_fading_status', {})
-- INI: 02eb=0,restore_camera_with_jumpcut
Opcode.register(0x02eb, SharedOpcodeCamera.restoreJumpcut, 0, 'restore_camera_jumpcut', {})
-- INI: 032a=1,set_behind_camera_mode_to %1h%
Opcode.register(0x032a, SharedOpcodeCamera.setZoom, 1, 'set_camera_zoom ${1}', {true})
-- INI: 0373=0,set_camera_directly_behind_player
Opcode.register(0x0373, SharedOpcodeCamera.setBehindPlayer, 0, 'set_camera_behind_player', {})
-- INI: 03c8=0,set_camera_directly_before_player
Opcode.register(0x03c8, SharedOpcodeCamera.setInFrontOfPlayer, 0, 'set_camera_in_front_of_player', {})
-- INI: 041d=1,set_camera_near_clip %1d%
Opcode.register(0x041d, SharedOpcodeCamera.setNearClip, 1, 'set_near_clip ${1}', {false})
-- INI: 0454=3,useless_store_debug_camera_position_to %1d% %2d% %3d%
Opcode.register(0x0454, SharedOpcodeCamera.getDebugCoordinates, 3, '${1}, ${2}, ${3} = get_debug_camera_coordinates', {true, true, true})
-- INI: 0460=2,set_camera_pointing_time %1d% %2d%
Opcode.register(0x0460, SharedOpcodeCamera.setInterpolationParameters, 2, 'set_interpolation_parameters ${1} ${2}', {false, false})
-- INI: 0463=3,useless_store_debug_camera_target_point_to %1d% %2d% %3d%
Opcode.register(0x0463, SharedOpcodeCamera.getDebugPointAt, 3, '${1}, ${2}, ${3} = get_debug_camera_point_at', {true, true, true})
