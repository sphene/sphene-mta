SanAndreasOpcodeZone = {}
SanAndreasOpcodeZone.__index = SanAndreasOpcodeZone

-- Opcode: 0x0767
-- Instruction: set_zone_population_type {zone} [zone_key] {type} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0767
function SanAndreasOpcodeZone.setPopulationType()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x076A
-- Instruction: set_zone_dealer_strength {zone} [zone_key] {strength} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/076A
function SanAndreasOpcodeZone.setDealerStrength()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x076B
-- Instruction: [var density: int] = get_zone_dealer_strength {zone} [zone_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/076B
function SanAndreasOpcodeZone.getDealerStrength(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x076C
-- Instruction: set_zone_gang_strength {zoneId} [zone_key] {gangId} [GangType] {density} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/076C
function SanAndreasOpcodeZone.setGangStrength()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x076D
-- Instruction: [var density: int] = get_zone_gang_strength {zone} [zone_key] {gangId} [GangType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/076D
function SanAndreasOpcodeZone.getGangStrength(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0843
-- Instruction: [var key: gxt_key] = get_name_of_zone {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0843
function SanAndreasOpcodeZone.getTextKey(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0874
-- Instruction: set_zone_population_race {zone} [zone_key] {_p2} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0874
function SanAndreasOpcodeZone.setPopulationRace()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08B3
-- Instruction: set_zone_for_gang_wars_training {zone} [zone_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08B3
function SanAndreasOpcodeZone.setForGangWarsTraining(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08CA
-- Instruction: init_zone_population_settings
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08CA
function SanAndreasOpcodeZone.initPopulationSettings()
    return true
end

-- Opcode: 0x08D3
-- Instruction: [var type: int] = get_current_population_zone_type
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08D3
function SanAndreasOpcodeZone.getCurrentPopulationZoneType(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08F1
-- Instruction: [var name: string] = get_name_of_info_zone {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08F1
function SanAndreasOpcodeZone.getName(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x090C
-- Instruction: set_specific_zone_to_trigger_gang_war {zone} [zone_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/090C
function SanAndreasOpcodeZone.setTriggerGangWar(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0917
-- Instruction: switch_audio_zone {zone} [zone_key] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0917
function SanAndreasOpcodeZone.switchAudio(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09B7
-- Instruction: set_zone_no_cops {zone} [zone_key] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09B7
function SanAndreasOpcodeZone.setNoCops()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0A24
-- Instruction: set_disable_military_zones {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A24
function SanAndreasOpcodeZone.setDisableMilitaryZones(_)
   return Script.setOpcodePartiallyImplemented()
end


-- INI: 0767=2,set_zone %1g% popcycle_group_for_peds_and_cars_to %2h%
Opcode.register(0x0767, SanAndreasOpcodeZone.setPopulationType, 2, 'set_zone_population_type ${1} ${2}', {false, true})
-- INI: 076A=2,set_zone %1g% dealer_density_to %2h%
Opcode.register(0x076a, SanAndreasOpcodeZone.setDealerStrength, 2, 'set_zone_dealer_strength ${1} ${2}', {false, false})
-- INI: 076B=2,get_zone %1d% dealer_density_to %2d%
Opcode.register(0x076b, SanAndreasOpcodeZone.getDealerStrength, 2, '${1} = get_zone_dealer_strength ${2}', {false, false})
-- INI: 076C=3,set_zone %1g% gang %2h% density_to %3h%
Opcode.register(0x076c, SanAndreasOpcodeZone.setGangStrength, 3, 'set_zone_gang_strength ${1} ${2} ${3}', {false, false, false})
-- INI: 076D=3,get_zone %1g% gang %2d% density_to %3d%
Opcode.register(0x076d, SanAndreasOpcodeZone.getGangStrength, 3, '${3} = get_zone_gang_strength ${1} ${2}', {false, false, true})
-- INI: 0843=4,get_zone_at %1d% %2d% %3d% nameA_to %4d% ; 8-byte string
Opcode.register(0x0843, SanAndreasOpcodeZone.getTextKey, 4, '${4} = get_name_of_zone ${1} ${2} ${3}', {false, false, false, true})
-- INI: 0874=2,set_zone %1g% popcycle_group_for_peds_to %2h%
Opcode.register(0x0874, SanAndreasOpcodeZone.setPopulationRace, 2, 'set_zone_population_race ${1} ${2}', {false, true})
-- INI: 08B3=1,set_gang_zone %1g% as_only_one_available_for_gangwars
Opcode.register(0x08b3, SanAndreasOpcodeZone.setForGangWarsTraining, 1, 'set_zone_for_gang_wars_training ${1}', {false})
-- INI: 08CA=0,reset_zones_info
Opcode.register(0x08ca, SanAndreasOpcodeZone.initPopulationSettings, 0, 'init_zone_population_settings', {})
-- INI: 08D3=1,get_present_zone_popcycle_group_for_peds_and_cars_to %1d%
Opcode.register(0x08d3, SanAndreasOpcodeZone.getCurrentPopulationZoneType, 1, '${1} = get_current_population_zone_type', {false})
-- INI: 08F1=4,get_zone_at %1d% %2d% %3d% nameB_to %4d% ; 8-byte string
Opcode.register(0x08f1, SanAndreasOpcodeZone.getName, 4, '${4} = get_name_of_info_zone ${1} ${2} ${3}', {false, false, false, true})
-- INI: 090C=1,highlight_inactive_gang_zone %1g% as_available_for_gangwars
Opcode.register(0x090c, SanAndreasOpcodeZone.setTriggerGangWar, 1, 'set_specific_zone_to_trigger_gang_war ${1}', {false})
-- INI: 0917=2,audio_zone %1g% enable_sound %2h%
Opcode.register(0x0917, SanAndreasOpcodeZone.switchAudio, 2, 'switch_audio_zone ${1} ${2}', {false, false})
-- INI: 09B7=2,set_zone %1g% disable_footcops %2h%
Opcode.register(0x09b7, SanAndreasOpcodeZone.setNoCops, 2, 'set_zone_no_cops ${1} ${2}', {false, false})
-- INI: 0A24=1,enable_military_zones_wanted_level %1h%
Opcode.register(0x0a24, SanAndreasOpcodeZone.setDisableMilitaryZones, 1, 'set_disable_military_zones ${1}', {false})
