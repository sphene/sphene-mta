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

    return shopName
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


-- INI: 075D=1,load_shopping_data_SHOPS_subsection %1d% ; "string"
Opcode.register(0x075d, SanAndreasOpcodeShopping.loadPrices, 1, 'load_prices ${1}', {false})
-- INI: 075E=1,load_shopping_data_PRICES_subsection %1d% ; "string"
Opcode.register(0x075e, SanAndreasOpcodeShopping.load, 1, 'load_shop ${1}', {false})
-- INI: 075F=1,store_shopping_data_entries_number_to %1d%
Opcode.register(0x075f, SanAndreasOpcodeShopping.getNumberOfItems, 1, '${1} = get_number_of_items_in_shop', {false})
-- INI: 0760=2,store_shopping_data_index %1d% textureCRC_to %2d%
Opcode.register(0x0760, SanAndreasOpcodeShopping.getItem, 2, '${2} = get_item_in_shop ${1}', {false, true})
-- INI: 0761=2,get_shopping_item_with_textureCRC %1d% price_to %2d%
Opcode.register(0x0761, SanAndreasOpcodeShopping.getPriceOfItem, 2, '${2} = get_price_of_item ${1}', {false, true})
-- INI: 0783=3,get_shopping_item_with_textureCRC %1d% flag %2d% store_to %3d%
Opcode.register(0x0783, SanAndreasOpcodeShopping.getExtraInfo, 3, '${3} = get_shopping_extra_info ${1} ${2}', {false, false, true})
-- INI: 078C=2,get_shopping_item_with_textureCRC %1d% nametag_to %2d% ; 8-byte string
Opcode.register(0x078c, SanAndreasOpcodeShopping.getNameOfItem, 2, '${1} = get_name_of_item ${2}', {false, false})
-- INI: 0790=1,charge_money_for_shopping_item_with_textureCRC %1d%
Opcode.register(0x0790, SanAndreasOpcodeShopping.buyItem, 1, 'buy_item ${1}', {false})
-- INI: 07B0=1,get_active_shop_name_to %1d% ; s$
Opcode.register(0x07b0, SanAndreasOpcodeShopping.getLoaded, 1, '${1} = get_loaded_shop', {false})
-- INI: 087C=0,release_shopping_data
Opcode.register(0x087c, SanAndreasOpcodeShopping.clearLoaded, 0, 'clear_loaded_shop', {})
-- INI: 08C8=2,set_shopping_item_with_textureCRC %1d% price_to %2d%
Opcode.register(0x08c8, SanAndreasOpcodeShopping.addPriceModifier, 2, 'add_price_modifier ${1} ${2}', {false, false})
-- INI: 08C9=1,reset_shopping_item %1d% price
Opcode.register(0x08c9, SanAndreasOpcodeShopping.removePriceModifier, 1, 'remove_price_modifier ${1}', {false})
-- INI: 0942=1,  item_with_textureCRC %1d% is_clothing
Opcode.register(0x0942, SanAndreasOpcodeShopping.hasPlayerBoughtItem, 1, 'has_player_bought_item ${1}', {false})
