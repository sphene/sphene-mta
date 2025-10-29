SanAndreasOpcodeGlobal = {}
SanAndreasOpcodeGlobal.__index = SanAndreasOpcodeGlobal

-- Opcode: 0x05A9
-- Instruction: [global var string] = [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05A9
function SanAndreasOpcodeGlobal.opcode05A9(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x05AA
-- Instruction: [local var string] = [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05AA
function SanAndreasOpcodeGlobal.opcode05AA(_, value)
    return opcodes[0x0004](nil, value)
end

-- Opcode: 0x05AD
-- Instruction: [global var string] == [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05AD
function SanAndreasOpcodeGlobal.opcode05AD(var1, var2)
    return (var1 == var2)
end

-- Opcode: 0x05AE
-- Instruction: [local var string] == [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05AE
function SanAndreasOpcodeGlobal.opcode05AE(var1, var2)
   return (var1 == var2)
end

-- Opcode: 0x06D1
-- Instruction: [global var string] = [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06D1
function SanAndreasOpcodeGlobal.opcode06D1(_, value)
    return value
end

-- Opcode: 0x06D2
-- Instruction: [local var string] = [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06D2
function SanAndreasOpcodeGlobal.opcode06D2(_, value)
    return value
end

-- Opcode: 0x0701
-- Instruction: skip_cutscene_end
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0701
function SanAndreasOpcodeGlobal.skipCutsceneEnd()
    return Cutscene.endSkipSection()
end

-- Opcode: 0x0707
-- Instruction: skip_cutscene_start_internal @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0707
function SanAndreasOpcodeGlobal.skipCutsceneStartInternal(pointer)
    if Thread.currentThread:isMissionThread() then
        pointer = Thread.currentThread.startPosition + -pointer
    end

    return Cutscene.startSkipSection(pointer)
end

-- Opcode: 0x07D6
-- Instruction: [local var int] == [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07D6
function SanAndreasOpcodeGlobal.opcode07D6(arg1, arg2)
return opcodes[0x0038](arg1, arg2)
end

-- Opcode: 0x07D7
-- Instruction: [local var float] == [global var float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07D7
function SanAndreasOpcodeGlobal.opcode07D7(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0844
-- Instruction: is_var_text_label_empty {var_text} [global var string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0844
function SanAndreasOpcodeGlobal.isVarTextLabelEmpty(_)
    return (#tostring(string) == 0)
end

-- Opcode: 0x0845
-- Instruction: is_lvar_text_label_empty {var_text} [local var string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0845
function SanAndreasOpcodeGlobal.isLvarTextLabelEmpty(string)
    return opcodes[0x0846](string)
end

-- Opcode: 0x0846
-- Instruction: is_var_text_label16_empty {var_text} [global var string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0846
function SanAndreasOpcodeGlobal.opcode0846(string)
    return (#tostring(string) == 0)
end

-- Opcode: 0x0847
-- Instruction: is_lvar_text_label16_empty {var_text} [local var string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0847
function SanAndreasOpcodeGlobal.opcode0847(string)
    return opcodes[0x0846](string)
end

-- Opcode: 0x0871
-- Instruction: switch_start {caseId} [int] {numCases} [int] {hasDefaultCase} [bool] @label {caseNum1} [int] @label {caseNum2} [int] @label {caseNum3} [int] @label {caseNum4} [int] @label {caseNum5} [int] @label {caseNum6} [int] @label {caseNum7} [int] @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0871
function SanAndreasOpcodeGlobal.switchStart(jumpTable, totalJumps, hasDefault, defPointer,
    caseId0, pointer0, caseId1, pointer1, caseId2, pointer2, caseId3, pointer3
    , caseId4, pointer4, caseId5, pointer5, caseId6, pointer6)

    if (caseId == 255 or caseId == -1) then
        return {
            ["jumptable"] = false
        }
    end

    local thread = Thread.currentThread

    if (thread:isMissionThread() or thread:isExternalScript()) then
        defPointer = thread.startPosition + -defPointer
        pointer0 = thread.startPosition + -pointer0
        pointer1 = thread.startPosition + -pointer1
        pointer2 = thread.startPosition + -pointer2
        pointer3 = thread.startPosition + -pointer3
        pointer4 = thread.startPosition + -pointer4
        pointer5 = thread.startPosition + -pointer5
        pointer6 = thread.startPosition + -pointer6
    end

    local caseId = jumpTable

    jumpTable = {
        ["jumptable"] = true,
        ["scripted"] = true,
        ["totaljumps"] = totalJumps,
        ["case"] = caseId,
        ["cases"] = {},
        ["highestCase"] = false,
        ["hasDefault"] = true,
        ["default"] = defPointer,
        ["counter"] = 7
    }

    local highestCase = caseId0
    jumpTable["cases"][tostring(caseId0)] = pointer0

    if (caseId1 > highestCase or highestCase == false) then
        jumpTable["cases"][tostring(caseId1)] = pointer1
        highestCase = caseId1
    end

    if (caseId2 > highestCase or highestCase == false) then
        jumpTable["cases"][tostring(caseId2)] = pointer2
        highestCase = caseId2
    end

    if (caseId3 > highestCase or highestCase == false) then
        jumpTable["cases"][tostring(caseId3)] = pointer3
        highestCase = caseId3
    end

    if (caseId4 > highestCase or highestCase == false) then
        jumpTable["cases"][tostring(caseId4)] = pointer4
        highestCase = caseId4
    end

    if (caseId5 > highestCase or highestCase == false) then
        jumpTable["cases"][tostring(caseId5)] = pointer5
        highestCase = caseId5
    end

    if (caseId6 > highestCase or highestCase == false) then
        jumpTable["cases"][tostring(caseId6)] = pointer6
        highestCase = caseId6
    end

    jumpTable["highestCase"] = highestCase

    if (jumpTable["cases"][tostring(caseId)] ~= nil) then
        Thread.currentThread:setPosition(jumpTable["cases"][tostring(caseId)])
    elseif (hasDefault and totalJumps <= jumpTable["counter"]) then
        Thread.currentThread:setPosition(jumpTable["default"])
    end

    return jumpTable
end

-- Opcode: 0x0872
-- Instruction: switch_continued {caseNum1} [int] @label {caseNum2} [int] @label {caseNum3} [int] @label {caseNum4} [int] @label {caseNum5} [int] @label {caseNum6} [int] @label {caseNum7} [int] @label {caseNum8} [int] @label {caseNum9} [int] @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0872
function SanAndreasOpcodeGlobal.switchContinued(caseId0, pointer0, caseId1, pointer1, caseId2, pointer2, caseId3, pointer3
    , caseId4, pointer4, caseId5, pointer5, caseId6, pointer6
    , caseId7, pointer7, caseId8, pointer8)

    local thread = Thread.currentThread

    if (thread:isMissionThread() or thread:isExternalScript()) then
        pointer0 = thread.startPosition + -pointer0
        pointer1 = thread.startPosition + -pointer1
        pointer2 = thread.startPosition + -pointer2
        pointer3 = thread.startPosition + -pointer3
        pointer4 = thread.startPosition + -pointer4
        pointer5 = thread.startPosition + -pointer5
        pointer6 = thread.startPosition + -pointer6
        pointer7 = thread.startPosition + -pointer7
        pointer8 = thread.startPosition + -pointer8
    end

    local lastResult = Thread.currentThread:getLastResult()

    if (type(lastResult) == "table") then
        if (lastResult.jumptable == true) then
            local jumpTable = lastResult

            local caseId = jumpTable["case"]
            local highestCase = jumpTable["highestCase"]

            if (caseId0 > highestCase or highestCase == false) then
                jumpTable["cases"][tostring(caseId0)] = pointer0
                highestCase = caseId0
            end

            if (caseId1 > highestCase) then
                jumpTable["cases"][tostring(caseId1)] = pointer1
                highestCase = caseId1
            end

            if (caseId2 > highestCase) then
                jumpTable["cases"][tostring(caseId2)] = pointer2
                highestCase = caseId2
            end

            if (caseId3 > highestCase) then
                jumpTable["cases"][tostring(caseId3)] = pointer3
                highestCase = caseId3
            end

            if (caseId4 > highestCase) then
                jumpTable["cases"][tostring(caseId4)] = pointer4
                highestCase = caseId4
            end

            if (caseId5 > highestCase) then
                jumpTable["cases"][tostring(caseId5)] = pointer5
                highestCase = caseId5
            end

            if (caseId6 > highestCase) then
                jumpTable["cases"][tostring(caseId6)] = pointer6
                highestCase = caseId6
            end

            if (caseId7 > highestCase) then
                jumpTable["cases"][tostring(caseId7)] = pointer7
                highestCase = caseId7
            end

            if (caseId8 > highestCase) then
                jumpTable["cases"][tostring(caseId8)] = pointer8
            end

            jumpTable["counter"] = jumpTable["counter"] + 9

            if (jumpTable["cases"][tostring(caseId)] ~= nil) then
                Thread.currentThread:setPosition(jumpTable["cases"][tostring(caseId)])
            elseif(jumpTable["hasDefault"]
                and jumpTable["totaljumps"] <= jumpTable["counter"]) then
                Thread.currentThread:setPosition(jumpTable["default"])
            end

            return jumpTable
        end
    end

    return 0
end

-- Opcode: 0x08B4
-- Instruction: is_global_var_bit_set_const {var_number} [global var int] {bitIndex} [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08B4
function SanAndreasOpcodeGlobal.isGlobalVarBitSetConst(checkBit, bit)
    return (bitTest(checkBit, bitReplace(0, 1, bit, 1)))
end

-- Opcode: 0x08B5
-- Instruction: is_global_var_bit_set_var {var_number} [global var int] {var_bitIndex} [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08B5
function SanAndreasOpcodeGlobal.isGlobalVarBitSetVar(checkBit, bit)
    return opcodes[0x08B4](checkBit, bit)
end

-- Opcode: 0x08B6
-- Instruction: is_global_var_bit_set_lvar {var_number} [global var int] {var_bitIndex} [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08B6
function SanAndreasOpcodeGlobal.isGlobalVarBitSetLvar(checkBit, bit)
    return opcodes[0x08B4](checkBit, bit)
end

-- Opcode: 0x08B7
-- Instruction: is_local_var_bit_set_const {var_number} [local var int] {bitIndex} [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08B7
function SanAndreasOpcodeGlobal.isLocalVarBitSetConst(checkBit, bit)
    return opcodes[0x08B4](checkBit, bit)
end

-- Opcode: 0x08B8
-- Instruction: is_local_var_bit_set_var {var_number} [local var int] {var_bitIndex} [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08B8
function SanAndreasOpcodeGlobal.isLocalVarBitSetVar(checkBit, bit)
    return opcodes[0x08B4](checkBit, bit)
end

-- Opcode: 0x08B9
-- Instruction: is_local_var_bit_set_lvar {var_number} [local var int] {var_bitIndex} [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08B9
function SanAndreasOpcodeGlobal.isLocalVarBitSetLvar(checkBit, bit)
    return opcodes[0x08B4](checkBit, bit)
end

-- Opcode: 0x08BA
-- Instruction: set_global_var_bit_const {var_number} [global var int] {bitIndex} [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08BA
function SanAndreasOpcodeGlobal.setGlobalVarBitConst(bitVar, bit)
    Script.storeValueAtIndex(1, bitReplace(bitVar, 1, bit, 1))

    return true
end

-- Opcode: 0x08BB
-- Instruction: set_global_var_bit_var {var_number} [global var int] {var_bitIndex} [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08BB
function SanAndreasOpcodeGlobal.setGlobalVarBitVar(bitVar, bit)
    return opcodes[0x08BA](bitVar, bit)
end

-- Opcode: 0x08BC
-- Instruction: set_global_var_bit_lvar {var_number} [global var int] {var_bitIndex} [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08BC
function SanAndreasOpcodeGlobal.setGlobalVarBitLvar(bitVar, bit)
    return opcodes[0x08BA](bitVar, bit)
end

-- Opcode: 0x08BD
-- Instruction: set_local_var_bit_const {var_number} [local var int] {bitIndex} [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08BD
function SanAndreasOpcodeGlobal.setLocalVarBitConst(bitVar, bit)
    return opcodes[0x08BA](bitVar, bit)
end

-- Opcode: 0x08BE
-- Instruction: set_local_var_bit_var {var_number} [local var int] {var_bitIndex} [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08BE
function SanAndreasOpcodeGlobal.setLocalVarBitVar(bitVar, bit)
    return opcodes[0x08BA](bitVar, bit)
end

-- Opcode: 0x08BF
-- Instruction: set_local_var_bit_lvar {var_number} [local var int] {var_bitIndex} [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08BF
function SanAndreasOpcodeGlobal.setLocalVarBitLvar(bitVar, bit)
    return opcodes[0x08BA](bitVar, bit)
end

-- Opcode: 0x08C0
-- Instruction: clear_global_var_bit_const {var_number} [global var int] {bitIndex} [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08C0
function SanAndreasOpcodeGlobal.clearGlobalVarBitConst(bitVar, bit)
    Script.storeValueAtIndex(1, bitReplace(bitVar, 0, bit, 1))

    return true
end

-- Opcode: 0x08C1
-- Instruction: clear_global_var_bit_var {var_number} [global var int] {var_bitIndex} [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08C1
function SanAndreasOpcodeGlobal.clearGlobalVarBitVar(bitVar, bit)
    return opcodes[0x08C0](bitVar, bit)
end

-- Opcode: 0x08C2
-- Instruction: clear_global_var_bit_lvar {var_number} [global var int] {var_bitIndex} [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08C2
function SanAndreasOpcodeGlobal.clearGlobalVarBitLvar(bitVar, bit)
    return opcodes[0x08C0](bitVar, bit)
end

-- Opcode: 0x08C3
-- Instruction: clear_local_var_bit_const {var_number} [local var int] {bitIndex} [literal int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08C3
function SanAndreasOpcodeGlobal.clearLocalVarBitConst(bitVar, bit)
    return opcodes[0x08C0](bitVar, bit)
end

-- Opcode: 0x08C4
-- Instruction: clear_local_var_bit_var {var_number} [local var int] {var_bitIndex} [global var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08C4
function SanAndreasOpcodeGlobal.clearLocalVarBitVar(bitVar, bit)
    return opcodes[0x08C0](bitVar, bit)
end

-- Opcode: 0x08C5
-- Instruction: clear_local_var_bit_lvar {var_number} [local var int] {var_bitIndex} [local var int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08C5
function SanAndreasOpcodeGlobal.clearLocalVarBitLvar(bitVar, bit)
    return opcodes[0x08C0](bitVar, bit)
end

-- Opcode: 0x08F9
-- Instruction: [global var string] == [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08F9
function SanAndreasOpcodeGlobal.opcode08F9(arg1, arg2)
    return opcodes[0x0038](arg1, arg2)
end

-- Opcode: 0x08FA
-- Instruction: [local var string] == [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08FA
function SanAndreasOpcodeGlobal.opcode08FA(arg1, arg2)
    return opcodes[0x0038](arg1, arg2)
end

-- Opcode: 0x098B
-- Instruction: [var string] = [var string] + [var string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/098B
function SanAndreasOpcodeGlobal.opcode098B(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x098C
-- Instruction: [var string] = [var string] + [var string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/098C
function SanAndreasOpcodeGlobal.opcode098C(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A4E
-- Instruction: is_xbox_player2_pressing_start
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A4E
function SanAndreasOpcodeGlobal.opcode0A4E()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A94
-- Instruction: load_and_launch_custom_mission {scriptFileName} [string] [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A94
function SanAndreasOpcodeGlobal.loadAndLaunchCustomMission()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A95
-- Instruction: save_this_custom_script
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A95
function SanAndreasOpcodeGlobal.saveThisCustomScript()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2000
-- Instruction: [var count: int] = get_cleo_arg_count
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2000
function SanAndreasOpcodeGlobal.getCleoArgCount()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2002
-- Instruction: cleo_return_with {conditionResult} [bool] {retArgs} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2002
function SanAndreasOpcodeGlobal.cleoReturnWith()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2003
-- Instruction: cleo_return_fail [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2003
function SanAndreasOpcodeGlobal.cleoReturnFail()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E6F
-- Instruction: stream_custom_script_from_label @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E6F
function SanAndreasOpcodeGlobal.streamCustomScriptFromLabel()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E9E
-- Instruction: [var modelId: model_any] = get_model_doesnt_exist_in_range {start} [int] {end} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E9E
function SanAndreasOpcodeGlobal.getModelDoesntExistInRange(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EB3
-- Instruction: convert_direction_to_quat {quat} [int] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EB3
function SanAndreasOpcodeGlobal.convertDirectionToQuat(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EBA
-- Instruction: [var pedType: PedType], [var pedStat: PedStat] = get_model_ped_type_and_stat {modelId} [model_char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EBA
function SanAndreasOpcodeGlobal.getModelPedTypeAndStat(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ED0
-- Instruction: return_script_event
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ED0
function SanAndreasOpcodeGlobal.returnScriptEvent()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ED1
-- Instruction: set_script_event_save_confirmation {add} [bool] @label {varSaveSlot} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ED1
function SanAndreasOpcodeGlobal.setScriptEventSaveConfirmation(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ED2
-- Instruction: set_script_event_char_delete {add} [bool] @label {varChar} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ED2
function SanAndreasOpcodeGlobal.setScriptEventCharDelete(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ED3
-- Instruction: set_script_event_char_create {add} [bool] @label {varChar} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ED3
function SanAndreasOpcodeGlobal.setScriptEventCharCreate(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ED4
-- Instruction: set_script_event_car_delete {add} [bool] @label {varCar} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ED4
function SanAndreasOpcodeGlobal.setScriptEventCarDelete(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ED5
-- Instruction: set_script_event_car_create {add} [bool] @label {varCar} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ED5
function SanAndreasOpcodeGlobal.setScriptEventCarCreate(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ED6
-- Instruction: set_script_event_object_delete {add} [bool] @label {varObject} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ED6
function SanAndreasOpcodeGlobal.setScriptEventObjectDelete(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ED7
-- Instruction: set_script_event_object_create {add} [bool] @label {varObject} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ED7
function SanAndreasOpcodeGlobal.setScriptEventObjectCreate(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0ED8
-- Instruction: set_script_event_on_menu {add} [bool] @label {varJustPaused} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ED8
function SanAndreasOpcodeGlobal.setScriptEventOnMenu(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EDA
-- Instruction: set_script_event_char_process {add} [bool] @label {varChar} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EDA
function SanAndreasOpcodeGlobal.setScriptEventCharProcess(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EDB
-- Instruction: set_script_event_car_process {add} [bool] @label {varCar} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EDB
function SanAndreasOpcodeGlobal.setScriptEventCarProcess(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EDC
-- Instruction: set_script_event_object_process {add} [bool] @label {varObject} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EDC
function SanAndreasOpcodeGlobal.setScriptEventObjectProcess(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EDD
-- Instruction: set_script_event_building_process {add} [bool] @label {entity} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EDD
function SanAndreasOpcodeGlobal.setScriptEventBuildingProcess(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EDE
-- Instruction: set_script_event_char_damage {add} [bool] @label {varChar} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EDE
function SanAndreasOpcodeGlobal.setScriptEventCharDamage(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EDF
-- Instruction: set_script_event_car_weapon_damage {add} [bool] @label {varCar} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EDF
function SanAndreasOpcodeGlobal.setScriptEventCarWeaponDamage(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EE0
-- Instruction: set_script_event_bullet_impact {add} [bool] @label {varCharOwner} [Char] {varEntityVictim} [any] {varWeaponType} [WeaponType] {varColPoint} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EE0
function SanAndreasOpcodeGlobal.setScriptEventBulletImpact(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0EF3
-- Instruction: [var result: float] = lerp {a} [float] {b} [float] {t} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0EF3
function SanAndreasOpcodeGlobal.lerp(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F0A
-- Instruction: return_times {numReturns} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F0A
function SanAndreasOpcodeGlobal.returnTimes()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F0B
-- Instruction: set_script_event_before_game_process {add} [int] @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F0B
function SanAndreasOpcodeGlobal.setScriptEventBeforeGameProcess()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F0C
-- Instruction: set_script_event_after_game_process {add} [int] @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F0C
function SanAndreasOpcodeGlobal.setScriptEventAfterGameProcess()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F0D
-- Instruction: set_matrix_look_direction {matrix} [int] {originX} [float] {originY} [float] {originZ} [float] {dirX} [float] {dirY} [float] {dirZ} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F0D
function SanAndreasOpcodeGlobal.setMatrixLookDirection()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F0F
-- Instruction: [var drawing: float], [var generating: float] = get_distance_multiplier
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F0F
function SanAndreasOpcodeGlobal.getDistanceMultiplier()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F11
-- Instruction: [var distance: float], [var closestZ: float] = get_closest_water_distance
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F11
function SanAndreasOpcodeGlobal.getClosestWaterDistance()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0F17
-- Instruction: [var address: int] = get_model_name_pointer {modelId} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0F17
function SanAndreasOpcodeGlobal.getModelNamePointer()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D06
-- Instruction: [var x: float], [var y: float], [var z: float] = get_matrix_position {matrix} [Matrix]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D06
function SanAndreasOpcodeGlobal.getMatrixPosition(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D07
-- Instruction: [var x: float], [var y: float], [var z: float] = get_coords_offsets_relative_to_matrix {x} [float] {y} [float] {z} [float] {matrix} [Matrix]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D07
function SanAndreasOpcodeGlobal.getCoordsOffsetsRelativeToMatrix(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D0E
-- Instruction: set_car_component_state {car} [Car] {component} [string] {state} [ComponentStates]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D0E
function SanAndreasOpcodeGlobal.setCarComponentState(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D13
-- Instruction: set_matrix_x_rotation {matrix} [any] {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D13
function SanAndreasOpcodeGlobal.setMatrixXRotation(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D14
-- Instruction: set_matrix_y_rotation {matrix} [any] {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D14
function SanAndreasOpcodeGlobal.setMatrixYRotation(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D15
-- Instruction: set_matrix_z_rotation {matrix} [any] {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D15
function SanAndreasOpcodeGlobal.setMatrixZRotation(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D1B
-- Instruction: [var type: EntityTypes], [var class: EntityClasses] = get_entity_type_and_class {entity} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D1B
function SanAndreasOpcodeGlobal.getEntityTypeAndClass(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D1C
-- Instruction: normalise_vector {vector} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D1C
function SanAndreasOpcodeGlobal.normaliseVector(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D1D
-- Instruction: interpolate_matrix {slerp} [any] {matrix1} [any] {matrix2} [any] {t} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D1D
function SanAndreasOpcodeGlobal.interpolateMatrix(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D25
-- Instruction: initialise_matrix {matrix} [any] {a} [float] {b} [float] {c} [float] {d} [int] {e} [float] {f} [float] {g} [float] {h} [int] {i} [float] {j} [float] {k} [float] {l} [int] {m} [float] {n} [float] {o} [float] {p} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D25
function SanAndreasOpcodeGlobal.initialiseMatrix(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D26
-- Instruction: initialise_vector {vector} [any] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D26
function SanAndreasOpcodeGlobal.initialiseVector(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D28
-- Instruction: [var x: float], [var y: float], [var z: float] = get_vector_elements {vector} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D28
function SanAndreasOpcodeGlobal.getVectorElements(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D2A
-- Instruction: [var numCollidedEntities: int] = get_car_num_collided_entities {car} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D2A
function SanAndreasOpcodeGlobal.getCarNumCollidedEntities(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D2B
-- Instruction: [var numCollidedEntities: int] = get_char_num_collided_entities {char} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D2B
function SanAndreasOpcodeGlobal.getCharNumCollidedEntities(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D2C
-- Instruction: [var numCollidedEntities: any] = get_object_num_collided_entities {object} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D2C
function SanAndreasOpcodeGlobal.getObjectNumCollidedEntities(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D34
-- Instruction: [var entity0: int], [var entity1: int], [var entity2: int], [var entity3: int], [var entity4: int], [var entity5: int] = get_car_collided_entities {car} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D34
function SanAndreasOpcodeGlobal.getCarCollidedEntities(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D35
-- Instruction: [var entity0: int], [var entity1: int], [var entity2: int], [var entity3: int], [var entity4: int], [var entity5: int] = get_char_collided_entities {char} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D35
function SanAndreasOpcodeGlobal.getCharCollidedEntities(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D36
-- Instruction: [var entity0: int], [var entity1: int], [var entity2: int], [var entity3: int], [var entity4: int], [var entity5: int] = get_object_collided_entities {object} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D36
function SanAndreasOpcodeGlobal.getObjectCollidedEntities(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D3D
-- Instruction: [var lighting: int] = get_col_data_lighting {colPoint} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D3D
function SanAndreasOpcodeGlobal.getColDataLighting(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D3F
-- Instruction: [var p1X: float], [var p1Y: float], [var p2X: float], [var p2Y: float] = find_intersection_between_circles {x1} [float] {y1} [float] {r1} [float] {x2} [float] {y2} [float] {r2} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D3F
function SanAndreasOpcodeGlobal.findIntersectionBetweenCircles(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D40
-- Instruction: draw_shape {type} [int] {texture} [int] {numVerts} [int] {pVerts} [int] {vertexAlpha} [int] {srcBlend} [BlendValues] {dstBlend} [BlendValues] {unused} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D40
function SanAndreasOpcodeGlobal.drawShape(_, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D41
-- Instruction: setup_shape_vertex {shape} [any] {vertex} [int] {x} [float] {y} [float] {z} [float] {rhw} [float] {r} [int] {g} [int] {b} [int] {a} [int] {u} [float] {v} [float] {invertX} [bool] {invertY} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D41
function SanAndreasOpcodeGlobal.setupShapeVertex(_, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D42
-- Instruction: load_txd {txd} [string] {path} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D42
function SanAndreasOpcodeGlobal.loadTxd(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D43
-- Instruction: [var id: int] = get_txd_id {txd} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D43
function SanAndreasOpcodeGlobal.getTxdId(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D44
-- Instruction: [var texture: int] = find_texture_in_txd_with_name {texture} [string] {dictionary} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D44
function SanAndreasOpcodeGlobal.findTextureInTxdWithName(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D45
-- Instruction: rotate_shape_vertices {shape} [any] {numVerts} [int] {x} [float] {y} [float] {angle} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D45
function SanAndreasOpcodeGlobal.rotateShapeVertices(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D46
-- Instruction: [var texture: int] = find_texture_in_txd_with_id {texture} [string] {dictionary} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D46
function SanAndreasOpcodeGlobal.findTextureInTxdWithId(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D47
-- Instruction: [var txdId: int] = get_model_txd_id {model} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D47
function SanAndreasOpcodeGlobal.getModelTxdId(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D48
-- Instruction: [var crc32Key: int] = get_model_crc {model} [model_any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D48
function SanAndreasOpcodeGlobal.getModelCrc(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D49
-- Instruction: [var result: bool] = string_cmp {strA} [string] {strB} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D49
function SanAndreasOpcodeGlobal.stringCmp(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D4A
-- Instruction: string_cat {var_string} [var string] {append} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D4A
function SanAndreasOpcodeGlobal.stringCat(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D4B
-- Instruction: [var result: int] = string_str {var_string} [var string] {substring} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D4B
function SanAndreasOpcodeGlobal.stringStr(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D4F
-- Instruction: set_struct_field {struct} [int] {offset} [int] {size} [int] {value} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D4F
function SanAndreasOpcodeGlobal.setStructField(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D50
-- Instruction: draw_temporary_shadow {type} [ShadowTypes] {x} [float] {y} [float] {z} [float] {width} [float] {height} [float] {rotation} [float] {distance} [float] {texture} [ShadowTextures] {intensity} [int] {red} [int] {blue} [int] {green} [int] {shadowData} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D50
function SanAndreasOpcodeGlobal.drawTemporaryShadow(_, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D51
-- Instruction: draw_permanent_shadow {type} [ShadowTypes] {x} [float] {y} [float] {z} [float] {width} [float] {height} [float] {rotation} [float] {distance} [float] {texture} [ShadowTextures] {intensity} [int] {red} [int] {green} [int] {blue} [int] {time} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D51
function SanAndreasOpcodeGlobal.drawPermanentShadow(_, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D52
-- Instruction: draw_temporary_light {type} [LightTypes] {x} [float] {y} [float] {z} [float] {dirX} [float] {dirY} [float] {dirZ} [float] {radius} [float] {red} [int] {blue} [int] {green} [int] {affectEntity} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D52
function SanAndreasOpcodeGlobal.drawTemporaryLight(_, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D53
-- Instruction: draw_temporary_corona {texture} [CoronaType] {red} [int] {blue} [int] {green} [int] {alpha} [int] {entity} [int] {x} [float] {y} [float] {z} [float] {size} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D53
function SanAndreasOpcodeGlobal.drawTemporaryCorona(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D54
-- Instruction: draw_temporary_corona_ex {texture} [CoronaType] {red} [int] {green} [int] {blue} [int] {alpha} [int] {entity} [int] {x} [float] {y} [float] {z} [float] {size} [float] {farClip} [float] {nearClip} [float] {flare} [int] {enableReflection} [bool] {checkObstacles} [bool] {flashWhileFading} [bool] {fadeSpeed} [float] {onlyFromBelow} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D54
function SanAndreasOpcodeGlobal.drawTemporaryCoronaEx(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D55
-- Instruction: [var coreRed: int], [var coreBlue: int], [var coreGreen: int], [var glowRed: int], [var glowBlue: int], [var glowGreen: int] = get_sun_colors
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D55
function SanAndreasOpcodeGlobal.getSunColors(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D56
-- Instruction: [var x: float], [var y: float] = get_sun_screen_coors
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D56
function SanAndreasOpcodeGlobal.getSunScreenCoors(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D57
-- Instruction: [var x: float], [var y: float], [var z: float] = get_sun_world_coors
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D57
function SanAndreasOpcodeGlobal.getSunWorldCoors(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D58
-- Instruction: [var core: float], [var glow: float] = get_sun_size
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D58
function SanAndreasOpcodeGlobal.getSunSize(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D5A
-- Instruction: [var ns: TrafficLightColors], [var we: TrafficLightColors] = get_trafficlights_current_color
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D5A
function SanAndreasOpcodeGlobal.getTrafficlightsCurrentColor(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D5B
-- Instruction: draw_spotlight {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {baseRadius} [float] {targetRadius} [float] {enableShadow} [bool] {shadowIntensity} [int] {flag1} [bool] {flag2} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D5B
function SanAndreasOpcodeGlobal.drawSpotlight(_, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D5C
-- Instruction: [var damageState: bool] = get_car_light_damage_status {car} [Car] {light} [LightTypesCar]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D5C
function SanAndreasOpcodeGlobal.getCarLightDamageStatus(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D5D
-- Instruction: set_car_light_damage_status {car} [Car] {light} [CarLights] {damageState} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D5D
function SanAndreasOpcodeGlobal.setCarLightDamageStatus(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D5E
-- Instruction: [var class: VehicleClasses], [var subclass: VehicleSubclass] = get_vehicle_class_and_subclass {vehicle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D5E
function SanAndreasOpcodeGlobal.getVehicleClassAndSubclass(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D5F
-- Instruction: [var x: float], [var y: float], [var z: float] = get_vehicle_dummy_posn {vehicle} [Car] {dummyElement} [VehicleDummy] {position} [PositionTypes] {invertX} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D5F
function SanAndreasOpcodeGlobal.getVehicleDummyPosn(_, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D60
-- Instruction: create_projectile {type} [ProjectileTypes] {launchedFromEntity} [int] {originX} [float] {originY} [float] {originZ} [float] {targetX} [float] {targetY} [float] {targetZ} [float] {targetEntity} [int] {force} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D60
function SanAndreasOpcodeGlobal.createProjectile(_, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D65
-- Instruction: print_temporary_text {text} [string] {x} [float] {y} [float] {widthScale} [float] {heightScale} [float] {style} [Font]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D65
function SanAndreasOpcodeGlobal.printTemporaryText(_, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D66
-- Instruction: print_temporary_text_ex {text} [string] {x} [float] {y} [float] {widthScale} [float] {heightScale} [float] {style} [Font] {prop} [bool] {align} [Align] {wrap} [float] {justify} [int] {red} [int] {green} [int] {blue} [int] {alpha} [int] {outline} [int] {shadow} [int] {dropRed} [int] {dropGreen} [int] {dropBlue} [int] {dropAlpha} [int] {background} [int] {backRed} [int] {backGreen} [int] {backBlue} [int] {backAlpha} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D66
function SanAndreasOpcodeGlobal.printTemporaryTextEx(_, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D72
-- Instruction: [var sfxVolume: float], [var radioVolume: float] = get_game_volume {type} [ParamTypes]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D72
function SanAndreasOpcodeGlobal.getGameVolume(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D73
-- Instruction: [var width: float], [var height: float] = get_screen_width_and_height {type} [ParamTypes]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D73
function SanAndreasOpcodeGlobal.getScreenWidthAndHeight(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D76
-- Instruction: [var componentObject: any] = get_component_object {component} [any] {object} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D76
function SanAndreasOpcodeGlobal.getComponentObject(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D77
-- Instruction: hide_object_atomic {objectAtomic} [any] {hide} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D77
function SanAndreasOpcodeGlobal.hideObjectAtomic(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D78
-- Instruction: [var state: bool] = get_object_atomic_flag {object} [Object] {atomicFlag} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D78
function SanAndreasOpcodeGlobal.getObjectAtomicFlag(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D79
-- Instruction: set_object_atomic_flag {object} [any] {atomicFlag} [int] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D79
function SanAndreasOpcodeGlobal.setObjectAtomicFlag(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D7A
-- Instruction: [var numMaterials: int] = get_object_atomic_num_materials {object} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D7A
function SanAndreasOpcodeGlobal.getObjectAtomicNumMaterials(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D7B
-- Instruction: [var texture: any] = get_object_atomic_material_texture {object} [any] {material} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D7B
function SanAndreasOpcodeGlobal.getObjectAtomicMaterialTexture(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0662
-- Instruction: write_debug {_p1} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0662
function SanAndreasOpcodeGlobal.writeDebug(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0663
-- Instruction: write_debug_with_int {_p1} [any] {_p2} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0663
function SanAndreasOpcodeGlobal.writeDebugWithInt(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0664
-- Instruction: write_debug_with_float {_p1} [any] {_p2} [any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0664
function SanAndreasOpcodeGlobal.writeDebugWithFloat(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2705
-- Instruction: [var float] = [float] + [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2705
function SanAndreasOpcodeGlobal.opcode2705()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2706
-- Instruction: [var float] = [float] - [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2706
function SanAndreasOpcodeGlobal.opcode2706()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2707
-- Instruction: [var float] = [float] * [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2707
function SanAndreasOpcodeGlobal.opcode2707()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2708
-- Instruction: [var float] = [float] / [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2708
function SanAndreasOpcodeGlobal.opcode2708()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2408
-- Instruction: terminate_script {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2408
function SanAndreasOpcodeGlobal.terminateScript()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x05a9, SanAndreasOpcodeGlobal.opcode05A9, '[global var string] = [string]')
Opcode.register(0x05aa, SanAndreasOpcodeGlobal.opcode05AA, '[local var string] = [string]')
Opcode.register(0x05ad, SanAndreasOpcodeGlobal.opcode05AD, '[global var string] == [string]')
Opcode.register(0x05ae, SanAndreasOpcodeGlobal.opcode05AE, '[local var string] == [string]')
Opcode.register(0x06d1, SanAndreasOpcodeGlobal.opcode06D1, '[global var string] = [string]')
Opcode.register(0x06d2, SanAndreasOpcodeGlobal.opcode06D2, '[local var string] = [string]')
Opcode.register(0x0701, SanAndreasOpcodeGlobal.skipCutsceneEnd, 'skip_cutscene_end')
Opcode.register(0x0707, SanAndreasOpcodeGlobal.skipCutsceneStartInternal, 'skip_cutscene_start_internal @label')
Opcode.register(0x07d6, SanAndreasOpcodeGlobal.opcode07D6, '[local var int] == [global var int]')
Opcode.register(0x07d7, SanAndreasOpcodeGlobal.opcode07D7, '[local var float] == [global var float]')
Opcode.register(0x0844, SanAndreasOpcodeGlobal.isVarTextLabelEmpty, 'is_var_text_label_empty {var_text} [global var string]')
Opcode.register(0x0845, SanAndreasOpcodeGlobal.isLvarTextLabelEmpty, 'is_lvar_text_label_empty {var_text} [local var string]')
Opcode.register(0x0846, SanAndreasOpcodeGlobal.opcode0846, 'is_var_text_label16_empty {var_text} [global var string]')
Opcode.register(0x0847, SanAndreasOpcodeGlobal.opcode0847, 'is_lvar_text_label16_empty {var_text} [local var string]')
Opcode.register(0x0871, SanAndreasOpcodeGlobal.switchStart, 'switch_start {caseId} [int] {numCases} [int] {hasDefaultCase} [bool] @label {caseNum1} [int] @label {caseNum2} [int] @label {caseNum3} [int] @label {caseNum4} [int] @label {caseNum5} [int] @label {caseNum6} [int] @label {caseNum7} [int] @label')
Opcode.register(0x0872, SanAndreasOpcodeGlobal.switchContinued, 'switch_continued {caseNum1} [int] @label {caseNum2} [int] @label {caseNum3} [int] @label {caseNum4} [int] @label {caseNum5} [int] @label {caseNum6} [int] @label {caseNum7} [int] @label {caseNum8} [int] @label {caseNum9} [int] @label')
Opcode.register(0x08b4, SanAndreasOpcodeGlobal.isGlobalVarBitSetConst, 'is_global_var_bit_set_const {var_number} [global var int] {bitIndex} [literal int]')
Opcode.register(0x08b5, SanAndreasOpcodeGlobal.isGlobalVarBitSetVar, 'is_global_var_bit_set_var {var_number} [global var int] {var_bitIndex} [global var int]')
Opcode.register(0x08b6, SanAndreasOpcodeGlobal.isGlobalVarBitSetLvar, 'is_global_var_bit_set_lvar {var_number} [global var int] {var_bitIndex} [local var int]')
Opcode.register(0x08b7, SanAndreasOpcodeGlobal.isLocalVarBitSetConst, 'is_local_var_bit_set_const {var_number} [local var int] {bitIndex} [literal int]')
Opcode.register(0x08b8, SanAndreasOpcodeGlobal.isLocalVarBitSetVar, 'is_local_var_bit_set_var {var_number} [local var int] {var_bitIndex} [global var int]')
Opcode.register(0x08b9, SanAndreasOpcodeGlobal.isLocalVarBitSetLvar, 'is_local_var_bit_set_lvar {var_number} [local var int] {var_bitIndex} [local var int]')
Opcode.register(0x08ba, SanAndreasOpcodeGlobal.setGlobalVarBitConst, 'set_global_var_bit_const {var_number} [global var int] {bitIndex} [literal int]')
Opcode.register(0x08bb, SanAndreasOpcodeGlobal.setGlobalVarBitVar, 'set_global_var_bit_var {var_number} [global var int] {var_bitIndex} [global var int]')
Opcode.register(0x08bc, SanAndreasOpcodeGlobal.setGlobalVarBitLvar, 'set_global_var_bit_lvar {var_number} [global var int] {var_bitIndex} [local var int]')
Opcode.register(0x08bd, SanAndreasOpcodeGlobal.setLocalVarBitConst, 'set_local_var_bit_const {var_number} [local var int] {bitIndex} [literal int]')
Opcode.register(0x08be, SanAndreasOpcodeGlobal.setLocalVarBitVar, 'set_local_var_bit_var {var_number} [local var int] {var_bitIndex} [global var int]')
Opcode.register(0x08bf, SanAndreasOpcodeGlobal.setLocalVarBitLvar, 'set_local_var_bit_lvar {var_number} [local var int] {var_bitIndex} [local var int]')
Opcode.register(0x08c0, SanAndreasOpcodeGlobal.clearGlobalVarBitConst, 'clear_global_var_bit_const {var_number} [global var int] {bitIndex} [literal int]')
Opcode.register(0x08c1, SanAndreasOpcodeGlobal.clearGlobalVarBitVar, 'clear_global_var_bit_var {var_number} [global var int] {var_bitIndex} [global var int]')
Opcode.register(0x08c2, SanAndreasOpcodeGlobal.clearGlobalVarBitLvar, 'clear_global_var_bit_lvar {var_number} [global var int] {var_bitIndex} [local var int]')
Opcode.register(0x08c3, SanAndreasOpcodeGlobal.clearLocalVarBitConst, 'clear_local_var_bit_const {var_number} [local var int] {bitIndex} [literal int]')
Opcode.register(0x08c4, SanAndreasOpcodeGlobal.clearLocalVarBitVar, 'clear_local_var_bit_var {var_number} [local var int] {var_bitIndex} [global var int]')
Opcode.register(0x08c5, SanAndreasOpcodeGlobal.clearLocalVarBitLvar, 'clear_local_var_bit_lvar {var_number} [local var int] {var_bitIndex} [local var int]')
Opcode.register(0x08f9, SanAndreasOpcodeGlobal.opcode08F9, '[global var string] == [string]')
Opcode.register(0x08fa, SanAndreasOpcodeGlobal.opcode08FA, '[local var string] == [string]')
Opcode.register(0x098b, SanAndreasOpcodeGlobal.opcode098B, '[var string] = [var string] + [var string]')
Opcode.register(0x098c, SanAndreasOpcodeGlobal.opcode098C, '[var string] = [var string] + [var string]')
Opcode.register(0x0a4e, SanAndreasOpcodeGlobal.opcode0A4E, 'is_xbox_player2_pressing_start')
Opcode.register(0x0a94, SanAndreasOpcodeGlobal.loadAndLaunchCustomMission, 'load_and_launch_custom_mission {scriptFileName} [string] [arguments]')
Opcode.register(0x0a95, SanAndreasOpcodeGlobal.saveThisCustomScript, 'save_this_custom_script')
Opcode.register(0x2000, SanAndreasOpcodeGlobal.getCleoArgCount, '[var count: int] = get_cleo_arg_count')
Opcode.register(0x2002, SanAndreasOpcodeGlobal.cleoReturnWith, 'cleo_return_with {conditionResult} [bool] {retArgs} [arguments]')
Opcode.register(0x2003, SanAndreasOpcodeGlobal.cleoReturnFail, 'cleo_return_fail [arguments]')
Opcode.register(0x0e6f, SanAndreasOpcodeGlobal.streamCustomScriptFromLabel, 'stream_custom_script_from_label @label')
Opcode.register(0x0e9e, SanAndreasOpcodeGlobal.getModelDoesntExistInRange, '[var modelId: model_any] = get_model_doesnt_exist_in_range {start} [int] {end} [int]')
Opcode.register(0x0eb3, SanAndreasOpcodeGlobal.convertDirectionToQuat, 'convert_direction_to_quat {quat} [int] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0eba, SanAndreasOpcodeGlobal.getModelPedTypeAndStat, '[var pedType: PedType], [var pedStat: PedStat] = get_model_ped_type_and_stat {modelId} [model_char]')
Opcode.register(0x0ed0, SanAndreasOpcodeGlobal.returnScriptEvent, 'return_script_event')
Opcode.register(0x0ed1, SanAndreasOpcodeGlobal.setScriptEventSaveConfirmation, 'set_script_event_save_confirmation {add} [bool] @label {varSaveSlot} [any]')
Opcode.register(0x0ed2, SanAndreasOpcodeGlobal.setScriptEventCharDelete, 'set_script_event_char_delete {add} [bool] @label {varChar} [Char]')
Opcode.register(0x0ed3, SanAndreasOpcodeGlobal.setScriptEventCharCreate, 'set_script_event_char_create {add} [bool] @label {varChar} [Char]')
Opcode.register(0x0ed4, SanAndreasOpcodeGlobal.setScriptEventCarDelete, 'set_script_event_car_delete {add} [bool] @label {varCar} [Car]')
Opcode.register(0x0ed5, SanAndreasOpcodeGlobal.setScriptEventCarCreate, 'set_script_event_car_create {add} [bool] @label {varCar} [Car]')
Opcode.register(0x0ed6, SanAndreasOpcodeGlobal.setScriptEventObjectDelete, 'set_script_event_object_delete {add} [bool] @label {varObject} [Object]')
Opcode.register(0x0ed7, SanAndreasOpcodeGlobal.setScriptEventObjectCreate, 'set_script_event_object_create {add} [bool] @label {varObject} [Object]')
Opcode.register(0x0ed8, SanAndreasOpcodeGlobal.setScriptEventOnMenu, 'set_script_event_on_menu {add} [bool] @label {varJustPaused} [bool]')
Opcode.register(0x0eda, SanAndreasOpcodeGlobal.setScriptEventCharProcess, 'set_script_event_char_process {add} [bool] @label {varChar} [Char]')
Opcode.register(0x0edb, SanAndreasOpcodeGlobal.setScriptEventCarProcess, 'set_script_event_car_process {add} [bool] @label {varCar} [Car]')
Opcode.register(0x0edc, SanAndreasOpcodeGlobal.setScriptEventObjectProcess, 'set_script_event_object_process {add} [bool] @label {varObject} [Object]')
Opcode.register(0x0edd, SanAndreasOpcodeGlobal.setScriptEventBuildingProcess, 'set_script_event_building_process {add} [bool] @label {entity} [any]')
Opcode.register(0x0ede, SanAndreasOpcodeGlobal.setScriptEventCharDamage, 'set_script_event_char_damage {add} [bool] @label {varChar} [Char]')
Opcode.register(0x0edf, SanAndreasOpcodeGlobal.setScriptEventCarWeaponDamage, 'set_script_event_car_weapon_damage {add} [bool] @label {varCar} [Car]')
Opcode.register(0x0ee0, SanAndreasOpcodeGlobal.setScriptEventBulletImpact, 'set_script_event_bullet_impact {add} [bool] @label {varCharOwner} [Char] {varEntityVictim} [any] {varWeaponType} [WeaponType] {varColPoint} [any]')
Opcode.register(0x0ef3, SanAndreasOpcodeGlobal.lerp, '[var result: float] = lerp {a} [float] {b} [float] {t} [float]')
Opcode.register(0x0f0a, SanAndreasOpcodeGlobal.returnTimes, 'return_times {numReturns} [int]')
Opcode.register(0x0f0b, SanAndreasOpcodeGlobal.setScriptEventBeforeGameProcess, 'set_script_event_before_game_process {add} [int] @label')
Opcode.register(0x0f0c, SanAndreasOpcodeGlobal.setScriptEventAfterGameProcess, 'set_script_event_after_game_process {add} [int] @label')
Opcode.register(0x0f0d, SanAndreasOpcodeGlobal.setMatrixLookDirection, 'set_matrix_look_direction {matrix} [int] {originX} [float] {originY} [float] {originZ} [float] {dirX} [float] {dirY} [float] {dirZ} [float]')
Opcode.register(0x0f0f, SanAndreasOpcodeGlobal.getDistanceMultiplier, '[var drawing: float], [var generating: float] = get_distance_multiplier')
Opcode.register(0x0f11, SanAndreasOpcodeGlobal.getClosestWaterDistance, '[var distance: float], [var closestZ: float] = get_closest_water_distance')
Opcode.register(0x0f17, SanAndreasOpcodeGlobal.getModelNamePointer, '[var address: int] = get_model_name_pointer {modelId} [model_any]')
Opcode.register(0x0d06, SanAndreasOpcodeGlobal.getMatrixPosition, '[var x: float], [var y: float], [var z: float] = get_matrix_position {matrix} [Matrix]')
Opcode.register(0x0d07, SanAndreasOpcodeGlobal.getCoordsOffsetsRelativeToMatrix, '[var x: float], [var y: float], [var z: float] = get_coords_offsets_relative_to_matrix {x} [float] {y} [float] {z} [float] {matrix} [Matrix]')
Opcode.register(0x0d0e, SanAndreasOpcodeGlobal.setCarComponentState, 'set_car_component_state {car} [Car] {component} [string] {state} [ComponentStates]')
Opcode.register(0x0d13, SanAndreasOpcodeGlobal.setMatrixXRotation, 'set_matrix_x_rotation {matrix} [any] {angle} [float]')
Opcode.register(0x0d14, SanAndreasOpcodeGlobal.setMatrixYRotation, 'set_matrix_y_rotation {matrix} [any] {angle} [float]')
Opcode.register(0x0d15, SanAndreasOpcodeGlobal.setMatrixZRotation, 'set_matrix_z_rotation {matrix} [any] {angle} [float]')
Opcode.register(0x0d1b, SanAndreasOpcodeGlobal.getEntityTypeAndClass, '[var type: EntityTypes], [var class: EntityClasses] = get_entity_type_and_class {entity} [any]')
Opcode.register(0x0d1c, SanAndreasOpcodeGlobal.normaliseVector, 'normalise_vector {vector} [any]')
Opcode.register(0x0d1d, SanAndreasOpcodeGlobal.interpolateMatrix, 'interpolate_matrix {slerp} [any] {matrix1} [any] {matrix2} [any] {t} [float]')
Opcode.register(0x0d25, SanAndreasOpcodeGlobal.initialiseMatrix, 'initialise_matrix {matrix} [any] {a} [float] {b} [float] {c} [float] {d} [int] {e} [float] {f} [float] {g} [float] {h} [int] {i} [float] {j} [float] {k} [float] {l} [int] {m} [float] {n} [float] {o} [float] {p} [int]')
Opcode.register(0x0d26, SanAndreasOpcodeGlobal.initialiseVector, 'initialise_vector {vector} [any] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0d28, SanAndreasOpcodeGlobal.getVectorElements, '[var x: float], [var y: float], [var z: float] = get_vector_elements {vector} [any]')
Opcode.register(0x0d2a, SanAndreasOpcodeGlobal.getCarNumCollidedEntities, '[var numCollidedEntities: int] = get_car_num_collided_entities {car} [Car]')
Opcode.register(0x0d2b, SanAndreasOpcodeGlobal.getCharNumCollidedEntities, '[var numCollidedEntities: int] = get_char_num_collided_entities {char} [Char]')
Opcode.register(0x0d2c, SanAndreasOpcodeGlobal.getObjectNumCollidedEntities, '[var numCollidedEntities: any] = get_object_num_collided_entities {object} [Object]')
Opcode.register(0x0d34, SanAndreasOpcodeGlobal.getCarCollidedEntities, '[var entity0: int], [var entity1: int], [var entity2: int], [var entity3: int], [var entity4: int], [var entity5: int] = get_car_collided_entities {car} [Car]')
Opcode.register(0x0d35, SanAndreasOpcodeGlobal.getCharCollidedEntities, '[var entity0: int], [var entity1: int], [var entity2: int], [var entity3: int], [var entity4: int], [var entity5: int] = get_char_collided_entities {char} [Char]')
Opcode.register(0x0d36, SanAndreasOpcodeGlobal.getObjectCollidedEntities, '[var entity0: int], [var entity1: int], [var entity2: int], [var entity3: int], [var entity4: int], [var entity5: int] = get_object_collided_entities {object} [Object]')
Opcode.register(0x0d3d, SanAndreasOpcodeGlobal.getColDataLighting, '[var lighting: int] = get_col_data_lighting {colPoint} [any]')
Opcode.register(0x0d3f, SanAndreasOpcodeGlobal.findIntersectionBetweenCircles, '[var p1X: float], [var p1Y: float], [var p2X: float], [var p2Y: float] = find_intersection_between_circles {x1} [float] {y1} [float] {r1} [float] {x2} [float] {y2} [float] {r2} [float]')
Opcode.register(0x0d40, SanAndreasOpcodeGlobal.drawShape, 'draw_shape {type} [int] {texture} [int] {numVerts} [int] {pVerts} [int] {vertexAlpha} [int] {srcBlend} [BlendValues] {dstBlend} [BlendValues] {unused} [int]')
Opcode.register(0x0d41, SanAndreasOpcodeGlobal.setupShapeVertex, 'setup_shape_vertex {shape} [any] {vertex} [int] {x} [float] {y} [float] {z} [float] {rhw} [float] {r} [int] {g} [int] {b} [int] {a} [int] {u} [float] {v} [float] {invertX} [bool] {invertY} [bool]')
Opcode.register(0x0d42, SanAndreasOpcodeGlobal.loadTxd, 'load_txd {txd} [string] {path} [string]')
Opcode.register(0x0d43, SanAndreasOpcodeGlobal.getTxdId, '[var id: int] = get_txd_id {txd} [string]')
Opcode.register(0x0d44, SanAndreasOpcodeGlobal.findTextureInTxdWithName, '[var texture: int] = find_texture_in_txd_with_name {texture} [string] {dictionary} [string]')
Opcode.register(0x0d45, SanAndreasOpcodeGlobal.rotateShapeVertices, 'rotate_shape_vertices {shape} [any] {numVerts} [int] {x} [float] {y} [float] {angle} [float]')
Opcode.register(0x0d46, SanAndreasOpcodeGlobal.findTextureInTxdWithId, '[var texture: int] = find_texture_in_txd_with_id {texture} [string] {dictionary} [int]')
Opcode.register(0x0d47, SanAndreasOpcodeGlobal.getModelTxdId, '[var txdId: int] = get_model_txd_id {model} [model_any]')
Opcode.register(0x0d48, SanAndreasOpcodeGlobal.getModelCrc, '[var crc32Key: int] = get_model_crc {model} [model_any]')
Opcode.register(0x0d49, SanAndreasOpcodeGlobal.stringCmp, '[var result: bool] = string_cmp {strA} [string] {strB} [string]')
Opcode.register(0x0d4a, SanAndreasOpcodeGlobal.stringCat, 'string_cat {var_string} [var string] {append} [string]')
Opcode.register(0x0d4b, SanAndreasOpcodeGlobal.stringStr, '[var result: int] = string_str {var_string} [var string] {substring} [string]')
Opcode.register(0x0d4f, SanAndreasOpcodeGlobal.setStructField, 'set_struct_field {struct} [int] {offset} [int] {size} [int] {value} [any]')
Opcode.register(0x0d50, SanAndreasOpcodeGlobal.drawTemporaryShadow, 'draw_temporary_shadow {type} [ShadowTypes] {x} [float] {y} [float] {z} [float] {width} [float] {height} [float] {rotation} [float] {distance} [float] {texture} [ShadowTextures] {intensity} [int] {red} [int] {blue} [int] {green} [int] {shadowData} [any]')
Opcode.register(0x0d51, SanAndreasOpcodeGlobal.drawPermanentShadow, 'draw_permanent_shadow {type} [ShadowTypes] {x} [float] {y} [float] {z} [float] {width} [float] {height} [float] {rotation} [float] {distance} [float] {texture} [ShadowTextures] {intensity} [int] {red} [int] {green} [int] {blue} [int] {time} [int]')
Opcode.register(0x0d52, SanAndreasOpcodeGlobal.drawTemporaryLight, 'draw_temporary_light {type} [LightTypes] {x} [float] {y} [float] {z} [float] {dirX} [float] {dirY} [float] {dirZ} [float] {radius} [float] {red} [int] {blue} [int] {green} [int] {affectEntity} [int]')
Opcode.register(0x0d53, SanAndreasOpcodeGlobal.drawTemporaryCorona, 'draw_temporary_corona {texture} [CoronaType] {red} [int] {blue} [int] {green} [int] {alpha} [int] {entity} [int] {x} [float] {y} [float] {z} [float] {size} [float]')
Opcode.register(0x0d54, SanAndreasOpcodeGlobal.drawTemporaryCoronaEx, 'draw_temporary_corona_ex {texture} [CoronaType] {red} [int] {green} [int] {blue} [int] {alpha} [int] {entity} [int] {x} [float] {y} [float] {z} [float] {size} [float] {farClip} [float] {nearClip} [float] {flare} [int] {enableReflection} [bool] {checkObstacles} [bool] {flashWhileFading} [bool] {fadeSpeed} [float] {onlyFromBelow} [bool]')
Opcode.register(0x0d55, SanAndreasOpcodeGlobal.getSunColors, '[var coreRed: int], [var coreBlue: int], [var coreGreen: int], [var glowRed: int], [var glowBlue: int], [var glowGreen: int] = get_sun_colors')
Opcode.register(0x0d56, SanAndreasOpcodeGlobal.getSunScreenCoors, '[var x: float], [var y: float] = get_sun_screen_coors')
Opcode.register(0x0d57, SanAndreasOpcodeGlobal.getSunWorldCoors, '[var x: float], [var y: float], [var z: float] = get_sun_world_coors')
Opcode.register(0x0d58, SanAndreasOpcodeGlobal.getSunSize, '[var core: float], [var glow: float] = get_sun_size')
Opcode.register(0x0d5a, SanAndreasOpcodeGlobal.getTrafficlightsCurrentColor, '[var ns: TrafficLightColors], [var we: TrafficLightColors] = get_trafficlights_current_color')
Opcode.register(0x0d5b, SanAndreasOpcodeGlobal.drawSpotlight, 'draw_spotlight {fromX} [float] {fromY} [float] {fromZ} [float] {toX} [float] {toY} [float] {toZ} [float] {baseRadius} [float] {targetRadius} [float] {enableShadow} [bool] {shadowIntensity} [int] {flag1} [bool] {flag2} [bool]')
Opcode.register(0x0d5c, SanAndreasOpcodeGlobal.getCarLightDamageStatus, '[var damageState: bool] = get_car_light_damage_status {car} [Car] {light} [LightTypesCar]')
Opcode.register(0x0d5d, SanAndreasOpcodeGlobal.setCarLightDamageStatus, 'set_car_light_damage_status {car} [Car] {light} [CarLights] {damageState} [bool]')
Opcode.register(0x0d5e, SanAndreasOpcodeGlobal.getVehicleClassAndSubclass, '[var class: VehicleClasses], [var subclass: VehicleSubclass] = get_vehicle_class_and_subclass {vehicle} [Car]')
Opcode.register(0x0d5f, SanAndreasOpcodeGlobal.getVehicleDummyPosn, '[var x: float], [var y: float], [var z: float] = get_vehicle_dummy_posn {vehicle} [Car] {dummyElement} [VehicleDummy] {position} [PositionTypes] {invertX} [bool]')
Opcode.register(0x0d60, SanAndreasOpcodeGlobal.createProjectile, 'create_projectile {type} [ProjectileTypes] {launchedFromEntity} [int] {originX} [float] {originY} [float] {originZ} [float] {targetX} [float] {targetY} [float] {targetZ} [float] {targetEntity} [int] {force} [float]')
Opcode.register(0x0d65, SanAndreasOpcodeGlobal.printTemporaryText, 'print_temporary_text {text} [string] {x} [float] {y} [float] {widthScale} [float] {heightScale} [float] {style} [Font]')
Opcode.register(0x0d66, SanAndreasOpcodeGlobal.printTemporaryTextEx, 'print_temporary_text_ex {text} [string] {x} [float] {y} [float] {widthScale} [float] {heightScale} [float] {style} [Font] {prop} [bool] {align} [Align] {wrap} [float] {justify} [int] {red} [int] {green} [int] {blue} [int] {alpha} [int] {outline} [int] {shadow} [int] {dropRed} [int] {dropGreen} [int] {dropBlue} [int] {dropAlpha} [int] {background} [int] {backRed} [int] {backGreen} [int] {backBlue} [int] {backAlpha} [int]')
Opcode.register(0x0d72, SanAndreasOpcodeGlobal.getGameVolume, '[var sfxVolume: float], [var radioVolume: float] = get_game_volume {type} [ParamTypes]')
Opcode.register(0x0d73, SanAndreasOpcodeGlobal.getScreenWidthAndHeight, '[var width: float], [var height: float] = get_screen_width_and_height {type} [ParamTypes]')
Opcode.register(0x0d76, SanAndreasOpcodeGlobal.getComponentObject, '[var componentObject: any] = get_component_object {component} [any] {object} [any]')
Opcode.register(0x0d77, SanAndreasOpcodeGlobal.hideObjectAtomic, 'hide_object_atomic {objectAtomic} [any] {hide} [bool]')
Opcode.register(0x0d78, SanAndreasOpcodeGlobal.getObjectAtomicFlag, '[var state: bool] = get_object_atomic_flag {object} [Object] {atomicFlag} [int]')
Opcode.register(0x0d79, SanAndreasOpcodeGlobal.setObjectAtomicFlag, 'set_object_atomic_flag {object} [any] {atomicFlag} [int] {state} [bool]')
Opcode.register(0x0d7a, SanAndreasOpcodeGlobal.getObjectAtomicNumMaterials, '[var numMaterials: int] = get_object_atomic_num_materials {object} [any]')
Opcode.register(0x0d7b, SanAndreasOpcodeGlobal.getObjectAtomicMaterialTexture, '[var texture: any] = get_object_atomic_material_texture {object} [any] {material} [int]')
Opcode.register(0x0662, SanAndreasOpcodeGlobal.writeDebug, 'write_debug {_p1} [any]')
Opcode.register(0x0663, SanAndreasOpcodeGlobal.writeDebugWithInt, 'write_debug_with_int {_p1} [any] {_p2} [any]')
Opcode.register(0x0664, SanAndreasOpcodeGlobal.writeDebugWithFloat, 'write_debug_with_float {_p1} [any] {_p2} [any]')
Opcode.register(0x2705, SanAndreasOpcodeGlobal.opcode2705, '[var float] = [float] + [float]')
Opcode.register(0x2706, SanAndreasOpcodeGlobal.opcode2706, '[var float] = [float] - [float]')
Opcode.register(0x2707, SanAndreasOpcodeGlobal.opcode2707, '[var float] = [float] * [float]')
Opcode.register(0x2708, SanAndreasOpcodeGlobal.opcode2708, '[var float] = [float] / [float]')
Opcode.register(0x2408, SanAndreasOpcodeGlobal.terminateScript, 'terminate_script {address} [int]')
