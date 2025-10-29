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


Opcode.register(0x0213, SharedOpcodePickup.create, '[var handle: Pickup] = create_pickup {modelId} [model_object] {pickupType} [PickupType] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0214, SharedOpcodePickup.hasBeenCollected, 'has_pickup_been_collected [Pickup]')
Opcode.register(0x0215, SharedOpcodePickup.remove, 'remove_pickup [Pickup]')
Opcode.register(0x02e1, SharedOpcodePickup.createMoney, '[var handle: Pickup] = create_money_pickup {x} [float] {y} [float] {z} [float] {cashAmount} [int] {permanent} [bool]')
Opcode.register(0x032b, SharedOpcodePickup.createWithAmmo, '[var handle: Pickup] = create_pickup_with_ammo {modelId} [model_object] {pickupType} [PickupType] {ammo} [int] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x04a6, SharedOpcodePickup.createProtection, '[var handle: Pickup] = create_protection_pickup {x} [float] {y} [float] {z} [float] {revenueLimit} [int] {revenueRate} [int]')
Opcode.register(0x0517, SharedOpcodePickup.createLockedProperty, '[var handle: Pickup] = create_locked_property_pickup {x} [float] {y} [float] {z} [float] {message} [gxt_key]')
Opcode.register(0x0518, SharedOpcodePickup.createForSaleProperty, '[var handle: Pickup] = create_forsale_property_pickup {x} [float] {y} [float] {z} [float] {price} [int] {message} [gxt_key]')
