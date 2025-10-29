SanAndreasOpcodeDecisionMakerGroup = {}
SanAndreasOpcodeDecisionMakerGroup.__index = SanAndreasOpcodeDecisionMakerGroup

-- Opcode: 0x06AE
-- Instruction: [var handle: DecisionMakerGroup] = load_group_decision_maker {type} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06AE
function SanAndreasOpcodeDecisionMakerGroup.load(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0749
-- Instruction: clear_group_decision_maker_event_response [DecisionMakerGroup] {event} [Event]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0749
function SanAndreasOpcodeDecisionMakerGroup.clearEventResponse(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x074A
-- Instruction: add_group_decision_maker_event_response [DecisionMakerGroup] {event} [Event] {taskId} [TaskId] {respect} [float] {hate} [float] {like} [float] {dislike} [float] {inCar} [bool] {onFoot} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/074A
function SanAndreasOpcodeDecisionMakerGroup.addEventResponse(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07E6
-- Instruction: [var handle: DecisionMakerGroup] = copy_group_decision_maker {handleOrTemplate} [DecisionMakerGroupTemplate]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07E6
function SanAndreasOpcodeDecisionMakerGroup.copy(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x06ae, SanAndreasOpcodeDecisionMakerGroup.load, '[var handle: DecisionMakerGroup] = load_group_decision_maker {type} [int]')
Opcode.register(0x0749, SanAndreasOpcodeDecisionMakerGroup.clearEventResponse, 'clear_group_decision_maker_event_response [DecisionMakerGroup] {event} [Event]')
Opcode.register(0x074a, SanAndreasOpcodeDecisionMakerGroup.addEventResponse, 'add_group_decision_maker_event_response [DecisionMakerGroup] {event} [Event] {taskId} [TaskId] {respect} [float] {hate} [float] {like} [float] {dislike} [float] {inCar} [bool] {onFoot} [bool]')
Opcode.register(0x07e6, SanAndreasOpcodeDecisionMakerGroup.copy, '[var handle: DecisionMakerGroup] = copy_group_decision_maker {handleOrTemplate} [DecisionMakerGroupTemplate]')
