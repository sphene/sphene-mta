SharedOpcodeGlobal = {}
SharedOpcodeGlobal.__index = SharedOpcodeGlobal

-- Opcode: 0x0000
-- Instruction: nop
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0000
function SharedOpcodeGlobal.nop()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0001
-- Instruction: wait {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0001
function SharedOpcodeGlobal.wait(milliseconds)
    Thread.currentThread:sleep(milliseconds)
    Thread.currentThread.endFrame = true
    return true
end

-- Opcode: 0x0002
-- Instruction: goto @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0002
function SharedOpcodeGlobal.gotoLabel(pointer)
    if (Thread.currentThread:isMissionThread() or Thread.currentThread:isExternalScript()) then
        pointer = Thread.currentThread.startPosition + -pointer
    end

    Thread.currentThread:setPosition(pointer)
    return true
end

-- Opcode: 0x0004
-- Instruction: [global var int] = [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0004
function SharedOpcodeGlobal.opcode0004(_, value)
    return value
end

-- Opcode: 0x0005
-- Instruction: [global var float] = [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0005
function SharedOpcodeGlobal.opcode0005(_, value)
    return value
end

-- Opcode: 0x0006
-- Instruction: [local var int] = [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0006
function SharedOpcodeGlobal.opcode0006(_, value)
    return value
end

-- Opcode: 0x0007
-- Instruction: [local var float] = [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0007
function SharedOpcodeGlobal.opcode0007(_, value)
    return value
end

-- Opcode: 0x0008
-- Instruction: [global var int] += [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0008
function SharedOpcodeGlobal.opcode0008(retVal, sum)
    return (retVal.value + sum)
end

-- Opcode: 0x0009
-- Instruction: [global var float] += [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0009
function SharedOpcodeGlobal.opcode0009(retVal, sum)
    return (retVal.value + sum)
end

-- Opcode: 0x000A
-- Instruction: [local var int] += [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/000A
function SharedOpcodeGlobal.opcode000A(retVal, sum)
    return (retVal.value + sum)
end

-- Opcode: 0x000B
-- Instruction: [local var float] += [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/000B
function SharedOpcodeGlobal.opcode000B(retVal, sum)
    return (retVal.value + sum)
end

-- Opcode: 0x000C
-- Instruction: [global var int] -= [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/000C
function SharedOpcodeGlobal.opcode000C(retVal, min)
    return (retVal.value - min)
end

-- Opcode: 0x000D
-- Instruction: [global var float] -= [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/000D
function SharedOpcodeGlobal.opcode000D(retVal, min)
    return (retVal.value - min)
end

-- Opcode: 0x000E
-- Instruction: [local var int] -= [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/000E
function SharedOpcodeGlobal.opcode000E(retVal, min)
    return (retVal.value - min)
end

-- Opcode: 0x000F
-- Instruction: [local var float] -= [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/000F
function SharedOpcodeGlobal.opcode000F(retVal, min)
    return (retVal.value - min)
end

-- Opcode: 0x0010
-- Instruction: [global var int] *= [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0010
function SharedOpcodeGlobal.opcode0010(retVal, numb)
    return (retVal.value * numb)
end

-- Opcode: 0x0011
-- Instruction: [global var float] *= [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0011
function SharedOpcodeGlobal.opcode0011(retVal, numb)
    return (retVal.value * numb)
end

-- Opcode: 0x0012
-- Instruction: [local var int] *= [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0012
function SharedOpcodeGlobal.opcode0012(retVal, numb)
    return (retVal.value * numb)
end

-- Opcode: 0x0013
-- Instruction: [local var float] *= [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0013
function SharedOpcodeGlobal.opcode0013(retVal, numb)
    return (retVal.value * numb)
end

-- Opcode: 0x0014
-- Instruction: [global var int] /= [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0014
function SharedOpcodeGlobal.opcode0014(retVal, divider)
    return math.floor(retVal.value / divider)
end

-- Opcode: 0x0015
-- Instruction: [global var float] /= [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0015
function SharedOpcodeGlobal.opcode0015(retVal, divider)
    return (retVal.value / divider)
end

-- Opcode: 0x0016
-- Instruction: [local var int] /= [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0016
function SharedOpcodeGlobal.opcode0016(retVal, divider)
    return math.floor(retVal.value / divider)
end

-- Opcode: 0x0017
-- Instruction: [local var float] /= [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0017
function SharedOpcodeGlobal.opcode0017(retVal, divider)
   return (retVal.value / divider)
end

-- Opcode: 0x0018
-- Instruction: [global var int] > [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0018
function SharedOpcodeGlobal.opcode0018(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x0019
-- Instruction: [local var int] > [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0019
function SharedOpcodeGlobal.opcode0019(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x001A
-- Instruction: [literal int] > [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/001A
function SharedOpcodeGlobal.opcode001A(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x001B
-- Instruction: [literal int] > [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/001B
function SharedOpcodeGlobal.opcode001B(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x001C
-- Instruction: [global var int] > [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/001C
function SharedOpcodeGlobal.opcode001C(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x001D
-- Instruction: [local var int] > [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/001D
function SharedOpcodeGlobal.opcode001D(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x001E
-- Instruction: [global var int] > [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/001E
function SharedOpcodeGlobal.opcode001E(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x001F
-- Instruction: [local var int] > [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/001F
function SharedOpcodeGlobal.opcode001F(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x0020
-- Instruction: [global var float] > [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0020
function SharedOpcodeGlobal.opcode0020(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x0021
-- Instruction: [local var float] > [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0021
function SharedOpcodeGlobal.opcode0021(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x0022
-- Instruction: [literal float] > [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0022
function SharedOpcodeGlobal.opcode0022(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x0023
-- Instruction: [literal float] > [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0023
function SharedOpcodeGlobal.opcode0023(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x0024
-- Instruction: [global var float] > [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0024
function SharedOpcodeGlobal.opcode0024(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x0025
-- Instruction: [local var float] > [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0025
function SharedOpcodeGlobal.opcode0025(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x0026
-- Instruction: [global var float] > [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0026
function SharedOpcodeGlobal.opcode0026(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x0027
-- Instruction: [local var float] > [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0027
function SharedOpcodeGlobal.opcode0027(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 > arg2)
end

-- Opcode: 0x0028
-- Instruction: [global var int] >= [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0028
function SharedOpcodeGlobal.opcode0028(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x0029
-- Instruction: [local var int] >= [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0029
function SharedOpcodeGlobal.opcode0029(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x002A
-- Instruction: [literal int] >= [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/002A
function SharedOpcodeGlobal.opcode002A(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x002B
-- Instruction: [literal int] >= [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/002B
function SharedOpcodeGlobal.opcode002B(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x002C
-- Instruction: [global var int] >= [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/002C
function SharedOpcodeGlobal.opcode002C(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x002D
-- Instruction: [local var int] >= [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/002D
function SharedOpcodeGlobal.opcode002D(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x002E
-- Instruction: [global var int] >= [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/002E
function SharedOpcodeGlobal.opcode002E(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x002F
-- Instruction: [local var int] >= [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/002F
function SharedOpcodeGlobal.opcode002F(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x0030
-- Instruction: [global var float] >= [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0030
function SharedOpcodeGlobal.opcode0030(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x0031
-- Instruction: [local var float] >= [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0031
function SharedOpcodeGlobal.opcode0031(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x0032
-- Instruction: [literal float] >= [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0032
function SharedOpcodeGlobal.opcode0032(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x0033
-- Instruction: [literal float] >= [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0033
function SharedOpcodeGlobal.opcode0033(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x0034
-- Instruction: [global var float] >= [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0034
function SharedOpcodeGlobal.opcode0034(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x0035
-- Instruction: [local var float] >= [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0035
function SharedOpcodeGlobal.opcode0035(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x0036
-- Instruction: [global var float] >= [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0036
function SharedOpcodeGlobal.opcode0036(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x0037
-- Instruction: [local var float] >= [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0037
function SharedOpcodeGlobal.opcode0037(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 >= arg2)
end

-- Opcode: 0x0038
-- Instruction: [global var int] == [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0038
function SharedOpcodeGlobal.opcode0038(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 == arg2)
end

-- Opcode: 0x0039
-- Instruction: [local var int] == [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0039
function SharedOpcodeGlobal.opcode0039(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 == arg2)
end

-- Opcode: 0x003A
-- Instruction: [global var int] == [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/003A
function SharedOpcodeGlobal.opcode003A(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 == arg2)
end

-- Opcode: 0x003B
-- Instruction: [local var int] == [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/003B
function SharedOpcodeGlobal.opcode003B(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 == arg2)
end

-- Opcode: 0x003C
-- Instruction: [global var int] == [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/003C
function SharedOpcodeGlobal.opcode003C(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 == arg2)
end

-- Opcode: 0x0042
-- Instruction: [global var float] == [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0042
function SharedOpcodeGlobal.opcode0042(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 == arg2)
end

-- Opcode: 0x0043
-- Instruction: [local var float] == [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0043
function SharedOpcodeGlobal.opcode0043(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 == arg2)
end

-- Opcode: 0x0044
-- Instruction: [global var float] == [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0044
function SharedOpcodeGlobal.opcode0044(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 == arg2)
end

-- Opcode: 0x0045
-- Instruction: [local var float] == [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0045
function SharedOpcodeGlobal.opcode0045(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 == arg2)
end

-- Opcode: 0x0046
-- Instruction: [global var float] == [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0046
function SharedOpcodeGlobal.opcode0046(arg1, arg2)
    if (type(arg1) == 'table') then
        arg1 = 1
    elseif (type(arg2) == 'table') then
        arg2 = 1
    end

    return (arg1 == arg2)
end

-- Opcode: 0x004D
-- Instruction: goto_if_false @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/004D
function SharedOpcodeGlobal.gotoIfFalse(pointer)
    local hasFailed = false
    local trueCounter = 0

    for _,result in pairs(Thread.currentThread.ifData["paramData"]) do
        if (result) then
            trueCounter = trueCounter + 1
        end
    end

    if (Thread.currentThread.ifData["ifType"] == 1) then
        if (trueCounter ~= 1) then
            hasFailed = true
        end
    elseif (Thread.currentThread.ifData["ifType"] == 2) then
        if (trueCounter ~= #Thread.currentThread.ifData["paramData"]) then
            hasFailed = true
        end
    elseif (Thread.currentThread.ifData["ifType"] == 3) then
        if (trueCounter == 0) then
            hasFailed = true
        end
    elseif (Thread.currentThread.ifData["ifType"] == 0) then
        local lastResult = Thread.currentThread:getLastResult()

        if (#Thread.currentThread.ifData["paramData"] > 0) then
            lastResult = Thread.currentThread.ifData["paramData"][#Thread.currentThread.ifData["paramData"]]
        end

        if (lastResult == false) then
            hasFailed = true
        end
    end

    Thread.currentThread.ifData["paramData"] = {}
    Thread.currentThread.ifData["ifType"] = 0

    if (hasFailed) then
        opcodes[0x0002](pointer)
        return true
    end

    return false
end

-- Opcode: 0x004E
-- Instruction: terminate_this_script
-- https://library.sannybuilder.com/#/sa/script/extensions/default/004E
function SharedOpcodeGlobal.terminateThisScript()
    if (Thread.currentThread:isMissionThread()) then
        Game.setMissionFlag(0)
        Thread.currentThread.originalThread:wake()
    end

    Thread.currentThread:setKeepAlive(false)
    return true
end

-- Opcode: 0x004F
-- Instruction: start_new_script @label [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/004F
function SharedOpcodeGlobal.startNewScript(pointer, ...)
    local thread = Thread:create(pointer, false, Thread.currentThread)

    local args = {unpack(arg)}

    for index,param in pairs(args) do
        thread:setLocalVar(index - 1, param)
    end

    return true
end

-- Opcode: 0x0050
-- Instruction: gosub @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0050
function SharedOpcodeGlobal.gosub(pointer)
    if (Thread.currentThread:isMissionThread() or Thread.currentThread:isExternalScript()) then
        pointer = Thread.currentThread.startPosition - pointer
    end

    Thread.currentThread:gosub(pointer)
    return true
end

-- Opcode: 0x0051
-- Instruction: return
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0051
function SharedOpcodeGlobal.doReturn()
    Thread.currentThread:doReturn()
    return true
end

-- Opcode: 0x0058
-- Instruction: [global var int] += [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0058
function SharedOpcodeGlobal.opcode0058(retVal, sum)
    return opcodes[0x0008](retVal, sum)
end

-- Opcode: 0x0059
-- Instruction: [global var float] += [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0059
function SharedOpcodeGlobal.opcode0059(retVal, sum)
    return opcodes[0x0008](retVal, sum)
end

-- Opcode: 0x005A
-- Instruction: [local var int] += [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/005A
function SharedOpcodeGlobal.opcode005A(retVal, sum)
    return opcodes[0x0008](retVal, sum)
end

-- Opcode: 0x005B
-- Instruction: [local var float] += [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/005B
function SharedOpcodeGlobal.opcode005B(retVal, sum)
   return opcodes[0x0008](retVal, sum)
end

-- Opcode: 0x005C
-- Instruction: [local var int] += [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/005C
function SharedOpcodeGlobal.opcode005C(retVal, sum)
   return opcodes[0x0008](retVal, sum)
end

-- Opcode: 0x005D
-- Instruction: [local var float] += [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/005D
function SharedOpcodeGlobal.opcode005D(retVal, sum)
   return opcodes[0x0008](retVal, sum)
end

-- Opcode: 0x005E
-- Instruction: [global var int] += [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/005E
function SharedOpcodeGlobal.opcode005E(retVal, sum)
   return opcodes[0x0008](retVal, sum)
end

-- Opcode: 0x005F
-- Instruction: [global var float] += [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/005F
function SharedOpcodeGlobal.opcode005F(retVal, sum)
   return opcodes[0x0008](retVal, sum)
end

-- Opcode: 0x0060
-- Instruction: [global var int] -= [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0060
function SharedOpcodeGlobal.opcode0060(retVal, min)
    return opcodes[0x000C](retVal, min)
end

-- Opcode: 0x0061
-- Instruction: [global var float] -= [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0061
function SharedOpcodeGlobal.opcode0061(retVal, value)
    return (retVal.value - value)
end

-- Opcode: 0x0062
-- Instruction: [local var int] -= [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0062
function SharedOpcodeGlobal.opcode0062(retVal, value)
    return (retVal.value - value)
end

-- Opcode: 0x0063
-- Instruction: [local var float] -= [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0063
function SharedOpcodeGlobal.opcode0063(retVal, value)
    return (retVal.value - value)
end

-- Opcode: 0x0064
-- Instruction: [local var int] -= [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0064
function SharedOpcodeGlobal.opcode0064(retVal, value)
    return (retVal.value - value)
end

-- Opcode: 0x0065
-- Instruction: [local var float] -= [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0065
function SharedOpcodeGlobal.opcode0065(retVal, value)
    return (retVal.value - value)
end

-- Opcode: 0x0066
-- Instruction: [global var int] -= [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0066
function SharedOpcodeGlobal.opcode0066(retVal, value)
    return (retVal.value - value)
end

-- Opcode: 0x0067
-- Instruction: [global var float] -= [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0067
function SharedOpcodeGlobal.opcode0067(retVal, value)
    return (retVal.value - value)
end

-- Opcode: 0x0068
-- Instruction: [global var int] *= [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0068
function SharedOpcodeGlobal.opcode0068(retVal, numb)
    return opcodes[0x0010](retVal, numb)
end

-- Opcode: 0x0069
-- Instruction: [global var float] *= [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0069
function SharedOpcodeGlobal.opcode0069(retVal, numb)
    return opcodes[0x0010](retVal, numb)
end

-- Opcode: 0x006A
-- Instruction: [local var int] *= [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/006A
function SharedOpcodeGlobal.opcode006A(retVal, numb)
    return opcodes[0x0010](retVal, numb)
end

-- Opcode: 0x006B
-- Instruction: [local var float] *= [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/006B
function SharedOpcodeGlobal.opcode006B(retVal, numb)
    return opcodes[0x0010](retVal, numb)
end

-- Opcode: 0x006C
-- Instruction: [global var int] *= [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/006C
function SharedOpcodeGlobal.opcode006C(retVal, numb)
    return opcodes[0x0010](retVal, numb)
end

-- Opcode: 0x006D
-- Instruction: [global var float] *= [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/006D
function SharedOpcodeGlobal.opcode006D(retVal, numb)
    return opcodes[0x0010](retVal, numb)
end

-- Opcode: 0x006E
-- Instruction: [local var int] *= [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/006E
function SharedOpcodeGlobal.opcode006E(retVal, numb)
    return opcodes[0x0010](retVal, numb)
end

-- Opcode: 0x006F
-- Instruction: [local var float] *= [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/006F
function SharedOpcodeGlobal.opcode006F(retVal, numb)
    return opcodes[0x0010](retVal, numb)
end

-- Opcode: 0x0070
-- Instruction: [global var int] /= [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0070
function SharedOpcodeGlobal.opcode0070(retVal, numb)
    return (retVal.value / numb)
end

-- Opcode: 0x0071
-- Instruction: [global var float] /= [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0071
function SharedOpcodeGlobal.opcode0071(retVal, numb)
    return (retVal.value / numb)
end

-- Opcode: 0x0072
-- Instruction: [local var int] /= [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0072
function SharedOpcodeGlobal.opcode0072(retVal, numb)
    return (retVal.value / numb)
end

-- Opcode: 0x0073
-- Instruction: [local var float] /= [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0073
function SharedOpcodeGlobal.opcode0073(retVal, numb)
    return (retVal.value / numb)
end

-- Opcode: 0x0074
-- Instruction: [global var int] /= [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0074
function SharedOpcodeGlobal.opcode0074(retVal, numb)
    return (retVal.value / numb)
end

-- Opcode: 0x0075
-- Instruction: [global var float] /= [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0075
function SharedOpcodeGlobal.opcode0075(retVal, numb)
    return (retVal.value / numb)
end

-- Opcode: 0x0076
-- Instruction: [local var int] /= [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0076
function SharedOpcodeGlobal.opcode0076(retVal, numb)
    return (retVal.value / numb)
end

-- Opcode: 0x0077
-- Instruction: [local var float] /= [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0077
function SharedOpcodeGlobal.opcode0077(retVal, numb)
    return (retVal.value / numb)
end

-- Opcode: 0x0078
-- Instruction: [global var float] +=@ [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0078
function SharedOpcodeGlobal.opcode0078(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0079
-- Instruction: [local var float] +=@ [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0079
function SharedOpcodeGlobal.opcode0079(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x007A
-- Instruction: [global var float] +=@ [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/007A
function SharedOpcodeGlobal.opcode007A(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x007B
-- Instruction: [local var float] +=@ [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/007B
function SharedOpcodeGlobal.opcode007B(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x007C
-- Instruction: [local var float] +=@ [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/007C
function SharedOpcodeGlobal.opcode007C(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x007D
-- Instruction: [global var float] +=@ [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/007D
function SharedOpcodeGlobal.opcode007D(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x007E
-- Instruction: [global var float] -=@ [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/007E
function SharedOpcodeGlobal.opcode007E(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x007F
-- Instruction: [local var float] -=@ [literal float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/007F
function SharedOpcodeGlobal.opcode007F(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0080
-- Instruction: [global var float] -=@ [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0080
function SharedOpcodeGlobal.opcode0080(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0081
-- Instruction: [local var float] -=@ [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0081
function SharedOpcodeGlobal.opcode0081(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0082
-- Instruction: [local var float] -=@ [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0082
function SharedOpcodeGlobal.opcode0082(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0083
-- Instruction: [global var float] -=@ [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0083
function SharedOpcodeGlobal.opcode0083(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0084
-- Instruction: [global var int] = [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0084
function SharedOpcodeGlobal.opcode0084(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x0085
-- Instruction: [local var int] = [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0085
function SharedOpcodeGlobal.opcode0085(_, value)
    return value
end

-- Opcode: 0x0086
-- Instruction: [global var float] = [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0086
function SharedOpcodeGlobal.opcode0086(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x0087
-- Instruction: [local var float] = [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0087
function SharedOpcodeGlobal.opcode0087(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x0088
-- Instruction: [global var float] = [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0088
function SharedOpcodeGlobal.opcode0088(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x0089
-- Instruction: [local var float] = [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0089
function SharedOpcodeGlobal.opcode0089(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x008A
-- Instruction: [global var int] = [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/008A
function SharedOpcodeGlobal.opcode008A(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x008B
-- Instruction: [local var int] = [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/008B
function SharedOpcodeGlobal.opcode008B(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x008C
-- Instruction: [global var int] =# [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/008C
function SharedOpcodeGlobal.opcode008C(_, float)
    return math.floor(float)
end

-- Opcode: 0x008D
-- Instruction: [global var float] =# [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/008D
function SharedOpcodeGlobal.opcode008D(_, integer)
    return integer
end

-- Opcode: 0x008E
-- Instruction: [local var int] =# [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/008E
function SharedOpcodeGlobal.opcode008E(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x008F
-- Instruction: [local var float] =# [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/008F
function SharedOpcodeGlobal.opcode008F(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0090
-- Instruction: [global var int] =# [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0090
function SharedOpcodeGlobal.opcode0090(_, float)
   return math.floor(float)
end

-- Opcode: 0x0091
-- Instruction: [global var float] =# [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0091
function SharedOpcodeGlobal.opcode0091(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0092
-- Instruction: [local var int] =# [local var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0092
function SharedOpcodeGlobal.opcode0092(_, value)
   return math.floor(value)
end

-- Opcode: 0x0093
-- Instruction: [local var float] =# [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0093
function SharedOpcodeGlobal.opcode0093(_, value)
   return value * 1.0
end

-- Opcode: 0x0094
-- Instruction: [global var number: int] = abs_var_int
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0094
function SharedOpcodeGlobal.absVarInt(_)
    Script.storeValueAtIndex(1, math.abs(Script.getValueAtIndex(1)))
end

-- Opcode: 0x0095
-- Instruction: [local var number: int] = abs_lvar_int
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0095
function SharedOpcodeGlobal.absLvarInt(_)
    Script.storeValueAtIndex(1, math.abs(Script.getValueAtIndex(1)))
end

-- Opcode: 0x0096
-- Instruction: [global var number: float] = abs_var_float
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0096
function SharedOpcodeGlobal.absVarFloat(_)
    Script.storeValueAtIndex(1, math.abs(Script.getValueAtIndex(1)))
end

-- Opcode: 0x0098
-- Instruction: [var float] = generate_random_float
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0098
function SharedOpcodeGlobal.generateRandomFloat(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x00D6
-- Instruction: if [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00D6
function SharedOpcodeGlobal.ifStatement(paramCount)
    Thread.currentThread.insideIf = true

    if (paramCount >= 1 and paramCount <= 7) then
        Thread.currentThread.ifData["ifType"] = 2
    elseif (paramCount >= 21 and paramCount <= 27) then
        Thread.currentThread.ifData["ifType"] = 3
    else
        Thread.currentThread.ifData["ifType"] = 1
    end

    Thread.currentThread.ifData["paramData"] = {}
    return true
end

-- Opcode: 0x00D7
-- Instruction: launch_mission @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00D7
function SharedOpcodeGlobal.launchMission(pointer)
    Thread:create(pointer)
end

-- Opcode: 0x0111
-- Instruction: set_deatharrest_state {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0111
function SharedOpcodeGlobal.setDeatharrestState(check)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0112
-- Instruction: has_deatharrest_been_executed
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0112
function SharedOpcodeGlobal.hasDeatharrestBeenExecuted()
    return PlayerElement.getLocalPlayer():isDead() or PlayerElement.getLocalPlayer():isBusted()
end

-- Opcode: 0x0180
-- Instruction: declare_mission_flag {var_flag} [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0180
function SharedOpcodeGlobal.declareMissionFlag(missionFlag)
    Game.setMissionFlag(missionFlag)
end

-- Opcode: 0x03A4
-- Instruction: script_name {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03A4
function SharedOpcodeGlobal.scriptName(threadName)
    Thread.currentThread:setName(threadName)
end

-- Opcode: 0x0425
-- Instruction: [var feet: float] = convert_metres_to_feet {meters} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0425
function SharedOpcodeGlobal.convertMetresToFeet(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0459
-- Instruction: terminate_all_scripts_with_this_name {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0459
function SharedOpcodeGlobal.terminateAllScriptsWithThisName(threadName)
    local threads = Thread.getThreadsFromName(threadName)

    for _, thread in pairs(threads) do
        if thread then
            thread:setKeepAlive(false)
            thread:wake()
        end
    end
end

-- Opcode: 0x04A3
-- Instruction: [global var int] == [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04A3
function SharedOpcodeGlobal.opcode04A3(arg1, arg2)
    return opcodes[0x0038](arg1, arg2)
end

-- Opcode: 0x04A4
-- Instruction: [local var int] == [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04A4
function SharedOpcodeGlobal.opcode04A4(arg1, arg2)
    return opcodes[0x0038](arg1, arg2)
end

-- Opcode: 0x04AE
-- Instruction: [global var int] = [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04AE
function SharedOpcodeGlobal.opcode04AE(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x04AF
-- Instruction: [local var int] = [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04AF
function SharedOpcodeGlobal.opcode04AF(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x04B0
-- Instruction: [global var int] > [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04B0
function SharedOpcodeGlobal.opcode04B0(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04B1
-- Instruction: [local var int] > [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04B1
function SharedOpcodeGlobal.opcode04B1(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04B2
-- Instruction: [literal int] > [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04B2
function SharedOpcodeGlobal.opcode04B2(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04B3
-- Instruction: [literal int] > [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04B3
function SharedOpcodeGlobal.opcode04B3(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04B4
-- Instruction: [global var int] >= [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04B4
function SharedOpcodeGlobal.opcode04B4(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04B5
-- Instruction: [global var int] >= [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04B5
function SharedOpcodeGlobal.opcode04B5(arg1, arg2)
    return opcodes[0x002C](arg1, arg2)
end

-- Opcode: 0x04B6
-- Instruction: [literal int] >= [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04B6
function SharedOpcodeGlobal.opcode04B6(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x04B7
-- Instruction: [literal int] >= [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/04B7
function SharedOpcodeGlobal.opcode04B7(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A8E
-- Instruction: [var int] = [int] + [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A8E
function SharedOpcodeGlobal.opcode0A8E(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A8F
-- Instruction: [var int] = [int] - [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A8F
function SharedOpcodeGlobal.opcode0A8F(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A90
-- Instruction: [var int] = [int] * [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A90
function SharedOpcodeGlobal.opcode0A90(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A91
-- Instruction: [var int] = [int] / [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A91
function SharedOpcodeGlobal.opcode0A91(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A92
-- Instruction: stream_custom_script {scriptFileName} [string] [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A92
function SharedOpcodeGlobal.streamCustomScript()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A93
-- Instruction: terminate_this_custom_script
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A93
function SharedOpcodeGlobal.terminateThisCustomScript()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AA0
-- Instruction: gosub_if_false @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AA0
function SharedOpcodeGlobal.gosubIfFalse(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AA1
-- Instruction: return_if_false
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AA1
function SharedOpcodeGlobal.returnIfFalse()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AB1
-- Instruction: cleo_call @label {numParams} [int] {params} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AB1
function SharedOpcodeGlobal.cleoCall()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AB2
-- Instruction: cleo_return {numRet} [int] {retParams} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AB2
function SharedOpcodeGlobal.cleoReturn()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AB3
-- Instruction: set_cleo_shared_var {index} [int] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AB3
function SharedOpcodeGlobal.setCleoSharedVar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AB4
-- Instruction: [var result: any] = get_cleo_shared_var {index} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AB4
function SharedOpcodeGlobal.getCleoSharedVar(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ABA
-- Instruction: terminate_all_custom_scripts_with_this_name {name} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ABA
function SharedOpcodeGlobal.terminateAllCustomScriptsWithThisName(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D16
-- Instruction: set_matrix_rotation_from_quat {matrix} [int] {quat} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D16
function SharedOpcodeGlobal.setMatrixRotationFromQuat(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D17
-- Instruction: set_quat_from_matrix {quat} [int] {matrix} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D17
function SharedOpcodeGlobal.setQuatFromMatrix(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D18
-- Instruction: rotate_quat_on_axis {quat} [int] {x} [float] {y} [float] {z} [float] {angle} [float] {rwCombine} [RwCombine]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D18
function SharedOpcodeGlobal.rotateQuatOnAxis(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D19
-- Instruction: [var quat: int] = get_normalised_quat {quat} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D19
function SharedOpcodeGlobal.getNormalisedQuat(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D1A
-- Instruction: [var quatResult: int] = multiply_quats {quat1} [int] {quat2} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D1A
function SharedOpcodeGlobal.multiplyQuats(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D1E
-- Instruction: [var result: int] = quat_slerp {from} [int] {to} [int] {lambda} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D1E
function SharedOpcodeGlobal.quatSlerp(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D24
-- Instruction: initialise_quat {quat} [int] {x} [float] {y} [float] {z} [float] {real} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D24
function SharedOpcodeGlobal.initialiseQuat(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D27
-- Instruction: copy_memory {src} [int] {dest} [int] {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D27
function SharedOpcodeGlobal.copyMemory(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D29
-- Instruction: [var x: float], [var y: float], [var z: float], [var real: float] = get_quat_elements {quat} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D29
function SharedOpcodeGlobal.getQuatElements(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D2E
-- Instruction: set_script_var {scriptPointer} [int] {varIndex} [int] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D2E
function SharedOpcodeGlobal.setScriptVar(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D2F
-- Instruction: [var result: any] = get_script_var {scriptPointer} [int] {varIndex} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D2F
function SharedOpcodeGlobal.getScriptVar(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B10
-- Instruction: [var int] = [int] & [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B10
function SharedOpcodeGlobal.opcode0B10(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B11
-- Instruction: [var int] = [int] | [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B11
function SharedOpcodeGlobal.opcode0B11(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B12
-- Instruction: [var int] = [int] ^ [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B12
function SharedOpcodeGlobal.opcode0B12(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B13
-- Instruction: [var int] = ~[int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B13
function SharedOpcodeGlobal.opcode0B13(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B14
-- Instruction: [var int] = [int] % [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B14
function SharedOpcodeGlobal.opcode0B14(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B15
-- Instruction: [var int] = [int] >> [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B15
function SharedOpcodeGlobal.opcode0B15(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B16
-- Instruction: [var int] = [int] << [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B16
function SharedOpcodeGlobal.opcode0B16(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B17
-- Instruction: [var int] &= [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B17
function SharedOpcodeGlobal.opcode0B17(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B18
-- Instruction: [var int] |= [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B18
function SharedOpcodeGlobal.opcode0B18(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B19
-- Instruction: [var int] ^= [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B19
function SharedOpcodeGlobal.opcode0B19(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B1A
-- Instruction: ~[var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B1A
function SharedOpcodeGlobal.opcode0B1A(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B1B
-- Instruction: [var int] %= [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B1B
function SharedOpcodeGlobal.opcode0B1B(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B1C
-- Instruction: [var int] >>= [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B1C
function SharedOpcodeGlobal.opcode0B1C(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0B1D
-- Instruction: [var int] <<= [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0B1D
function SharedOpcodeGlobal.opcode0B1D(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0000, SharedOpcodeGlobal.nop, 'nop')
Opcode.register(0x0001, SharedOpcodeGlobal.wait, 'wait {time} [int]')
Opcode.register(0x0002, SharedOpcodeGlobal.gotoLabel, 'goto @label')
Opcode.register(0x0004, SharedOpcodeGlobal.opcode0004, '[global var int] = [literal int]')
Opcode.register(0x0005, SharedOpcodeGlobal.opcode0005, '[global var float] = [literal float]')
Opcode.register(0x0006, SharedOpcodeGlobal.opcode0006, '[local var int] = [literal int]')
Opcode.register(0x0007, SharedOpcodeGlobal.opcode0007, '[local var float] = [literal float]')
Opcode.register(0x0008, SharedOpcodeGlobal.opcode0008, '[global var int] += [literal int]')
Opcode.register(0x0009, SharedOpcodeGlobal.opcode0009, '[global var float] += [literal float]')
Opcode.register(0x000a, SharedOpcodeGlobal.opcode000A, '[local var int] += [literal int]')
Opcode.register(0x000b, SharedOpcodeGlobal.opcode000B, '[local var float] += [literal float]')
Opcode.register(0x000c, SharedOpcodeGlobal.opcode000C, '[global var int] -= [literal int]')
Opcode.register(0x000d, SharedOpcodeGlobal.opcode000D, '[global var float] -= [literal float]')
Opcode.register(0x000e, SharedOpcodeGlobal.opcode000E, '[local var int] -= [literal int]')
Opcode.register(0x000f, SharedOpcodeGlobal.opcode000F, '[local var float] -= [literal float]')
Opcode.register(0x0010, SharedOpcodeGlobal.opcode0010, '[global var int] *= [literal int]')
Opcode.register(0x0011, SharedOpcodeGlobal.opcode0011, '[global var float] *= [literal float]')
Opcode.register(0x0012, SharedOpcodeGlobal.opcode0012, '[local var int] *= [literal int]')
Opcode.register(0x0013, SharedOpcodeGlobal.opcode0013, '[local var float] *= [literal float]')
Opcode.register(0x0014, SharedOpcodeGlobal.opcode0014, '[global var int] /= [literal int]')
Opcode.register(0x0015, SharedOpcodeGlobal.opcode0015, '[global var float] /= [literal float]')
Opcode.register(0x0016, SharedOpcodeGlobal.opcode0016, '[local var int] /= [literal int]')
Opcode.register(0x0017, SharedOpcodeGlobal.opcode0017, '[local var float] /= [literal float]')
Opcode.register(0x0018, SharedOpcodeGlobal.opcode0018, '[global var int] > [literal int]')
Opcode.register(0x0019, SharedOpcodeGlobal.opcode0019, '[local var int] > [literal int]')
Opcode.register(0x001a, SharedOpcodeGlobal.opcode001A, '[literal int] > [global var int]')
Opcode.register(0x001b, SharedOpcodeGlobal.opcode001B, '[literal int] > [local var int]')
Opcode.register(0x001c, SharedOpcodeGlobal.opcode001C, '[global var int] > [global var int]')
Opcode.register(0x001d, SharedOpcodeGlobal.opcode001D, '[local var int] > [local var int]')
Opcode.register(0x001e, SharedOpcodeGlobal.opcode001E, '[global var int] > [local var int]')
Opcode.register(0x001f, SharedOpcodeGlobal.opcode001F, '[local var int] > [global var int]')
Opcode.register(0x0020, SharedOpcodeGlobal.opcode0020, '[global var float] > [literal float]')
Opcode.register(0x0021, SharedOpcodeGlobal.opcode0021, '[local var float] > [literal float]')
Opcode.register(0x0022, SharedOpcodeGlobal.opcode0022, '[literal float] > [global var float]')
Opcode.register(0x0023, SharedOpcodeGlobal.opcode0023, '[literal float] > [local var float]')
Opcode.register(0x0024, SharedOpcodeGlobal.opcode0024, '[global var float] > [global var float]')
Opcode.register(0x0025, SharedOpcodeGlobal.opcode0025, '[local var float] > [local var float]')
Opcode.register(0x0026, SharedOpcodeGlobal.opcode0026, '[global var float] > [local var float]')
Opcode.register(0x0027, SharedOpcodeGlobal.opcode0027, '[local var float] > [global var float]')
Opcode.register(0x0028, SharedOpcodeGlobal.opcode0028, '[global var int] >= [literal int]')
Opcode.register(0x0029, SharedOpcodeGlobal.opcode0029, '[local var int] >= [literal int]')
Opcode.register(0x002a, SharedOpcodeGlobal.opcode002A, '[literal int] >= [global var int]')
Opcode.register(0x002b, SharedOpcodeGlobal.opcode002B, '[literal int] >= [local var int]')
Opcode.register(0x002c, SharedOpcodeGlobal.opcode002C, '[global var int] >= [global var int]')
Opcode.register(0x002d, SharedOpcodeGlobal.opcode002D, '[local var int] >= [local var int]')
Opcode.register(0x002e, SharedOpcodeGlobal.opcode002E, '[global var int] >= [local var int]')
Opcode.register(0x002f, SharedOpcodeGlobal.opcode002F, '[local var int] >= [global var int]')
Opcode.register(0x0030, SharedOpcodeGlobal.opcode0030, '[global var float] >= [literal float]')
Opcode.register(0x0031, SharedOpcodeGlobal.opcode0031, '[local var float] >= [literal float]')
Opcode.register(0x0032, SharedOpcodeGlobal.opcode0032, '[literal float] >= [global var float]')
Opcode.register(0x0033, SharedOpcodeGlobal.opcode0033, '[literal float] >= [local var float]')
Opcode.register(0x0034, SharedOpcodeGlobal.opcode0034, '[global var float] >= [global var float]')
Opcode.register(0x0035, SharedOpcodeGlobal.opcode0035, '[local var float] >= [local var float]')
Opcode.register(0x0036, SharedOpcodeGlobal.opcode0036, '[global var float] >= [local var float]')
Opcode.register(0x0037, SharedOpcodeGlobal.opcode0037, '[local var float] >= [global var float]')
Opcode.register(0x0038, SharedOpcodeGlobal.opcode0038, '[global var int] == [literal int]')
Opcode.register(0x0039, SharedOpcodeGlobal.opcode0039, '[local var int] == [literal int]')
Opcode.register(0x003a, SharedOpcodeGlobal.opcode003A, '[global var int] == [global var int]')
Opcode.register(0x003b, SharedOpcodeGlobal.opcode003B, '[local var int] == [local var int]')
Opcode.register(0x003c, SharedOpcodeGlobal.opcode003C, '[global var int] == [local var int]')
Opcode.register(0x0042, SharedOpcodeGlobal.opcode0042, '[global var float] == [literal float]')
Opcode.register(0x0043, SharedOpcodeGlobal.opcode0043, '[local var float] == [literal float]')
Opcode.register(0x0044, SharedOpcodeGlobal.opcode0044, '[global var float] == [global var float]')
Opcode.register(0x0045, SharedOpcodeGlobal.opcode0045, '[local var float] == [local var float]')
Opcode.register(0x0046, SharedOpcodeGlobal.opcode0046, '[global var float] == [local var float]')
Opcode.register(0x004d, SharedOpcodeGlobal.gotoIfFalse, 'goto_if_false @label')
Opcode.register(0x004e, SharedOpcodeGlobal.terminateThisScript, 'terminate_this_script')
Opcode.register(0x004f, SharedOpcodeGlobal.startNewScript, 'start_new_script @label [arguments]')
Opcode.register(0x0050, SharedOpcodeGlobal.gosub, 'gosub @label')
Opcode.register(0x0051, SharedOpcodeGlobal.doReturn, 'return')
Opcode.register(0x0058, SharedOpcodeGlobal.opcode0058, '[global var int] += [global var int]')
Opcode.register(0x0059, SharedOpcodeGlobal.opcode0059, '[global var float] += [global var float]')
Opcode.register(0x005a, SharedOpcodeGlobal.opcode005A, '[local var int] += [local var int]')
Opcode.register(0x005b, SharedOpcodeGlobal.opcode005B, '[local var float] += [local var float]')
Opcode.register(0x005c, SharedOpcodeGlobal.opcode005C, '[local var int] += [global var int]')
Opcode.register(0x005d, SharedOpcodeGlobal.opcode005D, '[local var float] += [global var float]')
Opcode.register(0x005e, SharedOpcodeGlobal.opcode005E, '[global var int] += [local var int]')
Opcode.register(0x005f, SharedOpcodeGlobal.opcode005F, '[global var float] += [local var float]')
Opcode.register(0x0060, SharedOpcodeGlobal.opcode0060, '[global var int] -= [global var int]')
Opcode.register(0x0061, SharedOpcodeGlobal.opcode0061, '[global var float] -= [global var float]')
Opcode.register(0x0062, SharedOpcodeGlobal.opcode0062, '[local var int] -= [local var int]')
Opcode.register(0x0063, SharedOpcodeGlobal.opcode0063, '[local var float] -= [local var float]')
Opcode.register(0x0064, SharedOpcodeGlobal.opcode0064, '[local var int] -= [global var int]')
Opcode.register(0x0065, SharedOpcodeGlobal.opcode0065, '[local var float] -= [global var float]')
Opcode.register(0x0066, SharedOpcodeGlobal.opcode0066, '[global var int] -= [local var int]')
Opcode.register(0x0067, SharedOpcodeGlobal.opcode0067, '[global var float] -= [local var float]')
Opcode.register(0x0068, SharedOpcodeGlobal.opcode0068, '[global var int] *= [global var int]')
Opcode.register(0x0069, SharedOpcodeGlobal.opcode0069, '[global var float] *= [global var float]')
Opcode.register(0x006a, SharedOpcodeGlobal.opcode006A, '[local var int] *= [local var int]')
Opcode.register(0x006b, SharedOpcodeGlobal.opcode006B, '[local var float] *= [local var float]')
Opcode.register(0x006c, SharedOpcodeGlobal.opcode006C, '[global var int] *= [local var int]')
Opcode.register(0x006d, SharedOpcodeGlobal.opcode006D, '[global var float] *= [local var float]')
Opcode.register(0x006e, SharedOpcodeGlobal.opcode006E, '[local var int] *= [global var int]')
Opcode.register(0x006f, SharedOpcodeGlobal.opcode006F, '[local var float] *= [global var float]')
Opcode.register(0x0070, SharedOpcodeGlobal.opcode0070, '[global var int] /= [global var int]')
Opcode.register(0x0071, SharedOpcodeGlobal.opcode0071, '[global var float] /= [global var float]')
Opcode.register(0x0072, SharedOpcodeGlobal.opcode0072, '[local var int] /= [local var int]')
Opcode.register(0x0073, SharedOpcodeGlobal.opcode0073, '[local var float] /= [local var float]')
Opcode.register(0x0074, SharedOpcodeGlobal.opcode0074, '[global var int] /= [local var int]')
Opcode.register(0x0075, SharedOpcodeGlobal.opcode0075, '[global var float] /= [local var float]')
Opcode.register(0x0076, SharedOpcodeGlobal.opcode0076, '[local var int] /= [global var int]')
Opcode.register(0x0077, SharedOpcodeGlobal.opcode0077, '[local var float] /= [global var float]')
Opcode.register(0x0078, SharedOpcodeGlobal.opcode0078, '[global var float] +=@ [literal float]')
Opcode.register(0x0079, SharedOpcodeGlobal.opcode0079, '[local var float] +=@ [literal float]')
Opcode.register(0x007a, SharedOpcodeGlobal.opcode007A, '[global var float] +=@ [global var float]')
Opcode.register(0x007b, SharedOpcodeGlobal.opcode007B, '[local var float] +=@ [local var float]')
Opcode.register(0x007c, SharedOpcodeGlobal.opcode007C, '[local var float] +=@ [global var float]')
Opcode.register(0x007d, SharedOpcodeGlobal.opcode007D, '[global var float] +=@ [local var float]')
Opcode.register(0x007e, SharedOpcodeGlobal.opcode007E, '[global var float] -=@ [literal float]')
Opcode.register(0x007f, SharedOpcodeGlobal.opcode007F, '[local var float] -=@ [literal float]')
Opcode.register(0x0080, SharedOpcodeGlobal.opcode0080, '[global var float] -=@ [global var float]')
Opcode.register(0x0081, SharedOpcodeGlobal.opcode0081, '[local var float] -=@ [local var float]')
Opcode.register(0x0082, SharedOpcodeGlobal.opcode0082, '[local var float] -=@ [global var float]')
Opcode.register(0x0083, SharedOpcodeGlobal.opcode0083, '[global var float] -=@ [local var float]')
Opcode.register(0x0084, SharedOpcodeGlobal.opcode0084, '[global var int] = [global var int]')
Opcode.register(0x0085, SharedOpcodeGlobal.opcode0085, '[local var int] = [local var int]')
Opcode.register(0x0086, SharedOpcodeGlobal.opcode0086, '[global var float] = [global var float]')
Opcode.register(0x0087, SharedOpcodeGlobal.opcode0087, '[local var float] = [local var float]')
Opcode.register(0x0088, SharedOpcodeGlobal.opcode0088, '[global var float] = [local var float]')
Opcode.register(0x0089, SharedOpcodeGlobal.opcode0089, '[local var float] = [global var float]')
Opcode.register(0x008a, SharedOpcodeGlobal.opcode008A, '[global var int] = [local var int]')
Opcode.register(0x008b, SharedOpcodeGlobal.opcode008B, '[local var int] = [global var int]')
Opcode.register(0x008c, SharedOpcodeGlobal.opcode008C, '[global var int] =# [global var float]')
Opcode.register(0x008d, SharedOpcodeGlobal.opcode008D, '[global var float] =# [global var int]')
Opcode.register(0x008e, SharedOpcodeGlobal.opcode008E, '[local var int] =# [global var float]')
Opcode.register(0x008f, SharedOpcodeGlobal.opcode008F, '[local var float] =# [global var int]')
Opcode.register(0x0090, SharedOpcodeGlobal.opcode0090, '[global var int] =# [local var float]')
Opcode.register(0x0091, SharedOpcodeGlobal.opcode0091, '[global var float] =# [local var int]')
Opcode.register(0x0092, SharedOpcodeGlobal.opcode0092, '[local var int] =# [local var float]')
Opcode.register(0x0093, SharedOpcodeGlobal.opcode0093, '[local var float] =# [local var int]')
Opcode.register(0x0094, SharedOpcodeGlobal.absVarInt, '[global var number: int] = abs_var_int')
Opcode.register(0x0095, SharedOpcodeGlobal.absLvarInt, '[local var number: int] = abs_lvar_int')
Opcode.register(0x0096, SharedOpcodeGlobal.absVarFloat, '[global var number: float] = abs_var_float')
Opcode.register(0x0098, SharedOpcodeGlobal.generateRandomFloat, '[var float] = generate_random_float')
Opcode.register(0x00d6, SharedOpcodeGlobal.ifStatement, 'if [int]')
Opcode.register(0x00d7, SharedOpcodeGlobal.launchMission, 'launch_mission @label')
Opcode.register(0x0111, SharedOpcodeGlobal.setDeatharrestState, 'set_deatharrest_state {state} [bool]')
Opcode.register(0x0112, SharedOpcodeGlobal.hasDeatharrestBeenExecuted, 'has_deatharrest_been_executed')
Opcode.register(0x0180, SharedOpcodeGlobal.declareMissionFlag, 'declare_mission_flag {var_flag} [global var int]')
Opcode.register(0x03a4, SharedOpcodeGlobal.scriptName, 'script_name {name} [string]')
Opcode.register(0x0425, SharedOpcodeGlobal.convertMetresToFeet, '[var feet: float] = convert_metres_to_feet {meters} [float]')
Opcode.register(0x0459, SharedOpcodeGlobal.terminateAllScriptsWithThisName, 'terminate_all_scripts_with_this_name {name} [string]')
Opcode.register(0x04a3, SharedOpcodeGlobal.opcode04A3, '[global var int] == [literal int]')
Opcode.register(0x04a4, SharedOpcodeGlobal.opcode04A4, '[local var int] == [literal int]')
Opcode.register(0x04ae, SharedOpcodeGlobal.opcode04AE, '[global var int] = [literal int]')
Opcode.register(0x04af, SharedOpcodeGlobal.opcode04AF, '[local var int] = [literal int]')
Opcode.register(0x04b0, SharedOpcodeGlobal.opcode04B0, '[global var int] > [literal int]')
Opcode.register(0x04b1, SharedOpcodeGlobal.opcode04B1, '[local var int] > [literal int]')
Opcode.register(0x04b2, SharedOpcodeGlobal.opcode04B2, '[literal int] > [global var int]')
Opcode.register(0x04b3, SharedOpcodeGlobal.opcode04B3, '[literal int] > [local var int]')
Opcode.register(0x04b4, SharedOpcodeGlobal.opcode04B4, '[global var int] >= [literal int]')
Opcode.register(0x04b5, SharedOpcodeGlobal.opcode04B5, '[global var int] >= [literal int]')
Opcode.register(0x04b6, SharedOpcodeGlobal.opcode04B6, '[literal int] >= [global var int]')
Opcode.register(0x04b7, SharedOpcodeGlobal.opcode04B7, '[literal int] >= [local var int]')
Opcode.register(0x0a8e, SharedOpcodeGlobal.opcode0A8E, '[var int] = [int] + [int]')
Opcode.register(0x0a8f, SharedOpcodeGlobal.opcode0A8F, '[var int] = [int] - [int]')
Opcode.register(0x0a90, SharedOpcodeGlobal.opcode0A90, '[var int] = [int] * [int]')
Opcode.register(0x0a91, SharedOpcodeGlobal.opcode0A91, '[var int] = [int] / [int]')
Opcode.register(0x0a92, SharedOpcodeGlobal.streamCustomScript, 'stream_custom_script {scriptFileName} [string] [arguments]')
Opcode.register(0x0a93, SharedOpcodeGlobal.terminateThisCustomScript, 'terminate_this_custom_script')
Opcode.register(0x0aa0, SharedOpcodeGlobal.gosubIfFalse, 'gosub_if_false @label')
Opcode.register(0x0aa1, SharedOpcodeGlobal.returnIfFalse, 'return_if_false')
Opcode.register(0x0ab1, SharedOpcodeGlobal.cleoCall, 'cleo_call @label {numParams} [int] {params} [arguments]')
Opcode.register(0x0ab2, SharedOpcodeGlobal.cleoReturn, 'cleo_return {numRet} [int] {retParams} [arguments]')
Opcode.register(0x0ab3, SharedOpcodeGlobal.setCleoSharedVar, 'set_cleo_shared_var {index} [int] {value} [any]')
Opcode.register(0x0ab4, SharedOpcodeGlobal.getCleoSharedVar, '[var result: any] = get_cleo_shared_var {index} [int]')
Opcode.register(0x0aba, SharedOpcodeGlobal.terminateAllCustomScriptsWithThisName, 'terminate_all_custom_scripts_with_this_name {name} [string]')
Opcode.register(0x0d16, SharedOpcodeGlobal.setMatrixRotationFromQuat, 'set_matrix_rotation_from_quat {matrix} [int] {quat} [int]')
Opcode.register(0x0d17, SharedOpcodeGlobal.setQuatFromMatrix, 'set_quat_from_matrix {quat} [int] {matrix} [int]')
Opcode.register(0x0d18, SharedOpcodeGlobal.rotateQuatOnAxis, 'rotate_quat_on_axis {quat} [int] {x} [float] {y} [float] {z} [float] {angle} [float] {rwCombine} [RwCombine]')
Opcode.register(0x0d19, SharedOpcodeGlobal.getNormalisedQuat, '[var quat: int] = get_normalised_quat {quat} [int]')
Opcode.register(0x0d1a, SharedOpcodeGlobal.multiplyQuats, '[var quatResult: int] = multiply_quats {quat1} [int] {quat2} [int]')
Opcode.register(0x0d1e, SharedOpcodeGlobal.quatSlerp, '[var result: int] = quat_slerp {from} [int] {to} [int] {lambda} [float]')
Opcode.register(0x0d24, SharedOpcodeGlobal.initialiseQuat, 'initialise_quat {quat} [int] {x} [float] {y} [float] {z} [float] {real} [float]')
Opcode.register(0x0d27, SharedOpcodeGlobal.copyMemory, 'copy_memory {src} [int] {dest} [int] {size} [int]')
Opcode.register(0x0d29, SharedOpcodeGlobal.getQuatElements, '[var x: float], [var y: float], [var z: float], [var real: float] = get_quat_elements {quat} [int]')
Opcode.register(0x0d2e, SharedOpcodeGlobal.setScriptVar, 'set_script_var {scriptPointer} [int] {varIndex} [int] {value} [any]')
Opcode.register(0x0d2f, SharedOpcodeGlobal.getScriptVar, '[var result: any] = get_script_var {scriptPointer} [int] {varIndex} [int]')
Opcode.register(0x0b10, SharedOpcodeGlobal.opcode0B10, '[var int] = [int] & [int]')
Opcode.register(0x0b11, SharedOpcodeGlobal.opcode0B11, '[var int] = [int] | [int]')
Opcode.register(0x0b12, SharedOpcodeGlobal.opcode0B12, '[var int] = [int] ^ [int]')
Opcode.register(0x0b13, SharedOpcodeGlobal.opcode0B13, '[var int] = ~[int]')
Opcode.register(0x0b14, SharedOpcodeGlobal.opcode0B14, '[var int] = [int] % [int]')
Opcode.register(0x0b15, SharedOpcodeGlobal.opcode0B15, '[var int] = [int] >> [int]')
Opcode.register(0x0b16, SharedOpcodeGlobal.opcode0B16, '[var int] = [int] << [int]')
Opcode.register(0x0b17, SharedOpcodeGlobal.opcode0B17, '[var int] &= [int]')
Opcode.register(0x0b18, SharedOpcodeGlobal.opcode0B18, '[var int] |= [int]')
Opcode.register(0x0b19, SharedOpcodeGlobal.opcode0B19, '[var int] ^= [int]')
Opcode.register(0x0b1a, SharedOpcodeGlobal.opcode0B1A, '~[var int]')
Opcode.register(0x0b1b, SharedOpcodeGlobal.opcode0B1B, '[var int] %= [int]')
Opcode.register(0x0b1c, SharedOpcodeGlobal.opcode0B1C, '[var int] >>= [int]')
Opcode.register(0x0b1d, SharedOpcodeGlobal.opcode0B1D, '[var int] <<= [int]')
