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


Opcode.register(0x046e, SharedOpcodeRc.giveModelToPlayer, 'give_remote_controlled_model_to_player {handle} [Player] {x} [float] {y} [float] {z} [float] {angle} [float] {modelId} [model_vehicle]')
Opcode.register(0x0484, SharedOpcodeRc.getCar, '[var car: Car] = get_remote_controlled_car {player} [Player]')
Opcode.register(0x048a, SharedOpcodeRc.setEnableDetonate, 'set_enable_rc_detonate {state} [bool]')
Opcode.register(0x04d6, SharedOpcodeRc.setEnableDetonateOnContact, 'set_enable_rc_detonate_on_contact {state} [bool]')
Opcode.register(0x04db, SharedOpcodeRc.removeBuggy, 'remove_rc_buggy')
