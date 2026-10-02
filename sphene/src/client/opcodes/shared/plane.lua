SharedOpcodePlane = {}
SharedOpcodePlane.__index = SharedOpcodePlane

-- Opcode: 0x04D2
-- Instruction: plane_goto_coords [Plane] {x} [float] {y} [float] {z} [float] {minAltitude} [float] {maxAltitude} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04D2
function SharedOpcodePlane.gotoCoords(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 04d2=5,set_plane %1d% fly_autopilot_around_point %2d% %3d% %4d% %5h%
Opcode.register(0x04d2, SharedOpcodePlane.gotoCoords, 6, 'plane_goto_coords ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
