SharedOpcodeMission = {}
SharedOpcodeMission.__index = SharedOpcodeMission

-- Opcode: 0x00D8
-- Instruction: mission_has_finished
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00D8
function SharedOpcodeMission.finish(_)
    Game.setMissionFlag(0)

    for _,element in pairs(Thread.currentThread:getCleanupList()) do
        element:destroy()
    end

    Thread.currentThread:clearCleanupList()

    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0417
-- Instruction: load_and_launch_mission_internal {index} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0417
function SharedOpcodeMission.loadAndLaunchInternal(mission)
    Game.setMissionFlag(1)

    Thread:create(Script.missionOffsets[mission + 1], true, Thread.currentThread)
    return true
end

-- Opcode: 0x045C
-- Instruction: fail_current_mission
-- https://library.sannybuilder.com/#/sa/script/extensions/default/045C
function SharedOpcodeMission.fail()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x00d8, SharedOpcodeMission.finish, 'mission_has_finished')
Opcode.register(0x0417, SharedOpcodeMission.loadAndLaunchInternal, 'load_and_launch_mission_internal {index} [int]')
Opcode.register(0x045c, SharedOpcodeMission.fail, 'fail_current_mission')
