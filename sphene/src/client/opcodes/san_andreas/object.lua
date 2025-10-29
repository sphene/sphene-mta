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
    return Script.storeValueAtIndex(2, object:getHealth())
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


Opcode.register(0x059f, SanAndreasOpcodeObject.getVelocity, '[var x: float], [var y: float], [var z: float] = get_object_velocity [Object]')
Opcode.register(0x05a1, SanAndreasOpcodeObject.addToRotationVelocity, 'add_to_object_rotation_velocity [Object] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x05a2, SanAndreasOpcodeObject.setRotationVelocity, 'set_object_rotation_velocity [Object] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x05a3, SanAndreasOpcodeObject.isStatic, 'is_object_static [Object]')
Opcode.register(0x05a6, SanAndreasOpcodeObject.getRotationVelocity, '[var x: float], [var y: float], [var z: float] = get_object_rotation_velocity [Object]')
Opcode.register(0x05a7, SanAndreasOpcodeObject.addVelocityRelative, 'add_velocity_relative_to_object_velocity [Object] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x05a8, SanAndreasOpcodeObject.getSpeed, '[var speed: float] = get_object_speed [Object]')
Opcode.register(0x0654, SanAndreasOpcodeObject.setRenderScorched, 'set_object_render_scorched [Object] {state} [bool]')
Opcode.register(0x0681, SanAndreasOpcodeObject.attachToCar, 'attach_object_to_car [Object] {handle} [Car] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]')
Opcode.register(0x0682, SanAndreasOpcodeObject.detach, 'detach_object [Object] {x} [float] {y} [float] {z} [float] {collisionDetection} [bool]')
Opcode.register(0x0685, SanAndreasOpcodeObject.isAttached, 'is_object_attached [Object]')
Opcode.register(0x069a, SanAndreasOpcodeObject.attachToObject, 'attach_object_to_object [Object] {handle} [Object] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]')
Opcode.register(0x069b, SanAndreasOpcodeObject.attachToChar, 'attach_object_to_char [Object] {handle} [Char] {xOffset} [float] {yOffset} [float] {zOffset} [float] {xRotation} [float] {yRotation} [float] {zRotation} [float]')
Opcode.register(0x071e, SanAndreasOpcodeObject.getHealth, '[var health: int] = get_object_health [Object]')
Opcode.register(0x071f, SanAndreasOpcodeObject.setHealth, 'set_object_health [Object] {health} [int]')
Opcode.register(0x0723, SanAndreasOpcodeObject.breakObject, 'break_object [Object] {intensity} [int]')
Opcode.register(0x0750, SanAndreasOpcodeObject.setVisible, 'set_object_visible [Object] {state} [bool]')
Opcode.register(0x075a, SanAndreasOpcodeObject.playAnim, 'play_object_anim [Object] {animationName} [string] {animationFile} [string] {frameDelta} [float] {lockF} [bool] {loop} [bool]')
Opcode.register(0x0796, SanAndreasOpcodeObject.getRopeHeight, '[var height: float] = get_rope_height_for_object [Object]')
Opcode.register(0x0797, SanAndreasOpcodeObject.setRopeHeight, 'set_rope_height_for_object [Object] {height} [float]')
Opcode.register(0x0798, SanAndreasOpcodeObject.grabEntityOnRope, '[var vehicle: Car], [var char: Char], [var object: Object] = grab_entity_on_rope_for_object [Object]')
Opcode.register(0x0799, SanAndreasOpcodeObject.releaseEntityFromRope, 'release_entity_from_rope_for_object [Object]')
Opcode.register(0x07c3, SanAndreasOpcodeObject.getQuaternion, '[var x: float], [var y: float], [var z: float], [var w: float] = get_object_quaternion [Object]')
Opcode.register(0x07c4, SanAndreasOpcodeObject.setQuaternion, 'set_object_quaternion [Object] {x} [float] {y} [float] {z} [float] {w} [float]')
Opcode.register(0x07f7, SanAndreasOpcodeObject.setCollisionDamageEffect, 'set_object_collision_damage_effect [Object] {state} [bool]')
Opcode.register(0x080a, SanAndreasOpcodeObject.getLevelDesignCoords, '[var x: float], [var y: float], [var z: float] = get_level_design_coords_for_object [Object] {nth} [int]')
Opcode.register(0x0815, SanAndreasOpcodeObject.setCoordinatesAndVelocity, 'set_object_coordinates_and_velocity [Object] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0827, SanAndreasOpcodeObject.connectLods, 'connect_lods [Object] {lodObject} [Object]')
Opcode.register(0x0833, SanAndreasOpcodeObject.hasBeenPhotographed, 'has_object_been_photographed [Object]')
Opcode.register(0x0836, SanAndreasOpcodeObject.setAnimSpeed, 'set_object_anim_speed [Object] {animationName} [string] {speed} [float]')
Opcode.register(0x0837, SanAndreasOpcodeObject.isPlayingAnim, 'is_object_playing_anim [Object] {animationName} [string]')
Opcode.register(0x0839, SanAndreasOpcodeObject.getAnimCurrentTime, '[var time: float] = get_object_anim_current_time [Object] {animationName} [string]')
Opcode.register(0x083a, SanAndreasOpcodeObject.setAnimCurrentTime, 'set_object_anim_current_time [Object] {animationName} [string] {time} [float]')
Opcode.register(0x0875, SanAndreasOpcodeObject.setOnlyDamagedByPlayer, 'set_object_only_damaged_by_player [Object] {state} [bool]')
Opcode.register(0x08d2, SanAndreasOpcodeObject.setScale, 'set_object_scale [Object] {scale} [float]')
Opcode.register(0x08e3, SanAndreasOpcodeObject.isInAngledArea2D, 'is_object_in_angled_area_2d [Object] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x08e4, SanAndreasOpcodeObject.isInAngledArea3D, 'is_object_in_angled_area_3d [Object] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x08e9, SanAndreasOpcodeObject.setAsStealable, 'set_object_as_stealable [Object] {state} [bool]')
Opcode.register(0x08ff, SanAndreasOpcodeObject.hasBeenDamagedByWeapon, 'has_object_been_damaged_by_weapon [Object] {weaponType} [WeaponType]')
Opcode.register(0x0900, SanAndreasOpcodeObject.clearLastWeaponDamage, 'clear_object_last_weapon_damage [Object]')
Opcode.register(0x0905, SanAndreasOpcodeObject.lockDoor, 'lock_door [Object] {state} [bool]')
Opcode.register(0x0906, SanAndreasOpcodeObject.setMass, 'set_object_mass [Object] {mass} [float]')
Opcode.register(0x0907, SanAndreasOpcodeObject.getMass, '[var mass: float] = get_object_mass [Object]')
Opcode.register(0x0908, SanAndreasOpcodeObject.setTurnMass, 'set_object_turn_mass [Object] {turnMass} [float]')
Opcode.register(0x0909, SanAndreasOpcodeObject.getTurnMass, '[var turnMass: float] = get_object_turn_mass [Object]')
Opcode.register(0x0916, SanAndreasOpcodeObject.winchCanPickUp, 'winch_can_pick_object_up [Object] {state} [bool]')
Opcode.register(0x095b, SanAndreasOpcodeObject.hasBeenUprooted, 'has_object_been_uprooted [Object]')
Opcode.register(0x0977, SanAndreasOpcodeObject.isWithinBrainActivationRange, 'is_object_within_brain_activation_range [Object]')
Opcode.register(0x0984, SanAndreasOpcodeObject.getModel, '[var model: int] = get_object_model [Object]')
Opcode.register(0x09a2, SanAndreasOpcodeObject.removeElegantly, 'remove_object_elegantly [Object]')
Opcode.register(0x09ca, SanAndreasOpcodeObject.setProofs, 'set_object_proofs [Object] {bulletProof} [bool] {fireProof} [bool] {explosionProof} [bool] {collisionProof} [bool] {meleeProof} [bool]')
Opcode.register(0x09cc, SanAndreasOpcodeObject.doesHaveThisModel, 'does_object_have_this_model [Object] {modelId} [model_any]')
Opcode.register(0x09fc, SanAndreasOpcodeObject.isIntersectingWorld, 'is_object_intersecting_world [Object]')
Opcode.register(0x0a0a, SanAndreasOpcodeObject.enableDisabledAttractors, 'enable_disabled_attractors_on_object [Object] {state} [bool]')
Opcode.register(0x0d11, SanAndreasOpcodeObject.setModelAlpha, 'set_object_model_alpha [Object] {alpha} [int]')
Opcode.register(0x0e01, SanAndreasOpcodeObject.createNoSave, '[var handle: Object] = create_object_no_save {modelId} [model_object] {x} [float] {y} [float] {z} [float] {useOffset} [bool] {useGround} [bool]')
Opcode.register(0x0e0c, SanAndreasOpcodeObject.isScriptControlled, 'is_object_script_controlled [Object]')
Opcode.register(0x0e0d, SanAndreasOpcodeObject.markAsNeeded, 'mark_object_as_needed [Object]')
Opcode.register(0x0e1a, SanAndreasOpcodeObject.initExtendedVars, 'init_extended_object_vars [Object] {identifier} [string] {totalVars} [int]')
Opcode.register(0x0e1b, SanAndreasOpcodeObject.setExtendedVar, 'set_extended_object_var [Object] {identifier} [string] {varNumber} [int] {value} [any]')
Opcode.register(0x0e1c, SanAndreasOpcodeObject.getExtendedVar, '[var value: any] = get_extended_object_var [Object] {identifier} [string] {varNumber} [int]')
Opcode.register(0x0e71, SanAndreasOpcodeObject.getDistanceFromCenterOfMassToBaseOfModel, '[var distance: float] = get_object_centre_of_mass_to_base_of_model [Object]')
Opcode.register(0x0e94, SanAndreasOpcodeObject.isReallyInAir, 'is_object_really_in_air [Object]')
Opcode.register(0x0e95, SanAndreasOpcodeObject.simulateDamage, 'simulate_object_damage [Object] {damage} [float] {weaponType} [WeaponType]')
Opcode.register(0x0eae, SanAndreasOpcodeObject.getProofs, '[var bullet: bool], [var fire: bool], [var explosion: bool], [var collision: bool], [var melee: bool] = get_object_proofs [Object]')
Opcode.register(0x0eca, SanAndreasOpcodeObject.getRandomSeed, '[var randomSeed: int] = get_object_random_seed [Object]')
Opcode.register(0x0ee9, SanAndreasOpcodeObject.locateDistanceToObject, 'locate_object_distance_to_object [Object] {object} [Object] {radius} [float]')
Opcode.register(0x0eec, SanAndreasOpcodeObject.locateDistanceToCoordinates, 'locate_object_distance_to_coordinates [Object] {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x0f03, SanAndreasOpcodeObject.createRenderObjectToObject, '[var renderobject: int] = create_render_object_to_object [Object] {modelId} [model_any] {x} [float] {y} [float] {z} [float] {rx} [float] {ry} [float] {rz} [float]')
Opcode.register(0x0f04, SanAndreasOpcodeObject.createRenderObjectToObjectFromSpecial, '[var renderobject: int] = create_render_object_to_object_from_special [Object] {specialModel} [int] {x} [float] {y} [float] {z} [float] {rx} [float] {ry} [float] {rz} [float]')
