SharedOpcodeGang = {}
SharedOpcodeGang.__index = SharedOpcodeGang

-- Opcode: 0x0237
-- Instruction: set_gang_weapons {gangId} [GangType] {weaponType1} [WeaponType] {weaponType2} [WeaponType] {weaponType3} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0237
function SharedOpcodeGang.setWeapons(_, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0237, SharedOpcodeGang.setWeapons, 'set_gang_weapons {gangId} [GangType] {weaponType1} [WeaponType] {weaponType2} [WeaponType] {weaponType3} [WeaponType]')
