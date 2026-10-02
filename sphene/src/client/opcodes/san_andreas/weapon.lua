SanAndreasOpcodeWeapon = {}
SanAndreasOpcodeWeapon.__index = SanAndreasOpcodeWeapon

-- Opcode: 0x0781
-- Instruction: [var modelId: model_object] = get_weapontype_model {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0781
function SanAndreasOpcodeWeapon.getModel(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0782
-- Instruction: [var slot: int] = get_weapontype_slot {weaponType} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0782
function SanAndreasOpcodeWeapon.getSlot(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E26
-- Instruction: is_weapon_fire_type {weaponType} [WeaponType] {weaponFire} [WeaponFire]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E26
function SanAndreasOpcodeWeapon.isFireType(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E84
-- Instruction: [var handle: WeaponInfo] = get_weaponinfo {weaponType} [WeaponType] {weaponSkill} [WeaponSkill]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E84
function SanAndreasOpcodeWeapon.getWeaponInfo(_, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0781=2,get_weapon_with_ID %1d% model_to %2d%
Opcode.register(0x0781, SanAndreasOpcodeWeapon.getModel, 2, '${2} = get_weapontype_model ${1}', {false, true})
-- INI: 0782=2,get_weapon_with_ID %1d% weapon_group_to %2d%
Opcode.register(0x0782, SanAndreasOpcodeWeapon.getSlot, 2, '${2} = get_weapontype_slot ${1}', {false, true})
-- INI: 0E26=2,is_weapon %1d% fire_type %2d%
Opcode.register(0x0e26, SanAndreasOpcodeWeapon.isFireType, 2, 'is_weapon_fire_type ${1} ${2}', {false, false})
-- INI: 0E84=3,get_weaponinfo %1d% skill %2d% store_to %3d%
Opcode.register(0x0e84, SanAndreasOpcodeWeapon.getWeaponInfo, 3, '${3} = get_weaponinfo ${1} ${2}', {false, false, true})
