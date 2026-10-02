SanAndreasOpcodeWeaponInfo = {}
SanAndreasOpcodeWeaponInfo.__index = SanAndreasOpcodeWeaponInfo

-- Opcode: 0x0E85
-- Instruction: [var model1: model_any], [var model2: model_any] = get_weaponinfo_models [WeaponInfo]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E85
function SanAndreasOpcodeWeaponInfo.getModels(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E86
-- Instruction: [var flags: int] = get_weaponinfo_flags [WeaponInfo]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E86
function SanAndreasOpcodeWeaponInfo.getFlags(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E87
-- Instruction: [var animGroup: AnimGrp] = get_weaponinfo_animgroup [WeaponInfo]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E87
function SanAndreasOpcodeWeaponInfo.getAnimgroup(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E88
-- Instruction: [var totalClip: int] = get_weaponinfo_total_clip [WeaponInfo]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E88
function SanAndreasOpcodeWeaponInfo.getTotalClip(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E89
-- Instruction: [var fireType: WeaponFire] = get_weaponinfo_fire_type [WeaponInfo]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E89
function SanAndreasOpcodeWeaponInfo.getFireType(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E8A
-- Instruction: [var weaponSlot: WeaponSlot] = get_weaponinfo_slot [WeaponInfo]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E8A
function SanAndreasOpcodeWeaponInfo.getSlot(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0E85=3,get_weaponinfo_models %1d% store_to %2d% %3d%
Opcode.register(0x0e85, SanAndreasOpcodeWeaponInfo.getModels, 3, '${1}, ${2} = get_weaponinfo_models ${3}', {false, true, true})
-- INI: 0E86=2,get_weaponinfo_flags %1d% store_to %2d%
Opcode.register(0x0e86, SanAndreasOpcodeWeaponInfo.getFlags, 2, '${1} = get_weaponinfo_flags ${2}', {true, false})
-- INI: 0E87=2,get_weaponinfo_animgroup %1d% store_to %2d%
Opcode.register(0x0e87, SanAndreasOpcodeWeaponInfo.getAnimgroup, 2, '${1} = get_weaponinfo_animgroup ${2}', {true, false})
-- INI: 0E88=2,get_weaponinfo_total_clip %1d% store_to %2d%
Opcode.register(0x0e88, SanAndreasOpcodeWeaponInfo.getTotalClip, 2, '${1} = get_weaponinfo_total_clip ${2}', {true, false})
-- INI: 0E89=2,get_weaponinfo_fire_type %1d% store_to %2d%
Opcode.register(0x0e89, SanAndreasOpcodeWeaponInfo.getFireType, 2, '${1} = get_weaponinfo_fire_type ${2}', {true, false})
-- INI: 0E8A=2,get_weaponinfo_slot %1d% store_to %2d%
Opcode.register(0x0e8a, SanAndreasOpcodeWeaponInfo.getSlot, 2, '${1} = get_weaponinfo_slot ${2}', {true, false})
