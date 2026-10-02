SharedOpcodeTxd = {}
SharedOpcodeTxd.__index = SharedOpcodeTxd

-- Opcode: 0x038F
-- Instruction: load_sprite {memorySlot} [int] {spriteName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/038F
function SharedOpcodeTxd.loadSprite(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0390
-- Instruction: load_texture_dictionary {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0390
function SharedOpcodeTxd.loadDictionary(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0391
-- Instruction: remove_texture_dictionary
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0391
function SharedOpcodeTxd.remove()
   return Script.setOpcodePartiallyImplemented()
end


-- INI: 038f=2,load_texture %2h% as %1d%  ; Load dictionary with 0390 first
Opcode.register(0x038f, SharedOpcodeTxd.loadSprite, 2, 'load_sprite ${1} ${2}', {false, false})
-- INI: 0390=1,load_txd_dictionary %1h%  ;; never used in VC or GTA 3
Opcode.register(0x0390, SharedOpcodeTxd.loadDictionary, 1, 'load_texture_dictionary ${1}', {false})
-- INI: 0391=0,release_textures
Opcode.register(0x0391, SharedOpcodeTxd.remove, 0, 'remove_texture_dictionary', {})
