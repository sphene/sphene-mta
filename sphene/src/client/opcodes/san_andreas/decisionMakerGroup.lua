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


-- INI: 06AE=2,create_group_decision_maker_type %1h% store_to %2d% ; decision\allowed\mission.grp
Opcode.register(0x06ae, SanAndreasOpcodeDecisionMakerGroup.load, 2, '${1} = load_group_decision_maker ${2}', {true, false})
-- INI: 0749=2,reset_group_decision_maker %1d% event %2h%
Opcode.register(0x0749, SanAndreasOpcodeDecisionMakerGroup.clearEventResponse, 2, 'clear_group_decision_maker_event_response ${1} ${2}', {false, false})
-- INI: 074A=9,set_group_decision_maker %1d% on_event %2h% taskID %3d% respect %4d% hate %5d% like %6d% dislike %7d% in_car %8h% on_foot %9h% ; see *.ped files
Opcode.register(0x074a, SanAndreasOpcodeDecisionMakerGroup.addEventResponse, 9, 'add_group_decision_maker_event_response ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 07E6=2,copy_group_decision_maker %1h% to %2d%
Opcode.register(0x07e6, SanAndreasOpcodeDecisionMakerGroup.copy, 2, '${1} = copy_group_decision_maker ${2}', {false, false})
