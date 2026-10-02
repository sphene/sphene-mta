SanAndreasOpcodeDecisionMakerChar = {}
SanAndreasOpcodeDecisionMakerChar.__index = SanAndreasOpcodeDecisionMakerChar

-- Opcode: 0x060A
-- Instruction: [var handle: DecisionMakerChar] = load_char_decision_maker {type} [DecisionMakerType]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/060A
function SanAndreasOpcodeDecisionMakerChar.load(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0708
-- Instruction: clear_char_decision_maker_event_response [DecisionMakerChar] {event} [Event]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0708
function SanAndreasOpcodeDecisionMakerChar.clearEventResponse(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0709
-- Instruction: add_char_decision_maker_event_response [DecisionMakerChar] {event} [Event] {taskId} [TaskId] {respect} [float] {hate} [float] {like} [float] {dislike} [float] {inCar} [bool] {onFoot} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0709
function SanAndreasOpcodeDecisionMakerChar.addEventResponse(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07E5
-- Instruction: [var handle: DecisionMakerChar] = copy_char_decision_maker {handleOrTemplate} [DecisionMakerCharTemplate]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07E5
function SanAndreasOpcodeDecisionMakerChar.copy(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0978
-- Instruction: [var handle: DecisionMakerChar] = copy_shared_char_decision_maker {template} [DecisionMakerCharTemplate]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0978
function SanAndreasOpcodeDecisionMakerChar.copyShared(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 060A=2,create_decision_maker_type %1h% store_to %2d% ; decision\allowed\m_.ped files
Opcode.register(0x060a, SanAndreasOpcodeDecisionMakerChar.load, 2, '${1} = load_char_decision_maker ${2}', {true, false})
-- INI: 0708=2,reset_decision_maker %1d% event %2h%
Opcode.register(0x0708, SanAndreasOpcodeDecisionMakerChar.clearEventResponse, 2, 'clear_char_decision_maker_event_response ${1} ${2}', {false, false})
-- INI: 0709=9,set_decision_maker %1d% on_event %2h% taskID %3d% respect %4d% hate %5d% like %6d% dislike %7d% in_car %8h% on_foot %9h% ; see *.ped files
Opcode.register(0x0709, SanAndreasOpcodeDecisionMakerChar.addEventResponse, 9, 'add_char_decision_maker_event_response ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 07E5=2,copy_decision_maker %1d% to %2d%
Opcode.register(0x07e5, SanAndreasOpcodeDecisionMakerChar.copy, 2, '${1} = copy_char_decision_maker ${2}', {false, false})
-- INI: 0978=2,copy_decision_maker %1d% to %2d%
Opcode.register(0x0978, SanAndreasOpcodeDecisionMakerChar.copyShared, 2, '${2} = copy_shared_char_decision_maker ${1}', {false, true})
