SanAndreasOpcodePlane = {}
SanAndreasOpcodePlane.__index = SanAndreasOpcodePlane

-- Opcode: 0x070E
-- Instruction: plane_attack_player [Plane] {handle} [Player] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/070E
function SanAndreasOpcodePlane.attackPlayer(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x070F
-- Instruction: plane_fly_in_direction [Plane] {heading} [float] {minAltitude} [float] {maxAltitude} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/070F
function SanAndreasOpcodePlane.flyInDirection(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0710
-- Instruction: plane_follow_entity [Plane] {char} [Char] {vehicle} [Car] {altitude} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0710
function SanAndreasOpcodePlane.followEntity(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0742
-- Instruction: set_plane_throttle [Plane] {throttle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0742
function SanAndreasOpcodePlane.setThrottle(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0745
-- Instruction: plane_starts_in_air [Plane]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0745
function SanAndreasOpcodePlane.startsInAir(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08A2
-- Instruction: plane_attack_player_using_dog_fight [Plane] {player} [Player] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08A2
function SanAndreasOpcodePlane.attackPlayerUsingDogFight(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08E6
-- Instruction: set_plane_undercarriage_up [Plane] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08E6
function SanAndreasOpcodePlane.setUndercarriageUp(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x091F
-- Instruction: [var position: float] = get_plane_undercarriage_position [Plane]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/091F
function SanAndreasOpcodePlane.getUndercarriagePosition(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 070E=3,hydra %1d% attack_player_car %2d% radius %3d%
Opcode.register(0x070e, SanAndreasOpcodePlane.attackPlayer, 3, 'plane_attack_player ${1} ${2} ${3}', {false, false, false})
-- INI: 070F=4,plane %1d% fly_direction %2d% altitude_between %3d% and %4d%
Opcode.register(0x070f, SanAndreasOpcodePlane.flyInDirection, 4, 'plane_fly_in_direction ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0710=4,plane %1d% follow_actor %2d% follow_car %3h% radius %4d%
Opcode.register(0x0710, SanAndreasOpcodePlane.followEntity, 4, 'plane_follow_entity ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0742=2,set_plane %1d% unknown_trajectory %2d%
Opcode.register(0x0742, SanAndreasOpcodePlane.setThrottle, 2, 'set_plane_throttle ${1} ${2}', {false, false})
-- INI: 0745=1,set_hydra %1d% thrust_to_horizontal
Opcode.register(0x0745, SanAndreasOpcodePlane.startsInAir, 1, 'plane_starts_in_air ${1}', {false})
-- INI: 08A2=3,set_hydra %1d% attack_with_rockets_car_of_player %2d% radius %3d%
Opcode.register(0x08a2, SanAndreasOpcodePlane.attackPlayerUsingDogFight, 3, 'plane_attack_player_using_dog_fight ${1} ${2} ${3}', {false, false, false})
-- INI: 08E6=2,set_plane %1d% landing_gear %2h%
Opcode.register(0x08e6, SanAndreasOpcodePlane.setUndercarriageUp, 2, 'set_plane_undercarriage_up ${1} ${2}', {false, false})
-- INI: 091F=2,get_plane %1d% landing_gear_status_to %2d%
Opcode.register(0x091f, SanAndreasOpcodePlane.getUndercarriagePosition, 2, '${1} = get_plane_undercarriage_position ${2}', {false, false})
