SanAndreasOpcodeCamera = {}
SanAndreasOpcodeCamera.__index = SanAndreasOpcodeCamera

-- Opcode: 0x0679
-- Instruction: attach_camera_to_vehicle {handle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float] {tilt} [float] {switchStyle} [SwitchType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0679
function SanAndreasOpcodeCamera.attachToVehicle(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x067A
-- Instruction: attach_camera_to_vehicle_look_at_vehicle {handle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {vehicle} [Car] {tilt} [float] {switchStyle} [SwitchType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/067A
function SanAndreasOpcodeCamera.attachToVehicleLookAtVehicle(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x067B
-- Instruction: attach_camera_to_vehicle_look_at_char {car} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {char} [Char] {tilt} [float] {switchStyle} [SwitchType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/067B
function SanAndreasOpcodeCamera.attachToVehicleLookAtChar(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x067C
-- Instruction: attach_camera_to_char {handle} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float] {tilt} [float] {switchStyle} [SwitchType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/067C
function SanAndreasOpcodeCamera.attachToChar(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x067D
-- Instruction: attach_camera_to_char_look_at_vehicle {char} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {vehicle} [Car] {tilt} [float] {switchStyle} [SwitchType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/067D
function SanAndreasOpcodeCamera.attachToCharLookAtVehicle()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x067E
-- Instruction: attach_camera_to_char_look_at_char {handle} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {char} [Char] {tilt} [float] {switchStyle} [SwitchType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/067E
function SanAndreasOpcodeCamera.attachToCharLookAtChar(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x068D
-- Instruction: [var x: float], [var y: float], [var z: float] = get_active_camera_coordinates
-- https://library.sannybuilder.com/#/sa/script/extensions/default/068D
function SanAndreasOpcodeCamera.getActiveCoordinates(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x068E
-- Instruction: [var x: float], [var y: float], [var z: float] = get_active_camera_point_at
-- https://library.sannybuilder.com/#/sa/script/extensions/default/068E
function SanAndreasOpcodeCamera.getActivePointAt(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06E0
-- Instruction: set_two_player_camera_mode {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06E0
function SanAndreasOpcodeCamera.setTwoPlayerMode(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0801
-- Instruction: [var fov: float] = get_camera_fov
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0801
function SanAndreasOpcodeCamera.getFov(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0822
-- Instruction: set_first_person_in_car_camera_mode {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0822
function SanAndreasOpcodeCamera.setFirstPersonInCarMode(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0834
-- Instruction: do_camera_bump {xOffset} [float] {yOffset} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0834
function SanAndreasOpcodeCamera.doBump(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0920
-- Instruction: camera_set_vector_track {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {time} [int] {ease} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0920
function SanAndreasOpcodeCamera.setVectorTrack(posX, posY, posZ, endX, endY, endZ, time, ease)
    Camera.animateLookPoint(posX, posY, posZ, endX, endY, endZ, ease == 1, false, time)
end

-- Opcode: 0x0922
-- Instruction: camera_set_lerp_fov {from} [float] {to} [float] {time} [int] {ease} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0922
function SanAndreasOpcodeCamera.setLerpFov(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0924
-- Instruction: set_darkness_effect {enable} [bool] {pitchBlack} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0924
function SanAndreasOpcodeCamera.setDarknessEffect(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0925
-- Instruction: camera_reset_new_scriptables
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0925
function SanAndreasOpcodeCamera.resetNewScriptables()
    Camera.restoreToUserDefined()
end

-- Opcode: 0x092F
-- Instruction: camera_persist_track {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/092F
function SanAndreasOpcodeCamera.persistTrack()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0930
-- Instruction: camera_persist_pos {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0930
function SanAndreasOpcodeCamera.persistPos()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0931
-- Instruction: camera_persist_fov {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0931
function SanAndreasOpcodeCamera.persistFov()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0933
-- Instruction: camera_is_vector_move_running
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0933
function SanAndreasOpcodeCamera.isVectorMoveRunning()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0934
-- Instruction: camera_is_vector_track_running
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0934
function SanAndreasOpcodeCamera.isVectorTrackRunning()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0936
-- Instruction: camera_set_vector_move {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {time} [int] {ease} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0936
function SanAndreasOpcodeCamera.setVectorMove(posX, posY, posZ, endX, endY, endZ, time, ease)
    Camera.animatePosition(posX, posY, posZ, endX, endY, endZ, ease == 1, true, time)
end

-- Opcode: 0x093D
-- Instruction: set_cinema_camera {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/093D
function SanAndreasOpcodeCamera.setCinema(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0944
-- Instruction: set_camera_in_front_of_char {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0944
function SanAndreasOpcodeCamera.setInFrontOfChar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x099C
-- Instruction: camera_set_shake_simulation_simple {type} [int] {timeInMs} [float] {intensity} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/099C
function SanAndreasOpcodeCamera.setShakeSimulationSimple(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09AD
-- Instruction: set_player_in_car_camera_mode {mode} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09AD
function SanAndreasOpcodeCamera.setPlayerInCarMode(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09EC
-- Instruction: allow_fixed_camera_collision {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09EC
function SanAndreasOpcodeCamera.allowFixedCollision(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09EF
-- Instruction: set_vehicle_camera_tweak {modelId} [model_vehicle] {distance} [float] {altitude} [float] {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09EF
function SanAndreasOpcodeCamera.setVehicleTweak(_, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09F0
-- Instruction: reset_vehicle_camera_tweak
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09F0
function SanAndreasOpcodeCamera.resetVehicleTweak()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A1E
-- Instruction: take_photo {_p1} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A1E
function SanAndreasOpcodeCamera.takePhoto(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A25
-- Instruction: set_camera_position_unfixed {xOffset} [float] {yOffset} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A25
function SanAndreasOpcodeCamera.setPositionUnfixed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A2F
-- Instruction: set_photo_camera_effect {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A2F
function SanAndreasOpcodeCamera.setPhotoEffect(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A39
-- Instruction: [var mode: int] = get_player_in_car_camera_mode
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A39
function SanAndreasOpcodeCamera.getPlayerInCarMode(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E60
-- Instruction: set_camera_control {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E60
function SanAndreasOpcodeCamera.setCameraControl(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E64
-- Instruction: [var mode: CameraMode] = get_current_camera_mode
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E64
function SanAndreasOpcodeCamera.getCurrentMode(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EB2
-- Instruction: [var x: float], [var y: float], [var z: float] = get_offset_from_camera_in_world_coords {offsetX} [float] {offsetY} [float] {offsetZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EB2
function SanAndreasOpcodeCamera.getOffsetFromCameraInWorldCoords(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EBE
-- Instruction: locate_camera_distance_to_coordinates {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EBE
function SanAndreasOpcodeCamera.locateDistanceToCoordinates(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EC7
-- Instruction: [var alpha: float] = get_fade_alpha
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EC7
function SanAndreasOpcodeCamera.getFadeAlpha(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F0E
-- Instruction: [var startX: float], [var startY: float], [var startZ: float], [var endX: float], [var endY: float], [var endZ: float] = get_third_person_camera_target {range} [float] {sourceX} [float] {sourceY} [float] {sourceZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F0E
function SanAndreasOpcodeCamera.getThirdPersonTarget()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F10
-- Instruction: [var x: float], [var y: float], [var z: float] = get_active_camera_rotation
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F10
function SanAndreasOpcodeCamera.getActiveRotation()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F12
-- Instruction: [var activeCCam: int] = get_camera_struct {cCamera} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F12
function SanAndreasOpcodeCamera.getStruct()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F14
-- Instruction: [var x: float], [var y: float] = get_camera_rotation_input_values
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F14
function SanAndreasOpcodeCamera.getRotationInputValues()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F15
-- Instruction: set_camera_rotation_input_values {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F15
function SanAndreasOpcodeCamera.setRotationInputValues()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0679, SanAndreasOpcodeCamera.attachToVehicle, 'attach_camera_to_vehicle {handle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float] {tilt} [float] {switchStyle} [SwitchType]')
Opcode.register(0x067a, SanAndreasOpcodeCamera.attachToVehicleLookAtVehicle, 'attach_camera_to_vehicle_look_at_vehicle {handle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {vehicle} [Car] {tilt} [float] {switchStyle} [SwitchType]')
Opcode.register(0x067b, SanAndreasOpcodeCamera.attachToVehicleLookAtChar, 'attach_camera_to_vehicle_look_at_char {car} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {char} [Char] {tilt} [float] {switchStyle} [SwitchType]')
Opcode.register(0x067c, SanAndreasOpcodeCamera.attachToChar, 'attach_camera_to_char {handle} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float] {tilt} [float] {switchStyle} [SwitchType]')
Opcode.register(0x067d, SanAndreasOpcodeCamera.attachToCharLookAtVehicle, 'attach_camera_to_char_look_at_vehicle {char} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {vehicle} [Car] {tilt} [float] {switchStyle} [SwitchType]')
Opcode.register(0x067e, SanAndreasOpcodeCamera.attachToCharLookAtChar, 'attach_camera_to_char_look_at_char {handle} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {char} [Char] {tilt} [float] {switchStyle} [SwitchType]')
Opcode.register(0x068d, SanAndreasOpcodeCamera.getActiveCoordinates, '[var x: float], [var y: float], [var z: float] = get_active_camera_coordinates')
Opcode.register(0x068e, SanAndreasOpcodeCamera.getActivePointAt, '[var x: float], [var y: float], [var z: float] = get_active_camera_point_at')
Opcode.register(0x06e0, SanAndreasOpcodeCamera.setTwoPlayerMode, 'set_two_player_camera_mode {state} [bool]')
Opcode.register(0x0801, SanAndreasOpcodeCamera.getFov, '[var fov: float] = get_camera_fov')
Opcode.register(0x0822, SanAndreasOpcodeCamera.setFirstPersonInCarMode, 'set_first_person_in_car_camera_mode {state} [bool]')
Opcode.register(0x0834, SanAndreasOpcodeCamera.doBump, 'do_camera_bump {xOffset} [float] {yOffset} [float]')
Opcode.register(0x0920, SanAndreasOpcodeCamera.setVectorTrack, 'camera_set_vector_track {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {time} [int] {ease} [bool]')
Opcode.register(0x0922, SanAndreasOpcodeCamera.setLerpFov, 'camera_set_lerp_fov {from} [float] {to} [float] {time} [int] {ease} [bool]')
Opcode.register(0x0924, SanAndreasOpcodeCamera.setDarknessEffect, 'set_darkness_effect {enable} [bool] {pitchBlack} [int]')
Opcode.register(0x0925, SanAndreasOpcodeCamera.resetNewScriptables, 'camera_reset_new_scriptables')
Opcode.register(0x092f, SanAndreasOpcodeCamera.persistTrack, 'camera_persist_track {state} [bool]')
Opcode.register(0x0930, SanAndreasOpcodeCamera.persistPos, 'camera_persist_pos {state} [bool]')
Opcode.register(0x0931, SanAndreasOpcodeCamera.persistFov, 'camera_persist_fov {state} [bool]')
Opcode.register(0x0933, SanAndreasOpcodeCamera.isVectorMoveRunning, 'camera_is_vector_move_running')
Opcode.register(0x0934, SanAndreasOpcodeCamera.isVectorTrackRunning, 'camera_is_vector_track_running')
Opcode.register(0x0936, SanAndreasOpcodeCamera.setVectorMove, 'camera_set_vector_move {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {time} [int] {ease} [bool]')
Opcode.register(0x093d, SanAndreasOpcodeCamera.setCinema, 'set_cinema_camera {state} [bool]')
Opcode.register(0x0944, SanAndreasOpcodeCamera.setInFrontOfChar, 'set_camera_in_front_of_char {handle} [Char]')
Opcode.register(0x099c, SanAndreasOpcodeCamera.setShakeSimulationSimple, 'camera_set_shake_simulation_simple {type} [int] {timeInMs} [float] {intensity} [float]')
Opcode.register(0x09ad, SanAndreasOpcodeCamera.setPlayerInCarMode, 'set_player_in_car_camera_mode {mode} [int]')
Opcode.register(0x09ec, SanAndreasOpcodeCamera.allowFixedCollision, 'allow_fixed_camera_collision {state} [bool]')
Opcode.register(0x09ef, SanAndreasOpcodeCamera.setVehicleTweak, 'set_vehicle_camera_tweak {modelId} [model_vehicle] {distance} [float] {altitude} [float] {angle} [float]')
Opcode.register(0x09f0, SanAndreasOpcodeCamera.resetVehicleTweak, 'reset_vehicle_camera_tweak')
Opcode.register(0x0a1e, SanAndreasOpcodeCamera.takePhoto, 'take_photo {_p1} [bool]')
Opcode.register(0x0a25, SanAndreasOpcodeCamera.setPositionUnfixed, 'set_camera_position_unfixed {xOffset} [float] {yOffset} [float]')
Opcode.register(0x0a2f, SanAndreasOpcodeCamera.setPhotoEffect, 'set_photo_camera_effect {state} [bool]')
Opcode.register(0x0a39, SanAndreasOpcodeCamera.getPlayerInCarMode, '[var mode: int] = get_player_in_car_camera_mode')
Opcode.register(0x0e60, SanAndreasOpcodeCamera.setCameraControl, 'set_camera_control {state} [bool]')
Opcode.register(0x0e64, SanAndreasOpcodeCamera.getCurrentMode, '[var mode: CameraMode] = get_current_camera_mode')
Opcode.register(0x0eb2, SanAndreasOpcodeCamera.getOffsetFromCameraInWorldCoords, '[var x: float], [var y: float], [var z: float] = get_offset_from_camera_in_world_coords {offsetX} [float] {offsetY} [float] {offsetZ} [float]')
Opcode.register(0x0ebe, SanAndreasOpcodeCamera.locateDistanceToCoordinates, 'locate_camera_distance_to_coordinates {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x0ec7, SanAndreasOpcodeCamera.getFadeAlpha, '[var alpha: float] = get_fade_alpha')
Opcode.register(0x0f0e, SanAndreasOpcodeCamera.getThirdPersonTarget, '[var startX: float], [var startY: float], [var startZ: float], [var endX: float], [var endY: float], [var endZ: float] = get_third_person_camera_target {range} [float] {sourceX} [float] {sourceY} [float] {sourceZ} [float]')
Opcode.register(0x0f10, SanAndreasOpcodeCamera.getActiveRotation, '[var x: float], [var y: float], [var z: float] = get_active_camera_rotation')
Opcode.register(0x0f12, SanAndreasOpcodeCamera.getStruct, '[var activeCCam: int] = get_camera_struct {cCamera} [int]')
Opcode.register(0x0f14, SanAndreasOpcodeCamera.getRotationInputValues, '[var x: float], [var y: float] = get_camera_rotation_input_values')
Opcode.register(0x0f15, SanAndreasOpcodeCamera.setRotationInputValues, 'set_camera_rotation_input_values {x} [float] {y} [float]')
