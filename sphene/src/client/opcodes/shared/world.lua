SharedOpcodeWorld = {}
SharedOpcodeWorld.__index = SharedOpcodeWorld

-- Opcode: 0x01EB
-- Instruction: set_car_density_multiplier {multiplier} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01EB
function SharedOpcodeWorld.setCarDensityMultiplier(multiplier)
    Traffic.setMultiplier(multiplier)
end

-- Opcode: 0x02CE
-- Instruction: [var groundZ: float] = get_ground_z_for_3d_coord {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02CE
function SharedOpcodeWorld.getGroundZFor3DCoord(posX, posY, posZ, _)
    enginePreloadWorldArea(posX, posY, posZ, "collisions")
    return getGroundPosition(posX, posY, posZ)
end

-- Opcode: 0x031A
-- Instruction: remove_all_script_fires
-- https://library.sannybuilder.com/#/sa/script/extensions/default/031A
function SharedOpcodeWorld.removeAllScriptFires()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0327
-- Instruction: [var handle: Car] = get_random_car_of_type_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0327
function SharedOpcodeWorld.getRandomCarOfTypeInArea(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0339
-- Instruction: is_area_occupied {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {solid} [bool] {car} [bool] {char} [bool] {object} [bool] {particle} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0339
function SharedOpcodeWorld.isAreaOccupied(_, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0363
-- Instruction: set_visibility_of_closest_object_of_type {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0363
function SharedOpcodeWorld.setVisibilityOfClosestObjectOfType(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x038A
-- Instruction: is_point_obscured_by_a_mission_entity {x} [float] {y} [float] {z} [float] {radiusX} [float] {radiusY} [float] {radiusZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/038A
function SharedOpcodeWorld.isPointObscuredByAMissionEntity(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ)
    Script.setOpcodePartiallyImplemented()

    for _, car in pairs(VehicleElement:all()) do
        if (car:isInCube(cornerAX, cornerAY, cornerAZ, cornerBX, cornerBY, cornerBZ)) then
            return true
        end
    end

    return false
end

-- Opcode: 0x0395
-- Instruction: clear_area {x} [float] {y} [float] {z} [float] {radius} [float] {clearParticles} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0395
function SharedOpcodeWorld.clearArea(posX, posY, posZ, radius, _)
    for _, element in pairs(VehicleElement:all()) do
        local x, y, z = element:getPosition()

        if element.spawned and getDistanceBetweenPoints3D(posX, posY, posZ, x, y, z) <= radius then
            if (not Thread.currentThread:isElementOnCleanupList(element)) then
                element:destroy()
            end
        end
    end

    for _, element in pairs(ActorElement:all()) do
        if (element.playerElement == false) then
            local x, y, z = element:getPosition()

            if element.spawned and getDistanceBetweenPoints3D(posX, posY, posZ, x, y, z) <= radius then
                if (not Thread.currentThread:isElementOnCleanupList(element)) then
                    element:destroy()
                end
            end
        end
    end

    for _, element in pairs(getElementsByType("projectile")) do
        local x, y, z = getElementPosition(element)

        if (getDistanceBetweenPoints3D(posX, posY, posZ, x, y, z) <= radius) then
            if (not Thread.currentThread:isElementOnCleanupList(element)) then
                element:destroy()
            end
        end
    end

    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03B6
-- Instruction: swap_nearest_building_model {x} [float] {y} [float] {z} [float] {radius} [float] {fromModelId} [model_object] {toModelId} [model_object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03B6
function SharedOpcodeWorld.swapNearestBuildingModel(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03B7
-- Instruction: switch_world_processing {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03B7
function SharedOpcodeWorld.switchProcessing(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03BA
-- Instruction: clear_area_of_cars {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03BA
function SharedOpcodeWorld.clearAreaOfCars(_, _, _, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03C5
-- Instruction: create_random_car_for_car_park {x} [float] {y} [float] {z} [float] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03C5
function SharedOpcodeWorld.createRandomCarForCarPark(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03DE
-- Instruction: set_ped_density_multiplier {multiplier} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03DE
function SharedOpcodeWorld.setPedDensityMultiplier(multiplier)
    Traffic.setPedestrianMultiplier(multiplier)
end

-- Opcode: 0x042B
-- Instruction: clear_area_of_chars {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/042B
function SharedOpcodeWorld.clearAreaOfChars(_, _, _, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x048C
-- Instruction: is_any_pickup_at_coords {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/048C
function SharedOpcodeWorld.isAnyPickupAtCoords(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04A5
-- Instruction: [var x: float], [var y: float], [var z: float] = get_dead_char_pickup_coords {char} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04A5
function SharedOpcodeWorld.getDeadCharPickupCoords(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04C0
-- Instruction: create_script_roadblock {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {type} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04C0
function SharedOpcodeWorld.createScriptRoadblock(_, _, _, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x04C1
-- Instruction: clear_all_script_roadblocks
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04C1
function SharedOpcodeWorld.clearAllScriptRoadblocks()
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x04F8
-- Instruction: add_set_piece {type} [SetPieceType] {fromX} [float] {fromY} [float] {toX} [float] {toY} [float] {spawnPoliceAAtX} [float] {spawnPoliceAAtY} [float] {headedTowardsAAtX} [float] {headedTowardsAAtY} [float] {spawnPoliceBAtX} [float] {spawnPoliceBAtY} [float] {headedTowardsBAtX} [float] {headedTowardsBAtY} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04F8
function SharedOpcodeWorld.addSetPiece()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x04F9
-- Instruction: set_extra_colours {color} [int] {fade} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04F9
function SharedOpcodeWorld.setExtraColors()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x04FA
-- Instruction: clear_extra_colours {withFade} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04FA
function SharedOpcodeWorld.clearExtraColors()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x053E
-- Instruction: [var handle: Car] = get_random_car_of_type_in_area_no_save {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/053E
function SharedOpcodeWorld.getRandomCarOfTypeInAreaNoSave(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ADD
-- Instruction: spawn_vehicle_by_cheating {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ADD
function SharedOpcodeWorld.spawnVehicleByCheating(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AE1
-- Instruction: [var handle: Char] = get_random_char_in_sphere_no_save_recursive {x} [float] {y} [float] {z} [float] {radius} [float] {findNext} [bool] {skipDead} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AE1
function SharedOpcodeWorld.getRandomCharInSphereNoSaveRecursive(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AE2
-- Instruction: [var handle: Car] = get_random_car_in_sphere_no_save_recursive {x} [float] {y} [float] {z} [float] {radius} [float] {findNext} [bool] {skipWrecked} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AE2
function SharedOpcodeWorld.getRandomCarInSphereNoSaveRecursive(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AE3
-- Instruction: [var handle: Object] = get_random_object_in_sphere_no_save_recursive {x} [float] {y} [float] {z} [float] {radius} [float] {findNext} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AE3
function SharedOpcodeWorld.getRandomObjectInSphereNoSaveRecursive(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 01eb=1,set_traffic_density_multiplier_to %1d%
Opcode.register(0x01eb, SharedOpcodeWorld.setCarDensityMultiplier, 1, 'set_car_density_multiplier ${1}', {true})
-- INI: 02ce=4,%4d% = ground_z %1d% %2d% %3d%
Opcode.register(0x02ce, SharedOpcodeWorld.getGroundZFor3DCoord, 4, '${4} = get_ground_z_for_3d_coord ${1} ${2} ${3}', {false, false, false, true})
-- INI: 031a=0,remove_all_fires
Opcode.register(0x031a, SharedOpcodeWorld.removeAllScriptFires, 0, 'remove_all_script_fires', {})
-- INI: 0327=6,%6d% = create_random_car_with_actors %5d% in_area %1d% %2d% %3d% %4d%
Opcode.register(0x0327, SharedOpcodeWorld.getRandomCarOfTypeInArea, 6, '${6} = get_random_car_of_type_in_area ${5} ${1} ${2} ${3} ${4}', {false, false, false, false, false, true})
-- INI: 0339=11,  anything_in_cube_cornerA %1d% %2d% %3d% cornerB %4d% %5d% %6d% solid %7d% car %8d% actor %9d% object %10d% particle %11d%
Opcode.register(0x0339, SharedOpcodeWorld.isAreaOccupied, 11, 'is_area_occupied ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11}', {false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0363=6,toggle_model_render_at %1d% %2d% %3d% radius %4d% object %5o% %6d%
Opcode.register(0x0363, SharedOpcodeWorld.setVisibilityOfClosestObjectOfType, 6, 'set_visibility_of_closest_object_of_type ${1} ${2} ${3} ${4} ${object.5} ${6}', {false, false, false, false, false, false})
-- INI: 038a=6,  car_in_cube %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x038a, SharedOpcodeWorld.isPointObscuredByAMissionEntity, 6, 'is_point_obscured_by_a_mission_entity ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0395=5,clear_area %5d% at %1d% %2d% %3d% range %4d%
Opcode.register(0x0395, SharedOpcodeWorld.clearArea, 5, 'clear_area ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 03b6=6,replace_model_at %1d% %2d% %3d% radius %4d% from %5o% to %6o%
Opcode.register(0x03b6, SharedOpcodeWorld.swapNearestBuildingModel, 6, 'swap_nearest_building_model ${1} ${2} ${3} ${4} ${object.5} ${object.6}', {false, false, false, false, false, false})
-- INI: 03b7=1,process_cut_scene_only %1b:false/true%
Opcode.register(0x03b7, SharedOpcodeWorld.switchProcessing, 1, 'switch_world_processing ${1}', {false})
-- INI: 03ba=6,clear_cars_from_cube %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x03ba, SharedOpcodeWorld.clearAreaOfCars, 6, 'clear_area_of_cars ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 03c5=4,create_random_car_for_carpark %1d% %2d% %3d% %4d%
Opcode.register(0x03c5, SharedOpcodeWorld.createRandomCarForCarPark, 4, 'create_random_car_for_car_park ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 03de=1,set_pedestrians_density_multiplier_to %1d%
Opcode.register(0x03de, SharedOpcodeWorld.setPedDensityMultiplier, 1, 'set_ped_density_multiplier ${1}', {true})
-- INI: 042b=6,clear_peds_from_cube %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x042b, SharedOpcodeWorld.clearAreaOfChars, 6, 'clear_area_of_chars ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 048c=3,  pickup_at %1d% %2d% %3d% available_or_will_respawn
Opcode.register(0x048c, SharedOpcodeWorld.isAnyPickupAtCoords, 3, 'is_any_pickup_at_coords ${1} ${2} ${3}', {false, false, false})
-- INI: 04a5=4,get_dead_actor_pickup_coords %1d% store_to %2d% %3d% %4d%
Opcode.register(0x04a5, SharedOpcodeWorld.getDeadCharPickupCoords, 4, '${2}, ${3}, ${4} = get_dead_char_pickup_coords ${1}', {false, true, true, true})
-- INI: 04c0=6,create_police_roadblock_at %1d% %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x04c0, SharedOpcodeWorld.createScriptRoadblock, 7, 'create_script_roadblock ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 04c1=0,remove_references_to_roadblocks
Opcode.register(0x04c1, SharedOpcodeWorld.clearAllScriptRoadblocks, 0, 'clear_all_script_roadblocks', {})
-- INI: 04f8=13,define_police_trigger_type %1h% if_player_with_wanted_level_in_rectangle %2d% %3d% %4d% %5d% spawn_policeA_at %6d% %7d% headed_towards %8d% %9d% spawn_policeB_at %10d% %11d% headed_towards %12d% %13d%
Opcode.register(0x04f8, SharedOpcodeWorld.addSetPiece, 13, 'add_set_piece ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13}', {false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 04f9=2,set_extra_colors %1h% fade %2h%
Opcode.register(0x04f9, SharedOpcodeWorld.setExtraColors, 2, 'set_extra_colours ${1} ${2}', {false, false})
-- INI: 04fa=1,clear_extra_colors_with_fade %1h%
Opcode.register(0x04fa, SharedOpcodeWorld.clearExtraColors, 1, 'clear_extra_colours ${1}', {false})
-- INI: 053e=6,%6d% = get_random_car_with_actors %5d% in_area %1d% %2d% %3d% %4d%
Opcode.register(0x053e, SharedOpcodeWorld.getRandomCarOfTypeInAreaNoSave, 6, '${6} = get_random_car_of_type_in_area_no_save ${5} ${1} ${2} ${3} ${4}', {false, false, false, false, false, true})
-- INI: 0ADD=1,spawn_car_with_model %1o% like_a_cheat
Opcode.register(0x0add, SharedOpcodeWorld.spawnVehicleByCheating, 1, 'spawn_vehicle_by_cheating ${vehicle.1}', {false})
-- INI: 0AE1=7,%7d% = random_actor_near_point %1d% %2d% %3d% in_radius %4d% find_next %5h% pass_deads %6h% // IF and SET
Opcode.register(0x0ae1, SharedOpcodeWorld.getRandomCharInSphereNoSaveRecursive, 7, '${7} = get_random_char_in_sphere_no_save_recursive ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 0AE2=7,%7d% = random_vehicle_near_point %1d% %2d% %3d% in_radius %4d% find_next %5h% pass_wrecked %6h% // IF and SET
Opcode.register(0x0ae2, SharedOpcodeWorld.getRandomCarInSphereNoSaveRecursive, 7, '${7} = get_random_car_in_sphere_no_save_recursive ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 0AE3=6,%6d% = random_object_near_point %1d% %2d% %3d% in_radius %4d% find_next %5h% // IF and SET
Opcode.register(0x0ae3, SharedOpcodeWorld.getRandomObjectInSphereNoSaveRecursive, 6, '${6} = get_random_object_in_sphere_no_save_recursive ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false, true})
