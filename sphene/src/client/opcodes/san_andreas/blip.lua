SanAndreasOpcodeBlip = {}
SanAndreasOpcodeBlip.__index = SanAndreasOpcodeBlip

-- Opcode: 0x06C4
-- Instruction: [var handle: Blip] = add_blip_for_searchlight {searchlight} [Searchlight]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06C4
function SanAndreasOpcodeBlip.addForSearchlight(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x075C
-- Instruction: does_blip_exist {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/075C
function SanAndreasOpcodeBlip.doesExist(marker)
    -- @todo: Once class system is added. Check for actual class.
    if (type(marker) ~= "table") then
        return false
    end

    return marker:isEnabled()
end

-- Opcode: 0x07BF
-- Instruction: set_blip_always_display_on_zoomed_radar [Blip] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07BF
function SanAndreasOpcodeBlip.setAlwaysDisplayOnZoomedRadar(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07E0
-- Instruction: set_blip_as_friendly [Blip] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07E0
function SanAndreasOpcodeBlip.setAsFriendly(marker, type)
    return Script.setOpcodePartiallyImplemented()
    --[[if (type(marker) == "table") then
        marker = marker.blip
    end

    return marker:setType(type)]]
end

-- Opcode: 0x0888
-- Instruction: [var handle: Blip] = add_blip_for_dead_char {char} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0888
function SanAndreasOpcodeBlip.addForDeadChar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08DC
-- Instruction: set_blip_entry_exit [Blip] {x} [float] {y} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08DC
function SanAndreasOpcodeBlip.setEntryExit(_, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08FB
-- Instruction: set_coord_blip_appearance [Blip] {color} [CoordAppearance]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08FB
function SanAndreasOpcodeBlip.setCoordAppearance(blip, type)
    blip:setType(type)
end


Opcode.register(0x06c4, SanAndreasOpcodeBlip.addForSearchlight, '[var handle: Blip] = add_blip_for_searchlight {searchlight} [Searchlight]')
Opcode.register(0x075c, SanAndreasOpcodeBlip.doesExist, 'does_blip_exist {handle} [any]')
Opcode.register(0x07bf, SanAndreasOpcodeBlip.setAlwaysDisplayOnZoomedRadar, 'set_blip_always_display_on_zoomed_radar [Blip] {state} [bool]')
Opcode.register(0x07e0, SanAndreasOpcodeBlip.setAsFriendly, 'set_blip_as_friendly [Blip] {state} [bool]')
Opcode.register(0x0888, SanAndreasOpcodeBlip.addForDeadChar, '[var handle: Blip] = add_blip_for_dead_char {char} [Char]')
Opcode.register(0x08dc, SanAndreasOpcodeBlip.setEntryExit, 'set_blip_entry_exit [Blip] {x} [float] {y} [float] {radius} [float]')
Opcode.register(0x08fb, SanAndreasOpcodeBlip.setCoordAppearance, 'set_coord_blip_appearance [Blip] {color} [CoordAppearance]')
