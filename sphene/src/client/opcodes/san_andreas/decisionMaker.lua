SanAndreasOpcodeDecisionMaker = {}
SanAndreasOpcodeDecisionMaker.__index = SanAndreasOpcodeDecisionMaker

-- Opcode: 0x065C
-- Instruction: remove_decision_maker [DecisionMaker]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/065C
function SanAndreasOpcodeDecisionMaker.remove(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x09F2
-- Instruction: does_decision_maker_exist {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09F2
function SanAndreasOpcodeDecisionMaker.doesExist(_)
    Script.setOpcodePartiallyImplemented()
    return true
end


Opcode.register(0x065c, SanAndreasOpcodeDecisionMaker.remove, 'remove_decision_maker [DecisionMaker]')
Opcode.register(0x09f2, SanAndreasOpcodeDecisionMaker.doesExist, 'does_decision_maker_exist {handle} [any]')
