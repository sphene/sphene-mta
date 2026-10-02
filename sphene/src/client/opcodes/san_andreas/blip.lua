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


-- INI: 06C4=2,create_marker_above_searchlight %1d% handle_as %2d%
Opcode.register(0x06c4, SanAndreasOpcodeBlip.addForSearchlight, 2, '${1} = add_blip_for_searchlight ${2}', {false, false})
-- INI: 075C=1,  marker %1d% enabled
Opcode.register(0x075c, SanAndreasOpcodeBlip.doesExist, 1, 'does_blip_exist ${1}', {false})
-- INI: 07BF=2,set_marker %1d% tracking_blip %2h%
Opcode.register(0x07bf, SanAndreasOpcodeBlip.setAlwaysDisplayOnZoomedRadar, 2, 'set_blip_always_display_on_zoomed_radar ${1} ${2}', {false, false})
-- INI: 07E0=2,set_marker %1d% type_to %2h%
Opcode.register(0x07e0, SanAndreasOpcodeBlip.setAsFriendly, 2, 'set_blip_as_friendly ${1} ${2}', {false, false})
-- INI: 0888=2,create_marker_above_actor %1d% handle_as %2d% ; versionB
Opcode.register(0x0888, SanAndreasOpcodeBlip.addForDeadChar, 2, '${2} = add_blip_for_dead_char ${1}', {false, true})
-- INI: 08DC=4,create_interior_marker %1d% at %2d% %3d% radius %4d%
Opcode.register(0x08dc, SanAndreasOpcodeBlip.setEntryExit, 4, 'set_blip_entry_exit ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 08FB=2,set_checkpoint %1d% type_to %2h%
Opcode.register(0x08fb, SanAndreasOpcodeBlip.setCoordAppearance, 2, 'set_coord_blip_appearance ${1} ${2}', {false, false})
