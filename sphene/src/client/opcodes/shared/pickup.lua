SharedOpcodePickup = {}
SharedOpcodePickup.__index = SharedOpcodePickup

-- Opcode: 0x0213
-- Instruction: [var handle: Pickup] = create_pickup {modelId} [model_object] {pickupType} [PickupType] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0213
function SharedOpcodePickup.create(model, type, posX, posY, posZ, _)
    local pickup = PickupElement:create(type, model)
    pickup:spawn(posX, posY, posZ)

    return pickup
end

-- Opcode: 0x0214
-- Instruction: has_pickup_been_collected [Pickup]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0214
function SharedOpcodePickup.hasBeenCollected(pickup)
    return pickup:isPickedUp()
end

-- Opcode: 0x0215
-- Instruction: remove_pickup [Pickup]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0215
function SharedOpcodePickup.remove(pickup)
    if (type(pickup) ~= 'table') then
        return
    end

    pickup:destroy()
end

-- Opcode: 0x02E1
-- Instruction: [var handle: Pickup] = create_money_pickup {x} [float] {y} [float] {z} [float] {cashAmount} [int] {permanent} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/02E1
function SharedOpcodePickup.createMoney(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x032B
-- Instruction: [var handle: Pickup] = create_pickup_with_ammo {modelId} [model_object] {pickupType} [PickupType] {ammo} [int] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/032B
function SharedOpcodePickup.createWithAmmo(model, _, _, posX, posY, posZ)
    Script.setOpcodePartiallyImplemented()

    -- local weaponPickup = WeaponPickupElement:create(model, type, ammo)
    local weaponPickup = PickupElement:create(2, model, false)
    weaponPickup:spawn(posX, posY, posZ)

    return weaponPickup
end

-- Opcode: 0x04A6
-- Instruction: [var handle: Pickup] = create_protection_pickup {x} [float] {y} [float] {z} [float] {revenueLimit} [int] {revenueRate} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04A6
function SharedOpcodePickup.createProtection(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0517
-- Instruction: [var handle: Pickup] = create_locked_property_pickup {x} [float] {y} [float] {z} [float] {message} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0517
function SharedOpcodePickup.createLockedProperty(posX, posY, posZ, asset, _)
    local assetPickup = PickupElement:create(3, 1272, true)
    assetPickup:spawn(posX, posY, posZ)
    assetPickup:setHiddenInMission(true, assetPickup:getAlpha())

    return assetPickup
end

-- Opcode: 0x0518
-- Instruction: [var handle: Pickup] = create_forsale_property_pickup {x} [float] {y} [float] {z} [float] {price} [int] {message} [gxt_key]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0518
function SharedOpcodePickup.createForSaleProperty(posX, posY, posZ, price, asset, _)
    Script.setOpcodePartiallyImplemented()
    local assetPickup = PickupElement:create(3, 1273, true)
    assetPickup:spawn(posX, posY, posZ)
    assetPickup:setHiddenInMission(true, assetPickup:getAlpha())

    return assetPickup
end


-- INI: 0213=6,%6d% = create_pickup %1o% type %2d% at %3d% %4d% %5d%
Opcode.register(0x0213, SharedOpcodePickup.create, 6, '${6} = create_pickup ${pickup.1} ${2} ${3} ${4} ${5}', {false, false, false, false, false, true})
-- INI: 0214=1,  pickup %1d% picked_up
Opcode.register(0x0214, SharedOpcodePickup.hasBeenCollected, 1, 'has_pickup_been_collected ${1}', {false})
-- INI: 0215=1,destroy_pickup %1d%
Opcode.register(0x0215, SharedOpcodePickup.remove, 1, 'remove_pickup ${1}', {false})
-- INI: 02e1=5,%5d% = create_cash_pickup %4d% at %1d% %2d% %3d%
Opcode.register(0x02e1, SharedOpcodePickup.createMoney, 6, '${5} = create_money_pickup ${4} ${1} ${2} ${3}', {false, false, false, false, true})
-- INI: 032b=7,%7d% = create_weapon_pickup %1o% %2d% ammo %3d% at %4d% %5d% %6d%
Opcode.register(0x032b, SharedOpcodePickup.createWithAmmo, 7, '${7} = create_pickup_with_ammo ${pickup.1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true})
-- INI: 04a6=6,%6d% = create_asset_money_pickup_at %1d% %2d% %3d% money %4d% rate %5d%
Opcode.register(0x04a6, SharedOpcodePickup.createProtection, 6, '${6} = create_protection_pickup ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false, true})
-- INI: 0517=5,%5d% = create_unavailable_asset_pickup %4g% at %1d% %2d% %3d%
Opcode.register(0x0517, SharedOpcodePickup.createLockedProperty, 5, '${5} = create_locked_property_pickup ${4} ${1} ${2} ${3}', {false, false, false, false, true})
-- INI: 0518=6,%6d% = create_available_asset_pickup %5g% at %1d% %2d% %3d% price %4d%
Opcode.register(0x0518, SharedOpcodePickup.createForSaleProperty, 6, '${6} = create_forsale_property_pickup ${5} ${1} ${2} ${3} ${4}', {false, false, false, false, false, true})
