SharedOpcodeRc = {}
SharedOpcodeRc.__index = SharedOpcodeRc

-- Opcode: 0x046E
-- Instruction: give_remote_controlled_model_to_player {handle} [Player] {x} [float] {y} [float] {z} [float] {angle} [float] {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/046E
function SharedOpcodeRc.giveModelToPlayer(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0484
-- Instruction: [var car: Car] = get_remote_controlled_car {player} [Player]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0484
function SharedOpcodeRc.getCar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x048A
-- Instruction: set_enable_rc_detonate {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/048A
function SharedOpcodeRc.setEnableDetonate(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04D6
-- Instruction: set_enable_rc_detonate_on_contact {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04D6
function SharedOpcodeRc.setEnableDetonateOnContact(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04DB
-- Instruction: remove_rc_buggy
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04DB
function SharedOpcodeRc.removeBuggy()
   return Script.setOpcodeUnimplemented()
end


-- INI: 046e=6,put_player %1d% in_RC_mode_at %2d% %3d% %4d% angle %5d% RC_model %6m%
Opcode.register(0x046e, SharedOpcodeRc.giveModelToPlayer, 6, 'give_remote_controlled_model_to_player ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0484=2,%2d% = player %1d% rc_car
Opcode.register(0x0484, SharedOpcodeRc.getCar, 2, '${2} = get_remote_controlled_car ${1}', {false, true})
-- INI: 048a=1,enable_rc_vehicle_detonation %1h%
Opcode.register(0x048a, SharedOpcodeRc.setEnableDetonate, 1, 'set_enable_rc_detonate ${1}', {false})
-- INI: 04d6=1,enable_rc_car_detonation %1h%
Opcode.register(0x04d6, SharedOpcodeRc.setEnableDetonateOnContact, 1, 'set_enable_rc_detonate_on_contact ${1}', {false})
-- INI: 04db=0,exit_rc_mode
Opcode.register(0x04db, SharedOpcodeRc.removeBuggy, 0, 'remove_rc_buggy', {})
