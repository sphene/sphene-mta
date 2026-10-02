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


-- INI: 059d=1,shuffle_card_decks %1d%
Opcode.register(0x059d, SharedOpcodeCardDecks.shuffle, 1, 'shuffle_card_decks ${1}', {false})
-- INI: 059e=1,fetch_next_card %1d%
Opcode.register(0x059e, SharedOpcodeCardDecks.fetchNextCard, 1, '${1} = fetch_next_card', {true})
