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


-- INI: 0679=9,put_camera_on_car %1d% with_offset %2d% %3d% %4d% rotation %5d% %6d% %7d% tilt %8d% switchstyle %9h%
Opcode.register(0x0679, SanAndreasOpcodeCamera.attachToVehicle, 9, 'attach_camera_to_vehicle ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 067A=7,put_camera_on_car %1d% with_offset %2d% %3d% %4d% point_to_car %5d% tilt %6d% switchstyle %7h%
Opcode.register(0x067a, SanAndreasOpcodeCamera.attachToVehicleLookAtVehicle, 7, 'attach_camera_to_vehicle_look_at_vehicle ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 067B=7,put_camera_on_car %1d% with_offset %2d% %3d% %4d% point_to_actor %5d% tilt %6d% %7h%
Opcode.register(0x067b, SanAndreasOpcodeCamera.attachToVehicleLookAtChar, 7, 'attach_camera_to_vehicle_look_at_char ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 067C=9,put_camera_on_actor %1d% offset %2d% %3d% %4d% rotation %5d% %6d% %7d% tilt %8d% switchstyle %9d%
Opcode.register(0x067c, SanAndreasOpcodeCamera.attachToChar, 9, 'attach_camera_to_char ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 067D=7,put_camera_on_actor %1d% offset %2d% %3d% %4d% target_car %5d% tilt %6d% switchstyle %7h%
Opcode.register(0x067d, SanAndreasOpcodeCamera.attachToCharLookAtVehicle, 7, 'attach_camera_to_char_look_at_vehicle ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 067E=7,put_camera_on_actor %1d% offset %2d% %3d% %4d% target_actor %5d% tilt %6d% switchstyle %7h%
Opcode.register(0x067e, SanAndreasOpcodeCamera.attachToCharLookAtChar, 7, 'attach_camera_to_char_look_at_char ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 068D=3,get_camera_position_to %1d% %2d% %3d%
Opcode.register(0x068d, SanAndreasOpcodeCamera.getActiveCoordinates, 3, '${1}, ${2}, ${3} = get_active_camera_coordinates', {true, true, true})
-- INI: 068E=3,get_camera_target_point_to %1d% %2d% %3d%
Opcode.register(0x068e, SanAndreasOpcodeCamera.getActivePointAt, 3, '${1}, ${2}, ${3} = get_active_camera_point_at', {true, true, true})
-- INI: 06E0=1,set_2_player_camera_mode_to %1h%
Opcode.register(0x06e0, SanAndreasOpcodeCamera.setTwoPlayerMode, 1, 'set_two_player_camera_mode ${1}', {false})
-- INI: 0801=1,get_camera_zoom_factor_to %1d% ; float
Opcode.register(0x0801, SanAndreasOpcodeCamera.getFov, 1, '${1} = get_camera_fov', {true})
-- INI: 0822=1,enable_camera_bumper_view %1h%
Opcode.register(0x0822, SanAndreasOpcodeCamera.setFirstPersonInCarMode, 1, 'set_first_person_in_car_camera_mode ${1}', {false})
-- INI: 0834=2,set_player_head_temporary_turn_rotation_Z %1d% rotation_Y %2d%
Opcode.register(0x0834, SanAndreasOpcodeCamera.doBump, 2, 'do_camera_bump ${1} ${2}', {false, false})
-- INI: 0920=8,point_camera %1d% %2d% %3d% transverse_to %4d% %5d% %6d% time %7d% smooth_transition %8h%
Opcode.register(0x0920, SanAndreasOpcodeCamera.setVectorTrack, 8, 'camera_set_vector_track ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0922=4,set_camera_zoom_from %1d% to %2d% timelimit %3d% smooth_transition %4h%
Opcode.register(0x0922, SanAndreasOpcodeCamera.setLerpFov, 4, 'camera_set_lerp_fov ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0924=2,enable_screen_darkness %1h% with_value %2h%
Opcode.register(0x0924, SanAndreasOpcodeCamera.setDarknessEffect, 2, 'set_darkness_effect ${1} ${2}', {false, false})
-- INI: 0925=0,restore_camera_to_user_defined
Opcode.register(0x0925, SanAndreasOpcodeCamera.resetNewScriptables, 0, 'camera_reset_new_scriptables', {})
-- INI: 092F=1,lock_camera_target_point %1h%
Opcode.register(0x092f, SanAndreasOpcodeCamera.persistTrack, 1, 'camera_persist_track ${1}', {false})
-- INI: 0930=1,lock_camera_position %1h%
Opcode.register(0x0930, SanAndreasOpcodeCamera.persistPos, 1, 'camera_persist_pos ${1}', {false})
-- INI: 0931=1,lock_camera_zoom %1h%
Opcode.register(0x0931, SanAndreasOpcodeCamera.persistFov, 1, 'camera_persist_fov ${1}', {false})
-- INI: 0933=0,  camera_position_manipulated
Opcode.register(0x0933, SanAndreasOpcodeCamera.isVectorMoveRunning, 0, 'camera_is_vector_move_running', {})
-- INI: 0934=0,  camera_target_point_manipulated
Opcode.register(0x0934, SanAndreasOpcodeCamera.isVectorTrackRunning, 0, 'camera_is_vector_track_running', {})
-- INI: 0936=8,set_camera %1d% %2d% %3d% position_to %4d% %5d% %6d% time %7d% smooth_transition %8h%
Opcode.register(0x0936, SanAndreasOpcodeCamera.setVectorMove, 8, 'camera_set_vector_move ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 093D=1,lock_camera_on_cinematic_view %1h%
Opcode.register(0x093d, SanAndreasOpcodeCamera.setCinema, 1, 'set_cinema_camera ${1}', {false})
-- INI: 0944=1,manipulate_weapon_camera %1d%
Opcode.register(0x0944, SanAndreasOpcodeCamera.setInFrontOfChar, 1, 'set_camera_in_front_of_char ${1}', {false})
-- INI: 099C=3,jiggle_camera type %1h% timelimit %2d% intensity %3d%
Opcode.register(0x099c, SanAndreasOpcodeCamera.setShakeSimulationSimple, 3, 'camera_set_shake_simulation_simple ${1} ${2} ${3}', {false, false, false})
-- INI: 09AD=1,set_vehicle_camera_mode %1h%
Opcode.register(0x09ad, SanAndreasOpcodeCamera.setPlayerInCarMode, 1, 'set_player_in_car_camera_mode ${1}', {false})
-- INI: 09EC=1,set_garages_leave_camera_alone %1d%
Opcode.register(0x09ec, SanAndreasOpcodeCamera.allowFixedCollision, 1, 'allow_fixed_camera_collision ${1}', {false})
-- INI: 09EF=4,set_behind_camera_autoposition_mode_for_car_model %1m% distance %2d% altitude_multiplier %3d% angle_X %4d%
Opcode.register(0x09ef, SanAndreasOpcodeCamera.setVehicleTweak, 4, 'set_vehicle_camera_tweak ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 09F0=0,restore_behind_camera_autoposition_mode_for_all_car_models
Opcode.register(0x09f0, SanAndreasOpcodeCamera.resetVehicleTweak, 0, 'reset_vehicle_camera_tweak', {})
-- INI: 0A1E=1,dump_screen %1h%
Opcode.register(0x0a1e, SanAndreasOpcodeCamera.takePhoto, 1, 'take_photo ${1}', {false})
-- INI: 0A25=2,set_camera_on_players_X_angle %1d% Z_angle %2d%
Opcode.register(0x0a25, SanAndreasOpcodeCamera.setPositionUnfixed, 2, 'set_camera_position_unfixed ${1} ${2}', {false, false})
-- INI: 0A2F=1,show_first_person_view %1h%
Opcode.register(0x0a2f, SanAndreasOpcodeCamera.setPhotoEffect, 1, 'set_photo_camera_effect ${1}', {false})
-- INI: 0A39=1,get_vehicle_camera_mode_to %1d%
Opcode.register(0x0a39, SanAndreasOpcodeCamera.getPlayerInCarMode, 1, '${1} = get_player_in_car_camera_mode', {true})
-- INI: 0E60=1,set_camera_control %1d%
Opcode.register(0x0e60, SanAndreasOpcodeCamera.setCameraControl, 1, 'set_camera_control ${1}', {false})
-- INI: 0E64=1,get_camera_mode %1d%
Opcode.register(0x0e64, SanAndreasOpcodeCamera.getCurrentMode, 1, '${1} = get_current_camera_mode', {true})
-- INI: 0EB2=6,get_offset_from_camera_in_world_coords %1d% %2d% %3d% store_to %4d% %5d% %6d%
Opcode.register(0x0eb2, SanAndreasOpcodeCamera.getOffsetFromCameraInWorldCoords, 6, '${4}, ${5}, ${6} = get_offset_from_camera_in_world_coords ${1} ${2} ${3}', {false, false, false, true, true, true})
-- INI: 0EBE=4,locate_camera_distance_to_coordinates %1d% %2d% %3d% radius %4d%
Opcode.register(0x0ebe, SanAndreasOpcodeCamera.locateDistanceToCoordinates, 4, 'locate_camera_distance_to_coordinates ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0EC7=1,get_fade_alpha %1d%
Opcode.register(0x0ec7, SanAndreasOpcodeCamera.getFadeAlpha, 1, '${1} = get_fade_alpha', {true})
Opcode.register(0x0f0e, SanAndreasOpcodeCamera.getThirdPersonTarget, 10, '${1}, ${2}, ${3}, ${4}, ${5}, ${6} = get_third_person_camera_target ${7} ${8} ${9} ${10}', {true, true, true, true, true, true, false, false, false, false})
Opcode.register(0x0f10, SanAndreasOpcodeCamera.getActiveRotation, 3, '${1}, ${2}, ${3} = get_active_camera_rotation', {true, true, true})
Opcode.register(0x0f12, SanAndreasOpcodeCamera.getStruct, 2, '${1} = get_camera_struct ${2}', {true, false})
Opcode.register(0x0f14, SanAndreasOpcodeCamera.getRotationInputValues, 2, '${1}, ${2} = get_camera_rotation_input_values', {true, true})
Opcode.register(0x0f15, SanAndreasOpcodeCamera.setRotationInputValues, 2, 'set_camera_rotation_input_values ${1} ${2}', {false, false})
