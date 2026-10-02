SanAndreasOpcodeObject = {}
SanAndreasOpcodeObject.__index = SanAndreasOpcodeObject

-- Opcode: 0x059F
-- Instruction: [var x: float], [var y: float], [var z: float] = get_object_velocity [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/059F
function SanAndreasOpcodeObject.getVelocity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05A1
-- Instruction: add_to_object_rotation_velocity [Object] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05A1
function SanAndreasOpcodeObject.addToRotationVelocity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05A2
-- Instruction: set_object_rotation_velocity [Object] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05A2
function SanAndreasOpcodeObject.setRotationVelocity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05A3
-- Instruction: is_object_static [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05A3
function SanAndreasOpcodeObject.isStatic(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05A6
-- Instruction: [var x: float], [var y: float], [var z: float] = get_object_rotation_velocity [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05A6
function SanAndreasOpcodeObject.getRotationVelocity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05A7
-- Instruction: add_velocity_relative_to_object_velocity [Object] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05A7
function SanAndreasOpcodeObject.addVelocityRelative(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x05A8
-- Instruction: [var speed: float] = get_object_speed [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05A8
function SanAndreasOpcodeObject.getSpeed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0654
-- Instruction: set_object_render_scorched [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0654
function SanAndreasOpcodeObject.setRenderScorched(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0681
-- Instruction: attach_object_to_car [Object] {handle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0681
function SanAndreasOpcodeObject.attachToCar(object, car, offsetX, offsetY, offsetZ, rotX, rotY, rotZ)
    object:attach(car, offsetX, offsetY, offsetZ, rotX, rotY, rotZ)
end

-- Opcode: 0x0682
-- Instruction: detach_object [Object] {x} [float] {y} [float] {z} [float] {collisionDetection} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0682
function SanAndreasOpcodeObject.detach(object, x, y, z, enableCollisions)
   object:detach()
   object:setPosition(x, y, z)
   object:setCollisionsEnabled((enableCollisions == 1))
end

-- Opcode: 0x0685
-- Instruction: is_object_attached [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0685
function SanAndreasOpcodeObject.isAttached(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x069A
-- Instruction: attach_object_to_object [Object] {handle} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/069A
function SanAndreasOpcodeObject.attachToObject(object, object2, offsetX, offsetY, offsetZ, rotX, rotY, rotZ)
    object:attach(object2, offsetX, offsetY, offsetZ, rotX, rotY, rotZ)
end

-- Opcode: 0x069B
-- Instruction: attach_object_to_char [Object] {handle} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/069B
function SanAndreasOpcodeObject.attachToChar(object, char, offsetX, offsetY, offsetZ, rotX, rotY, rotZ)
    object:attach(char, offsetX, offsetY, offsetZ, rotX, rotY, rotZ)
end

-- Opcode: 0x071E
-- Instruction: [var health: int] = get_object_health [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/071E
function SanAndreasOpcodeObject.getHealth(object, _)
    return object:getHealth()
end

-- Opcode: 0x071F
-- Instruction: set_object_health [Object] {health} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/071F
function SanAndreasOpcodeObject.setHealth(object, health)
    return object:setHealth(health)
end

-- Opcode: 0x0723
-- Instruction: break_object [Object] {intensity} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0723
function SanAndreasOpcodeObject.breakObject(object, intensity)
   return object:doBreak(intensity)
end

-- Opcode: 0x0750
-- Instruction: set_object_visible [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0750
function SanAndreasOpcodeObject.setVisible(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x075A
-- Instruction: play_object_anim [Object] {animationName} [string] {animationFile} [string] {frameDelta} [float] {lockF} [bool] {loop} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/075A
function SanAndreasOpcodeObject.playAnim(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0796
-- Instruction: [var height: float] = get_rope_height_for_object [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0796
function SanAndreasOpcodeObject.getRopeHeight(_, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0797
-- Instruction: set_rope_height_for_object [Object] {height} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0797
function SanAndreasOpcodeObject.setRopeHeight(_, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0798
-- Instruction: [var vehicle: Car], [var char: Char], [var object: Object] = grab_entity_on_rope_for_object [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0798
function SanAndreasOpcodeObject.grabEntityOnRope(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0799
-- Instruction: release_entity_from_rope_for_object [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0799
function SanAndreasOpcodeObject.releaseEntityFromRope(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07C3
-- Instruction: [var x: float], [var y: float], [var z: float], [var w: float] = get_object_quaternion [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07C3
function SanAndreasOpcodeObject.getQuaternion(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07C4
-- Instruction: set_object_quaternion [Object] {x} [float] {y} [float] {z} [float] {w} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07C4
function SanAndreasOpcodeObject.setQuaternion(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07F7
-- Instruction: set_object_collision_damage_effect [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07F7
function SanAndreasOpcodeObject.setCollisionDamageEffect(object, destructible)
    destructible = (destructible == 0) and false or true
    return object:setBreakable(destructible)
end

-- Opcode: 0x080A
-- Instruction: [var x: float], [var y: float], [var z: float] = get_level_design_coords_for_object [Object] {nth} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/080A
function SanAndreasOpcodeObject.getLevelDesignCoords(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0815
-- Instruction: set_object_coordinates_and_velocity [Object] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0815
function SanAndreasOpcodeObject.setCoordinatesAndVelocity(object, posX, posY, posZ)
    Script.setOpcodePartiallyImplemented()
    object:setPosition(posX, posY, posZ)
end

-- Opcode: 0x0827
-- Instruction: connect_lods [Object] {lodObject} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0827
function SanAndreasOpcodeObject.connectLods(object, lowLodObject)
    return object:setLowLODElement(lowLodObject)
end

-- Opcode: 0x0833
-- Instruction: has_object_been_photographed [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0833
function SanAndreasOpcodeObject.hasBeenPhotographed(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0836
-- Instruction: set_object_anim_speed [Object] {animationName} [string] {speed} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0836
function SanAndreasOpcodeObject.setAnimSpeed(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0837
-- Instruction: is_object_playing_anim [Object] {animationName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0837
function SanAndreasOpcodeObject.isPlayingAnim(_, _)
   Script.setOpcodePartiallyImplemented()
   return true
end

-- Opcode: 0x0839
-- Instruction: [var time: float] = get_object_anim_current_time [Object] {animationName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0839
function SanAndreasOpcodeObject.getAnimCurrentTime(_, _, _)
   Script.setOpcodePartiallyImplemented()
   return 1
end

-- Opcode: 0x083A
-- Instruction: set_object_anim_current_time [Object] {animationName} [string] {time} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/083A
function SanAndreasOpcodeObject.setAnimCurrentTime(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0875
-- Instruction: set_object_only_damaged_by_player [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0875
function SanAndreasOpcodeObject.setOnlyDamagedByPlayer(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08D2
-- Instruction: set_object_scale [Object] {scale} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08D2
function SanAndreasOpcodeObject.setScale(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08E3
-- Instruction: is_object_in_angled_area_2d [Object] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08E3
function SanAndreasOpcodeObject.isInAngledArea2D(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08E4
-- Instruction: is_object_in_angled_area_3d [Object] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08E4
function SanAndreasOpcodeObject.isInAngledArea3D(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08E9
-- Instruction: set_object_as_stealable [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08E9
function SanAndreasOpcodeObject.setAsStealable(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08FF
-- Instruction: has_object_been_damaged_by_weapon [Object] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08FF
function SanAndreasOpcodeObject.hasBeenDamagedByWeapon(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0900
-- Instruction: clear_object_last_weapon_damage [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0900
function SanAndreasOpcodeObject.clearLastWeaponDamage(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0905
-- Instruction: lock_door [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0905
function SanAndreasOpcodeObject.lockDoor(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0906
-- Instruction: set_object_mass [Object] {mass} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0906
function SanAndreasOpcodeObject.setMass(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0907
-- Instruction: [var mass: float] = get_object_mass [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0907
function SanAndreasOpcodeObject.getMass(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0908
-- Instruction: set_object_turn_mass [Object] {turnMass} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0908
function SanAndreasOpcodeObject.setTurnMass(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0909
-- Instruction: [var turnMass: float] = get_object_turn_mass [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0909
function SanAndreasOpcodeObject.getTurnMass(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0916
-- Instruction: winch_can_pick_object_up [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0916
function SanAndreasOpcodeObject.winchCanPickUp(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x095B
-- Instruction: has_object_been_uprooted [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/095B
function SanAndreasOpcodeObject.hasBeenUprooted(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0977
-- Instruction: is_object_within_brain_activation_range [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0977
function SanAndreasOpcodeObject.isWithinBrainActivationRange(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0984
-- Instruction: [var model: int] = get_object_model [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0984
function SanAndreasOpcodeObject.getModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09A2
-- Instruction: remove_object_elegantly [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09A2
function SanAndreasOpcodeObject.removeElegantly(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09CA
-- Instruction: set_object_proofs [Object] {bulletProof} [bool] {fireProof} [bool] {explosionProof} [bool] {collisionProof} [bool] {meleeProof} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09CA
function SanAndreasOpcodeObject.setProofs(object, bulletProof, fireProof, explosionProof, collisionProof, meleeProof)
    -- This needs to get implemented, I think it's essential to gameplay
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09CC
-- Instruction: does_object_have_this_model [Object] {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09CC
function SanAndreasOpcodeObject.doesHaveThisModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09FC
-- Instruction: is_object_intersecting_world [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09FC
function SanAndreasOpcodeObject.isIntersectingWorld(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A0A
-- Instruction: enable_disabled_attractors_on_object [Object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A0A
function SanAndreasOpcodeObject.enableDisabledAttractors(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D11
-- Instruction: set_object_model_alpha [Object] {alpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D11
function SanAndreasOpcodeObject.setModelAlpha(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E01
-- Instruction: [var handle: Object] = create_object_no_save {modelId} [model_object] {x} [float] {y} [float] {z} [float] {useOffset} [bool] {useGround} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E01
function SanAndreasOpcodeObject.createNoSave(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E0C
-- Instruction: is_object_script_controlled [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E0C
function SanAndreasOpcodeObject.isScriptControlled(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E0D
-- Instruction: mark_object_as_needed [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E0D
function SanAndreasOpcodeObject.markAsNeeded(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E1A
-- Instruction: init_extended_object_vars [Object] {identifier} [string] {totalVars} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E1A
function SanAndreasOpcodeObject.initExtendedVars(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E1B
-- Instruction: set_extended_object_var [Object] {identifier} [string] {varNumber} [int] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E1B
function SanAndreasOpcodeObject.setExtendedVar(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E1C
-- Instruction: [var value: any] = get_extended_object_var [Object] {identifier} [string] {varNumber} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E1C
function SanAndreasOpcodeObject.getExtendedVar(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E71
-- Instruction: [var distance: float] = get_object_centre_of_mass_to_base_of_model [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E71
function SanAndreasOpcodeObject.getDistanceFromCenterOfMassToBaseOfModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E94
-- Instruction: is_object_really_in_air [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E94
function SanAndreasOpcodeObject.isReallyInAir(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E95
-- Instruction: simulate_object_damage [Object] {damage} [float] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E95
function SanAndreasOpcodeObject.simulateDamage(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EAE
-- Instruction: [var bullet: bool], [var fire: bool], [var explosion: bool], [var collision: bool], [var melee: bool] = get_object_proofs [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EAE
function SanAndreasOpcodeObject.getProofs(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ECA
-- Instruction: [var randomSeed: int] = get_object_random_seed [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ECA
function SanAndreasOpcodeObject.getRandomSeed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EE9
-- Instruction: locate_object_distance_to_object [Object] {object} [Object] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EE9
function SanAndreasOpcodeObject.locateDistanceToObject(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EEC
-- Instruction: locate_object_distance_to_coordinates [Object] {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EEC
function SanAndreasOpcodeObject.locateDistanceToCoordinates(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F03
-- Instruction: [var renderobject: int] = create_render_object_to_object [Object] {modelId} [model_any] {x} [float] {y} [float] {z} [float] {rx} [float] {ry} [float] {rz} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F03
function SanAndreasOpcodeObject.createRenderObjectToObject()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F04
-- Instruction: [var renderobject: int] = create_render_object_to_object_from_special [Object] {specialModel} [int] {x} [float] {y} [float] {z} [float] {rx} [float] {ry} [float] {rz} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F04
function SanAndreasOpcodeObject.createRenderObjectToObjectFromSpecial()
   return Script.setOpcodeUnimplemented()
end


-- INI: 059f=4,get_object %1d% velocity %2d% %3d% %4d%  ;; never used in VC
Opcode.register(0x059f, SanAndreasOpcodeObject.getVelocity, 4, '${2}, ${3}, ${4} = get_object_velocity ${1}', {false, true, true, true})
-- INI: 05a1=4,set_object %1d% rotation_velocity_about_an_axis %2d% %3d% %4d%  ;; never used in VC
Opcode.register(0x05a1, SanAndreasOpcodeObject.addToRotationVelocity, 4, 'add_to_object_rotation_velocity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 05a2=4,set_object %1d% rotation_velocity_about_an_axis %2d% %3d% %4d%  ;; never used in VC
Opcode.register(0x05a2, SanAndreasOpcodeObject.setRotationVelocity, 4, 'set_object_rotation_velocity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 05a3=1,  object %1d% stopped  ;; never used in VC
Opcode.register(0x05a3, SanAndreasOpcodeObject.isStatic, 1, 'is_object_static ${1}', {false})
-- INI: 05a6=4,get_object %1d% rotation_velocity %2d% %3d% %4d%  ;; never used in VC
Opcode.register(0x05a6, SanAndreasOpcodeObject.getRotationVelocity, 4, '${2}, ${3}, ${4} = get_object_rotation_velocity ${1}', {false, true, true, true})
-- INI: 05a7=4,set_object %1d% velocity %2d% %3d% %4d%  ;; never used in VC
Opcode.register(0x05a7, SanAndreasOpcodeObject.addVelocityRelative, 4, 'add_velocity_relative_to_object_velocity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 05a8=2,get_object %1d% speed_to %2d%  ;; never used in VC
Opcode.register(0x05a8, SanAndreasOpcodeObject.getSpeed, 2, '${2} = get_object_speed ${1}', {false, true})
-- INI: 0654=2,make_object %1d% fireproof %2h%
Opcode.register(0x0654, SanAndreasOpcodeObject.setRenderScorched, 2, 'set_object_render_scorched ${1} ${2}', {false, false})
-- INI: 0681=8,attach_object %1d% to_car %2d% with_offset %3d% %4d% %5d% rotation %6d% %7d% %8d%
Opcode.register(0x0681, SanAndreasOpcodeObject.attachToCar, 8, 'attach_object_to_car ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0682=5,detach_object %1d% %2d% %3d% %4d% collision_detection %5h%
Opcode.register(0x0682, SanAndreasOpcodeObject.detach, 5, 'detach_object ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0685=1,  object %1d% attached
Opcode.register(0x0685, SanAndreasOpcodeObject.isAttached, 1, 'is_object_attached ${1}', {false})
-- INI: 069A=8,attach_object %1d% to_object %2d% with_offset %3d% %4d% %5d% rotation %6d% %7d% %8d%
Opcode.register(0x069a, SanAndreasOpcodeObject.attachToObject, 8, 'attach_object_to_object ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 069B=8,attach_object %1d% to_actor %2d% with_offset %3d% %4d% %5d% rotation %6d% %7d% %8d%
Opcode.register(0x069b, SanAndreasOpcodeObject.attachToChar, 8, 'attach_object_to_char ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 071E=2,get_object %1d% health_to %2d%
Opcode.register(0x071e, SanAndreasOpcodeObject.getHealth, 2, '${1} = get_object_health ${2}', {false, false})
-- INI: 071F=2,set_object %1d% health_to %2h%
Opcode.register(0x071f, SanAndreasOpcodeObject.setHealth, 2, 'set_object_health ${1} ${2}', {false, false})
-- INI: 0723=2,break_object %1d% intensity %2h%
Opcode.register(0x0723, SanAndreasOpcodeObject.breakObject, 2, 'break_object ${1} ${2}', {false, false})
-- INI: 0750=2,set_object %1d% visibility %2h%
Opcode.register(0x0750, SanAndreasOpcodeObject.setVisible, 2, 'set_object_visible ${1} ${2}', {false, false})
-- INI: 075A=6,set_object %1d% animation %2h% IFP_file %3h% %4d% lockF %5h% loop %6h% ; IF AND SET
Opcode.register(0x075a, SanAndreasOpcodeObject.playAnim, 6, 'play_object_anim ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0796=2,get_crane_magnet %1d% magnet_lane_length_to %2d% ; float
Opcode.register(0x0796, SanAndreasOpcodeObject.getRopeHeight, 2, '${2} = get_rope_height_for_object ${1}', {false, true})
-- INI: 0797=2,set_crane_magnet %1d% magnet_lane_length_to %2d% ; float
Opcode.register(0x0797, SanAndreasOpcodeObject.setRopeHeight, 2, 'set_rope_height_for_object ${1} ${2}', {false, true})
-- INI: 0798=4,get_crane_magnet %1d% attached_car_handle_to %2d% attached_actor_handle_to %3d% attached_object_handle_to %4d%
Opcode.register(0x0798, SanAndreasOpcodeObject.grabEntityOnRope, 4, '${2}, ${3}, ${4} = grab_entity_on_rope_for_object ${1}', {false, true, true, true})
-- INI: 0799=1,set_crane_magnet %1d% release_stuff_from_magnet
Opcode.register(0x0799, SanAndreasOpcodeObject.releaseEntityFromRope, 1, 'release_entity_from_rope_for_object ${1}', {false})
-- INI: 07C3=5,get_object %1d% axis_angle_relation_to %2d% %3d% %4d% %5d%
Opcode.register(0x07c3, SanAndreasOpcodeObject.getQuaternion, 5, '${2}, ${3}, ${4}, ${5} = get_object_quaternion ${1}', {false, true, true, true, true})
-- INI: 07C4=5,set_object %1d% axis_angle_relation_to %2d% %3d% %4d% %5d%
Opcode.register(0x07c4, SanAndreasOpcodeObject.setQuaternion, 5, 'set_object_quaternion ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 07F7=2,set_object %1d% destructible %2h%
Opcode.register(0x07f7, SanAndreasOpcodeObject.setCollisionDamageEffect, 2, 'set_object_collision_damage_effect ${1} ${2}', {false, false})
-- INI: 080A=5,get_object %1d% spoot %2h% store_to %3d% %4d% %5d%
Opcode.register(0x080a, SanAndreasOpcodeObject.getLevelDesignCoords, 5, '${3}, ${4}, ${5} = get_level_design_coords_for_object ${1} ${2}', {false, false, true, true, true})
-- INI: 0815=4,put_object %1d% at %2d% %3d% %4d% and_keep_rotation
Opcode.register(0x0815, SanAndreasOpcodeObject.setCoordinatesAndVelocity, 4, 'set_object_coordinates_and_velocity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0827=2,assign_object %1d% to_lod_object %2d%
Opcode.register(0x0827, SanAndreasOpcodeObject.connectLods, 2, 'connect_lods ${1} ${2}', {false, false})
-- INI: 0833=1,  object %1d% photographed
Opcode.register(0x0833, SanAndreasOpcodeObject.hasBeenPhotographed, 1, 'has_object_been_photographed ${1}', {false})
-- INI: 0836=3,set_object %1d% animation %2h% at %3d% times_normal_rate
Opcode.register(0x0836, SanAndreasOpcodeObject.setAnimSpeed, 3, 'set_object_anim_speed ${1} ${2} ${3}', {false, false, false})
-- INI: 0837=2,  object %1d% animation == %2h%
Opcode.register(0x0837, SanAndreasOpcodeObject.isPlayingAnim, 2, 'is_object_playing_anim ${1} ${2}', {false, false})
-- INI: 0839=3,get_object %1d% animation %2h% progress_to %3d%
Opcode.register(0x0839, SanAndreasOpcodeObject.getAnimCurrentTime, 3, '${3} = get_object_anim_current_time ${1} ${2}', {false, false, true})
-- INI: 083A=3,set_object %1d% animation %2h% progress_to %3d%
Opcode.register(0x083a, SanAndreasOpcodeObject.setAnimCurrentTime, 3, 'set_object_anim_current_time ${1} ${2} ${3}', {false, false, false})
-- INI: 0875=2,set_object %1d% immune_to_nonplayer %2h%
Opcode.register(0x0875, SanAndreasOpcodeObject.setOnlyDamagedByPlayer, 2, 'set_object_only_damaged_by_player ${1} ${2}', {false, false})
-- INI: 08D2=2,object %1d% scale_model %2d%
Opcode.register(0x08d2, SanAndreasOpcodeObject.setScale, 2, 'set_object_scale ${1} ${2}', {false, false})
-- INI: 08E3=7,  object %1d% sphere %7h% in_rectangle_ll_corner_at %2d% %3d% lr_corner_at %4d% %5d% radius %6d%
Opcode.register(0x08e3, SanAndreasOpcodeObject.isInAngledArea2D, 7, 'is_object_in_angled_area_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 08E4=9,  object %1d% in_cube_fll_corner_at %2d% %3d% %4d% fur_corner_at %5d% %6d% %7d% depth %8d% flag %9h%
Opcode.register(0x08e4, SanAndreasOpcodeObject.isInAngledArea3D, 9, 'is_object_in_angled_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 08E9=2,set_object %1d% liftable %2h%
Opcode.register(0x08e9, SanAndreasOpcodeObject.setAsStealable, 2, 'set_object_as_stealable ${1} ${2}', {false, false})
-- INI: 08FF=2,  object %1d% received_damage_type %2h%
Opcode.register(0x08ff, SanAndreasOpcodeObject.hasBeenDamagedByWeapon, 2, 'has_object_been_damaged_by_weapon ${1} ${2}', {false, false})
-- INI: 0900=1,clear_object %1d% last_weapon_damage
Opcode.register(0x0900, SanAndreasOpcodeObject.clearLastWeaponDamage, 1, 'clear_object_last_weapon_damage ${1}', {false})
-- INI: 0905=2,set_door %1d% lock %2h%
Opcode.register(0x0905, SanAndreasOpcodeObject.lockDoor, 2, 'lock_door ${1} ${2}', {false, false})
-- INI: 0906=2,set_object %1d% mass_to %2d% ; float
Opcode.register(0x0906, SanAndreasOpcodeObject.setMass, 2, 'set_object_mass ${1} ${2}', {false, true})
-- INI: 0907=2,get_object %1d% mass_to %2d% ; float
Opcode.register(0x0907, SanAndreasOpcodeObject.getMass, 2, '${2} = get_object_mass ${1}', {false, true})
-- INI: 0908=2,set_object %1d% turn_mass_to %2d% ; float
Opcode.register(0x0908, SanAndreasOpcodeObject.setTurnMass, 2, 'set_object_turn_mass ${1} ${2}', {false, true})
-- INI: 0909=2,get_object %1d% turn_mass_to %2d% ; float
Opcode.register(0x0909, SanAndreasOpcodeObject.getTurnMass, 2, '${2} = get_object_turn_mass ${1}', {false, true})
-- INI: 0916=2,set_object %1d% attractive_to_magnet %2h%
Opcode.register(0x0916, SanAndreasOpcodeObject.winchCanPickUp, 2, 'winch_can_pick_object_up ${1} ${2}', {false, true})
-- INI: 095B=1,  is_object_moveable %1d%
Opcode.register(0x095b, SanAndreasOpcodeObject.hasBeenUprooted, 1, 'has_object_been_uprooted ${1}', {false})
-- INI: 0977=1,  player_in_radius_of_object %1d% external_script_trigger
Opcode.register(0x0977, SanAndreasOpcodeObject.isWithinBrainActivationRange, 1, 'is_object_within_brain_activation_range ${1}', {false})
-- INI: 0984=2,%2d% = object %1d% model
Opcode.register(0x0984, SanAndreasOpcodeObject.getModel, 2, '${2} = get_object_model ${1}', {false, true})
-- INI: 09A2=1,destroy_object_with_fade %1d%
Opcode.register(0x09a2, SanAndreasOpcodeObject.removeElegantly, 1, 'remove_object_elegantly ${1}', {false})
-- INI: 09CA=6,set_object %1d% immunities BP %2h% FP %3h% EP %4h% CP %5h% MP %6h%
Opcode.register(0x09ca, SanAndreasOpcodeObject.setProofs, 6, 'set_object_proofs ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 09CC=2,  object %1d% model %2o%
Opcode.register(0x09cc, SanAndreasOpcodeObject.doesHaveThisModel, 2, 'does_object_have_this_model ${1} ${object.2}', {false, false})
-- INI: 09FC=1,  anything_entered_objects_position %1d%
Opcode.register(0x09fc, SanAndreasOpcodeObject.isIntersectingWorld, 1, 'is_object_intersecting_world ${1}', {false})
-- INI: 0A0A=2,unknown_object %1d% flag %2h%
Opcode.register(0x0a0a, SanAndreasOpcodeObject.enableDisabledAttractors, 2, 'enable_disabled_attractors_on_object ${1} ${2}', {false, false})
-- INI: 0D11=2,set_object %1d% model_alpha %2d% // IF and SET
Opcode.register(0x0d11, SanAndreasOpcodeObject.setModelAlpha, 2, 'set_object_model_alpha ${1} ${2}', {false, false})
-- INI: 0E01=7,create_object_no_save %1o% at %2d% %3d% %4d% offset %5d% ground %6d% to %7d%
Opcode.register(0x0e01, SanAndreasOpcodeObject.createNoSave, 7, '${7} = create_object_no_save ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 0E0C=1,is_object_script_controlled %1d%
Opcode.register(0x0e0c, SanAndreasOpcodeObject.isScriptControlled, 1, 'is_object_script_controlled ${1}', {false})
-- INI: 0E0D=1,mark_object_as_needed %1d%
Opcode.register(0x0e0d, SanAndreasOpcodeObject.markAsNeeded, 1, 'mark_object_as_needed ${1}', {false})
-- INI: 0E1A=3,init_extended_object_vars %1d% id %2d% new_vars %3d%
Opcode.register(0x0e1a, SanAndreasOpcodeObject.initExtendedVars, 3, 'init_extended_object_vars ${1} ${2} ${3}', {false, false, false})
-- INI: 0E1B=4,set_extended_object_var %1d% id %2d% var %3d% value %4d%
Opcode.register(0x0e1b, SanAndreasOpcodeObject.setExtendedVar, 4, 'set_extended_object_var ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0E1C=4,get_extended_object_var %1d% id %2d% var %3d% to %4d%
Opcode.register(0x0e1c, SanAndreasOpcodeObject.getExtendedVar, 4, '${4} = get_extended_object_var ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0E71=2,get_object_centre_of_mass_to_base_of_model %1d% %2d%
Opcode.register(0x0e71, SanAndreasOpcodeObject.getDistanceFromCenterOfMassToBaseOfModel, 2, '${1} = get_object_centre_of_mass_to_base_of_model ${2}', {false, false})
-- INI: 0E94=1,is_object_really_in_air %1d%
Opcode.register(0x0e94, SanAndreasOpcodeObject.isReallyInAir, 1, 'is_object_really_in_air ${1}', {false})
-- INI: 0E95=3,simulate_object_damage %1d% damage %2d% type %3d%
Opcode.register(0x0e95, SanAndreasOpcodeObject.simulateDamage, 3, 'simulate_object_damage ${1} ${2} ${3}', {false, false, false})
-- INI: 0EAE=6,get_object_proofs %1d% bullet %2d% fire %3d% explosion %4d% collision %5d% melee %6d%
Opcode.register(0x0eae, SanAndreasOpcodeObject.getProofs, 6, '${2}, ${3}, ${4}, ${5}, ${6} = get_object_proofs ${1}', {false, true, true, true, true, true})
-- INI: 0ECA=2,get_object_random_seed %1d% store_to %2d%
Opcode.register(0x0eca, SanAndreasOpcodeObject.getRandomSeed, 2, '${1} = get_object_random_seed ${2}', {true, false})
-- INI: 0EE9=3,locate_object_distance_to_object %1d% object %2d% radius %3d%
Opcode.register(0x0ee9, SanAndreasOpcodeObject.locateDistanceToObject, 3, 'locate_object_distance_to_object ${1} ${2} ${3}', {false, false, false})
-- INI: 0EEC=5,locate_object_distance_to_coordinates %1d% pos %2d% %3d% %4d% radius %5d%
Opcode.register(0x0eec, SanAndreasOpcodeObject.locateDistanceToCoordinates, 5, 'locate_object_distance_to_coordinates ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
Opcode.register(0x0f03, SanAndreasOpcodeObject.createRenderObjectToObject, 9, '${1} = create_render_object_to_object [Object] ${2} ${3} ${4} ${5} ${6} ${7} ${8}')
Opcode.register(0x0f04, SanAndreasOpcodeObject.createRenderObjectToObjectFromSpecial, 9, '${1} = create_render_object_to_object_from_special [Object] ${2} ${3} ${4} ${5} ${6} ${7} ${8}')
