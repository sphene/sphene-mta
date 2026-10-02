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


-- INI: 062F=2,%2d% = create_group_type %1h%
Opcode.register(0x062f, SanAndreasOpcodeGroup.create, 2, '${1} = create_group ${2}', {true, false})
-- INI: 0630=2,put_actor %2d% in_group %1d% as_leader
Opcode.register(0x0630, SanAndreasOpcodeGroup.setLeader, 2, 'set_group_leader ${1} ${2}', {false, false})
-- INI: 0631=2,put_actor %2d% in_group %1d%
Opcode.register(0x0631, SanAndreasOpcodeGroup.setMember, 2, 'set_group_member ${1} ${2}', {false, false})
-- INI: 0632=1,release_group %1d%
Opcode.register(0x0632, SanAndreasOpcodeGroup.remove, 1, 'remove_group ${1}', {false})
-- INI: 06AD=2,set_group %1d% group_decision_maker_to %2d%
Opcode.register(0x06ad, SanAndreasOpcodeGroup.setDecisionMaker, 2, 'set_group_decision_maker ${1} ${2}', {false, false})
-- INI: 06F0=2,set_group %1d% distance_limit_to %2d%
Opcode.register(0x06f0, SanAndreasOpcodeGroup.setSeparationRange, 2, 'set_group_separation_range ${1} ${2}', {false, false})
-- INI: 07B3=2,set_group %1d% give_command %2h%
Opcode.register(0x07b3, SanAndreasOpcodeGroup.setDefaultTaskAllocator, 2, 'set_group_default_task_allocator ${1} ${2}', {false, false})
-- INI: 07F6=3,get_group %1d% number_of_leaders_to %2d% number_of_members_to %3d%
Opcode.register(0x07f6, SanAndreasOpcodeGroup.getSize, 3, '${2}, ${3} = get_group_size ${1}', {false, true, true})
-- INI: 07FD=1,  group %1d% alive
Opcode.register(0x07fd, SanAndreasOpcodeGroup.doesExist, 1, 'does_group_exist ${1}', {false})
-- INI: 087D=2,assign_group %1d% to_AS_pack %2d%
Opcode.register(0x087d, SanAndreasOpcodeGroup.setSequence, 2, 'set_group_sequence ${1} ${2}', {false, false})
-- INI: 092B=3,%3d% = group %1d% member %2d%
Opcode.register(0x092b, SanAndreasOpcodeGroup.getMember, 3, '${3} = get_group_member ${1} ${2}', {false, false, true})
-- INI: 0940=2,set_group %1d% enters_leaders_vehicle %2h%
Opcode.register(0x0940, SanAndreasOpcodeGroup.setFollowStatus, 2, 'set_group_follow_status ${1} ${2}', {false, false})
