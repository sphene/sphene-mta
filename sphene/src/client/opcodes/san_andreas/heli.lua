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


Opcode.register(0x0724, SanAndreasOpcodeHeli.attackPlayer, 'heli_attack_player [Heli] {handle} [Player] {radius} [float]')
Opcode.register(0x0726, SanAndreasOpcodeHeli.followEntity, 'heli_follow_entity [Heli] {char} [Char] {vehicle} [Car] {radius} [float]')
Opcode.register(0x0727, SanAndreasOpcodeHeli.chaseEntity, 'police_heli_chase_entity [Heli] {char} [Char] {vehicle} [Car] {radius} [float]')
Opcode.register(0x0743, SanAndreasOpcodeHeli.landAtCoords, 'heli_land_at_coords [Heli] {x} [float] {y} [float] {z} [float] {minAltitude} [float] {maxAltitude} [float]')
Opcode.register(0x0780, SanAndreasOpcodeHeli.keepEntityInView, 'heli_keep_entity_in_view [Heli] {char} [Char] {vehicle} [Car] {minAltitude} [float] {maxAltitude} [any]')
Opcode.register(0x0788, SanAndreasOpcodeHeli.attachWinch, 'attach_winch_to_heli [Heli] {state} [bool]')
Opcode.register(0x0789, SanAndreasOpcodeHeli.releaseEntityFromWinch, 'release_entity_from_winch [Heli]')
Opcode.register(0x078b, SanAndreasOpcodeHeli.grabEntityOnWinch, '[var char: Char], [var vehicle: Car], [var object: Object] = grab_entity_on_winch [Heli]')
Opcode.register(0x07bb, SanAndreasOpcodeHeli.activateSpeedCheat, 'activate_heli_speed_cheat [Heli] {power} [int]')
Opcode.register(0x0825, SanAndreasOpcodeHeli.setBladesFullSpeed, 'set_heli_blades_full_speed [Heli]')
Opcode.register(0x0853, SanAndreasOpcodeHeli.setReachedTargetDistance, 'set_heli_reached_target_distance [Heli] {distance} [int]')
Opcode.register(0x0a1c, SanAndreasOpcodeHeli.disableAudio, 'disable_heli_audio [Heli] {state} [bool]')
