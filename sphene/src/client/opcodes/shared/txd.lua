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


Opcode.register(0x038f, SharedOpcodeTxd.loadSprite, 'load_sprite {memorySlot} [int] {spriteName} [string]')
Opcode.register(0x0390, SharedOpcodeTxd.loadDictionary, 'load_texture_dictionary {name} [string]')
Opcode.register(0x0391, SharedOpcodeTxd.remove, 'remove_texture_dictionary')
