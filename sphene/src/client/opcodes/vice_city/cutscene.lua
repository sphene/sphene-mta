ViceCityOpcodeCutscene = {}
ViceCityOpcodeCutscene.__index = ViceCityOpcodeCutscene

-- Opcode: 0x04BC
-- Instruction: set_cutscene_anim_to_loop {animName} [string]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/04BC
function ViceCityOpcodeCutscene.setAnimToLoop(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0522
-- Instruction: disable_cutscene_shadows
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0522
function ViceCityOpcodeCutscene.disableShadows()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0569
-- Instruction: load_uncompressed_anim {animation} [string]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0569
function ViceCityOpcodeCutscene.loadUncompressedAnim(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0598
-- Instruction: create_dust_effect_for_cutscene_heli {heliObject} [CutsceneObject] {radius} [float] {density} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0598
function ViceCityOpcodeCutscene.createDustEffectForHeli(_, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 04bc=1,set_cutscene_anim %1s% to_loop
Opcode.register(0x04bc, ViceCityOpcodeCutscene.setAnimToLoop, 1, 'set_cutscene_anim_to_loop ${1}', {false})
-- INI: 0522=0,disable_cutscene_shadows
Opcode.register(0x0522, ViceCityOpcodeCutscene.disableShadows, 0, 'disable_cutscene_shadows', {})
-- INI: 0569=1,load_uncompressed_animation %1s%
Opcode.register(0x0569, ViceCityOpcodeCutscene.loadUncompressedAnim, 1, 'load_uncompressed_anim ${1}', {false})
-- INI: 0598=3,stir_ground_around_object %1d% radius %2d% density %3h%
Opcode.register(0x0598, ViceCityOpcodeCutscene.createDustEffectForHeli, 3, 'create_dust_effect_for_cutscene_heli ${1} ${2} ${3}', {false, false, false})
