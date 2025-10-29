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


Opcode.register(0x070e, SanAndreasOpcodePlane.attackPlayer, 'plane_attack_player [Plane] {handle} [Player] {radius} [float]')
Opcode.register(0x070f, SanAndreasOpcodePlane.flyInDirection, 'plane_fly_in_direction [Plane] {heading} [float] {minAltitude} [float] {maxAltitude} [float]')
Opcode.register(0x0710, SanAndreasOpcodePlane.followEntity, 'plane_follow_entity [Plane] {char} [Char] {vehicle} [Car] {altitude} [float]')
Opcode.register(0x0742, SanAndreasOpcodePlane.setThrottle, 'set_plane_throttle [Plane] {throttle} [float]')
Opcode.register(0x0745, SanAndreasOpcodePlane.startsInAir, 'plane_starts_in_air [Plane]')
Opcode.register(0x08a2, SanAndreasOpcodePlane.attackPlayerUsingDogFight, 'plane_attack_player_using_dog_fight [Plane] {player} [Player] {radius} [float]')
Opcode.register(0x08e6, SanAndreasOpcodePlane.setUndercarriageUp, 'set_plane_undercarriage_up [Plane] {state} [bool]')
Opcode.register(0x091f, SanAndreasOpcodePlane.getUndercarriagePosition, '[var position: float] = get_plane_undercarriage_position [Plane]')
