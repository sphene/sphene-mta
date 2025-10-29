SanAndreasOpcodeShopping = {}
SanAndreasOpcodeShopping.__index = SanAndreasOpcodeShopping

-- Opcode: 0x075D
-- Instruction: load_prices {sectionName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/075D
function SanAndreasOpcodeShopping.loadPrices(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x075E
-- Instruction: load_shop {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/075E
function SanAndreasOpcodeShopping.load(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x075F
-- Instruction: [var numItems: int] = get_number_of_items_in_shop
-- https://library.sannybuilder.com/#/sa/script/extensions/default/075F
function SanAndreasOpcodeShopping.getNumberOfItems(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0760
-- Instruction: [var id: int] = get_item_in_shop {nth} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0760
function SanAndreasOpcodeShopping.getItem(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0761
-- Instruction: [var price: int] = get_price_of_item {itemId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0761
function SanAndreasOpcodeShopping.getPriceOfItem(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0783
-- Instruction: [var value: int] = get_shopping_extra_info {itemId} [int] {flag} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0783
function SanAndreasOpcodeShopping.getExtraInfo(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x078C
-- Instruction: [var name: string] = get_name_of_item {itemId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/078C
function SanAndreasOpcodeShopping.getNameOfItem(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0790
-- Instruction: buy_item {itemId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0790
function SanAndreasOpcodeShopping.buyItem(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07B0
-- Instruction: [var name: string] = get_loaded_shop
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07B0
function SanAndreasOpcodeShopping.getLoaded(_)
    local player = PlayerElement.getLocalPlayer()
    local shopName = 'UNKNOWN'

    if (player) then
        shopName = player:getActiveInteriorName()
    end

    Script.setOpcodePartiallyImplemented()
    Script.storeValueAtIndex(1, shopName)

    return true
end

-- Opcode: 0x087C
-- Instruction: clear_loaded_shop
-- https://library.sannybuilder.com/#/sa/script/extensions/default/087C
function SanAndreasOpcodeShopping.clearLoaded()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08C8
-- Instruction: add_price_modifier {itemId} [int] {modifier} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08C8
function SanAndreasOpcodeShopping.addPriceModifier(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x08C9
-- Instruction: remove_price_modifier {itemId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08C9
function SanAndreasOpcodeShopping.removePriceModifier(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0942
-- Instruction: has_player_bought_item {itemId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0942
function SanAndreasOpcodeShopping.hasPlayerBoughtItem(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x075d, SanAndreasOpcodeShopping.loadPrices, 'load_prices {sectionName} [string]')
Opcode.register(0x075e, SanAndreasOpcodeShopping.load, 'load_shop {name} [string]')
Opcode.register(0x075f, SanAndreasOpcodeShopping.getNumberOfItems, '[var numItems: int] = get_number_of_items_in_shop')
Opcode.register(0x0760, SanAndreasOpcodeShopping.getItem, '[var id: int] = get_item_in_shop {nth} [int]')
Opcode.register(0x0761, SanAndreasOpcodeShopping.getPriceOfItem, '[var price: int] = get_price_of_item {itemId} [int]')
Opcode.register(0x0783, SanAndreasOpcodeShopping.getExtraInfo, '[var value: int] = get_shopping_extra_info {itemId} [int] {flag} [int]')
Opcode.register(0x078c, SanAndreasOpcodeShopping.getNameOfItem, '[var name: string] = get_name_of_item {itemId} [int]')
Opcode.register(0x0790, SanAndreasOpcodeShopping.buyItem, 'buy_item {itemId} [int]')
Opcode.register(0x07b0, SanAndreasOpcodeShopping.getLoaded, '[var name: string] = get_loaded_shop')
Opcode.register(0x087c, SanAndreasOpcodeShopping.clearLoaded, 'clear_loaded_shop')
Opcode.register(0x08c8, SanAndreasOpcodeShopping.addPriceModifier, 'add_price_modifier {itemId} [int] {modifier} [int]')
Opcode.register(0x08c9, SanAndreasOpcodeShopping.removePriceModifier, 'remove_price_modifier {itemId} [int]')
Opcode.register(0x0942, SanAndreasOpcodeShopping.hasPlayerBoughtItem, 'has_player_bought_item {itemId} [int]')
