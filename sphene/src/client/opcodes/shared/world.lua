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


Opcode.register(0x01eb, SharedOpcodeWorld.setCarDensityMultiplier, 'set_car_density_multiplier {multiplier} [float]')
Opcode.register(0x02ce, SharedOpcodeWorld.getGroundZFor3DCoord, '[var groundZ: float] = get_ground_z_for_3d_coord {x} [float] {y} [float] {z} [float]')
Opcode.register(0x031a, SharedOpcodeWorld.removeAllScriptFires, 'remove_all_script_fires')
Opcode.register(0x0327, SharedOpcodeWorld.getRandomCarOfTypeInArea, '[var handle: Car] = get_random_car_of_type_in_area {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {modelId} [model_vehicle]')
Opcode.register(0x0339, SharedOpcodeWorld.isAreaOccupied, 'is_area_occupied {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {solid} [bool] {car} [bool] {char} [bool] {object} [bool] {particle} [bool]')
Opcode.register(0x0363, SharedOpcodeWorld.setVisibilityOfClosestObjectOfType, 'set_visibility_of_closest_object_of_type {x} [float] {y} [float] {z} [float] {radius} [float] {modelId} [model_object] {state} [bool]')
Opcode.register(0x038a, SharedOpcodeWorld.isPointObscuredByAMissionEntity, 'is_point_obscured_by_a_mission_entity {x} [float] {y} [float] {z} [float] {radiusX} [float] {radiusY} [float] {radiusZ} [float]')
Opcode.register(0x0395, SharedOpcodeWorld.clearArea, 'clear_area {x} [float] {y} [float] {z} [float] {radius} [float] {clearParticles} [bool]')
Opcode.register(0x03b6, SharedOpcodeWorld.swapNearestBuildingModel, 'swap_nearest_building_model {x} [float] {y} [float] {z} [float] {radius} [float] {fromModelId} [model_object] {toModelId} [model_object]')
Opcode.register(0x03b7, SharedOpcodeWorld.switchProcessing, 'switch_world_processing {state} [bool]')
Opcode.register(0x03ba, SharedOpcodeWorld.clearAreaOfCars, 'clear_area_of_cars {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x03c5, SharedOpcodeWorld.createRandomCarForCarPark, 'create_random_car_for_car_park {x} [float] {y} [float] {z} [float] {heading} [float]')
Opcode.register(0x03de, SharedOpcodeWorld.setPedDensityMultiplier, 'set_ped_density_multiplier {multiplier} [float]')
Opcode.register(0x042b, SharedOpcodeWorld.clearAreaOfChars, 'clear_area_of_chars {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float]')
Opcode.register(0x048c, SharedOpcodeWorld.isAnyPickupAtCoords, 'is_any_pickup_at_coords {x} [float] {y} [float] {z} [float]')
Opcode.register(0x04a5, SharedOpcodeWorld.getDeadCharPickupCoords, '[var x: float], [var y: float], [var z: float] = get_dead_char_pickup_coords {char} [Char]')
Opcode.register(0x04c0, SharedOpcodeWorld.createScriptRoadblock, 'create_script_roadblock {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {type} [int]')
Opcode.register(0x04c1, SharedOpcodeWorld.clearAllScriptRoadblocks, 'clear_all_script_roadblocks')
Opcode.register(0x04f8, SharedOpcodeWorld.addSetPiece, 'add_set_piece {type} [SetPieceType] {fromX} [float] {fromY} [float] {toX} [float] {toY} [float] {spawnPoliceAAtX} [float] {spawnPoliceAAtY} [float] {headedTowardsAAtX} [float] {headedTowardsAAtY} [float] {spawnPoliceBAtX} [float] {spawnPoliceBAtY} [float] {headedTowardsBAtX} [float] {headedTowardsBAtY} [float]')
Opcode.register(0x04f9, SharedOpcodeWorld.setExtraColors, 'set_extra_colours {color} [int] {fade} [bool]')
Opcode.register(0x04fa, SharedOpcodeWorld.clearExtraColors, 'clear_extra_colours {withFade} [bool]')
Opcode.register(0x053e, SharedOpcodeWorld.getRandomCarOfTypeInAreaNoSave, '[var handle: Car] = get_random_car_of_type_in_area_no_save {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {modelId} [model_vehicle]')
Opcode.register(0x0add, SharedOpcodeWorld.spawnVehicleByCheating, 'spawn_vehicle_by_cheating {modelId} [model_vehicle]')
Opcode.register(0x0ae1, SharedOpcodeWorld.getRandomCharInSphereNoSaveRecursive, '[var handle: Char] = get_random_char_in_sphere_no_save_recursive {x} [float] {y} [float] {z} [float] {radius} [float] {findNext} [bool] {skipDead} [bool]')
Opcode.register(0x0ae2, SharedOpcodeWorld.getRandomCarInSphereNoSaveRecursive, '[var handle: Car] = get_random_car_in_sphere_no_save_recursive {x} [float] {y} [float] {z} [float] {radius} [float] {findNext} [bool] {skipWrecked} [bool]')
Opcode.register(0x0ae3, SharedOpcodeWorld.getRandomObjectInSphereNoSaveRecursive, '[var handle: Object] = get_random_object_in_sphere_no_save_recursive {x} [float] {y} [float] {z} [float] {radius} [float] {findNext} [bool]')
