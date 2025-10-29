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


Opcode.register(0x04bc, ViceCityOpcodeCutscene.setAnimToLoop, 'set_cutscene_anim_to_loop {animName} [string]')
Opcode.register(0x0522, ViceCityOpcodeCutscene.disableShadows, 'disable_cutscene_shadows')
Opcode.register(0x0569, ViceCityOpcodeCutscene.loadUncompressedAnim, 'load_uncompressed_anim {animation} [string]')
Opcode.register(0x0598, ViceCityOpcodeCutscene.createDustEffectForHeli, 'create_dust_effect_for_cutscene_heli {heliObject} [CutsceneObject] {radius} [float] {density} [int]')
