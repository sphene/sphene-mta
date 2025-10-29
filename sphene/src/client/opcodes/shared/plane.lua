SharedOpcodePlane = {}
SharedOpcodePlane.__index = SharedOpcodePlane

-- Opcode: 0x04D2
-- Instruction: plane_goto_coords [Plane] {x} [float] {y} [float] {z} [float] {minAltitude} [float] {maxAltitude} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04D2
function SharedOpcodePlane.gotoCoords(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x04d2, SharedOpcodePlane.gotoCoords, 'plane_goto_coords [Plane] {x} [float] {y} [float] {z} [float] {minAltitude} [float] {maxAltitude} [float]')
