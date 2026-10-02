SharedOpcodeGame = {}
SharedOpcodeGame.__index = SharedOpcodeGame

-- Opcode: 0x01F0
-- Instruction: set_max_wanted_level {wantedLevel} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01F0
function SharedOpcodeGame.setMaxWantedLevel(maxWantedLevel)
    Game.setMaxWantedLevel(maxWantedLevel)
end

-- Opcode: 0x01F7
-- Instruction: set_police_ignore_player {player} [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01F7
function SharedOpcodeGame.setPoliceIgnorePlayer(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x02ED
-- Instruction: set_collectable1_total {amount} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02ED
function SharedOpcodeGame.setCollectableTotal(hiddenPackages)
    Game.setHiddenPackages(hiddenPackages)
end

-- Opcode: 0x0335
-- Instruction: set_free_resprays {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0335
function SharedOpcodeGame.setFreeResprays(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03BF
-- Instruction: set_everyone_ignore_player {player} [Player] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03BF
function SharedOpcodeGame.setEveryoneIgnorePlayer(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03C7
-- Instruction: set_wanted_multiplier {multiplier} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03C7
function SharedOpcodeGame.setWantedMultiplier()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x03D8
-- Instruction: activate_save_menu
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03D8
function SharedOpcodeGame.activateSaveMenu()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03D9
-- Instruction: has_save_game_finished
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03D9
function SharedOpcodeGame.hasSaveGameFinished()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03F4
-- Instruction: set_all_cars_can_be_damaged {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03F4
function SharedOpcodeGame.setAllCarsCanBeDamaged()
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x040C
-- Instruction: is_german_game
-- https://library.sannybuilder.com/#/sa/script/extensions/default/040C
function SharedOpcodeGame.isGerman()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0424
-- Instruction: are_measurements_in_metres
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0424
function SharedOpcodeGame.areMeasurementsInMeters()
    return true
end

-- Opcode: 0x0445
-- Instruction: are_any_car_cheats_activated
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0445
function SharedOpcodeGame.areAnyCarCheatsActivated()
    Script.setOpcodePartiallyImplemented()
    return false
end

-- Opcode: 0x0485
-- Instruction: is_pc_version
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0485
function SharedOpcodeGame.isPcVersion()
   return true
end

-- Opcode: 0x0572
-- Instruction: set_all_taxis_have_nitro {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0572
function SharedOpcodeGame.setAllTaxisHaveNitro(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x057E
-- Instruction: set_player_is_in_stadium {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/057E
function SharedOpcodeGame.setIsInStadium(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x059A
-- Instruction: is_australian_game
-- https://library.sannybuilder.com/#/sa/script/extensions/default/059A
function SharedOpcodeGame.isAustralian()
   return false
end

-- Opcode: 0x0AA9
-- Instruction: is_game_version_original
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AA9
function SharedOpcodeGame.isVersionOriginal()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2244
-- Instruction: [var fps: int] = get_framerate
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2244
function SharedOpcodeGame.getFramerate()
   return Script.setOpcodeUnimplemented()
end


-- INI: 01f0=1,set_max_wanted_level_to %1d%
Opcode.register(0x01f0, SharedOpcodeGame.setMaxWantedLevel, 1, 'set_max_wanted_level ${1}', {true})
-- INI: 01f7=2,set_player %1d% ignored_by_cops_state_to %2b:true/false%
Opcode.register(0x01f7, SharedOpcodeGame.setPoliceIgnorePlayer, 2, 'set_police_ignore_player ${1} ${2}', {false, false})
-- INI: 02ed=1,set_total_hidden_packages_to %1d%
Opcode.register(0x02ed, SharedOpcodeGame.setCollectableTotal, 1, 'set_collectable1_total ${1}', {true})
-- INI: 0335=1,set_free_paynspray_to %1b:true/false%
Opcode.register(0x0335, SharedOpcodeGame.setFreeResprays, 1, 'set_free_resprays ${1}', {false})
-- INI: 03bf=2,set_player %1d% ignored_by_everyone_to %2b:true/false%
Opcode.register(0x03bf, SharedOpcodeGame.setEveryoneIgnorePlayer, 2, 'set_everyone_ignore_player ${1} ${2}', {false, false})
-- INI: 03c7=1,set_sensitivity_to_crime_to %1d%
Opcode.register(0x03c7, SharedOpcodeGame.setWantedMultiplier, 1, 'set_wanted_multiplier ${1}', {true})
-- INI: 03d8=0,show_save_screen
Opcode.register(0x03d8, SharedOpcodeGame.activateSaveMenu, 0, 'activate_save_menu', {})
-- INI: 03d9=0,  save_done
Opcode.register(0x03d9, SharedOpcodeGame.hasSaveGameFinished, 0, 'has_save_game_finished', {})
-- INI: 03f4=1,set_all_vehicles_apply_damage_rules %1d%
Opcode.register(0x03f4, SharedOpcodeGame.setAllCarsCanBeDamaged, 1, 'set_all_cars_can_be_damaged ${1}', {false})
-- INI: 040c=0,  german_game
Opcode.register(0x040c, SharedOpcodeGame.isGerman, 0, 'is_german_game', {})
-- INI: 0424=0,  metric
Opcode.register(0x0424, SharedOpcodeGame.areMeasurementsInMeters, 0, 'are_measurements_in_metres', {})
-- INI: 0445=0,  are_car_cheats_used
Opcode.register(0x0445, SharedOpcodeGame.areAnyCarCheatsActivated, 0, 'are_any_car_cheats_activated', {})
-- INI: 0485=0,  pc_version  ;; never used in VC
Opcode.register(0x0485, SharedOpcodeGame.isPcVersion, 0, 'is_pc_version', {})
-- INI: 0572=1,set_taxi_boost_jump %1h%
Opcode.register(0x0572, SharedOpcodeGame.setAllTaxisHaveNitro, 1, 'set_all_taxis_have_nitro ${1}', {false})
-- INI: 057e=1,make_radar_grey %1h%
Opcode.register(0x057e, SharedOpcodeGame.setIsInStadium, 1, 'set_player_is_in_stadium ${1}', {false})
-- INI: 059a=0,  australian_game
Opcode.register(0x059a, SharedOpcodeGame.isAustralian, 0, 'is_australian_game', {})
-- INI: 0AA9=0,  is_game_version_original
Opcode.register(0x0aa9, SharedOpcodeGame.isVersionOriginal, 0, 'is_game_version_original', {})
Opcode.register(0x2244, SharedOpcodeGame.getFramerate, 1, '${1} = get_framerate')
