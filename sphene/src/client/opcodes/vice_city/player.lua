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


Opcode.register(0x0054, ViceCityOpcodePlayer.getCoordinates, '[var x: float], [var y: float], [var z: float] = get_player_coordinates [Player]')
Opcode.register(0x0055, ViceCityOpcodePlayer.setCoordinates, 'set_player_coordinates [Player] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0056, ViceCityOpcodePlayer.isInArea2D, 'is_player_in_area_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x0057, ViceCityOpcodePlayer.isInArea3D, 'is_player_in_area_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x00da, ViceCityOpcodePlayer.storeCarIsIn, '[var handle: Car] = store_car_player_is_in [Player]')
Opcode.register(0x00dc, ViceCityOpcodePlayer.isInCar, 'is_player_in_car [Player] {vehicle} [Car]')
Opcode.register(0x00de, ViceCityOpcodePlayer.isInModel, 'is_player_in_model [Player] {modelId} [model_vehicle]')
Opcode.register(0x00e0, ViceCityOpcodePlayer.isInAnyCar, 'is_player_in_any_car [Player]')
Opcode.register(0x00e3, ViceCityOpcodePlayer.locateAnyMeans2D, 'locate_player_any_means_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00e4, ViceCityOpcodePlayer.locateOnFoot2D, 'locate_player_on_foot_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00e5, ViceCityOpcodePlayer.locateInCar2D, 'locate_player_in_car_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00e6, ViceCityOpcodePlayer.locateStoppedAnyMeans2D, 'locate_stopped_player_any_means_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00e7, ViceCityOpcodePlayer.locateStoppedOnFoot2D, 'locate_stopped_player_on_foot_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00e8, ViceCityOpcodePlayer.locateStoppedInCar2D, 'locate_stopped_player_in_car_2d [Player] {x} [float] {y} [float] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00e9, ViceCityOpcodePlayer.locateAnyMeansChar2D, 'locate_player_any_means_char_2d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00ea, ViceCityOpcodePlayer.locateOnFootChar2D, 'locate_player_on_foot_char_2d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00eb, ViceCityOpcodePlayer.locateInCarChar2D, 'locate_player_in_car_char_2d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00f5, ViceCityOpcodePlayer.locateAnyMeans3D, 'locate_player_any_means_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00f6, ViceCityOpcodePlayer.locateOnFoot3D, 'locate_player_on_foot_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00f7, ViceCityOpcodePlayer.locateInCar3D, 'locate_player_in_car_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00f8, ViceCityOpcodePlayer.locateStoppedAnyMeans3D, 'locate_stopped_player_any_means_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00f9, ViceCityOpcodePlayer.locateStoppedOnFoot3D, 'locate_stopped_player_on_foot_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00fa, ViceCityOpcodePlayer.locateStoppedInCar3D, 'locate_stopped_player_in_car_3d [Player] {x} [float] {y} [float] {z} [float] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00fb, ViceCityOpcodePlayer.locateAnyMeansChar3D, 'locate_player_any_means_char_3d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00fc, ViceCityOpcodePlayer.locateOnFootChar3D, 'locate_player_on_foot_char_3d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x00fd, ViceCityOpcodePlayer.locateInCarChar3D, 'locate_player_in_car_char_3d [Player] {target} [Char] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0121, ViceCityOpcodePlayer.isInZone, 'is_player_in_zone [Player] {zone} [zone_key]')
Opcode.register(0x012a, ViceCityOpcodePlayer.warpFromCarToCoord, 'warp_player_from_car_to_coord [Player] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0170, ViceCityOpcodePlayer.getHeading, '[var heading: float] = get_player_heading [Player]')
Opcode.register(0x0171, ViceCityOpcodePlayer.setHeading, 'set_player_heading [Player] {heading} [float]')
Opcode.register(0x017a, ViceCityOpcodePlayer.setAmmo, 'set_player_ammo [Player] {weaponType} [WeaponType] {ammo} [int]')
Opcode.register(0x0183, ViceCityOpcodePlayer.isHealthGreater, 'is_player_health_greater [Player] {health} [int]')
Opcode.register(0x0197, ViceCityOpcodePlayer.isInAreaOnFoot2D, 'is_player_in_area_on_foot_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x0198, ViceCityOpcodePlayer.isInAreaInCar2D, 'is_player_in_area_in_car_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x0199, ViceCityOpcodePlayer.isStoppedInArea2D, 'is_player_stopped_in_area_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x019a, ViceCityOpcodePlayer.isStoppedInAreaOnFoot2D, 'is_player_stopped_in_area_on_foot_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x019b, ViceCityOpcodePlayer.isStoppedInAreaInCar2D, 'is_player_stopped_in_area_in_car_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x019c, ViceCityOpcodePlayer.isInAreaOnFoot3D, 'is_player_in_area_on_foot_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x019d, ViceCityOpcodePlayer.isInAreaInCar3D, 'is_player_in_area_in_car_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x019e, ViceCityOpcodePlayer.isStoppedInArea3D, 'is_player_stopped_in_area_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x019f, ViceCityOpcodePlayer.isStoppedInAreaOnFoot3D, 'is_player_stopped_in_area_on_foot_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x01a0, ViceCityOpcodePlayer.isStoppedInAreaInCar3D, 'is_player_stopped_in_area_in_car_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {drawSphere} [bool]')
Opcode.register(0x01b1, ViceCityOpcodePlayer.giveWeapon, 'give_weapon_to_player [Player] {weaponType} [WeaponType] {ammo} [int]')
Opcode.register(0x01b8, ViceCityOpcodePlayer.setCurrentWeapon, 'set_current_player_weapon [Player] {weaponType} [WeaponType]')
Opcode.register(0x01fc, ViceCityOpcodePlayer.locateAnyMeansCar2D, 'locate_player_any_means_car_2d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x01fd, ViceCityOpcodePlayer.locateOnFootCar2D, 'locate_player_on_foot_car_2d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x01fe, ViceCityOpcodePlayer.locateInCarCar2D, 'locate_player_in_car_car_2d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {drawSphere} [bool]')
Opcode.register(0x01ff, ViceCityOpcodePlayer.locateAnyMeansCar3D, 'locate_player_any_means_car_3d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0200, ViceCityOpcodePlayer.locateOnFootCar3D, 'locate_player_on_foot_car_3d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0201, ViceCityOpcodePlayer.locateInCarCar3D, 'locate_player_in_car_car_3d [Player] {handle} [Car] {xRadius} [float] {yRadius} [float] {zRadius} [float] {drawSphere} [bool]')
Opcode.register(0x0210, ViceCityOpcodePlayer.turnToFaceChar, 'turn_player_to_face_char [Player] {char} [Char]')
Opcode.register(0x0222, ViceCityOpcodePlayer.setHealth, 'set_player_health [Player] {health} [int]')
Opcode.register(0x0225, ViceCityOpcodePlayer.getHealth, '[var health: int] = get_player_health [Player]')
Opcode.register(0x022e, ViceCityOpcodePlayer.lookAtCharAlways, 'player_look_at_char_always [Player] {target} [Char]')
Opcode.register(0x0230, ViceCityOpcodePlayer.stopLooking, 'stop_player_looking [Player]')
Opcode.register(0x029f, ViceCityOpcodePlayer.isStopped, 'is_player_stopped [Player]')
Opcode.register(0x02ad, ViceCityOpcodePlayer.isInAngledArea2D, 'is_player_in_angled_area_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02ae, ViceCityOpcodePlayer.isInAngledAreaOnFoot2D, 'is_player_in_angled_area_on_foot_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02af, ViceCityOpcodePlayer.isInAngledAreaInCar2D, 'is_player_in_angled_area_in_car_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02b0, ViceCityOpcodePlayer.isStoppedInAngledArea2D, 'is_player_stopped_in_angled_area_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02b1, ViceCityOpcodePlayer.isStoppedInAngledAreaOnFoot2D, 'is_player_stopped_in_angled_area_on_foot_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02b2, ViceCityOpcodePlayer.isStoppedInAngledAreaInCar2D, 'is_player_stopped_in_angled_area_in_car_2d [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02b3, ViceCityOpcodePlayer.isInAngledArea3D, 'is_player_in_angled_area_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02b4, ViceCityOpcodePlayer.isInAngledAreaOnFoot3D, 'is_player_in_angled_area_on_foot_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02b5, ViceCityOpcodePlayer.isInAngledAreaInCar3D, 'is_player_in_angled_area_in_car_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02b6, ViceCityOpcodePlayer.isStoppedInAngledArea3D, 'is_player_stopped_in_angled_area_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02b7, ViceCityOpcodePlayer.isStoppedInAngledAreaOnFoot3D, 'is_player_stopped_in_angled_area_on_foot_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02b8, ViceCityOpcodePlayer.isStoppedInAngledAreaInCar3D, 'is_player_stopped_in_angled_area_in_car_3d [Player] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x02d5, ViceCityOpcodePlayer.isShootingInArea, 'is_player_shooting_in_area [Player] {leftBottomX} [float] {leftBottomY} [float] {rightTopX} [float] {rightTopY} [float] {drawSphere} [bool]')
Opcode.register(0x02d7, ViceCityOpcodePlayer.isCurrentWeapon, 'is_current_player_weapon [Player] {weaponType} [WeaponType]')
Opcode.register(0x02de, ViceCityOpcodePlayer.isInTaxi, 'is_player_in_taxi [Player]')
Opcode.register(0x02df, ViceCityOpcodePlayer.isShooting, 'is_player_shooting [Player]')
Opcode.register(0x0322, ViceCityOpcodePlayer.explodeHead, 'explode_player_head [Player]')
Opcode.register(0x0336, ViceCityOpcodePlayer.setVisible, 'set_player_visible [Player] {state} [bool]')
Opcode.register(0x035e, ViceCityOpcodePlayer.addArmour, 'add_armour_to_player [Player] {amount} [int]')
Opcode.register(0x0369, ViceCityOpcodePlayer.warpIntoCar, 'warp_player_into_car [Player] {vehicle} [Car]')
Opcode.register(0x03b8, ViceCityOpcodePlayer.removeAllWeapons, 'remove_all_player_weapons [Player]')
Opcode.register(0x03c1, ViceCityOpcodePlayer.storeCarIsInNoSave, '[var handle: Car] = store_car_player_is_in_no_save [Player]')
Opcode.register(0x0419, ViceCityOpcodePlayer.getAmmoInWeapon, '[var ammo: int] = get_ammo_in_player_weapon [Player] {weaponType} [WeaponType]')
Opcode.register(0x043e, ViceCityOpcodePlayer.setHooker, 'set_player_hooker [Player] {hooker} [Char]')
Opcode.register(0x0442, ViceCityOpcodePlayer.isSittingInCar, 'is_player_sitting_in_car [Player] {vehicle} [Car]')
Opcode.register(0x0443, ViceCityOpcodePlayer.isSittingInAnyCar, 'is_player_sitting_in_any_car [Player]')
Opcode.register(0x044a, ViceCityOpcodePlayer.isOnFoot, 'is_player_on_foot [Player]')
Opcode.register(0x046f, ViceCityOpcodePlayer.getCurrentWeapon, '[var weaponType: WeaponType] = get_current_player_weapon [Player]')
Opcode.register(0x047e, ViceCityOpcodePlayer.isOnAnyBike, 'is_player_on_any_bike [Player]')
Opcode.register(0x0490, ViceCityOpcodePlayer.hasGotWeapon, 'has_player_got_weapon [Player] {weaponId} [WeaponType]')
Opcode.register(0x04a8, ViceCityOpcodePlayer.isInAnyBoat, 'is_player_in_any_boat [Player]')
Opcode.register(0x04aa, ViceCityOpcodePlayer.isInAnyHeli, 'is_player_in_any_heli [Player]')
Opcode.register(0x04ac, ViceCityOpcodePlayer.isInAnyPlane, 'is_player_in_any_plane [Player]')
Opcode.register(0x04be, ViceCityOpcodePlayer.resetHavoc, 'reset_havoc_caused_by_player [Player]')
Opcode.register(0x04bf, ViceCityOpcodePlayer.getHavoc, '[var level: int] = get_havoc_caused_by_player [Player]')
Opcode.register(0x04c9, ViceCityOpcodePlayer.isInFlyingVehicle, 'is_player_in_flying_vehicle [Player]')
Opcode.register(0x04e2, ViceCityOpcodePlayer.shutUp, 'shut_player_up [Player] {state} [bool]')
Opcode.register(0x0540, ViceCityOpcodePlayer.setAutoAim, 'set_player_auto_aim [Player] {state} [bool]')
Opcode.register(0x0546, ViceCityOpcodePlayer.isTouchingVehicle, 'is_player_touching_vehicle [Player] {vehicle} [Car]')
Opcode.register(0x0551, ViceCityOpcodePlayer.setHasMetDebbieHarry, 'set_player_has_met_debbie_harry {state} [bool]')
Opcode.register(0x057f, ViceCityOpcodePlayer.getBusFaresCollected, '[var num: int] = get_bus_fares_collected_by_player [Player]')
Opcode.register(0x0596, ViceCityOpcodePlayer.isInShortcutTaxi, 'is_player_in_shortcut_taxi [Player]')
