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


Opcode.register(0x0781, SanAndreasOpcodeWeapon.getModel, '[var modelId: model_object] = get_weapontype_model {weaponType} [WeaponType]')
Opcode.register(0x0782, SanAndreasOpcodeWeapon.getSlot, '[var slot: int] = get_weapontype_slot {weaponType} [WeaponType]')
Opcode.register(0x0e26, SanAndreasOpcodeWeapon.isFireType, 'is_weapon_fire_type {weaponType} [WeaponType] {weaponFire} [WeaponFire]')
Opcode.register(0x0e84, SanAndreasOpcodeWeapon.getWeaponInfo, '[var handle: WeaponInfo] = get_weaponinfo {weaponType} [WeaponType] {weaponSkill} [WeaponSkill]')
