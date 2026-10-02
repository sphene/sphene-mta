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


-- INI: 07AB=2,  car %1d% has_attached_trailer %2d%
Opcode.register(0x07ab, SanAndreasOpcodeTrailer.isAttachedToCab, 2, 'is_trailer_attached_to_cab ${1} ${2}', {false, false})
-- INI: 07AC=2,detach_trailer %1d% from_cab %2d%
Opcode.register(0x07ac, SanAndreasOpcodeTrailer.detachFromCab, 2, 'detach_trailer_from_cab ${1} ${2}', {false, false})
-- INI: 0893=2,put_trailer %1d% on_cab %2d%
Opcode.register(0x0893, SanAndreasOpcodeTrailer.attachToCab, 2, 'attach_trailer_to_cab ${1} ${2}', {false, false})
