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


Opcode.register(0x01f0, SharedOpcodeGame.setMaxWantedLevel, 'set_max_wanted_level {wantedLevel} [int]')
Opcode.register(0x01f7, SharedOpcodeGame.setPoliceIgnorePlayer, 'set_police_ignore_player {player} [Player] {state} [bool]')
Opcode.register(0x02ed, SharedOpcodeGame.setCollectableTotal, 'set_collectable1_total {amount} [int]')
Opcode.register(0x0335, SharedOpcodeGame.setFreeResprays, 'set_free_resprays {state} [bool]')
Opcode.register(0x03bf, SharedOpcodeGame.setEveryoneIgnorePlayer, 'set_everyone_ignore_player {player} [Player] {state} [bool]')
Opcode.register(0x03c7, SharedOpcodeGame.setWantedMultiplier, 'set_wanted_multiplier {multiplier} [float]')
Opcode.register(0x03d8, SharedOpcodeGame.activateSaveMenu, 'activate_save_menu')
Opcode.register(0x03d9, SharedOpcodeGame.hasSaveGameFinished, 'has_save_game_finished')
Opcode.register(0x03f4, SharedOpcodeGame.setAllCarsCanBeDamaged, 'set_all_cars_can_be_damaged {state} [bool]')
Opcode.register(0x040c, SharedOpcodeGame.isGerman, 'is_german_game')
Opcode.register(0x0424, SharedOpcodeGame.areMeasurementsInMeters, 'are_measurements_in_metres')
Opcode.register(0x0445, SharedOpcodeGame.areAnyCarCheatsActivated, 'are_any_car_cheats_activated')
Opcode.register(0x0485, SharedOpcodeGame.isPcVersion, 'is_pc_version')
Opcode.register(0x0572, SharedOpcodeGame.setAllTaxisHaveNitro, 'set_all_taxis_have_nitro {state} [bool]')
Opcode.register(0x057e, SharedOpcodeGame.setIsInStadium, 'set_player_is_in_stadium {state} [bool]')
Opcode.register(0x059a, SharedOpcodeGame.isAustralian, 'is_australian_game')
Opcode.register(0x0aa9, SharedOpcodeGame.isVersionOriginal, 'is_game_version_original')
Opcode.register(0x2244, SharedOpcodeGame.getFramerate, '[var fps: int] = get_framerate')
