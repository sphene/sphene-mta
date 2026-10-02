SanAndreasOpcodeGame = {}
SanAndreasOpcodeGame.__index = SanAndreasOpcodeGame

-- Opcode: 0x050F
-- Instruction: [var level: int] = get_max_wanted_level
-- https://library.sannybuilder.com/#/sa/script/extensions/default/050F
function SanAndreasOpcodeGame.getMaxWantedLevel(_)
    return Game.getMaxWantedLevel()
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


-- INI: 050f=1,get_max_wanted_level_to %1d%
Opcode.register(0x050f, SanAndreasOpcodeGame.getMaxWantedLevel, 1, '${1} = get_max_wanted_level', {true})
-- INI: 06C8=1,enable_riot %1h%
Opcode.register(0x06c8, SanAndreasOpcodeGame.setLaRiots, 1, 'set_la_riots ${1}', {false})
-- INI: 06D0=1,enable_emergency_traffic %1h%
Opcode.register(0x06d0, SanAndreasOpcodeGame.switchEmergencyServices, 1, 'switch_emergency_services ${1}', {false})
-- INI: 06D7=1,enable_train_traffic %1h%
Opcode.register(0x06d7, SanAndreasOpcodeGame.switchRandomTrains, 1, 'switch_random_trains ${1}', {false})
-- INI: 06F1=1,set_2_player_distance_limit_to %1d%
Opcode.register(0x06f1, SanAndreasOpcodeGame.limitTwoPlayerDistance, 1, 'limit_two_player_distance ${1}', {false})
-- INI: 06F2=0,release_2_players_distance_limit
Opcode.register(0x06f2, SanAndreasOpcodeGame.releaseTwoPlayerDistance, 0, 'release_two_player_distance', {})
-- INI: 06F3=1,set_players_can_target_eachother %1h%
Opcode.register(0x06f3, SanAndreasOpcodeGame.setPlayerPlayerTargeting, 1, 'set_player_player_targetting ${1}', {false})
-- INI: 06FA=1,allow_players_to_use_separate_vehicles %1h%
Opcode.register(0x06fa, SanAndreasOpcodeGame.setPlayersCanBeInSeparateCars, 1, 'set_players_can_be_in_separate_cars ${1}', {false})
-- INI: 072C=1,generate_police_bikes %1h%
Opcode.register(0x072c, SanAndreasOpcodeGame.switchCopsOnBikes, 1, 'switch_cops_on_bikes ${1}', {false})
-- INI: 0746=3,set_acquaintance %1h% of_actors_pedtype %2h% to_actors_pedtype %3h%
Opcode.register(0x0746, SanAndreasOpcodeGame.setRelationship, 3, 'set_relationship ${1} ${2} ${3}', {false, false, false})
-- INI: 0747=3,clear_acquaintance %1h% of_actors_pedtype %2h% to_actors_pedtype %3h% ; see ped.dat
Opcode.register(0x0747, SanAndreasOpcodeGame.clearRelationship, 3, 'clear_relationship ${1} ${2} ${3}', {false, false, false})
-- INI: 07A8=1,enable_area69_sam %1h%
Opcode.register(0x07a8, SanAndreasOpcodeGame.setArea51SamSite, 1, 'set_area51_sam_site ${1}', {false})
-- INI: 07E8=3,  acquaintance %1h% of_actors_type %2h% to_actors_type %3h% set
Opcode.register(0x07e8, SanAndreasOpcodeGame.isRelationshipSet, 3, 'is_relationship_set ${1} ${2} ${3}', {false, false, false})
-- INI: 0800=0,  in_two_players_mode
Opcode.register(0x0800, SanAndreasOpcodeGame.is2PlayerGameGoingOn, 0, 'is_2player_game_going_on', {})
-- INI: 0828=1,set_max_fire_generations %1h%
Opcode.register(0x0828, SanAndreasOpcodeGame.setMaxFireGenerations, 1, 'set_max_fire_generations ${1}', {false})
-- INI: 084D=1,unknown_enable_burglary_house_occupants %1h%
Opcode.register(0x084d, SanAndreasOpcodeGame.activateInteriorPeds, 1, 'activate_interior_peds ${1}', {false})
-- INI: 0864=4,set_interior_at %1d% %2d% radius %3d% access %4h%
Opcode.register(0x0864, SanAndreasOpcodeGame.enableEntryExitPlayerGroupWarping, 4, 'enable_entry_exit_player_group_warping ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0867=1,  unknown_in_burglary_interior %1h%
Opcode.register(0x0867, SanAndreasOpcodeGame.isProceduralInteriorActive, 1, 'is_procedural_interior_active ${1}', {false})
-- INI: 0879=1,enable_gang_wars %1h%
Opcode.register(0x0879, SanAndreasOpcodeGame.setGangWarsActive, 1, 'set_gang_wars_active ${1}', {false})
-- INI: 087A=0,  gang_war_in_progress
Opcode.register(0x087a, SanAndreasOpcodeGame.isGangWarGoingOn, 0, 'is_gang_war_going_on', {})
-- INI: 08A3=1,update_respect_while_on_mission %1h%
Opcode.register(0x08a3, SanAndreasOpcodeGame.canTriggerGangWarWhenOnAMission, 1, 'can_trigger_gang_war_when_on_a_mission ${1}', {false})
-- INI: 08A8=1,set_markers_to_long_distance %1h%
Opcode.register(0x08a8, SanAndreasOpcodeGame.setAlwaysDraw3DMarkers, 1, 'set_always_draw_3d_markers ${1}', {false})
-- INI: 08AC=1,hide_gang_zones_on_map %1h%
Opcode.register(0x08ac, SanAndreasOpcodeGame.setGangWarsTrainingMission, 1, 'set_gang_wars_training_mission ${1}', {false})
-- INI: 08B1=1,enable_night_vision %1h%
Opcode.register(0x08b1, SanAndreasOpcodeGame.setNightVision, 1, 'set_night_vision ${1}', {false})
-- INI: 08B2=1,enable_thermal_vision %1h%
Opcode.register(0x08b2, SanAndreasOpcodeGame.setInfraredVision, 1, 'set_infrared_vision ${1}', {false})
-- INI: 08DD=1,lose_stuff_after_wasted %1h%
Opcode.register(0x08dd, SanAndreasOpcodeGame.switchDeathPenalties, 1, 'switch_death_penalties ${1}', {false})
-- INI: 08DE=1,lose_stuff_after_busted %1h%
Opcode.register(0x08de, SanAndreasOpcodeGame.switchArrestPenalties, 1, 'switch_arrest_penalties ${1}', {false})
-- INI: 08EA=1,enable_gangs_spawn %1h%
Opcode.register(0x08ea, SanAndreasOpcodeGame.setCreateRandomGangMembers, 1, 'set_create_random_gang_members ${1}', {false})
-- INI: 08F4=1,set_max_group_members %1h%
Opcode.register(0x08f4, SanAndreasOpcodeGame.setScriptLimitToGangSize, 1, 'set_script_limit_to_gang_size ${1}', {false})
-- INI: 090D=0,highlight_all_inactive_gang_zones_as_available_for_gangwars
Opcode.register(0x090d, SanAndreasOpcodeGame.clearSpecificZonesToTriggerGangWar, 0, 'clear_specific_zones_to_trigger_gang_war', {})
-- INI: 0923=1,enable_air_traffic %1h%
Opcode.register(0x0923, SanAndreasOpcodeGame.switchAmbientPlanes, 1, 'switch_ambient_planes ${1}', {false})
-- INI: 0956=1,get_respect_to %1d%
Opcode.register(0x0956, SanAndreasOpcodeGame.findMaxNumberOfGroupMembers, 1, '${1} = find_max_number_of_group_members', {true})
-- INI: 096A=1,enable_flying_helis %1h%
Opcode.register(0x096a, SanAndreasOpcodeGame.switchPoliceHelis, 1, 'switch_police_helis ${1}', {false})
-- INI: 0970=0,teleport_in_override_restart ; 016Eh
Opcode.register(0x0970, SanAndreasOpcodeGame.forceDeathRestart, 0, 'force_death_restart', {})
-- INI: 0974=0,emulate_wasted_busted  ; 12 hours and clear weapons
Opcode.register(0x0974, SanAndreasOpcodeGame.resetStuffUponResurrection, 0, 'reset_stuff_upon_resurrection', {})
-- INI: 0983=1,unknown_disable_gang_wars %1h%
Opcode.register(0x0983, SanAndreasOpcodeGame.setOnlyCreateGangMembers, 1, 'set_only_create_gang_members ${1}', {false})
-- INI: 098A=1,set_gunshot_sense_range_for_riot2 %1d%
Opcode.register(0x098a, SanAndreasOpcodeGame.setGunshotSenseRangeForRiot2, 1, 'set_gunshot_sense_range_for_riot2 ${1}', {false})
-- INI: 098E=3,set_interior %1g% bitmask %2d% flag %3h%
Opcode.register(0x098e, SanAndreasOpcodeGame.setNamedEntryExitFlag, 3, 'set_named_entry_exit_flag ${1} ${2} ${3}', {false, false, false})
-- INI: 099D=0,  night_vision_enabled
Opcode.register(0x099d, SanAndreasOpcodeGame.isNightVisionActive, 0, 'is_night_vision_active', {})
-- INI: 099E=1,enable_police_patrols %1h%
Opcode.register(0x099e, SanAndreasOpcodeGame.setCreateRandomCops, 1, 'set_create_random_cops ${1}', {false})
-- INI: 09A6=1,enable_interior_radar_blips %1h%
Opcode.register(0x09a6, SanAndreasOpcodeGame.showBlipsOnAllLevels, 1, 'show_blips_on_all_levels ${1}', {false})
-- INI: 09AC=1,disable_map_icons %1h%
Opcode.register(0x09ac, SanAndreasOpcodeGame.hideAllFrontendBlips, 1, 'hide_all_frontend_blips ${1}', {false})
-- INI: 09BD=1,allow_other_scripts_to_display_text_boxes %1h%
Opcode.register(0x09bd, SanAndreasOpcodeGame.setMinigameInProgress, 1, 'set_minigame_in_progress ${1}', {false})
-- INI: 09BE=0,  are_text_boxes_locked_to_any_script
Opcode.register(0x09be, SanAndreasOpcodeGame.isMinigameInProgress, 0, 'is_minigame_in_progress', {})
-- INI: 09BF=1,set_random_traffic_spawn_to_model %1m%  ; Load the vehicle model before using this
Opcode.register(0x09bf, SanAndreasOpcodeGame.setForceRandomCarModel, 1, 'set_force_random_car_model ${vehicle.1}', {false})
-- INI: 09C8=0,  menu_subtitles_switched_on
Opcode.register(0x09c8, SanAndreasOpcodeGame.areSubtitlesSwitchedOn, 0, 'are_subtitles_switched_on', {})
-- INI: 09D2=1,set_cops_chase_criminals %1d%
Opcode.register(0x09d2, SanAndreasOpcodeGame.enableAmbientCrime, 1, 'enable_ambient_crime ${1}', {false})
-- INI: 09D4=0,suspend_wanted_level
Opcode.register(0x09d4, SanAndreasOpcodeGame.clearWantedLevelInGarage, 0, 'clear_wanted_level_in_garage', {})
-- INI: 09DD=1,unknown_player_group %1h%
Opcode.register(0x09dd, SanAndreasOpcodeGame.makeRoomInPlayerGangForMissionPeds, 1, 'make_room_in_player_gang_for_mission_peds ${1}', {false})
-- INI: 09E4=1,enable_aircraftcarrier_sam %1h%
Opcode.register(0x09e4, SanAndreasOpcodeGame.setAircraftCarrierSamSite, 1, 'set_aircraft_carrier_sam_site ${1}', {false})
-- INI: 09E6=1,set_burglary_houses_accessible %1h%
Opcode.register(0x09e6, SanAndreasOpcodeGame.enableBurglaryHouses, 1, 'enable_burglary_houses ${1}', {false})
-- INI: 09F5=1,disable_player_mutal_activities %1d%
Opcode.register(0x09f5, SanAndreasOpcodeGame.shutAllCharsUp, 1, 'shut_all_chars_up ${1}', {false})
-- INI: 09F8=0,give_player2_weapons_of_player1
Opcode.register(0x09f8, SanAndreasOpcodeGame.doWeaponStuffAtStartOf2PGame, 0, 'do_weapon_stuff_at_start_of_2p_game', {})
-- INI: 09FA=0,  is_menu_closed
Opcode.register(0x09fa, SanAndreasOpcodeGame.hasGameJustReturnedFromFrontend, 0, 'has_game_just_returned_from_frontend', {})
-- INI: 09FB=1,%1d% = current_language
Opcode.register(0x09fb, SanAndreasOpcodeGame.getCurrentLanguage, 1, '${1} = get_current_language', {true})
-- INI: 0A03=0,  unknown_gang_war_in_progress
Opcode.register(0x0a03, SanAndreasOpcodeGame.isGangWarFightingGoingOn, 0, 'is_gang_war_fighting_going_on', {})
-- INI: 0A0F=0,  new_language_set
Opcode.register(0x0a0f, SanAndreasOpcodeGame.hasLanguageChanged, 0, 'has_language_changed', {})
-- INI: 0A13=0,unknown_sync_player_camera
Opcode.register(0x0a13, SanAndreasOpcodeGame.manageAllPopulation, 0, 'manage_all_population', {})
-- INI: 0A14=1,disable_respray_garages %1h%
Opcode.register(0x0a14, SanAndreasOpcodeGame.setNoResprays, 1, 'set_no_resprays ${1}', {false})
-- INI: 0A2B=0,  widescreen_option_enabled
Opcode.register(0x0a2b, SanAndreasOpcodeGame.isWidescreenOnInOptions, 0, 'is_widescreen_on_in_options', {})
-- INI: 0A37=1,disable_vehicle_lights %1d%
Opcode.register(0x0a37, SanAndreasOpcodeGame.forceAllVehicleLightsOff, 1, 'force_all_vehicle_lights_off ${1}', {false})
-- INI: 0A3D=1,enable_prostitutes_pay_you %1h%
Opcode.register(0x0a3d, SanAndreasOpcodeGame.activatePimpCheat, 1, 'activate_pimp_cheat ${1}', {false})
-- INI: 0A3F=1,set_unused_flag %1h%
Opcode.register(0x0a3f, SanAndreasOpcodeGame.setScriptCoopGame, 1, 'set_script_coop_game ${1}', {false})
-- INI: 0A43=0,get_rid_of_player_prostitute
Opcode.register(0x0a43, SanAndreasOpcodeGame.getRidOfPlayerProstitute, 0, 'get_rid_of_player_prostitute', {})
-- INI: 0A46=2,set_external_scripts_triggers_type %1h% enabled %2h%
Opcode.register(0x0a46, SanAndreasOpcodeGame.switchObjectBrains, 2, 'switch_object_brains ${1} ${2}', {false, false})
-- INI: 0A48=1,enable_menu_access_in_widescreen_mode %1h%
Opcode.register(0x0a48, SanAndreasOpcodeGame.allowPauseInWidescreen, 1, 'allow_pause_in_widescreen ${1}', {false})
-- INI: 0A4B=0,  controls_set_to_joystick
Opcode.register(0x0a4b, SanAndreasOpcodeGame.isPcUsingJoypad, 0, 'is_pc_using_joypad', {})
-- INI: 0DD5=1,%1d% = get_platform ; PC
Opcode.register(0x0dd5, SanAndreasOpcodeGame.getPlatform, 1, '${1} = get_game_platform', {true})
-- INI: 0E0E=2,get_current_resolution_to %1d% %2d%
Opcode.register(0x0e0e, SanAndreasOpcodeGame.getCurrentResolution, 2, '${1}, ${2} = get_current_resolution', {true, true})
-- INI: 0E20=0,is_on_samp
Opcode.register(0x0e20, SanAndreasOpcodeGame.isSamp, 0, 'is_on_samp', {})
-- INI: 0E2C=1,get_current_save_slot %1d%
Opcode.register(0x0e2c, SanAndreasOpcodeGame.getCurrentSaveSlot, 1, '${1} = get_current_save_slot', {false})
-- INI: 0E2D=0,is_game_first_start
Opcode.register(0x0e2d, SanAndreasOpcodeGame.isFirstStart, 0, 'is_game_first_start', {})
-- INI: 0E45=1,frame_mod %1d%
Opcode.register(0x0e45, SanAndreasOpcodeGame.frameMod, 1, 'frame_mod ${1}', {false})
-- INI: 0E5D=1,is_cheat_active %1d%
Opcode.register(0x0e5d, SanAndreasOpcodeGame.isCheatActive, 1, 'is_cheat_active ${1}', {false})
-- INI: 0E6E=0,is_select_menu_just_pressed
Opcode.register(0x0e6e, SanAndreasOpcodeGame.isSelectMenuJustPressed, 0, 'is_select_menu_just_pressed', {})
-- INI: 0EA1=1,disable_second_player_restore_camera %1d%
Opcode.register(0x0ea1, SanAndreasOpcodeGame.disableSecondPlayer, 1, 'disable_second_player ${1}', {false})
-- INI: 0EA2=1,fix_two_players_separated_cars %1d%
Opcode.register(0x0ea2, SanAndreasOpcodeGame.fixTwoPlayersSeparatedCars, 0, 'fix_two_players_separated_cars', {})
Opcode.register(0x0f16, SanAndreasOpcodeGame.setOnMission, 1, 'set_on_mission ${1}')
