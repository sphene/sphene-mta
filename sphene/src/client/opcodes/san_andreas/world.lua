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
    Script.storeValueAtIndex(5, ActorElement.getActorInSphere(x, y, z, radius) or -1)
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

    Script.storeValueAtIndex(4, waterLevel)
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
    return Script.setOpcodePartiallyImplemented()
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


Opcode.register(0x02ee, SanAndreasOpcodeWorld.isProjectileInArea, 'is_projectile_in_area {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x0356, SanAndreasOpcodeWorld.isExplosionInArea, 'is_explosion_in_area {explosionType} [ExplosionType] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x06bc, SanAndreasOpcodeWorld.fireSingleBullet, 'fire_single_bullet {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {energy} [int]')
Opcode.register(0x06bd, SanAndreasOpcodeWorld.isLineOfSightClear, 'is_line_of_sight_clear {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {buildings} [bool] {cars} [bool] {chars} [bool] {objects} [bool] {particles} [bool]')
Opcode.register(0x06c3, SanAndreasOpcodeWorld.getNumberOfFiresInRange, '[var numFires: int] = get_number_of_fires_in_range {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x06d9, SanAndreasOpcodeWorld.deleteMissionTrains, 'delete_mission_trains')
Opcode.register(0x06db, SanAndreasOpcodeWorld.deleteAllTrains, 'delete_all_trains')
Opcode.register(0x0702, SanAndreasOpcodeWorld.getPercentageTaggedInArea, '[var percent: int] = get_percentage_tagged_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float]')
Opcode.register(0x0703, SanAndreasOpcodeWorld.setTagStatusInArea, 'set_tag_status_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {percent} [int]')
Opcode.register(0x0716, SanAndreasOpcodeWorld.isClosestObjectOfTypeSmashedOrDamaged, 'is_closest_object_of_type_smashed_or_damaged {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object] {smashed} [bool] {damaged} [bool]')
Opcode.register(0x072d, SanAndreasOpcodeWorld.isFlameInAngledArea2D, 'is_flame_in_angled_area_2d {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x072e, SanAndreasOpcodeWorld.isFlameInAngledArea3D, 'is_flame_in_angled_area_3d {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x073e, SanAndreasOpcodeWorld.getRandomCarInSphereNoSave, '[var handle: Car] = get_random_car_in_sphere_no_save {x} [float] {y} [float] {z} [float] {radius} [float] {model} [model_vehicle]')
Opcode.register(0x073f, SanAndreasOpcodeWorld.getRandomCharInSphere, '[var handle: Char] = get_random_char_in_sphere {x} [float] {y} [float] {z} [float] {radius} [float] {civilian} [bool] {gang} [bool] {criminal} [bool]')
Opcode.register(0x0786, SanAndreasOpcodeWorld.getNumberOfFiresInArea, '[var numFires: int] = get_number_of_fires_in_area {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x07a6, SanAndreasOpcodeWorld.getNearestTagPosition, '[var x: float], [var y: float], [var z: float] = get_nearest_tag_position {xCoord} [float] {yCoord} [float] {zCoord} [float]')
Opcode.register(0x07df, SanAndreasOpcodeWorld.removeOilPuddlesInArea, 'remove_oil_puddles_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float]')
Opcode.register(0x07ef, SanAndreasOpcodeWorld.getCityFromCoords, '[var townId: Town] = get_city_from_coords {x} [float] {y} [float] {z} [float]')
Opcode.register(0x07f0, SanAndreasOpcodeWorld.hasObjectOfTypeBeenSmashed, 'has_object_of_type_been_smashed {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object]')
Opcode.register(0x07fb, SanAndreasOpcodeWorld.switchEntryExit, 'switch_entry_exit {interiorName} [string] {state} [bool]')
Opcode.register(0x0810, SanAndreasOpcodeWorld.getParkingNodeInArea, '[var x: float], [var y: float], [var z: float] = get_parking_node_in_area {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x0814, SanAndreasOpcodeWorld.addStuntJump, 'add_stunt_jump {startX} [float] {startY} [float] {startZ} [float] {startRadiusX} [float] {startRadiusY} [float] {startRadiusZ} [float] {finishX} [float] {finishY} [float] {finishZ} [float] {finishRadiusX} [float] {finishRadiusY} [float] {finishRadiusZ} [float] {cameraX} [float] {cameraY} [float] {cameraZ} [float] {reward} [int]')
Opcode.register(0x0830, SanAndreasOpcodeWorld.setPoolTableCoords, 'set_pool_table_coords {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x0855, SanAndreasOpcodeWorld.getSoundLevelAtCoords, '[var level: float] = get_sound_level_at_coords {handle} [Char] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x085a, SanAndreasOpcodeWorld.createEmergencyServicesCar, 'create_emergency_services_car {model} [model_vehicle] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0866, SanAndreasOpcodeWorld.getClosestStealableObject, '[var handle: Object] = get_closest_stealable_object {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x0876, SanAndreasOpcodeWorld.createBirds, 'create_birds {xFrom} [float] {yFrom} [float] {zFrom} [float] {xTo} [float] {yTo} [float] {zTo} [float] {quantity} [int] {type} [int]')
Opcode.register(0x088d, SanAndreasOpcodeWorld.setUsesCollisionOfClosestObjectOfType, 'set_uses_collision_of_closest_object_of_type {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object] {state} [bool]')
Opcode.register(0x089e, SanAndreasOpcodeWorld.getRandomCharInSphereOnlyDrugsBuyers, '[var handle: Char] = get_random_char_in_sphere_only_drugs_buyers {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x08e5, SanAndreasOpcodeWorld.getRandomCharInSphereNoBrain, '[var handle: Char] = get_random_char_in_sphere_no_brain {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x08e7, SanAndreasOpcodeWorld.disableAllEntryExits, 'disable_all_entry_exits {state} [bool]')
Opcode.register(0x091c, SanAndreasOpcodeWorld.getUserOfClosestMapAttractor, '[var handle: Char] = get_user_of_closest_map_attractor {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object] {attractorName} [string]')
Opcode.register(0x092e, SanAndreasOpcodeWorld.getWaterHeightAtCoords, '[var height: float] = get_water_height_at_coords {x} [float] {y} [float] {waves} [bool]')
Opcode.register(0x0971, SanAndreasOpcodeWorld.syncWater, 'sync_water')
Opcode.register(0x0980, SanAndreasOpcodeWorld.extinguishFireAtPoint, 'extinguish_fire_at_point {x} [float] {y} [float] {z} [float] {radius} [float]')
Opcode.register(0x0985, SanAndreasOpcodeWorld.setCharUsesCollisionClosestObjectOfType, 'set_char_uses_collision_closest_object_of_type {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object] {state} [bool] {target} [Char]')
Opcode.register(0x0986, SanAndreasOpcodeWorld.clearAllScriptFireFlags, 'clear_all_script_fire_flags')
Opcode.register(0x09b4, SanAndreasOpcodeWorld.setClosestEntryExitFlag, 'set_closest_entry_exit_flag {x} [float] {y} [float] {radius} [float] {flag} [EntryexitsFlag] {state} [bool]')
Opcode.register(0x09c0, SanAndreasOpcodeWorld.getRandomCarOfTypeInAngledAreaNoSave, '[var vehicle: Car] = get_random_car_of_type_in_angled_area_no_save {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {modelId} [model_vehicle]')
Opcode.register(0x09c3, SanAndreasOpcodeWorld.isCopVehicleInArea3DNoSave, 'is_cop_vehicle_in_area_3d_no_save {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x09da, SanAndreasOpcodeWorld.isMoneyPickupAtCoords, 'is_money_pickup_at_coords {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0a3e, SanAndreasOpcodeWorld.getRandomCharInAreaOffsetNoSave, '[var handle: Char] = get_random_char_in_area_offset_no_save {x} [float] {y} [float] {z} [float] {radiusX} [float] {radiusY} [float] {radiusZ} [float]')
Opcode.register(0x0a45, SanAndreasOpcodeWorld.setRailtrackResistanceMult, 'set_railtrack_resistance_mult {mult} [float]')
Opcode.register(0x0ab6, SanAndreasOpcodeWorld.getTargetCoords, '[var x: float], [var y: float], [var z: float] = get_target_blip_coords')
Opcode.register(0x0e33, SanAndreasOpcodeWorld.getPickupThisCoord, '[var handle: Pickup] = get_pickup_this_coord {x} [float] {y} [float] {z} [float] {onlyValid} [bool]')
Opcode.register(0x0e3f, SanAndreasOpcodeWorld.convert3DToScreen2D, '[var x: float], [var y: float], [var sizeX: float], [var sizeY: float] = convert_3d_to_screen_2d {x} [float] {y} [float] {z} [float] {nearClip} [bool] {farClip} [bool]')
Opcode.register(0x0ea6, SanAndreasOpcodeWorld.getClosestCopNearPos, '[var closestCop: Char] = get_closest_cop_near_pos {x} [float] {y} [float] {z} [float] {radius} [float] {alive} [bool] {inCar} [bool] {onFoot} [bool]')
Opcode.register(0x0ea7, SanAndreasOpcodeWorld.getAnyCharNoSaveRecursive, '[var progress: int], [var anyChar: Char] = get_any_char_no_save_recursive {progress} [int]')
Opcode.register(0x0ea8, SanAndreasOpcodeWorld.getAnyCarNoSaveRecursive, '[var progress: int], [var anyCar: Car] = get_any_car_no_save_recursive {progress} [int]')
Opcode.register(0x0ea9, SanAndreasOpcodeWorld.getAnyObjectNoSaveRecursive, '[var progress: int], [var anyObject: Object] = get_any_object_no_save_recursive {progress} [int]')
Opcode.register(0x0ef0, SanAndreasOpcodeWorld.getCoordFromAngledDistance, '[var x: float], [var y: float] = get_coord_from_angled_distance {x} [float] {y} [float] {angle} [float] {distance} [float]')
