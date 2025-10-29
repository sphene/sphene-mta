SanAndreasOpcodeGroup = {}
SanAndreasOpcodeGroup.__index = SanAndreasOpcodeGroup

-- Opcode: 0x062F
-- Instruction: [var handle: Group] = create_group {defaultTaskAllocator} [DefaultTaskAllocator]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/062F
function SanAndreasOpcodeGroup.create(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0630
-- Instruction: set_group_leader [Group] {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0630
function SanAndreasOpcodeGroup.setLeader(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0631
-- Instruction: set_group_member [Group] {handle} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0631
function SanAndreasOpcodeGroup.setMember(actor, group)
    if (type(actor) ~= "table") then
        return false
    end

    actor:setGroup(group)
    return true
end

-- Opcode: 0x0632
-- Instruction: remove_group [Group]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0632
function SanAndreasOpcodeGroup.remove(_)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x06AD
-- Instruction: set_group_decision_maker [Group] {handleOrTemplate} [DecisionMakerGroupTemplate]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06AD
function SanAndreasOpcodeGroup.setDecisionMaker(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x06F0
-- Instruction: set_group_separation_range [Group] {range} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06F0
function SanAndreasOpcodeGroup.setSeparationRange(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07B3
-- Instruction: set_group_default_task_allocator [Group] {defaultTaskAllocator} [DefaultTaskAllocator]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07B3
function SanAndreasOpcodeGroup.setDefaultTaskAllocator(_, _)
   return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x07F6
-- Instruction: [var numLeaders: int], [var numMembers: int] = get_group_size [Group]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07F6
function SanAndreasOpcodeGroup.getSize(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x07FD
-- Instruction: does_group_exist {handle} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07FD
function SanAndreasOpcodeGroup.doesExist(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x087D
-- Instruction: set_group_sequence [Group] {sequence} [Sequence]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/087D
function SanAndreasOpcodeGroup.setSequence(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x092B
-- Instruction: [var handle: Char] = get_group_member [Group] {slotId} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/092B
function SanAndreasOpcodeGroup.getMember(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0940
-- Instruction: set_group_follow_status [Group] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0940
function SanAndreasOpcodeGroup.setFollowStatus(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x062f, SanAndreasOpcodeGroup.create, '[var handle: Group] = create_group {defaultTaskAllocator} [DefaultTaskAllocator]')
Opcode.register(0x0630, SanAndreasOpcodeGroup.setLeader, 'set_group_leader [Group] {handle} [Char]')
Opcode.register(0x0631, SanAndreasOpcodeGroup.setMember, 'set_group_member [Group] {handle} [Char]')
Opcode.register(0x0632, SanAndreasOpcodeGroup.remove, 'remove_group [Group]')
Opcode.register(0x06ad, SanAndreasOpcodeGroup.setDecisionMaker, 'set_group_decision_maker [Group] {handleOrTemplate} [DecisionMakerGroupTemplate]')
Opcode.register(0x06f0, SanAndreasOpcodeGroup.setSeparationRange, 'set_group_separation_range [Group] {range} [float]')
Opcode.register(0x07b3, SanAndreasOpcodeGroup.setDefaultTaskAllocator, 'set_group_default_task_allocator [Group] {defaultTaskAllocator} [DefaultTaskAllocator]')
Opcode.register(0x07f6, SanAndreasOpcodeGroup.getSize, '[var numLeaders: int], [var numMembers: int] = get_group_size [Group]')
Opcode.register(0x07fd, SanAndreasOpcodeGroup.doesExist, 'does_group_exist {handle} [any]')
Opcode.register(0x087d, SanAndreasOpcodeGroup.setSequence, 'set_group_sequence [Group] {sequence} [Sequence]')
Opcode.register(0x092b, SanAndreasOpcodeGroup.getMember, '[var handle: Char] = get_group_member [Group] {slotId} [int]')
Opcode.register(0x0940, SanAndreasOpcodeGroup.setFollowStatus, 'set_group_follow_status [Group] {state} [bool]')
