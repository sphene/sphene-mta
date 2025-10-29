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


Opcode.register(0x01f9, SharedOpcodeKillFrenzy.start, 'start_kill_frenzy {text} [gxt_key] {weaponType} [WeaponType] {timeInMs} [int] {targetsNum} [int] {targetModel1} [model_any] {targetModel2} [model_any] {targetModel3} [model_any] {targetModel4} [model_any] {betaSoundsAndMessages} [bool]')
Opcode.register(0x01fa, SharedOpcodeKillFrenzy.readStatus, '[var status: int] = read_kill_frenzy_status')
