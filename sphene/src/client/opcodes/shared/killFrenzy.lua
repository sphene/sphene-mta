SharedOpcodeKillFrenzy = {}
SharedOpcodeKillFrenzy.__index = SharedOpcodeKillFrenzy

-- Opcode: 0x01F9
-- Instruction: start_kill_frenzy {text} [gxt_key] {weaponType} [WeaponType] {timeInMs} [int] {targetsNum} [int] {targetModel1} [model_any] {targetModel2} [model_any] {targetModel3} [model_any] {targetModel4} [model_any] {betaSoundsAndMessages} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01F9
function SharedOpcodeKillFrenzy.start(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x01FA
-- Instruction: [var status: int] = read_kill_frenzy_status
-- https://library.sannybuilder.com/#/sa/script/extensions/default/01FA
function SharedOpcodeKillFrenzy.readStatus(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 01f9=9,init_rampage %1g% %2d% %3d% %4d% %5m% %6m% %7m% %8m% %9d%
Opcode.register(0x01f9, SharedOpcodeKillFrenzy.start, 9, 'start_kill_frenzy ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 01fa=1,%1d% = rampage_status
Opcode.register(0x01fa, SharedOpcodeKillFrenzy.readStatus, 1, '${1} = read_kill_frenzy_status', {true})
