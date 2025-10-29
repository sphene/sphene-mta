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


Opcode.register(0x0767, SanAndreasOpcodeZone.setPopulationType, 'set_zone_population_type {zone} [zone_key] {type} [int]')
Opcode.register(0x076a, SanAndreasOpcodeZone.setDealerStrength, 'set_zone_dealer_strength {zone} [zone_key] {strength} [int]')
Opcode.register(0x076b, SanAndreasOpcodeZone.getDealerStrength, '[var density: int] = get_zone_dealer_strength {zone} [zone_key]')
Opcode.register(0x076c, SanAndreasOpcodeZone.setGangStrength, 'set_zone_gang_strength {zoneId} [zone_key] {gangId} [GangType] {density} [int]')
Opcode.register(0x076d, SanAndreasOpcodeZone.getGangStrength, '[var density: int] = get_zone_gang_strength {zone} [zone_key] {gangId} [GangType]')
Opcode.register(0x0843, SanAndreasOpcodeZone.getTextKey, '[var key: gxt_key] = get_name_of_zone {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0874, SanAndreasOpcodeZone.setPopulationRace, 'set_zone_population_race {zone} [zone_key] {_p2} [int]')
Opcode.register(0x08b3, SanAndreasOpcodeZone.setForGangWarsTraining, 'set_zone_for_gang_wars_training {zone} [zone_key]')
Opcode.register(0x08ca, SanAndreasOpcodeZone.initPopulationSettings, 'init_zone_population_settings')
Opcode.register(0x08d3, SanAndreasOpcodeZone.getCurrentPopulationZoneType, '[var type: int] = get_current_population_zone_type')
Opcode.register(0x08f1, SanAndreasOpcodeZone.getName, '[var name: string] = get_name_of_info_zone {x} [float] {y} [float] {z} [float]')
Opcode.register(0x090c, SanAndreasOpcodeZone.setTriggerGangWar, 'set_specific_zone_to_trigger_gang_war {zone} [zone_key]')
Opcode.register(0x0917, SanAndreasOpcodeZone.switchAudio, 'switch_audio_zone {zone} [zone_key] {state} [bool]')
Opcode.register(0x09b7, SanAndreasOpcodeZone.setNoCops, 'set_zone_no_cops {zone} [zone_key] {state} [bool]')
Opcode.register(0x0a24, SanAndreasOpcodeZone.setDisableMilitaryZones, 'set_disable_military_zones {state} [bool]')
