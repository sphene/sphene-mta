SharedOpcodeGang = {}
SharedOpcodeGang.__index = SharedOpcodeGang

-- Opcode: 0x0237
-- Instruction: set_gang_weapons {gangId} [GangType] {weaponType1} [WeaponType] {weaponType2} [WeaponType] {weaponType3} [WeaponType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0237
function SharedOpcodeGang.setWeapons(_, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0237=3,set_gang %1d% primary_weapon_to %2c% secondary_weapon_to %3c%
Opcode.register(0x0237, SharedOpcodeGang.setWeapons, 4, 'set_gang_weapons ${1} ${2} ${3} ${4}', {false, true, false, false})
