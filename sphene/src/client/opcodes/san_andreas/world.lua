SanAndreasOpcodeWorld = {}
SanAndreasOpcodeWorld.__index = SanAndreasOpcodeWorld

-- Opcode: 0x02EE
-- Instruction: is_projectile_in_area {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02EE
function SanAndreasOpcodeWorld.isProjectileInArea(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0356
-- Instruction: is_explosion_in_area {explosionType} [ExplosionType] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0356
function SanAndreasOpcodeWorld.isExplosionInArea(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06BC
-- Instruction: fire_single_bullet {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {energy} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06BC
function SanAndreasOpcodeWorld.fireSingleBullet(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06BD
-- Instruction: is_line_of_sight_clear {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {buildings} [bool] {cars} [bool] {chars} [bool] {objects} [bool] {particles} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06BD
function SanAndreasOpcodeWorld.isLineOfSightClear(_, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06C3
-- Instruction: [var numFires: int] = get_number_of_fires_in_range {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06C3
function SanAndreasOpcodeWorld.getNumberOfFiresInRange(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06D9
-- Instruction: delete_mission_trains
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06D9
function SanAndreasOpcodeWorld.deleteMissionTrains(_)
    for _, train in pairs(TrainElement:all()) do
        train:destroy()
    end
end

-- Opcode: 0x06DB
-- Instruction: delete_all_trains
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06DB
function SanAndreasOpcodeWorld.deleteAllTrains()
    for _, train in pairs(TrainElement:all()) do
        train:destroy()
    end
end

-- Opcode: 0x0702
-- Instruction: [var percent: int] = get_percentage_tagged_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0702
function SanAndreasOpcodeWorld.getPercentageTaggedInArea(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0703
-- Instruction: set_tag_status_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {percent} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0703
function SanAndreasOpcodeWorld.setTagStatusInArea(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0716
-- Instruction: is_closest_object_of_type_smashed_or_damaged {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object] {smashed} [bool] {damaged} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0716
function SanAndreasOpcodeWorld.isClosestObjectOfTypeSmashedOrDamaged(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x072D
-- Instruction: is_flame_in_angled_area_2d {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/072D
function SanAndreasOpcodeWorld.isFlameInAngledArea2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x072E
-- Instruction: is_flame_in_angled_area_3d {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/072E
function SanAndreasOpcodeWorld.isFlameInAngledArea3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x073E
-- Instruction: [var handle: Car] = get_random_car_in_sphere_no_save {x} [float] {y} [float] {z} [float] {radius} [float] {model} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/073E
function SanAndreasOpcodeWorld.getRandomCarInSphereNoSave(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x073F
-- Instruction: [var handle: Char] = get_random_char_in_sphere {x} [float] {y} [float] {z} [float] {radius} [float] {civilian} [bool] {gang} [bool] {criminal} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/073F
function SanAndreasOpcodeWorld.getRandomCharInSphere(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0786
-- Instruction: [var numFires: int] = get_number_of_fires_in_area {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0786
function SanAndreasOpcodeWorld.getNumberOfFiresInArea(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07A6
-- Instruction: [var x: float], [var y: float], [var z: float] = get_nearest_tag_position {xCoord} [float] {yCoord} [float] {zCoord} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07A6
function SanAndreasOpcodeWorld.getNearestTagPosition(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07DF
-- Instruction: remove_oil_puddles_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07DF
function SanAndreasOpcodeWorld.removeOilPuddlesInArea(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07EF
-- Instruction: [var townId: Town] = get_city_from_coords {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07EF
function SanAndreasOpcodeWorld.getCityFromCoords(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07F0
-- Instruction: has_object_of_type_been_smashed {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07F0
function SanAndreasOpcodeWorld.hasObjectOfTypeBeenSmashed(x, y, z, radius, model)
    local objectName = Script.objectsById[math.abs(model - 1)]

    if (objectName) then
        model = engineGetModelIDFromName(objectName)
    else
        return false
    end

    for _, object in pairs(ObjectElement:all()) do
        local objectX, objectY, objectZ = object:getPosition()

        if (object:getModel() == model and object:isBroken()) then
            if (getDistanceBetweenPoints3D(objectX, objectY, objectZ, x, y, z) <= radius) then
                return true
            end
        end
    end

    return false
end

-- Opcode: 0x07FB
-- Instruction: switch_entry_exit {interiorName} [string] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07FB
function SanAndreasOpcodeWorld.switchEntryExit(_)
    -- What's this? Will leave it partially implemented for now. (GTX)
    -- : Makes the entrance marker visible / disable (Megadreams)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0810
-- Instruction: [var x: float], [var y: float], [var z: float] = get_parking_node_in_area {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0810
function SanAndreasOpcodeWorld.getParkingNodeInArea(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0814
-- Instruction: add_stunt_jump {startX} [float] {startY} [float] {startZ} [float] {startRadiusX} [float] {startRadiusY} [float] {startRadiusZ} [float] {finishX} [float] {finishY} [float] {finishZ} [float] {finishRadiusX} [float] {finishRadiusY} [float] {finishRadiusZ} [float] {cameraX} [float] {cameraY} [float] {cameraZ} [float] {reward} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0814
function SanAndreasOpcodeWorld.addStuntJump(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0830
-- Instruction: set_pool_table_coords {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0830
function SanAndreasOpcodeWorld.setPoolTableCoords(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0855
-- Instruction: [var level: float] = get_sound_level_at_coords {handle} [Char] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0855
function SanAndreasOpcodeWorld.getSoundLevelAtCoords(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x085A
-- Instruction: create_emergency_services_car {model} [model_vehicle] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/085A
function SanAndreasOpcodeWorld.createEmergencyServicesCar(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0866
-- Instruction: [var handle: Object] = get_closest_stealable_object {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0866
function SanAndreasOpcodeWorld.getClosestStealableObject(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0876
-- Instruction: create_birds {xFrom} [float] {yFrom} [float] {zFrom} [float] {xTo} [float] {yTo} [float] {zTo} [float] {quantity} [int] {type} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0876
function SanAndreasOpcodeWorld.createBirds(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x088D
-- Instruction: set_uses_collision_of_closest_object_of_type {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/088D
function SanAndreasOpcodeWorld.setUsesCollisionOfClosestObjectOfType(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x089E
-- Instruction: [var handle: Char] = get_random_char_in_sphere_only_drugs_buyers {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/089E
function SanAndreasOpcodeWorld.getRandomCharInSphereOnlyDrugsBuyers(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08E5
-- Instruction: [var handle: Char] = get_random_char_in_sphere_no_brain {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08E5
function SanAndreasOpcodeWorld.getRandomCharInSphereNoBrain(x, y, z, radius, _)
    return ActorElement.getActorInSphere(x, y, z, radius) or -1
end

-- Opcode: 0x08E7
-- Instruction: disable_all_entry_exits {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08E7
function SanAndreasOpcodeWorld.disableAllEntryExits(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x091C
-- Instruction: [var handle: Char] = get_user_of_closest_map_attractor {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object] {attractorName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/091C
function SanAndreasOpcodeWorld.getUserOfClosestMapAttractor(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x092E
-- Instruction: [var height: float] = get_water_height_at_coords {x} [float] {y} [float] {waves} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/092E
function SanAndreasOpcodeWorld.getWaterHeightAtCoords(x, y, ignoreWaves, _)
    local waterLevel = getWaterLevel(x, y, 1000)

    Script.setOpcodePartiallyImplemented()

    if (not waterLevel) then
        waterLevel = 0
    end

    return waterLevel
end

-- Opcode: 0x0971
-- Instruction: sync_water
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0971
function SanAndreasOpcodeWorld.syncWater()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0980
-- Instruction: extinguish_fire_at_point {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0980
function SanAndreasOpcodeWorld.extinguishFireAtPoint(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0985
-- Instruction: set_char_uses_collision_closest_object_of_type {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object] {state} [bool] {target} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0985
function SanAndreasOpcodeWorld.setCharUsesCollisionClosestObjectOfType(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0986
-- Instruction: clear_all_script_fire_flags
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0986
function SanAndreasOpcodeWorld.clearAllScriptFireFlags()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09B4
-- Instruction: set_closest_entry_exit_flag {x} [float] {y} [float] {radius} [float] {flag} [EntryexitsFlag] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09B4
function SanAndreasOpcodeWorld.setClosestEntryExitFlag(posX, posY, posZ, bitmask, flag)
    return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09C0
-- Instruction: [var vehicle: Car] = get_random_car_of_type_in_angled_area_no_save {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09C0
function SanAndreasOpcodeWorld.getRandomCarOfTypeInAngledAreaNoSave(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09C3
-- Instruction: is_cop_vehicle_in_area_3d_no_save {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09C3
function SanAndreasOpcodeWorld.isCopVehicleInArea3DNoSave(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09DA
-- Instruction: is_money_pickup_at_coords {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09DA
function SanAndreasOpcodeWorld.isMoneyPickupAtCoords(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A3E
-- Instruction: [var handle: Char] = get_random_char_in_area_offset_no_save {x} [float] {y} [float] {z} [float] {radiusX} [float] {radiusY} [float] {radiusZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A3E
function SanAndreasOpcodeWorld.getRandomCharInAreaOffsetNoSave(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A45
-- Instruction: set_railtrack_resistance_mult {mult} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A45
function SanAndreasOpcodeWorld.setRailtrackResistanceMult(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0AB6
-- Instruction: [var x: float], [var y: float], [var z: float] = get_target_blip_coords
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AB6
function SanAndreasOpcodeWorld.getTargetCoords(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E33
-- Instruction: [var handle: Pickup] = get_pickup_this_coord {x} [float] {y} [float] {z} [float] {onlyValid} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E33
function SanAndreasOpcodeWorld.getPickupThisCoord(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E3F
-- Instruction: [var x: float], [var y: float], [var sizeX: float], [var sizeY: float] = convert_3d_to_screen_2d {x} [float] {y} [float] {z} [float] {nearClip} [bool] {farClip} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E3F
function SanAndreasOpcodeWorld.convert3DToScreen2D(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EA6
-- Instruction: [var closestCop: Char] = get_closest_cop_near_pos {x} [float] {y} [float] {z} [float] {radius} [float] {alive} [bool] {inCar} [bool] {onFoot} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EA6
function SanAndreasOpcodeWorld.getClosestCopNearPos(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EA7
-- Instruction: [var progress: int], [var anyChar: Char] = get_any_char_no_save_recursive {progress} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EA7
function SanAndreasOpcodeWorld.getAnyCharNoSaveRecursive(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EA8
-- Instruction: [var progress: int], [var anyCar: Car] = get_any_car_no_save_recursive {progress} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EA8
function SanAndreasOpcodeWorld.getAnyCarNoSaveRecursive(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EA9
-- Instruction: [var progress: int], [var anyObject: Object] = get_any_object_no_save_recursive {progress} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EA9
function SanAndreasOpcodeWorld.getAnyObjectNoSaveRecursive(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EF0
-- Instruction: [var x: float], [var y: float] = get_coord_from_angled_distance {x} [float] {y} [float] {angle} [float] {distance} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EF0
function SanAndreasOpcodeWorld.getCoordFromAngledDistance(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 02ee=6,  projectile_in_cube %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x02ee, SanAndreasOpcodeWorld.isProjectileInArea, 6, 'is_projectile_in_area ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0356=7,  explosion_type %1d% in_cube %2d% %3d% %4d% %5d% %6d% %7d%
Opcode.register(0x0356, SanAndreasOpcodeWorld.isExplosionInArea, 7, 'is_explosion_in_area ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 06BC=7,create_M4_shoot_from %1d% %2d% %3d% target %4d% %5d% %6d% energy %7h%
Opcode.register(0x06bc, SanAndreasOpcodeWorld.fireSingleBullet, 7, 'fire_single_bullet ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 06BD=11,  no_obstacles_between %1d% %2d% %3d% and %4d% %5d% %6d% solid %7h% car %8h% actor %9h% object %10h% particle %11h%
Opcode.register(0x06bd, SanAndreasOpcodeWorld.isLineOfSightClear, 11, 'is_line_of_sight_clear ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11}', {false, false, false, false, false, false, false, false, false, false, false})
-- INI: 06C3=5,get_number_of_fires_within_sphere_at %1d% %2d% %3d% radius %4d% store_to %5d%
Opcode.register(0x06c3, SanAndreasOpcodeWorld.getNumberOfFiresInRange, 5, '${5} = get_number_of_fires_in_range ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 06D9=0,destroy_defined_trains
Opcode.register(0x06d9, SanAndreasOpcodeWorld.deleteMissionTrains, 0, 'delete_mission_trains', {})
-- INI: 06DB=0,destroy_all_trains
Opcode.register(0x06db, SanAndreasOpcodeWorld.deleteAllTrains, 0, 'delete_all_trains', {})
-- INI: 0702=5,%5d% = get_tags_painted_percentage_at %2d% %3d% %4d% %1d%
Opcode.register(0x0702, SanAndreasOpcodeWorld.getPercentageTaggedInArea, 5, '${5} = get_percentage_tagged_in_area ${2} ${3} ${4} ${1}', {false, false, false, false, true})
-- INI: 0703=5,set_tags_painted_percentage_at %1d% %2d% %3d% %4d% value %5h%
Opcode.register(0x0703, SanAndreasOpcodeWorld.setTagStatusInArea, 5, 'set_tag_status_in_area ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0716=7,  object_model %5o% in_object_group_at %1d% %2d% %3d% radius %4d% destroyed %6h% %7h%
Opcode.register(0x0716, SanAndreasOpcodeWorld.isClosestObjectOfTypeSmashedOrDamaged, 7, 'is_closest_object_of_type_smashed_or_damaged ${1} ${2} ${3} ${4} ${object.5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 072D=6,  is_flamethrower_fired_in_angled_area_2d %1d% %2d% to %3d% %4d% angle %5d% sphere %6h%
Opcode.register(0x072d, SanAndreasOpcodeWorld.isFlameInAngledArea2D, 6, 'is_flame_in_angled_area_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 072E=8,  is_flamethrower_fired_in_angled_area_3d %1d% %2d% %3d% to %4d% %5d% %6h% angle %7d% sphere %8d%
Opcode.register(0x072e, SanAndreasOpcodeWorld.isFlameInAngledArea3D, 8, 'is_flame_in_angled_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 073E=6,get_car_in_sphere %1d% %2d% %3d% radius %4d% model %5m% handle_as %6d%
Opcode.register(0x073e, SanAndreasOpcodeWorld.getRandomCarInSphereNoSave, 6, '${6} = get_random_car_in_sphere_no_save ${1} ${2} ${3} ${4} ${vehicle.5}', {false, false, false, false, false, true})
-- INI: 073F=8,get_actor_in_sphere %1d% %2d% %3d% radius %4d% with_pedtype_civilian %5h% gang %6h% criminal/prostitute %7h% handle_as %8d%
Opcode.register(0x073f, SanAndreasOpcodeWorld.getRandomCharInSphere, 8, '${8} = get_random_char_in_sphere ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false, true})
-- INI: 0786=7,get_number_of_fires_within_cube_cornerA %1d% %2d% %3d% cornerB %4d% %5d% %6d% store_to %7d%
Opcode.register(0x0786, SanAndreasOpcodeWorld.getNumberOfFiresInArea, 7, '${7} = get_number_of_fires_in_area ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 07A6=6,get_nearest_tag_location_near_point %1d% %2d% %3d% store_to %4d% %5d% %6d%
Opcode.register(0x07a6, SanAndreasOpcodeWorld.getNearestTagPosition, 6, '${4}, ${5}, ${6} = get_nearest_tag_position ${1} ${2} ${3}', {false, false, false, true, true, true})
-- INI: 07DF=4,unknown_rectangle_cornerA %1d% %2d% cornerB %3d% %4d%
Opcode.register(0x07df, SanAndreasOpcodeWorld.removeOilPuddlesInArea, 4, 'remove_oil_puddles_in_area ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 07EF=4,get_town_number_from_point %1d% %2d% %3d% store_to %4d%
Opcode.register(0x07ef, SanAndreasOpcodeWorld.getCityFromCoords, 4, '${4} = get_city_from_coords ${1} ${2} ${3}', {false, false, false, true})
-- INI: 07F0=5,  in_sphere %1d% %2d% %3d% radius %4d% damaged_object_with_model %5o%
Opcode.register(0x07f0, SanAndreasOpcodeWorld.hasObjectOfTypeBeenSmashed, 5, 'has_object_of_type_been_smashed ${1} ${2} ${3} ${4} ${object.5}', {false, false, false, false, false})
-- INI: 07FB=2,set_interior %1g% access %2h%
Opcode.register(0x07fb, SanAndreasOpcodeWorld.switchEntryExit, 2, 'switch_entry_exit ${1} ${2}', {false, false})
-- INI: 0810=9,store_random_parkplace_in_cube_cornerA %1d% %2d% %3d% cornerB %4d% %5d% %6d% position_to %7d% %8d% %9d%
Opcode.register(0x0810, SanAndreasOpcodeWorld.getParkingNodeInArea, 9, '${1}, ${2}, ${3} = get_parking_node_in_area ${4} ${5} ${6} ${7} ${8} ${9}', {true, true, true, true, true, true, true, true, true})
-- INI: 0814=16,define_unique_jump_start %1d% %2d% %3d% radius %4d% %5d% %6d% in_air_goal %7d% %8d% %9d% radius %10d% %11d% %12d% camera %13d% %14d% %15d% reward %16d%
Opcode.register(0x0814, SanAndreasOpcodeWorld.addStuntJump, 16, 'add_stunt_jump ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0830=6,create_pool_table_collision_cornerA %1d% %2d% %3d% cornerB %4d% %5d% %6d%
Opcode.register(0x0830, SanAndreasOpcodeWorld.setPoolTableCoords, 6, 'set_pool_table_coords ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0855=5,get_actor %1d% noise_level_at %2d% %3d% %4d% store_to %5d%
Opcode.register(0x0855, SanAndreasOpcodeWorld.getSoundLevelAtCoords, 5, '${5} = get_sound_level_at_coords ${2} ${3} ${4} ${1}', {false, false, false, false, true})
-- INI: 085A=4,spawn_emergency_vehicle_model %1o% on_street_nearest_to %2d% %3d% %4d%
Opcode.register(0x085a, SanAndreasOpcodeWorld.createEmergencyServicesCar, 4, 'create_emergency_services_car ${vehicle.1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0866=5,get_object_in_sphere %1d% %2d% %3d% radius %4d% handle_as %5d%
Opcode.register(0x0866, SanAndreasOpcodeWorld.getClosestStealableObject, 5, '${5} = get_closest_stealable_object ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 0876=8,unknown_cube_cornera %1d% %2d% %3d% cornerB %4d% %5d% %6d% flag %7h% flag %8h%
Opcode.register(0x0876, SanAndreasOpcodeWorld.createBirds, 8, 'create_birds ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 088D=6,set_objects_in_sphere %1d% %2d% %3d% radius %4d% with_model %5o% collision_detection %6h%
Opcode.register(0x088d, SanAndreasOpcodeWorld.setUsesCollisionOfClosestObjectOfType, 6, 'set_uses_collision_of_closest_object_of_type ${1} ${2} ${3} ${4} ${object.5} ${6}', {false, false, false, false, false, false})
-- INI: 089E=5,get_actor_that_buys_drugs_in_sphere %1d% %2d% %3d% radius %4d% handle_as %5d%
Opcode.register(0x089e, SanAndreasOpcodeWorld.getRandomCharInSphereOnlyDrugsBuyers, 5, '${5} = get_random_char_in_sphere_only_drugs_buyers ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 08E5=5,get_actor_in_sphere %1d% %2d% %3d% radius %4d% handle_as %5d%
Opcode.register(0x08e5, SanAndreasOpcodeWorld.getRandomCharInSphereNoBrain, 5, '${5} = get_random_char_in_sphere_no_brain ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 08E7=1,disable_entrance_markers %1h%
Opcode.register(0x08e7, SanAndreasOpcodeWorld.disableAllEntryExits, 1, 'disable_all_entry_exits ${1}', {false})
-- INI: 091C=7,get_actor_in_sphere %1d% %2d% %3d% radius %4d% model %5o% external_script_named %6h% handle_as %7d%
Opcode.register(0x091c, SanAndreasOpcodeWorld.getUserOfClosestMapAttractor, 7, '${7} = get_user_of_closest_map_attractor ${1} ${2} ${3} ${4} ${object.5} ${6}', {false, false, false, false, false, false, true})
-- INI: 092E=4,get_water_height_at %1d% %2d% ignore_waves %3h% store_to %4d%
Opcode.register(0x092e, SanAndreasOpcodeWorld.getWaterHeightAtCoords, 4, '${4} = get_water_height_at_coords ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0971=0,sync_water
Opcode.register(0x0971, SanAndreasOpcodeWorld.syncWater, 0, 'sync_water', {})
-- INI: 0980=4,extinguish_all_fires_at %1d% %2d% %3d% radius %4d%
Opcode.register(0x0980, SanAndreasOpcodeWorld.extinguishFireAtPoint, 4, 'extinguish_fire_at_point ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0985=7,set_objects_in_sphere %1d% %2d% %3d% radius %4d% with_model %5o% solid %6h% for_actor %7d%
Opcode.register(0x0985, SanAndreasOpcodeWorld.setCharUsesCollisionClosestObjectOfType, 7, 'set_char_uses_collision_closest_object_of_type ${1} ${2} ${3} ${4} ${object.5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 0986=0,remove_references_to_all_fires
Opcode.register(0x0986, SanAndreasOpcodeWorld.clearAllScriptFireFlags, 0, 'clear_all_script_fire_flags', {})
-- INI: 09B4=5,set_object_property_at %1d% %2d% radius %3d% bitmask %4d% flag %5h%
Opcode.register(0x09b4, SanAndreasOpcodeWorld.setClosestEntryExitFlag, 5, 'set_closest_entry_exit_flag ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 09C0=7,%7d% = get_random_car_in_area %1d% %2d% %3d% %4d% %5d% with_actors %6h%
Opcode.register(0x09c0, SanAndreasOpcodeWorld.getRandomCarOfTypeInAngledAreaNoSave, 7, '${7} = get_random_car_of_type_in_angled_area_no_save ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 09C3=6,  police_car_in_rectangle_cornerA %1d% %2d% %3d% cornerB %4d% %5d% %6d%
Opcode.register(0x09c3, SanAndreasOpcodeWorld.isCopVehicleInArea3DNoSave, 6, 'is_cop_vehicle_in_area_3d_no_save ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 09DA=3,  cash_pickup_at %1d% %2d% %3d%
Opcode.register(0x09da, SanAndreasOpcodeWorld.isMoneyPickupAtCoords, 3, 'is_money_pickup_at_coords ${1} ${2} ${3}', {false, false, false})
-- INI: 0A3E=7,unknown_get_actor_in_sphere %1d% %2d% %3d% radius %4d% %5d% %6d% handle_as %7d%
Opcode.register(0x0a3e, SanAndreasOpcodeWorld.getRandomCharInAreaOffsetNoSave, 7, '${7} = get_random_char_in_area_offset_no_save ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 0A45=1,set_rail_tracks_friction_to %1d%
Opcode.register(0x0a45, SanAndreasOpcodeWorld.setRailtrackResistanceMult, 1, 'set_railtrack_resistance_mult ${1}', {false})
-- INI: 0AB6=3,get_target_blip_coords_to %1d% %2d% %3d% // IF and SET
Opcode.register(0x0ab6, SanAndreasOpcodeWorld.getTargetCoords, 3, '${1}, ${2}, ${3} = get_target_blip_coords', {true, true, true})
-- INI: 0E33=5,get_pickup_this_coord %1d% %2d% %3d% only_available %4d% store_to %5d%
Opcode.register(0x0e33, SanAndreasOpcodeWorld.getPickupThisCoord, 5, '${5} = get_pickup_this_coord ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 0E3F=9,convert_3d_to_screen_2d %1d% %2d% %3d% checkNearClip %4d% checkFarClip %5d% store_2d_to %6d% %7d% size_to %8d% %9d%
Opcode.register(0x0e3f, SanAndreasOpcodeWorld.convert3DToScreen2D, 9, '${6}, ${7}, ${8}, ${9} = convert_3d_to_screen_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false, true, true, true, true})
-- INI: 0EA6=8,get_closest_cop_near_char %1d% %2d% %3d% radius %4d% alive %5d% in_car %6d% on_foot %7d% store_to %8d%
Opcode.register(0x0ea6, SanAndreasOpcodeWorld.getClosestCopNearPos, 8, '${8} = get_closest_cop_near_pos ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false, true})
-- INI: 0EA7=3,get_any_char_no_save_recursive %1d% progress_to %2d% char_to %3d%
Opcode.register(0x0ea7, SanAndreasOpcodeWorld.getAnyCharNoSaveRecursive, 3, '${2}, ${3} = get_any_char_no_save_recursive ${1}', {false, true, true})
-- INI: 0EA8=3,get_any_car_no_save_recursive %1d% progress_to %2d% car_to %3d%
Opcode.register(0x0ea8, SanAndreasOpcodeWorld.getAnyCarNoSaveRecursive, 3, '${2}, ${3} = get_any_car_no_save_recursive ${1}', {false, true, true})
-- INI: 0EA9=3,get_any_object_no_save_recursive %1d% progress_to %2d% object_to %3d%
Opcode.register(0x0ea9, SanAndreasOpcodeWorld.getAnyObjectNoSaveRecursive, 3, '${2}, ${3} = get_any_object_no_save_recursive ${1}', {false, true, true})
-- INI: 0EF0=6,get_coord_from_angled_distance %1d% %2d% angle %3d% dist %4d% store_to %5d% %6d%
Opcode.register(0x0ef0, SanAndreasOpcodeWorld.getCoordFromAngledDistance, 6, '${5}, ${6} = get_coord_from_angled_distance ${1} ${2} ${3} ${4}', {false, false, false, false, true, true})
