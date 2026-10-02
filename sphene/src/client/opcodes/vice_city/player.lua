ViceCityOpcodePlayer = {}
ViceCityOpcodePlayer.__index = ViceCityOpcodePlayer

-- Opcode: 0x0054
-- Instruction: [var x: float], [var y: float], [var z: float] = get_player_coordinates [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0054
function ViceCityOpcodePlayer.getCoordinates(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0055
-- Instruction: set_player_coordinates [Player] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0055
function ViceCityOpcodePlayer.setCoordinates(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0056
-- Instruction: is_player_in_area_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0056
function ViceCityOpcodePlayer.isInArea2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0057
-- Instruction: is_player_in_area_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0057
function ViceCityOpcodePlayer.isInArea3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00DA
-- Instruction: [var handle: Car] = store_car_player_is_in [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00DA
function ViceCityOpcodePlayer.storeCarIsIn(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00DC
-- Instruction: is_player_in_car [Player] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00DC
function ViceCityOpcodePlayer.isInCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00DE
-- Instruction: is_player_in_model [Player] {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00DE
function ViceCityOpcodePlayer.isInModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00E0
-- Instruction: is_player_in_any_car [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00E0
function ViceCityOpcodePlayer.isInAnyCar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00E3
-- Instruction: locate_player_any_means_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00E3
function ViceCityOpcodePlayer.locateAnyMeans2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00E4
-- Instruction: locate_player_on_foot_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00E4
function ViceCityOpcodePlayer.locateOnFoot2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00E5
-- Instruction: locate_player_in_car_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00E5
function ViceCityOpcodePlayer.locateInCar2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00E6
-- Instruction: locate_stopped_player_any_means_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00E6
function ViceCityOpcodePlayer.locateStoppedAnyMeans2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00E7
-- Instruction: locate_stopped_player_on_foot_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00E7
function ViceCityOpcodePlayer.locateStoppedOnFoot2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00E8
-- Instruction: locate_stopped_player_in_car_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00E8
function ViceCityOpcodePlayer.locateStoppedInCar2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00E9
-- Instruction: locate_player_any_means_char_2d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00E9
function ViceCityOpcodePlayer.locateAnyMeansChar2D(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00EA
-- Instruction: locate_player_on_foot_char_2d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00EA
function ViceCityOpcodePlayer.locateOnFootChar2D(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00EB
-- Instruction: locate_player_in_car_char_2d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00EB
function ViceCityOpcodePlayer.locateInCarChar2D(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00F5
-- Instruction: locate_player_any_means_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00F5
function ViceCityOpcodePlayer.locateAnyMeans3D(player, posX, posY, posZ, xRadius, yRadius, zRadius, showSphere)
    if (showSphere == 1) then
        CheckpointFrameElement.draw(Thread.currentThread, posX, posY, posZ, xRadius)
    end

    if (type(player) ~= "table") then
        return false
    end

    local playerX, playerY, playerZ = player:getPosition()

    if (getDistanceBetweenPoints2D(posX, 0, playerX, 0) < xRadius
        and getDistanceBetweenPoints2D(0, posY, 0, playerY) < yRadius
        and getDistanceBetweenPoints3D(0, 0, posZ, 0, 0, playerZ) < zRadius) then
        return true
    end

    return false
end

-- Opcode: 0x00F6
-- Instruction: locate_player_on_foot_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00F6
function ViceCityOpcodePlayer.locateOnFoot3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00F7
-- Instruction: locate_player_in_car_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00F7
function ViceCityOpcodePlayer.locateInCar3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00F8
-- Instruction: locate_stopped_player_any_means_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00F8
function ViceCityOpcodePlayer.locateStoppedAnyMeans3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00F9
-- Instruction: locate_stopped_player_on_foot_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00F9
function ViceCityOpcodePlayer.locateStoppedOnFoot3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00FA
-- Instruction: locate_stopped_player_in_car_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00FA
function ViceCityOpcodePlayer.locateStoppedInCar3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00FB
-- Instruction: locate_player_any_means_char_3d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00FB
function ViceCityOpcodePlayer.locateAnyMeansChar3D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00FC
-- Instruction: locate_player_on_foot_char_3d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00FC
function ViceCityOpcodePlayer.locateOnFootChar3D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00FD
-- Instruction: locate_player_in_car_char_3d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/00FD
function ViceCityOpcodePlayer.locateInCarChar3D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0121
-- Instruction: is_player_in_zone [Player] {zone} [zone_key]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0121
function ViceCityOpcodePlayer.isInZone(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x012A
-- Instruction: warp_player_from_car_to_coord [Player] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/012A
function ViceCityOpcodePlayer.warpFromCarToCoord(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0170
-- Instruction: [var heading: float] = get_player_heading [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0170
function ViceCityOpcodePlayer.getHeading(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0171
-- Instruction: set_player_heading [Player] {heading} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0171
function ViceCityOpcodePlayer.setHeading(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x017A
-- Instruction: set_player_ammo [Player] {weaponType} [WeaponType] {ammo} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/017A
function ViceCityOpcodePlayer.setAmmo(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0183
-- Instruction: is_player_health_greater [Player] {health} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0183
function ViceCityOpcodePlayer.isHealthGreater(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0197
-- Instruction: is_player_in_area_on_foot_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0197
function ViceCityOpcodePlayer.isInAreaOnFoot2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0198
-- Instruction: is_player_in_area_in_car_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0198
function ViceCityOpcodePlayer.isInAreaInCar2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0199
-- Instruction: is_player_stopped_in_area_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0199
function ViceCityOpcodePlayer.isStoppedInArea2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x019A
-- Instruction: is_player_stopped_in_area_on_foot_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/019A
function ViceCityOpcodePlayer.isStoppedInAreaOnFoot2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x019B
-- Instruction: is_player_stopped_in_area_in_car_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/019B
function ViceCityOpcodePlayer.isStoppedInAreaInCar2D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x019C
-- Instruction: is_player_in_area_on_foot_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/019C
function ViceCityOpcodePlayer.isInAreaOnFoot3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x019D
-- Instruction: is_player_in_area_in_car_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/019D
function ViceCityOpcodePlayer.isInAreaInCar3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x019E
-- Instruction: is_player_stopped_in_area_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/019E
function ViceCityOpcodePlayer.isStoppedInArea3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x019F
-- Instruction: is_player_stopped_in_area_on_foot_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/019F
function ViceCityOpcodePlayer.isStoppedInAreaOnFoot3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01A0
-- Instruction: is_player_stopped_in_area_in_car_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01A0
function ViceCityOpcodePlayer.isStoppedInAreaInCar3D(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01B1
-- Instruction: give_weapon_to_player [Player] {weaponType} [WeaponType] {ammo} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01B1
function ViceCityOpcodePlayer.giveWeapon(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01B8
-- Instruction: set_current_player_weapon [Player] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01B8
function ViceCityOpcodePlayer.setCurrentWeapon(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01FC
-- Instruction: locate_player_any_means_car_2d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01FC
function ViceCityOpcodePlayer.locateAnyMeansCar2D(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01FD
-- Instruction: locate_player_on_foot_car_2d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01FD
function ViceCityOpcodePlayer.locateOnFootCar2D(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01FE
-- Instruction: locate_player_in_car_car_2d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01FE
function ViceCityOpcodePlayer.locateInCarCar2D(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01FF
-- Instruction: locate_player_any_means_car_3d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/01FF
function ViceCityOpcodePlayer.locateAnyMeansCar3D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0200
-- Instruction: locate_player_on_foot_car_3d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0200
function ViceCityOpcodePlayer.locateOnFootCar3D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0201
-- Instruction: locate_player_in_car_car_3d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0201
function ViceCityOpcodePlayer.locateInCarCar3D(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0210
-- Instruction: turn_player_to_face_char [Player] {char} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0210
function ViceCityOpcodePlayer.turnToFaceChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0222
-- Instruction: set_player_health [Player] {health} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0222
function ViceCityOpcodePlayer.setHealth(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0225
-- Instruction: [var health: int] = get_player_health [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0225
function ViceCityOpcodePlayer.getHealth(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x022E
-- Instruction: player_look_at_char_always [Player] {target} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/022E
function ViceCityOpcodePlayer.lookAtCharAlways(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0230
-- Instruction: stop_player_looking [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0230
function ViceCityOpcodePlayer.stopLooking(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x029F
-- Instruction: is_player_stopped [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/029F
function ViceCityOpcodePlayer.isStopped(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02AD
-- Instruction: is_player_in_angled_area_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02AD
function ViceCityOpcodePlayer.isInAngledArea2D(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02AE
-- Instruction: is_player_in_angled_area_on_foot_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02AE
function ViceCityOpcodePlayer.isInAngledAreaOnFoot2D(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02AF
-- Instruction: is_player_in_angled_area_in_car_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02AF
function ViceCityOpcodePlayer.isInAngledAreaInCar2D(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02B0
-- Instruction: is_player_stopped_in_angled_area_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02B0
function ViceCityOpcodePlayer.isStoppedInAngledArea2D(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02B1
-- Instruction: is_player_stopped_in_angled_area_on_foot_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02B1
function ViceCityOpcodePlayer.isStoppedInAngledAreaOnFoot2D(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02B2
-- Instruction: is_player_stopped_in_angled_area_in_car_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02B2
function ViceCityOpcodePlayer.isStoppedInAngledAreaInCar2D(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02B3
-- Instruction: is_player_in_angled_area_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02B3
function ViceCityOpcodePlayer.isInAngledArea3D(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02B4
-- Instruction: is_player_in_angled_area_on_foot_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02B4
function ViceCityOpcodePlayer.isInAngledAreaOnFoot3D(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02B5
-- Instruction: is_player_in_angled_area_in_car_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02B5
function ViceCityOpcodePlayer.isInAngledAreaInCar3D(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02B6
-- Instruction: is_player_stopped_in_angled_area_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02B6
function ViceCityOpcodePlayer.isStoppedInAngledArea3D(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02B7
-- Instruction: is_player_stopped_in_angled_area_on_foot_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02B7
function ViceCityOpcodePlayer.isStoppedInAngledAreaOnFoot3D(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02B8
-- Instruction: is_player_stopped_in_angled_area_in_car_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02B8
function ViceCityOpcodePlayer.isStoppedInAngledAreaInCar3D(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02D5
-- Instruction: is_player_shooting_in_area [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02D5
function ViceCityOpcodePlayer.isShootingInArea(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02D7
-- Instruction: is_current_player_weapon [Player] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02D7
function ViceCityOpcodePlayer.isCurrentWeapon(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02DE
-- Instruction: is_player_in_taxi [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02DE
function ViceCityOpcodePlayer.isInTaxi(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x02DF
-- Instruction: is_player_shooting [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02DF
function ViceCityOpcodePlayer.isShooting(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0322
-- Instruction: explode_player_head [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0322
function ViceCityOpcodePlayer.explodeHead(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0336
-- Instruction: set_player_visible [Player] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0336
function ViceCityOpcodePlayer.setVisible(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x035E
-- Instruction: add_armour_to_player [Player] {amount} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/035E
function ViceCityOpcodePlayer.addArmour(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0369
-- Instruction: warp_player_into_car [Player] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0369
function ViceCityOpcodePlayer.warpIntoCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03B8
-- Instruction: remove_all_player_weapons [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03B8
function ViceCityOpcodePlayer.removeAllWeapons(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03C1
-- Instruction: [var handle: Car] = store_car_player_is_in_no_save [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/03C1
function ViceCityOpcodePlayer.storeCarIsInNoSave(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0419
-- Instruction: [var ammo: int] = get_ammo_in_player_weapon [Player] {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0419
function ViceCityOpcodePlayer.getAmmoInWeapon(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x043E
-- Instruction: set_player_hooker [Player] {hooker} [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/043E
function ViceCityOpcodePlayer.setHooker()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0442
-- Instruction: is_player_sitting_in_car [Player] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0442
function ViceCityOpcodePlayer.isSittingInCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0443
-- Instruction: is_player_sitting_in_any_car [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0443
function ViceCityOpcodePlayer.isSittingInAnyCar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x044A
-- Instruction: is_player_on_foot [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/044A
function ViceCityOpcodePlayer.isOnFoot(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x046F
-- Instruction: [var weaponType: WeaponType] = get_current_player_weapon [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/046F
function ViceCityOpcodePlayer.getCurrentWeapon(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x047E
-- Instruction: is_player_on_any_bike [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/047E
function ViceCityOpcodePlayer.isOnAnyBike(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0490
-- Instruction: has_player_got_weapon [Player] {weaponId} [WeaponType]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0490
function ViceCityOpcodePlayer.hasGotWeapon(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04A8
-- Instruction: is_player_in_any_boat [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04A8
function ViceCityOpcodePlayer.isInAnyBoat(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04AA
-- Instruction: is_player_in_any_heli [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04AA
function ViceCityOpcodePlayer.isInAnyHeli(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04AC
-- Instruction: is_player_in_any_plane [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04AC
function ViceCityOpcodePlayer.isInAnyPlane()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04BE
-- Instruction: reset_havoc_caused_by_player [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04BE
function ViceCityOpcodePlayer.resetHavoc(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04BF
-- Instruction: [var level: int] = get_havoc_caused_by_player [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04BF
function ViceCityOpcodePlayer.getHavoc(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04C9
-- Instruction: is_player_in_flying_vehicle [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04C9
function ViceCityOpcodePlayer.isInFlyingVehicle(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04E2
-- Instruction: shut_player_up [Player] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04E2
function ViceCityOpcodePlayer.shutUp(_)
    return true
end

-- Opcode: 0x0540
-- Instruction: set_player_auto_aim [Player] {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0540
function ViceCityOpcodePlayer.setAutoAim(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0546
-- Instruction: is_player_touching_vehicle [Player] {vehicle} [Car]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0546
function ViceCityOpcodePlayer.isTouchingVehicle(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0551
-- Instruction: set_player_has_met_debbie_harry {state} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0551
function ViceCityOpcodePlayer.setHasMetDebbieHarry(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x057F
-- Instruction: [var num: int] = get_bus_fares_collected_by_player [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/057F
function ViceCityOpcodePlayer.getBusFaresCollected(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0596
-- Instruction: is_player_in_shortcut_taxi [Player]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0596
function ViceCityOpcodePlayer.isInShortcutTaxi(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0054=4,store_player %1d% position_to %2d% %3d% %4d%
Opcode.register(0x0054, ViceCityOpcodePlayer.getCoordinates, 4, '${2}, ${3}, ${4} = get_player_coordinates ${1}', {false, true, true, true})
-- INI: 0055=4,put_player %1d% at %2d% %3d% %4d%
Opcode.register(0x0055, ViceCityOpcodePlayer.setCoordinates, 4, 'set_player_coordinates ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0056=6,  player %1d% %6b:in-sphere/%in_rectangle %2d% %3d% %4d% %5d%
Opcode.register(0x0056, ViceCityOpcodePlayer.isInArea2D, 6, 'is_player_in_area_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0057=8,  player %1d% %8b:in-sphere/%in_cube %2d% %3d% %4d% %5d% %6d% %7d%
Opcode.register(0x0057, ViceCityOpcodePlayer.isInArea3D, 8, 'is_player_in_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 00da=2,%2d% = player %1d% car
Opcode.register(0x00da, ViceCityOpcodePlayer.storeCarIsIn, 2, '${2} = store_car_player_is_in ${1}', {false, true})
-- INI: 00dc=2,  player %1d% in_car %2d%
Opcode.register(0x00dc, ViceCityOpcodePlayer.isInCar, 2, 'is_player_in_car ${1} ${2}', {false, false})
-- INI: 00de=2,  player %1d% driving_vehicle_type %2m%
Opcode.register(0x00de, ViceCityOpcodePlayer.isInModel, 2, 'is_player_in_model ${1} ${2}', {false, false})
-- INI: 00e0=1,  player %1d% in_any_car
Opcode.register(0x00e0, ViceCityOpcodePlayer.isInAnyCar, 1, 'is_player_in_any_car ${1}', {false})
-- INI: 00e3=6,  player %1d% %6b:in-sphere/%near_point %2d% %3d% radius %4d% %5d%
Opcode.register(0x00e3, ViceCityOpcodePlayer.locateAnyMeans2D, 6, 'locate_player_any_means_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00e4=6,  player %1d% %6b:in-sphere/%near_point_on_foot %2d% %3d% radius %4d% %5d%
Opcode.register(0x00e4, ViceCityOpcodePlayer.locateOnFoot2D, 6, 'locate_player_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00e5=6,  player %1d% %6b:in-sphere/%near_point_in_car %2d% %3d% radius %4d% %5d%
Opcode.register(0x00e5, ViceCityOpcodePlayer.locateInCar2D, 6, 'locate_player_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00e6=6,  player %1d% stopped %6b:in-sphere/%near_point %2d% %3d% radius %4d% %5d%  ;; never used in VC
Opcode.register(0x00e6, ViceCityOpcodePlayer.locateStoppedAnyMeans2D, 6, 'locate_stopped_player_any_means_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00e7=6,  player %1d% stopped %6b:in-sphere/%near_point_on_foot %2d% %3d% radius %4d% %5d%
Opcode.register(0x00e7, ViceCityOpcodePlayer.locateStoppedOnFoot2D, 6, 'locate_stopped_player_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00e8=6,  player %1d% stopped %6b:in-sphere/%near_point_in_car %2d% %3d% radius %4d% %5d%  ;; never used in VC
Opcode.register(0x00e8, ViceCityOpcodePlayer.locateStoppedInCar2D, 6, 'locate_stopped_player_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00e9=5,  player %1d% %5b:in-sphere/%near_actor %2d% radius %3d% %4d%
Opcode.register(0x00e9, ViceCityOpcodePlayer.locateAnyMeansChar2D, 5, 'locate_player_any_means_char_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 00ea=5,  player %1d% %5b:in-sphere/%near_actor_on_foot %2d% radius %3d% %4d%
Opcode.register(0x00ea, ViceCityOpcodePlayer.locateOnFootChar2D, 5, 'locate_player_on_foot_char_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 00eb=5,  player %1d% %5b:in-sphere/%near_actor_in_car %2d% radius %3d% %4d%
Opcode.register(0x00eb, ViceCityOpcodePlayer.locateInCarChar2D, 5, 'locate_player_in_car_char_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 00f5=8,  player %1d% %8b:in-sphere/%near_point %2d% %3d% %4d% radius %5d% %6d% %7d%
Opcode.register(0x00f5, ViceCityOpcodePlayer.locateAnyMeans3D, 8, 'locate_player_any_means_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 00f6=8,  player %1d% %8b:in-sphere/%near_point_on_foot %2d% %3d% %4d% radius %5d% %6d% %7d%
Opcode.register(0x00f6, ViceCityOpcodePlayer.locateOnFoot3D, 8, 'locate_player_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 00f7=8,  player %1d% sphere %8b% near_point_in_car %2d% %3d% %4d% radius %5d% %6d% %7d%
Opcode.register(0x00f7, ViceCityOpcodePlayer.locateInCar3D, 8, 'locate_player_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 00f8=8,  player %1d% stopped %8b:in-sphere/%near_point %2d% %3d% %4d% radius %5d% %6d% %7d%
Opcode.register(0x00f8, ViceCityOpcodePlayer.locateStoppedAnyMeans3D, 8, 'locate_stopped_player_any_means_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 00f9=8,  player %1d% stopped %8b:in-sphere/%near_point_on_foot %2d% %3d% %4d% radius %5d% %6d% %7d%
Opcode.register(0x00f9, ViceCityOpcodePlayer.locateStoppedOnFoot3D, 8, 'locate_stopped_player_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 00fa=8,  player %1d% stopped %8b:in-sphere/%near_point_in_car %2d% %3d% %4d% radius %5d% %6d% %7d%
Opcode.register(0x00fa, ViceCityOpcodePlayer.locateStoppedInCar3D, 8, 'locate_stopped_player_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 00fb=6,  player %1d% %6b:in-sphere/%near_actor %2d% radius %3d% %4d% %5d%
Opcode.register(0x00fb, ViceCityOpcodePlayer.locateAnyMeansChar3D, 6, 'locate_player_any_means_char_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00fc=6,  player %1d% %6b:in-sphere/%near_actor %2d% on_foot radius %3d% %4d% %5d%
Opcode.register(0x00fc, ViceCityOpcodePlayer.locateOnFootChar3D, 6, 'locate_player_on_foot_char_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 00fd=6,  player %1d% %6b:in-sphere/%near_actor %2d% in_car radius %3d% %4d% %5d%
Opcode.register(0x00fd, ViceCityOpcodePlayer.locateInCarChar3D, 6, 'locate_player_in_car_char_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0121=2,  player %1d% in_zone %2z%
Opcode.register(0x0121, ViceCityOpcodePlayer.isInZone, 2, 'is_player_in_zone ${1} ${2}', {false, false})
-- INI: 012a=4,put_player %1d% at %2d% %3d% %4d% and_remove_from_car
Opcode.register(0x012a, ViceCityOpcodePlayer.warpFromCarToCoord, 4, 'warp_player_from_car_to_coord ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0170=2,%2d% = player %1d% z_angle
Opcode.register(0x0170, ViceCityOpcodePlayer.getHeading, 2, '${2} = get_player_heading ${1}', {false, true})
-- INI: 0171=2,set_player %1d% z_angle_to %2d%
Opcode.register(0x0171, ViceCityOpcodePlayer.setHeading, 2, 'set_player_heading ${1} ${2}', {false, true})
-- INI: 017a=3,set_player %1d% weapon %2d% ammo_to %3d%
Opcode.register(0x017a, ViceCityOpcodePlayer.setAmmo, 3, 'set_player_ammo ${1} ${2} ${3}', {false, false, true})
-- INI: 0183=2,  player %1d% health > %2h%
Opcode.register(0x0183, ViceCityOpcodePlayer.isHealthGreater, 2, 'is_player_health_greater ${1} ${2}', {false, false})
-- INI: 0197=6,  player %1d% %6b:in-sphere/%in_rectangle_on_foot %2d% %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x0197, ViceCityOpcodePlayer.isInAreaOnFoot2D, 6, 'is_player_in_area_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0198=6,  player %1d% %6b:in-sphere/%in_rectangle_in_car %2d% %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x0198, ViceCityOpcodePlayer.isInAreaInCar2D, 6, 'is_player_in_area_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0199=6,  player %1d% %6b:in-sphere/%in_rectangle %2d% %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x0199, ViceCityOpcodePlayer.isStoppedInArea2D, 6, 'is_player_stopped_in_area_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 019a=6,  player %1d% stopped %6b:in-sphere/%in_rectangle_on_foot %2d% %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x019a, ViceCityOpcodePlayer.isStoppedInAreaOnFoot2D, 6, 'is_player_stopped_in_area_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 019b=6,  player %1d% stopped %6b:in-sphere/%in_rectangle_in_car %2d% %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x019b, ViceCityOpcodePlayer.isStoppedInAreaInCar2D, 6, 'is_player_stopped_in_area_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 019c=8,  player %1d% %8b:in-sphere/%in_cube_on_foot %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x019c, ViceCityOpcodePlayer.isInAreaOnFoot3D, 8, 'is_player_in_area_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 019d=8,  player %1d% %8b:in-sphere/%in_cube_in_car %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x019d, ViceCityOpcodePlayer.isInAreaInCar3D, 8, 'is_player_in_area_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 019e=8,  player %1d% stopped %8b:in-sphere/%in_cube %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x019e, ViceCityOpcodePlayer.isStoppedInArea3D, 8, 'is_player_stopped_in_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 019f=8,  player %1d% stopped %8b:in-sphere/%in_cube_on_foot %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x019f, ViceCityOpcodePlayer.isStoppedInAreaOnFoot3D, 8, 'is_player_stopped_in_area_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 01a0=8,  player %1d% stopped %8b:in-sphere/%in_cube_in_car %2d% %3d% %4d% %5d% %6d% %7d%  ;; never used in VC
Opcode.register(0x01a0, ViceCityOpcodePlayer.isStoppedInAreaInCar3D, 8, 'is_player_stopped_in_area_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 01b1=3,give_player %1d% weapon %2c% ammo %3d%  ;; Load the weapon model before using this
Opcode.register(0x01b1, ViceCityOpcodePlayer.giveWeapon, 3, 'give_weapon_to_player ${1} ${2} ${3}', {false, false, false})
-- INI: 01b8=2,set_player %1d% armed_weapon_to %2c%
Opcode.register(0x01b8, ViceCityOpcodePlayer.setCurrentWeapon, 2, 'set_current_player_weapon ${1} ${2}', {false, true})
-- INI: 01fc=5,  player %1d% near_car %2d% radius %3d% %4d% %5d%
Opcode.register(0x01fc, ViceCityOpcodePlayer.locateAnyMeansCar2D, 5, 'locate_player_any_means_car_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 01fd=5,  player %1d% near_car_on_foot %2d% radius %3d% %4d% %5d%  ;; never used in VC
Opcode.register(0x01fd, ViceCityOpcodePlayer.locateOnFootCar2D, 5, 'locate_player_on_foot_car_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 01fe=5,  player %1d% near_car_in_car %2d% radius %3d% %4d% %5d%
Opcode.register(0x01fe, ViceCityOpcodePlayer.locateInCarCar2D, 5, 'locate_player_in_car_car_2d ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 01ff=6,  player %1d% near_car %2d% radius %3d% %4d% %5d% unknown %6h%
Opcode.register(0x01ff, ViceCityOpcodePlayer.locateAnyMeansCar3D, 6, 'locate_player_any_means_car_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0200=6,  player %1d% near_car_on_foot %2d% radius %3d% %4d% %5d% unknown %6h%  ;; never used in VC
Opcode.register(0x0200, ViceCityOpcodePlayer.locateOnFootCar3D, 6, 'locate_player_on_foot_car_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0201=6,  player %1d% near_car_in_car %2d% radius %3d% %4d% %5d% unknown %6h%  ;; never used in VC
Opcode.register(0x0201, ViceCityOpcodePlayer.locateInCarCar3D, 6, 'locate_player_in_car_car_3d ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0210=2,player %1d% look_at_actor %2d%
Opcode.register(0x0210, ViceCityOpcodePlayer.turnToFaceChar, 2, 'turn_player_to_face_char ${1} ${2}', {false, false})
-- INI: 0222=2,set_player %1d% health_to %2d%
Opcode.register(0x0222, ViceCityOpcodePlayer.setHealth, 2, 'set_player_health ${1} ${2}', {false, true})
-- INI: 0225=2,%2d% = player %1d% health
Opcode.register(0x0225, ViceCityOpcodePlayer.getHealth, 2, '${2} = get_player_health ${1}', {false, true})
-- INI: 022e=2,set_player %1d% to_look_at_actor %2d%
Opcode.register(0x022e, ViceCityOpcodePlayer.lookAtCharAlways, 2, 'player_look_at_char_always ${1} ${2}', {false, false})
-- INI: 0230=1,set_player %1d% stop_looking
Opcode.register(0x0230, ViceCityOpcodePlayer.stopLooking, 1, 'stop_player_looking ${1}', {false})
-- INI: 029f=1,  player %1d% stopped
Opcode.register(0x029f, ViceCityOpcodePlayer.isStopped, 1, 'is_player_stopped ${1}', {false})
-- INI: 02ad=7,  player %1d% in_area %2d% %3d% %4d% %5d% radius %6d% sphere %7h%
Opcode.register(0x02ad, ViceCityOpcodePlayer.isInAngledArea2D, 7, 'is_player_in_angled_area_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 02ae=7,  player %1d% in_area_on_foot %2d% %3d% %4d% %5d% radius %6d% sphere %7h%  ;; never used anywhere
Opcode.register(0x02ae, ViceCityOpcodePlayer.isInAngledAreaOnFoot2D, 7, 'is_player_in_angled_area_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 02af=7,  player %1d% in_area_in_car %2d% %3d% %4d% %5d% radius %6d% sphere %7h%  ;; never used anywhere
Opcode.register(0x02af, ViceCityOpcodePlayer.isInAngledAreaInCar2D, 7, 'is_player_in_angled_area_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 02b0=7,  player %1d% stopped_in_area %2d% %3d% %4d% %5d% radius %6d% sphere %7h%  ;; never used anywhere
Opcode.register(0x02b0, ViceCityOpcodePlayer.isStoppedInAngledArea2D, 7, 'is_player_stopped_in_angled_area_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 02b1=7,  player %1d% stopped_in_area_on_foot %2d% %3d% %4d% %5d% radius %6d% sphere %7h%  ;; never used anywhere
Opcode.register(0x02b1, ViceCityOpcodePlayer.isStoppedInAngledAreaOnFoot2D, 7, 'is_player_stopped_in_angled_area_on_foot_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 02b2=7,  player %1d% stopped_in_area_in_car %2d% %3d% %4d% %5d% radius %6d% sphere %7h%  ;; never used anywhere
Opcode.register(0x02b2, ViceCityOpcodePlayer.isStoppedInAngledAreaInCar2D, 7, 'is_player_stopped_in_angled_area_in_car_2d ${1} ${2} ${3} ${4} ${5} ${6} ${7}', {false, false, false, false, false, false, false})
-- INI: 02b3=9,  player %1d% in_cube %2d% %3d% %4d% %5d% %6d% %7d% radius %8d% sphere %9h%
Opcode.register(0x02b3, ViceCityOpcodePlayer.isInAngledArea3D, 9, 'is_player_in_angled_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 02b4=9,  player %1d% in_cube_on_foot %2d% %3d% %4d% %5d% %6d% %7d% radius %8d% sphere %9h%
Opcode.register(0x02b4, ViceCityOpcodePlayer.isInAngledAreaOnFoot3D, 9, 'is_player_in_angled_area_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 02b5=9,  player %1d% in_cube_in_car %2d% %3d% %4d% %5d% %6d% %7d% radius %8d% sphere %9h%
Opcode.register(0x02b5, ViceCityOpcodePlayer.isInAngledAreaInCar3D, 9, 'is_player_in_angled_area_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 02b6=9,  player %1d% stopped_in_cube %2d% %3d% %4d% %5d% %6d% %7d% radius %8d% sphere %9h%  ;; never used anywhere
Opcode.register(0x02b6, ViceCityOpcodePlayer.isStoppedInAngledArea3D, 9, 'is_player_stopped_in_angled_area_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 02b7=9,  player %1d% stopped_in_cube_on_foot %2d% %3d% %4d% %5d% %6d% %7d% radius %8d% sphere %9h%  ;; never used anywhere
Opcode.register(0x02b7, ViceCityOpcodePlayer.isStoppedInAngledAreaOnFoot3D, 9, 'is_player_stopped_in_angled_area_on_foot_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 02b8=9,  player %1d% stopped_in_cube_in_car %2d% %3d% %4d% %5d% %6d% %7d% radius %8d% sphere %9h%  ;; never used anywhere
Opcode.register(0x02b8, ViceCityOpcodePlayer.isStoppedInAngledAreaInCar3D, 9, 'is_player_stopped_in_angled_area_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 02d5=6,  player %1d% shooting_in_area %2d% %3d% %4d% %5d% %6d%
Opcode.register(0x02d5, ViceCityOpcodePlayer.isShootingInArea, 6, 'is_player_shooting_in_area ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 02d7=2,  player %1d% current_weapon == %2c%
Opcode.register(0x02d7, ViceCityOpcodePlayer.isCurrentWeapon, 2, 'is_current_player_weapon ${1} ${2}', {true, false})
-- INI: 02de=1,  player %1d% in_taxi
Opcode.register(0x02de, ViceCityOpcodePlayer.isInTaxi, 1, 'is_player_in_taxi ${1}', {false})
-- INI: 02df=1,  player %1d% aggressive
Opcode.register(0x02df, ViceCityOpcodePlayer.isShooting, 1, 'is_player_shooting ${1}', {false})
-- INI: 0322=1,kill_player %1d%
Opcode.register(0x0322, ViceCityOpcodePlayer.explodeHead, 1, 'explode_player_head ${1}', {false})
-- INI: 0336=2,set_player %1d% visible %2d%
Opcode.register(0x0336, ViceCityOpcodePlayer.setVisible, 2, 'set_player_visible ${1} ${2}', {false, false})
-- INI: 035e=2,set_player %1d% armour_to %2d%
Opcode.register(0x035e, ViceCityOpcodePlayer.addArmour, 2, 'add_armour_to_player ${1} ${2}', {false, true})
-- INI: 0369=2,put_player %1d% in_car %2d%
Opcode.register(0x0369, ViceCityOpcodePlayer.warpIntoCar, 2, 'warp_player_into_car ${1} ${2}', {false, false})
-- INI: 03b8=1,clear_weapons_from_player %1d%
Opcode.register(0x03b8, ViceCityOpcodePlayer.removeAllWeapons, 1, 'remove_all_player_weapons ${1}', {false})
-- INI: 03c1=2,%2d% = player %1d% car_no_save
Opcode.register(0x03c1, ViceCityOpcodePlayer.storeCarIsInNoSave, 2, '${2} = store_car_player_is_in_no_save ${1}', {false, true})
-- INI: 0419=3,%3d% = player %1d% weapon %2c% ammo
Opcode.register(0x0419, ViceCityOpcodePlayer.getAmmoInWeapon, 3, '${3} = get_ammo_in_player_weapon ${1} ${2}', {false, false, true})
-- INI: 043e=2,set_player_hooker %1d% char %2d%
Opcode.register(0x043e, ViceCityOpcodePlayer.setHooker, 2, 'set_player_hooker ${1} ${2}', {false, false})
-- INI: 0442=2,  player %1d% sitting_in_car %2d%
Opcode.register(0x0442, ViceCityOpcodePlayer.isSittingInCar, 2, 'is_player_sitting_in_car ${1} ${2}', {false, false})
-- INI: 0443=1,  player %1d% sitting_in_any_car
Opcode.register(0x0443, ViceCityOpcodePlayer.isSittingInAnyCar, 1, 'is_player_sitting_in_any_car ${1}', {false})
-- INI: 044a=1,  player %1d% on_foot
Opcode.register(0x044a, ViceCityOpcodePlayer.isOnFoot, 1, 'is_player_on_foot ${1}', {false})
-- INI: 046f=2,store_player %1d% currently_armed_weapon_to %2d%
Opcode.register(0x046f, ViceCityOpcodePlayer.getCurrentWeapon, 2, '${2} = get_current_player_weapon ${1}', {false, true})
-- INI: 047e=1,  player %1d% on_any_bike
Opcode.register(0x047e, ViceCityOpcodePlayer.isOnAnyBike, 1, 'is_player_on_any_bike ${1}', {false})
-- INI: 0490=2,  player %1d% has_weapon %2h%
Opcode.register(0x0490, ViceCityOpcodePlayer.hasGotWeapon, 2, 'has_player_got_weapon ${1} ${2}', {false, false})
-- INI: 04a8=1,  player %1d% in_any_boat
Opcode.register(0x04a8, ViceCityOpcodePlayer.isInAnyBoat, 1, 'is_player_in_any_boat ${1}', {false})
-- INI: 04aa=1,  player %1d% in_any_heli
Opcode.register(0x04aa, ViceCityOpcodePlayer.isInAnyHeli, 1, 'is_player_in_any_heli ${1}', {false})
-- INI: 04ac=1,  player %1d% in_any_plane
Opcode.register(0x04ac, ViceCityOpcodePlayer.isInAnyPlane, 1, 'is_player_in_any_plane ${1}', {false})
-- INI: 04be=1,reset_player %1d% chaos_level
Opcode.register(0x04be, ViceCityOpcodePlayer.resetHavoc, 1, 'reset_havoc_caused_by_player ${1}', {false})
-- INI: 04bf=2,%2d% = player %1d% chaos_level
Opcode.register(0x04bf, ViceCityOpcodePlayer.getHavoc, 2, '${2} = get_havoc_caused_by_player ${1}', {false, true})
-- INI: 04c9=1,  player %1d% in_flying_vehicle
Opcode.register(0x04c9, ViceCityOpcodePlayer.isInFlyingVehicle, 1, 'is_player_in_flying_vehicle ${1}', {false})
-- INI: 04e2=2,set_player %1d% suspend_heavy_police_reinforcements %2h%
Opcode.register(0x04e2, ViceCityOpcodePlayer.shutUp, 2, 'shut_player_up ${1} ${2}', {false, false})
-- INI: 0540=2,set_player %1d% auto_aim %2h%
Opcode.register(0x0540, ViceCityOpcodePlayer.setAutoAim, 2, 'set_player_auto_aim ${1} ${2}', {false, false})
-- INI: 0546=2,  player %1d% touching_car %2d%
Opcode.register(0x0546, ViceCityOpcodePlayer.isTouchingVehicle, 2, 'is_player_touching_vehicle ${1} ${2}', {false, false})
-- INI: 0551=1,set_kaufman_radio %1h%
Opcode.register(0x0551, ViceCityOpcodePlayer.setHasMetDebbieHarry, 1, 'set_player_has_met_debbie_harry ${1}', {false})
-- INI: 057f=2,get_player %1d% store_coach_passengers_dropped_off_to %2d%
Opcode.register(0x057f, ViceCityOpcodePlayer.getBusFaresCollected, 2, '${2} = get_bus_fares_collected_by_player ${1}', {false, true})
-- INI: 0596=1,  player %1d% riding_mission_restart_taxi
Opcode.register(0x0596, ViceCityOpcodePlayer.isInShortcutTaxi, 1, 'is_player_in_shortcut_taxi ${1}', {false})
