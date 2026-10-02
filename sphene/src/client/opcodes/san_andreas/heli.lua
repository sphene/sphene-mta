SanAndreasOpcodeHeli = {}
SanAndreasOpcodeHeli.__index = SanAndreasOpcodeHeli

-- Opcode: 0x0724
-- Instruction: heli_attack_player [Heli] {handle} [Player] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0724
function SanAndreasOpcodeHeli.attackPlayer(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0726
-- Instruction: heli_follow_entity [Heli] {char} [Char] {vehicle} [Car] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0726
function SanAndreasOpcodeHeli.followEntity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0727
-- Instruction: police_heli_chase_entity [Heli] {char} [Char] {vehicle} [Car] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0727
function SanAndreasOpcodeHeli.chaseEntity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0743
-- Instruction: heli_land_at_coords [Heli] {x} [float] {y} [float] {z} [float] {minAltitude} [float] {maxAltitude} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0743
function SanAndreasOpcodeHeli.landAtCoords(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0780
-- Instruction: heli_keep_entity_in_view [Heli] {char} [Char] {vehicle} [Car] {minAltitude} [float] {maxAltitude} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0780
function SanAndreasOpcodeHeli.keepEntityInView(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0788
-- Instruction: attach_winch_to_heli [Heli] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0788
function SanAndreasOpcodeHeli.attachWinch(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0789
-- Instruction: release_entity_from_winch [Heli]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0789
function SanAndreasOpcodeHeli.releaseEntityFromWinch(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x078B
-- Instruction: [var char: Char], [var vehicle: Car], [var object: Object] = grab_entity_on_winch [Heli]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/078B
function SanAndreasOpcodeHeli.grabEntityOnWinch(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07BB
-- Instruction: activate_heli_speed_cheat [Heli] {power} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07BB
function SanAndreasOpcodeHeli.activateSpeedCheat(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0825
-- Instruction: set_heli_blades_full_speed [Heli]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0825
function SanAndreasOpcodeHeli.setBladesFullSpeed(car)
    return car:setHelicopterRotorSpeed(0.2)
end

-- Opcode: 0x0853
-- Instruction: set_heli_reached_target_distance [Heli] {distance} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0853
function SanAndreasOpcodeHeli.setReachedTargetDistance(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A1C
-- Instruction: disable_heli_audio [Heli] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A1C
function SanAndreasOpcodeHeli.disableAudio(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0724=3,heli %1d% follow_and_attack_player %2d% radius %3d%
Opcode.register(0x0724, SanAndreasOpcodeHeli.attackPlayer, 3, 'heli_attack_player ${1} ${2} ${3}', {false, false, false})
-- INI: 0726=4,heli %1d% follow_actor %2d% follow_car %3h% radius %4d%
Opcode.register(0x0726, SanAndreasOpcodeHeli.followEntity, 4, 'heli_follow_entity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0727=4,set_heli %1d% behavior_to_police_heli_and_follow_actor %2d% follow_car %3h% radius %4d%
Opcode.register(0x0727, SanAndreasOpcodeHeli.chaseEntity, 4, 'police_heli_chase_entity ${1} ${2} ${3} ${4}', {false, true, true, true})
-- INI: 0743=6,heli %1d% fly_to %2d% %3d% %4d% altitude %5d% %6d%
Opcode.register(0x0743, SanAndreasOpcodeHeli.landAtCoords, 6, 'heli_land_at_coords ${1} ${2} ${3} ${4} ${5} ${6}', {false, true, false, false, false, false})
-- INI: 0780=5,heli %1d% hover_above actor %2d% car %3h% altitude %4d% %5d%
Opcode.register(0x0780, SanAndreasOpcodeHeli.keepEntityInView, 5, 'heli_keep_entity_in_view ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0788=2,enable_heli %1d% magnet %2h%
Opcode.register(0x0788, SanAndreasOpcodeHeli.attachWinch, 2, 'attach_winch_to_heli ${1} ${2}', {false, false})
-- INI: 0789=1,set_heli %1d% release_stuff_from_magnet
Opcode.register(0x0789, SanAndreasOpcodeHeli.releaseEntityFromWinch, 1, 'release_entity_from_winch ${1}', {false})
-- INI: 078B=4,%2d% = get_heli %1d% attached_car_handle actor_handle_to %3d% object_handle_to %4d%
Opcode.register(0x078b, SanAndreasOpcodeHeli.grabEntityOnWinch, 4, '${1}, ${2}, ${3} = grab_entity_on_winch ${4}', {false, true, false, false})
-- INI: 07BB=2,set_heli %1d% horizontal_thrust_power %2h%
Opcode.register(0x07bb, SanAndreasOpcodeHeli.activateSpeedCheat, 2, 'activate_heli_speed_cheat ${1} ${2}', {false, false})
-- INI: 0825=1,set_helicopter %1d% instant_rotor_start
Opcode.register(0x0825, SanAndreasOpcodeHeli.setBladesFullSpeed, 1, 'set_heli_blades_full_speed ${1}', {false})
-- INI: 0853=2,unknown_heli %1d% flag %2h%
Opcode.register(0x0853, SanAndreasOpcodeHeli.setReachedTargetDistance, 2, 'set_heli_reached_target_distance ${1} ${2}', {false, false})
-- INI: 0A1C=2,set_helicopter %1d% play_engine_sounds %2h%
Opcode.register(0x0a1c, SanAndreasOpcodeHeli.disableAudio, 2, 'disable_heli_audio ${1} ${2}', {false, false})
