SharedOpcodeCardDecks = {}
SharedOpcodeCardDecks.__index = SharedOpcodeCardDecks

-- Opcode: 0x059D
-- Instruction: shuffle_card_decks {type} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/059D
function SharedOpcodeCardDecks.shuffle(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x059E
-- Instruction: [var number: int] = fetch_next_card
-- https://library.sannybuilder.com/#/sa/script/extensions/default/059E
function SharedOpcodeCardDecks.fetchNextCard(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x059d, SharedOpcodeCardDecks.shuffle, 'shuffle_card_decks {type} [int]')
Opcode.register(0x059e, SharedOpcodeCardDecks.fetchNextCard, '[var number: int] = fetch_next_card')
