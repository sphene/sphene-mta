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


Opcode.register(0x0e85, SanAndreasOpcodeWeaponInfo.getModels, '[var model1: model_any], [var model2: model_any] = get_weaponinfo_models [WeaponInfo]')
Opcode.register(0x0e86, SanAndreasOpcodeWeaponInfo.getFlags, '[var flags: int] = get_weaponinfo_flags [WeaponInfo]')
Opcode.register(0x0e87, SanAndreasOpcodeWeaponInfo.getAnimgroup, '[var animGroup: AnimGrp] = get_weaponinfo_animgroup [WeaponInfo]')
Opcode.register(0x0e88, SanAndreasOpcodeWeaponInfo.getTotalClip, '[var totalClip: int] = get_weaponinfo_total_clip [WeaponInfo]')
Opcode.register(0x0e89, SanAndreasOpcodeWeaponInfo.getFireType, '[var fireType: WeaponFire] = get_weaponinfo_fire_type [WeaponInfo]')
Opcode.register(0x0e8a, SanAndreasOpcodeWeaponInfo.getSlot, '[var weaponSlot: WeaponSlot] = get_weaponinfo_slot [WeaponInfo]')
