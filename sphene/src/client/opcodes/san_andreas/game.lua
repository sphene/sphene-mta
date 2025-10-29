SanAndreasOpcodeGame = {}
SanAndreasOpcodeGame.__index = SanAndreasOpcodeGame

-- Opcode: 0x050F
-- Instruction: [var level: int] = get_max_wanted_level
-- https://library.sannybuilder.com/#/sa/script/extensions/default/050F
function SanAndreasOpcodeGame.getMaxWantedLevel(_)
    Script.storeValueAtIndex(1, Game.getMaxWantedLevel())
end

-- Opcode: 0x06C8
-- Instruction: set_la_riots {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06C8
function SanAndreasOpcodeGame.setLaRiots(riotsEnabled)
    Game.setRiotsEnabled(riotsEnabled)
end

-- Opcode: 0x06D0
-- Instruction: switch_emergency_services {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06D0
function SanAndreasOpcodeGame.switchEmergencyServices(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x06D7
-- Instruction: switch_random_trains {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06D7
function SanAndreasOpcodeGame.switchRandomTrains(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x06F1
-- Instruction: limit_two_player_distance {distance} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06F1
function SanAndreasOpcodeGame.limitTwoPlayerDistance(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06F2
-- Instruction: release_two_player_distance
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06F2
function SanAndreasOpcodeGame.releaseTwoPlayerDistance()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06F3
-- Instruction: set_player_player_targetting {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06F3
function SanAndreasOpcodeGame.setPlayerPlayerTargeting(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x06FA
-- Instruction: set_players_can_be_in_separate_cars {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06FA
function SanAndreasOpcodeGame.setPlayersCanBeInSeparateCars(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x072C
-- Instruction: switch_cops_on_bikes {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/072C
function SanAndreasOpcodeGame.switchCopsOnBikes(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0746
-- Instruction: set_relationship {relationshipType} [RelationshipType] {ofPedType} [PedType] {toPedType} [PedType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0746
function SanAndreasOpcodeGame.setRelationship(_, _, _)
    return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0747
-- Instruction: clear_relationship {relationshipType} [RelationshipType] {ofPedType} [PedType] {toPedType} [PedType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0747
function SanAndreasOpcodeGame.clearRelationship(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07A8
-- Instruction: set_area51_sam_site {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07A8
function SanAndreasOpcodeGame.setArea51SamSite(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07E8
-- Instruction: is_relationship_set {relationshipType} [RelationshipType] {ofPedType} [PedType] {toPedType} [PedType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07E8
function SanAndreasOpcodeGame.isRelationshipSet(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0800
-- Instruction: is_2player_game_going_on
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0800
function SanAndreasOpcodeGame.is2PlayerGameGoingOn()
   return false
end

-- Opcode: 0x0828
-- Instruction: set_max_fire_generations {limit} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0828
function SanAndreasOpcodeGame.setMaxFireGenerations(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x084D
-- Instruction: activate_interior_peds {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/084D
function SanAndreasOpcodeGame.activateInteriorPeds(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0864
-- Instruction: enable_entry_exit_player_group_warping {x} [float] {y} [float] {radius} [float] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0864
function SanAndreasOpcodeGame.enableEntryExitPlayerGroupWarping(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0867
-- Instruction: is_procedural_interior_active {areaId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0867
function SanAndreasOpcodeGame.isProceduralInteriorActive(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0879
-- Instruction: set_gang_wars_active {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0879
function SanAndreasOpcodeGame.setGangWarsActive(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x087A
-- Instruction: is_gang_war_going_on
-- https://library.sannybuilder.com/#/sa/script/extensions/default/087A
function SanAndreasOpcodeGame.isGangWarGoingOn()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08A3
-- Instruction: can_trigger_gang_war_when_on_a_mission {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08A3
function SanAndreasOpcodeGame.canTriggerGangWarWhenOnAMission(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08A8
-- Instruction: set_always_draw_3d_markers {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08A8
function SanAndreasOpcodeGame.setAlwaysDraw3DMarkers(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08AC
-- Instruction: set_gang_wars_training_mission {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08AC
function SanAndreasOpcodeGame.setGangWarsTrainingMission(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08B1
-- Instruction: set_night_vision {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08B1
function SanAndreasOpcodeGame.setNightVision(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08B2
-- Instruction: set_infrared_vision {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08B2
function SanAndreasOpcodeGame.setInfraredVision(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08DD
-- Instruction: switch_death_penalties {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08DD
function SanAndreasOpcodeGame.switchDeathPenalties(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08DE
-- Instruction: switch_arrest_penalties {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08DE
function SanAndreasOpcodeGame.switchArrestPenalties(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08EA
-- Instruction: set_create_random_gang_members {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08EA
function SanAndreasOpcodeGame.setCreateRandomGangMembers(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08F4
-- Instruction: set_script_limit_to_gang_size {maxSize} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08F4
function SanAndreasOpcodeGame.setScriptLimitToGangSize(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x090D
-- Instruction: clear_specific_zones_to_trigger_gang_war
-- https://library.sannybuilder.com/#/sa/script/extensions/default/090D
function SanAndreasOpcodeGame.clearSpecificZonesToTriggerGangWar()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0923
-- Instruction: switch_ambient_planes {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0923
function SanAndreasOpcodeGame.switchAmbientPlanes(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0956
-- Instruction: [var maxNum: int] = find_max_number_of_group_members
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0956
function SanAndreasOpcodeGame.findMaxNumberOfGroupMembers(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x096A
-- Instruction: switch_police_helis {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/096A
function SanAndreasOpcodeGame.switchPoliceHelis(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0970
-- Instruction: force_death_restart
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0970
function SanAndreasOpcodeGame.forceDeathRestart()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0974
-- Instruction: reset_stuff_upon_resurrection
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0974
function SanAndreasOpcodeGame.resetStuffUponResurrection()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0983
-- Instruction: set_only_create_gang_members {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0983
function SanAndreasOpcodeGame.setOnlyCreateGangMembers(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x098A
-- Instruction: set_gunshot_sense_range_for_riot2 {range} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/098A
function SanAndreasOpcodeGame.setGunshotSenseRangeForRiot2(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x098E
-- Instruction: set_named_entry_exit_flag {name} [string] {flag} [EntryexitsFlag] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/098E
function SanAndreasOpcodeGame.setNamedEntryExitFlag(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x099D
-- Instruction: is_night_vision_active
-- https://library.sannybuilder.com/#/sa/script/extensions/default/099D
function SanAndreasOpcodeGame.isNightVisionActive()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x099E
-- Instruction: set_create_random_cops {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/099E
function SanAndreasOpcodeGame.setCreateRandomCops(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09A6
-- Instruction: show_blips_on_all_levels {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09A6
function SanAndreasOpcodeGame.showBlipsOnAllLevels(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09AC
-- Instruction: hide_all_frontend_blips {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09AC
function SanAndreasOpcodeGame.hideAllFrontendBlips(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09BD
-- Instruction: set_minigame_in_progress {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09BD
function SanAndreasOpcodeGame.setMinigameInProgress(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09BE
-- Instruction: is_minigame_in_progress
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09BE
function SanAndreasOpcodeGame.isMinigameInProgress(_)
    Script.setOpcodePartiallyImplemented()
    return false
end

-- Opcode: 0x09BF
-- Instruction: set_force_random_car_model {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09BF
function SanAndreasOpcodeGame.setForceRandomCarModel(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09C8
-- Instruction: are_subtitles_switched_on
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09C8
function SanAndreasOpcodeGame.areSubtitlesSwitchedOn(_)
    return true
end

-- Opcode: 0x09D2
-- Instruction: enable_ambient_crime {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09D2
function SanAndreasOpcodeGame.enableAmbientCrime(_)
    return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09D4
-- Instruction: clear_wanted_level_in_garage
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09D4
function SanAndreasOpcodeGame.clearWantedLevelInGarage()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09DD
-- Instruction: make_room_in_player_gang_for_mission_peds {_p1} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09DD
function SanAndreasOpcodeGame.makeRoomInPlayerGangForMissionPeds(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09E4
-- Instruction: set_aircraft_carrier_sam_site {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09E4
function SanAndreasOpcodeGame.setAircraftCarrierSamSite(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09E6
-- Instruction: enable_burglary_houses {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09E6
function SanAndreasOpcodeGame.enableBurglaryHouses(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09F5
-- Instruction: shut_all_chars_up {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09F5
function SanAndreasOpcodeGame.shutAllCharsUp(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09F8
-- Instruction: do_weapon_stuff_at_start_of_2p_game
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09F8
function SanAndreasOpcodeGame.doWeaponStuffAtStartOf2PGame()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09FA
-- Instruction: has_game_just_returned_from_frontend
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09FA
function SanAndreasOpcodeGame.hasGameJustReturnedFromFrontend()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09FB
-- Instruction: [var languageSlot: int] = get_current_language
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09FB
function SanAndreasOpcodeGame.getCurrentLanguage(_)
    Script.setOpcodePartiallyImplemented()
    return 0
end

-- Opcode: 0x0A03
-- Instruction: is_gang_war_fighting_going_on
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A03
function SanAndreasOpcodeGame.isGangWarFightingGoingOn(_)
    Script.setOpcodePartiallyImplemented()
    return false
end

-- Opcode: 0x0A0F
-- Instruction: has_language_changed
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A0F
function SanAndreasOpcodeGame.hasLanguageChanged()
   return false
end

-- Opcode: 0x0A13
-- Instruction: manage_all_population
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A13
function SanAndreasOpcodeGame.manageAllPopulation()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A14
-- Instruction: set_no_resprays {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A14
function SanAndreasOpcodeGame.setNoResprays(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A2B
-- Instruction: is_widescreen_on_in_options
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A2B
function SanAndreasOpcodeGame.isWidescreenOnInOptions()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A37
-- Instruction: force_all_vehicle_lights_off {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A37
function SanAndreasOpcodeGame.forceAllVehicleLightsOff(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0A3D
-- Instruction: activate_pimp_cheat {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A3D
function SanAndreasOpcodeGame.activatePimpCheat(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A3F
-- Instruction: set_script_coop_game {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A3F
function SanAndreasOpcodeGame.setScriptCoopGame(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A43
-- Instruction: get_rid_of_player_prostitute
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A43
function SanAndreasOpcodeGame.getRidOfPlayerProstitute()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A46
-- Instruction: switch_object_brains {type} [ScriptBrainAttachType] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A46
function SanAndreasOpcodeGame.switchObjectBrains(type, enabled)
    if (type == 0) then
        type = 'ped'
    elseif (type == 1) then
        type = 'object'
    else
        return
    end

    ElementManager.setExternalScriptTriggerStatus(type, enabled == 1)
end

-- Opcode: 0x0A48
-- Instruction: allow_pause_in_widescreen {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A48
function SanAndreasOpcodeGame.allowPauseInWidescreen(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A4B
-- Instruction: is_pc_using_joypad
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A4B
function SanAndreasOpcodeGame.isPcUsingJoypad()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0DD5
-- Instruction: [var platform: Platform] = get_game_platform
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0DD5
function SanAndreasOpcodeGame.getPlatform()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E0E
-- Instruction: [var width: int], [var height: int] = get_current_resolution
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E0E
function SanAndreasOpcodeGame.getCurrentResolution(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E20
-- Instruction: is_on_samp
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E20
function SanAndreasOpcodeGame.isSamp()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E2C
-- Instruction: [var slot: int] = get_current_save_slot
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E2C
function SanAndreasOpcodeGame.getCurrentSaveSlot(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E2D
-- Instruction: is_game_first_start
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E2D
function SanAndreasOpcodeGame.isFirstStart()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E45
-- Instruction: frame_mod {mod} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E45
function SanAndreasOpcodeGame.frameMod(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E5D
-- Instruction: is_cheat_active {cheat} [Cheats]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E5D
function SanAndreasOpcodeGame.isCheatActive(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E6E
-- Instruction: is_select_menu_just_pressed
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E6E
function SanAndreasOpcodeGame.isSelectMenuJustPressed()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EA1
-- Instruction: disable_second_player {restoreCamera} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EA1
function SanAndreasOpcodeGame.disableSecondPlayer(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EA2
-- Instruction: fix_two_players_separated_cars
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EA2
function SanAndreasOpcodeGame.fixTwoPlayersSeparatedCars(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F16
-- Instruction: set_on_mission {status} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F16
function SanAndreasOpcodeGame.setOnMission()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x050f, SanAndreasOpcodeGame.getMaxWantedLevel, '[var level: int] = get_max_wanted_level')
Opcode.register(0x06c8, SanAndreasOpcodeGame.setLaRiots, 'set_la_riots {state} [bool]')
Opcode.register(0x06d0, SanAndreasOpcodeGame.switchEmergencyServices, 'switch_emergency_services {state} [bool]')
Opcode.register(0x06d7, SanAndreasOpcodeGame.switchRandomTrains, 'switch_random_trains {state} [bool]')
Opcode.register(0x06f1, SanAndreasOpcodeGame.limitTwoPlayerDistance, 'limit_two_player_distance {distance} [float]')
Opcode.register(0x06f2, SanAndreasOpcodeGame.releaseTwoPlayerDistance, 'release_two_player_distance')
Opcode.register(0x06f3, SanAndreasOpcodeGame.setPlayerPlayerTargeting, 'set_player_player_targetting {state} [bool]')
Opcode.register(0x06fa, SanAndreasOpcodeGame.setPlayersCanBeInSeparateCars, 'set_players_can_be_in_separate_cars {state} [bool]')
Opcode.register(0x072c, SanAndreasOpcodeGame.switchCopsOnBikes, 'switch_cops_on_bikes {state} [bool]')
Opcode.register(0x0746, SanAndreasOpcodeGame.setRelationship, 'set_relationship {relationshipType} [RelationshipType] {ofPedType} [PedType] {toPedType} [PedType]')
Opcode.register(0x0747, SanAndreasOpcodeGame.clearRelationship, 'clear_relationship {relationshipType} [RelationshipType] {ofPedType} [PedType] {toPedType} [PedType]')
Opcode.register(0x07a8, SanAndreasOpcodeGame.setArea51SamSite, 'set_area51_sam_site {state} [bool]')
Opcode.register(0x07e8, SanAndreasOpcodeGame.isRelationshipSet, 'is_relationship_set {relationshipType} [RelationshipType] {ofPedType} [PedType] {toPedType} [PedType]')
Opcode.register(0x0800, SanAndreasOpcodeGame.is2PlayerGameGoingOn, 'is_2player_game_going_on')
Opcode.register(0x0828, SanAndreasOpcodeGame.setMaxFireGenerations, 'set_max_fire_generations {limit} [int]')
Opcode.register(0x084d, SanAndreasOpcodeGame.activateInteriorPeds, 'activate_interior_peds {state} [bool]')
Opcode.register(0x0864, SanAndreasOpcodeGame.enableEntryExitPlayerGroupWarping, 'enable_entry_exit_player_group_warping {x} [float] {y} [float] {radius} [float] {state} [bool]')
Opcode.register(0x0867, SanAndreasOpcodeGame.isProceduralInteriorActive, 'is_procedural_interior_active {areaId} [int]')
Opcode.register(0x0879, SanAndreasOpcodeGame.setGangWarsActive, 'set_gang_wars_active {state} [bool]')
Opcode.register(0x087a, SanAndreasOpcodeGame.isGangWarGoingOn, 'is_gang_war_going_on')
Opcode.register(0x08a3, SanAndreasOpcodeGame.canTriggerGangWarWhenOnAMission, 'can_trigger_gang_war_when_on_a_mission {state} [bool]')
Opcode.register(0x08a8, SanAndreasOpcodeGame.setAlwaysDraw3DMarkers, 'set_always_draw_3d_markers {state} [bool]')
Opcode.register(0x08ac, SanAndreasOpcodeGame.setGangWarsTrainingMission, 'set_gang_wars_training_mission {state} [bool]')
Opcode.register(0x08b1, SanAndreasOpcodeGame.setNightVision, 'set_night_vision {state} [bool]')
Opcode.register(0x08b2, SanAndreasOpcodeGame.setInfraredVision, 'set_infrared_vision {state} [bool]')
Opcode.register(0x08dd, SanAndreasOpcodeGame.switchDeathPenalties, 'switch_death_penalties {state} [bool]')
Opcode.register(0x08de, SanAndreasOpcodeGame.switchArrestPenalties, 'switch_arrest_penalties {state} [bool]')
Opcode.register(0x08ea, SanAndreasOpcodeGame.setCreateRandomGangMembers, 'set_create_random_gang_members {state} [bool]')
Opcode.register(0x08f4, SanAndreasOpcodeGame.setScriptLimitToGangSize, 'set_script_limit_to_gang_size {maxSize} [int]')
Opcode.register(0x090d, SanAndreasOpcodeGame.clearSpecificZonesToTriggerGangWar, 'clear_specific_zones_to_trigger_gang_war')
Opcode.register(0x0923, SanAndreasOpcodeGame.switchAmbientPlanes, 'switch_ambient_planes {state} [bool]')
Opcode.register(0x0956, SanAndreasOpcodeGame.findMaxNumberOfGroupMembers, '[var maxNum: int] = find_max_number_of_group_members')
Opcode.register(0x096a, SanAndreasOpcodeGame.switchPoliceHelis, 'switch_police_helis {state} [bool]')
Opcode.register(0x0970, SanAndreasOpcodeGame.forceDeathRestart, 'force_death_restart')
Opcode.register(0x0974, SanAndreasOpcodeGame.resetStuffUponResurrection, 'reset_stuff_upon_resurrection')
Opcode.register(0x0983, SanAndreasOpcodeGame.setOnlyCreateGangMembers, 'set_only_create_gang_members {state} [bool]')
Opcode.register(0x098a, SanAndreasOpcodeGame.setGunshotSenseRangeForRiot2, 'set_gunshot_sense_range_for_riot2 {range} [float]')
Opcode.register(0x098e, SanAndreasOpcodeGame.setNamedEntryExitFlag, 'set_named_entry_exit_flag {name} [string] {flag} [EntryexitsFlag] {state} [bool]')
Opcode.register(0x099d, SanAndreasOpcodeGame.isNightVisionActive, 'is_night_vision_active')
Opcode.register(0x099e, SanAndreasOpcodeGame.setCreateRandomCops, 'set_create_random_cops {state} [bool]')
Opcode.register(0x09a6, SanAndreasOpcodeGame.showBlipsOnAllLevels, 'show_blips_on_all_levels {state} [bool]')
Opcode.register(0x09ac, SanAndreasOpcodeGame.hideAllFrontendBlips, 'hide_all_frontend_blips {state} [bool]')
Opcode.register(0x09bd, SanAndreasOpcodeGame.setMinigameInProgress, 'set_minigame_in_progress {state} [bool]')
Opcode.register(0x09be, SanAndreasOpcodeGame.isMinigameInProgress, 'is_minigame_in_progress')
Opcode.register(0x09bf, SanAndreasOpcodeGame.setForceRandomCarModel, 'set_force_random_car_model {modelId} [model_vehicle]')
Opcode.register(0x09c8, SanAndreasOpcodeGame.areSubtitlesSwitchedOn, 'are_subtitles_switched_on')
Opcode.register(0x09d2, SanAndreasOpcodeGame.enableAmbientCrime, 'enable_ambient_crime {state} [bool]')
Opcode.register(0x09d4, SanAndreasOpcodeGame.clearWantedLevelInGarage, 'clear_wanted_level_in_garage')
Opcode.register(0x09dd, SanAndreasOpcodeGame.makeRoomInPlayerGangForMissionPeds, 'make_room_in_player_gang_for_mission_peds {_p1} [int]')
Opcode.register(0x09e4, SanAndreasOpcodeGame.setAircraftCarrierSamSite, 'set_aircraft_carrier_sam_site {state} [bool]')
Opcode.register(0x09e6, SanAndreasOpcodeGame.enableBurglaryHouses, 'enable_burglary_houses {state} [bool]')
Opcode.register(0x09f5, SanAndreasOpcodeGame.shutAllCharsUp, 'shut_all_chars_up {state} [bool]')
Opcode.register(0x09f8, SanAndreasOpcodeGame.doWeaponStuffAtStartOf2PGame, 'do_weapon_stuff_at_start_of_2p_game')
Opcode.register(0x09fa, SanAndreasOpcodeGame.hasGameJustReturnedFromFrontend, 'has_game_just_returned_from_frontend')
Opcode.register(0x09fb, SanAndreasOpcodeGame.getCurrentLanguage, '[var languageSlot: int] = get_current_language')
Opcode.register(0x0a03, SanAndreasOpcodeGame.isGangWarFightingGoingOn, 'is_gang_war_fighting_going_on')
Opcode.register(0x0a0f, SanAndreasOpcodeGame.hasLanguageChanged, 'has_language_changed')
Opcode.register(0x0a13, SanAndreasOpcodeGame.manageAllPopulation, 'manage_all_population')
Opcode.register(0x0a14, SanAndreasOpcodeGame.setNoResprays, 'set_no_resprays {state} [bool]')
Opcode.register(0x0a2b, SanAndreasOpcodeGame.isWidescreenOnInOptions, 'is_widescreen_on_in_options')
Opcode.register(0x0a37, SanAndreasOpcodeGame.forceAllVehicleLightsOff, 'force_all_vehicle_lights_off {state} [bool]')
Opcode.register(0x0a3d, SanAndreasOpcodeGame.activatePimpCheat, 'activate_pimp_cheat {state} [bool]')
Opcode.register(0x0a3f, SanAndreasOpcodeGame.setScriptCoopGame, 'set_script_coop_game {state} [bool]')
Opcode.register(0x0a43, SanAndreasOpcodeGame.getRidOfPlayerProstitute, 'get_rid_of_player_prostitute')
Opcode.register(0x0a46, SanAndreasOpcodeGame.switchObjectBrains, 'switch_object_brains {type} [ScriptBrainAttachType] {state} [bool]')
Opcode.register(0x0a48, SanAndreasOpcodeGame.allowPauseInWidescreen, 'allow_pause_in_widescreen {state} [bool]')
Opcode.register(0x0a4b, SanAndreasOpcodeGame.isPcUsingJoypad, 'is_pc_using_joypad')
Opcode.register(0x0dd5, SanAndreasOpcodeGame.getPlatform, '[var platform: Platform] = get_game_platform')
Opcode.register(0x0e0e, SanAndreasOpcodeGame.getCurrentResolution, '[var width: int], [var height: int] = get_current_resolution')
Opcode.register(0x0e20, SanAndreasOpcodeGame.isSamp, 'is_on_samp')
Opcode.register(0x0e2c, SanAndreasOpcodeGame.getCurrentSaveSlot, '[var slot: int] = get_current_save_slot')
Opcode.register(0x0e2d, SanAndreasOpcodeGame.isFirstStart, 'is_game_first_start')
Opcode.register(0x0e45, SanAndreasOpcodeGame.frameMod, 'frame_mod {mod} [int]')
Opcode.register(0x0e5d, SanAndreasOpcodeGame.isCheatActive, 'is_cheat_active {cheat} [Cheats]')
Opcode.register(0x0e6e, SanAndreasOpcodeGame.isSelectMenuJustPressed, 'is_select_menu_just_pressed')
Opcode.register(0x0ea1, SanAndreasOpcodeGame.disableSecondPlayer, 'disable_second_player {restoreCamera} [bool]')
Opcode.register(0x0ea2, SanAndreasOpcodeGame.fixTwoPlayersSeparatedCars, 'fix_two_players_separated_cars')
Opcode.register(0x0f16, SanAndreasOpcodeGame.setOnMission, 'set_on_mission {status} [bool]')
