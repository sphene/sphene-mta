SanAndreasOpcodeTrailer = {}
SanAndreasOpcodeTrailer.__index = SanAndreasOpcodeTrailer

-- Opcode: 0x07AB
-- Instruction: is_trailer_attached_to_cab [Trailer] {cab} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07AB
function SanAndreasOpcodeTrailer.isAttachedToCab(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07AC
-- Instruction: detach_trailer_from_cab [Trailer] {cab} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07AC
function SanAndreasOpcodeTrailer.detachFromCab(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0893
-- Instruction: attach_trailer_to_cab [Trailer] {cab} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0893
function SanAndreasOpcodeTrailer.attachToCab(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x07ab, SanAndreasOpcodeTrailer.isAttachedToCab, 'is_trailer_attached_to_cab [Trailer] {cab} [Car]')
Opcode.register(0x07ac, SanAndreasOpcodeTrailer.detachFromCab, 'detach_trailer_from_cab [Trailer] {cab} [Car]')
Opcode.register(0x0893, SanAndreasOpcodeTrailer.attachToCab, 'attach_trailer_to_cab [Trailer] {cab} [Car]')
