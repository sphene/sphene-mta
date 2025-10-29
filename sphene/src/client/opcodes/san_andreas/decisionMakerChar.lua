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


Opcode.register(0x060a, SanAndreasOpcodeDecisionMakerChar.load, '[var handle: DecisionMakerChar] = load_char_decision_maker {type} [DecisionMakerType]')
Opcode.register(0x0708, SanAndreasOpcodeDecisionMakerChar.clearEventResponse, 'clear_char_decision_maker_event_response [DecisionMakerChar] {event} [Event]')
Opcode.register(0x0709, SanAndreasOpcodeDecisionMakerChar.addEventResponse, 'add_char_decision_maker_event_response [DecisionMakerChar] {event} [Event] {taskId} [TaskId] {respect} [float] {hate} [float] {like} [float] {dislike} [float] {inCar} [bool] {onFoot} [bool]')
Opcode.register(0x07e5, SanAndreasOpcodeDecisionMakerChar.copy, '[var handle: DecisionMakerChar] = copy_char_decision_maker {handleOrTemplate} [DecisionMakerCharTemplate]')
Opcode.register(0x0978, SanAndreasOpcodeDecisionMakerChar.copyShared, '[var handle: DecisionMakerChar] = copy_shared_char_decision_maker {template} [DecisionMakerCharTemplate]')
