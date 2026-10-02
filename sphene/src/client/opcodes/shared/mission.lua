SharedOpcodeMission = {}
SharedOpcodeMission.__index = SharedOpcodeMission

-- Opcode: 0x00D8
-- Instruction: mission_has_finished
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00D8
function SharedOpcodeMission.finish(_)
    Game.setIsOnMission(false)

    for _,element in pairs(Thread.currentThread:getCleanupList()) do
        element:destroy()
    end

    Thread.currentThread:clearCleanupList()

    local player = PlayerElement.getLocalPlayer()

    if (player and player:getInterior() == 0) then
        TimeCycle.stopExtraColor(false)
    end

    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0417
-- Instruction: load_and_launch_mission_internal {index} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0417
function SharedOpcodeMission.loadAndLaunchInternal(mission)
    Game.setIsOnMission(true)

    Thread:create(Script.missionOffsets[mission + 1], true, Thread.currentThread)
    return true
end

-- Opcode: 0x045C
-- Instruction: fail_current_mission
-- https://library.sannybuilder.com/#/sa/script/extensions/default/045C
function SharedOpcodeMission.fail()
   return Script.setOpcodeUnimplemented()
end


-- INI: 00d8=0,mission_cleanup
Opcode.register(0x00d8, SharedOpcodeMission.finish, 0, 'mission_has_finished', {})
-- INI: 0417=1,start_mission %1d%
Opcode.register(0x0417, SharedOpcodeMission.loadAndLaunchInternal, 1, 'load_and_launch_mission_internal ${1}', {false})
-- INI: 045c=0,fail_current_mission
Opcode.register(0x045c, SharedOpcodeMission.fail, 0, 'fail_current_mission', {})
