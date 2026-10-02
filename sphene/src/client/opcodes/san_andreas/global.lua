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
    return bitReplace(bitVar, 1, bit, 1)
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
    return bitReplace(bitVar, 0, bit, 1)
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


-- INI: 05A9=2,%1d% = %2g% ; s$
Opcode.register(0x05a9, SanAndreasOpcodeGlobal.opcode05A9, 2, '${1} = ${2}', {true, false})
-- INI: 05AA=2,%1d% = %2g%  ; @s = 'short'
Opcode.register(0x05aa, SanAndreasOpcodeGlobal.opcode05AA, 2, '${1} = ${2}', {true, false})
-- INI: 05AD=2,  %1d% == %2g% ; s$ == short
Opcode.register(0x05ad, SanAndreasOpcodeGlobal.opcode05AD, 2, '${1} == ${2}', {false, false})
-- INI: 05AE=2,  %1d% == %2g% ; @s == 'short'
Opcode.register(0x05ae, SanAndreasOpcodeGlobal.opcode05AE, 2, '${1} == ${2}', {false, false})
-- INI: 06D1=2,%1d% = %2h% ; v$ = string
Opcode.register(0x06d1, SanAndreasOpcodeGlobal.opcode06D1, 2, '${1} = ${2}', {true, false})
-- INI: 06D2=2,%1d% = %2h% ; @v = string
Opcode.register(0x06d2, SanAndreasOpcodeGlobal.opcode06D2, 2, '${1} = ${2}', {true, false})
-- INI: 0701=0,end_scene_skip
Opcode.register(0x0701, SanAndreasOpcodeGlobal.skipCutsceneEnd, 0, 'skip_cutscene_end', {})
-- INI: 0707=1,start_scene_skip_to %1p%
Opcode.register(0x0707, SanAndreasOpcodeGlobal.skipCutsceneStartInternal, 1, 'skip_cutscene_start_internal ${pointer.1}', {false})
-- INI: 07D6=2,  %1d% == %2d% ; @ == $ (int)
Opcode.register(0x07d6, SanAndreasOpcodeGlobal.opcode07D6, 2, '${1} == ${2}', {false, false})
-- INI: 07D7=2,  %1d% == %2d% ; @ == $ (float)
Opcode.register(0x07d7, SanAndreasOpcodeGlobal.opcode07D7, 2, '${1} == ${2}', {false, false})
-- INI: 0844=1,  string %1d% empty ; s$
Opcode.register(0x0844, SanAndreasOpcodeGlobal.isVarTextLabelEmpty, 1, 'is_var_text_label_empty ${1}', {false})
-- INI: 0845=1,  string %1d% empty ; same as 0847
Opcode.register(0x0845, SanAndreasOpcodeGlobal.isLvarTextLabelEmpty, 1, 'is_lvar_text_label_empty ${1}', {false})
-- INI: 0846=1,  string %1d% empty ; v$
Opcode.register(0x0846, SanAndreasOpcodeGlobal.opcode0846, 1, 'is_var_text_label16_empty ${1}', {false})
-- INI: 0847=1,  string %1d% empty ; @v
Opcode.register(0x0847, SanAndreasOpcodeGlobal.opcode0847, 1, 'is_lvar_text_label16_empty ${1}', {false})
-- INI: 0871=18,init_jump_table %1d% total_jumps %2h% default_jump %3h% %4p% jumps %5h% %6p% %7h% %8p% %9h% %10p% %11h% %12p% %13h% %14p% %15h% %16p% %17h% %18p%
Opcode.register(0x0871, SanAndreasOpcodeGlobal.switchStart, 18, 'switch_start ${1} ${2} ${3} ${pointer.4} ${5} ${pointer.6} ${7} ${pointer.8} ${9} ${pointer.10} ${11} ${pointer.12} ${13} ${pointer.14} ${15} ${pointer.16} ${17} ${pointer.18}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0872=18,jump_table_jumps %1d% %2p% %3h% %4p% %5h% %6p% %7h% %8p% %9h% %10p% %11h% %12p% %13h% %14p% %15h% %16p% %17h% %18p%
Opcode.register(0x0872, SanAndreasOpcodeGlobal.switchContinued, 18, 'switch_continued ${1} ${pointer.2} ${3} ${pointer.4} ${5} ${pointer.6} ${7} ${pointer.8} ${9} ${pointer.10} ${11} ${pointer.12} ${13} ${pointer.14} ${15} ${pointer.16} ${17} ${pointer.18}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 08B4=2,  test %1d% bit %2h%
Opcode.register(0x08b4, SanAndreasOpcodeGlobal.isGlobalVarBitSetConst, 2, 'is_global_var_bit_set_const ${1} ${2}', {false, false})
-- INI: 08B5=2,  test %1d% bit %2d%
Opcode.register(0x08b5, SanAndreasOpcodeGlobal.isGlobalVarBitSetVar, 2, 'is_global_var_bit_set_var ${1} ${2}', {false, false})
-- INI: 08B6=2,  test %1d% bit %2d%
Opcode.register(0x08b6, SanAndreasOpcodeGlobal.isGlobalVarBitSetLvar, 2, 'is_global_var_bit_set_lvar ${1} ${2}', {false, false})
-- INI: 08B7=2,  test %1d% bit %2h%
Opcode.register(0x08b7, SanAndreasOpcodeGlobal.isLocalVarBitSetConst, 2, 'is_local_var_bit_set_const ${1} ${2}', {false, false})
-- INI: 08B8=2,  test %1d% bit %2d%
Opcode.register(0x08b8, SanAndreasOpcodeGlobal.isLocalVarBitSetVar, 2, 'is_local_var_bit_set_var ${1} ${2}', {false, false})
-- INI: 08B9=2,  test %1d% bit %2d%
Opcode.register(0x08b9, SanAndreasOpcodeGlobal.isLocalVarBitSetLvar, 2, 'is_local_var_bit_set_lvar ${1} ${2}', {false, false})
-- INI: 08BA=2,set %1d% bit %2h%
Opcode.register(0x08ba, SanAndreasOpcodeGlobal.setGlobalVarBitConst, 2, 'set_global_var_bit_const ${1} ${2}', {false, false})
-- INI: 08BB=2,set %1d% bit %2d%
Opcode.register(0x08bb, SanAndreasOpcodeGlobal.setGlobalVarBitVar, 2, 'set_global_var_bit_var ${1} ${2}', {false, false})
-- INI: 08BC=2,set %1d% bit %2d%
Opcode.register(0x08bc, SanAndreasOpcodeGlobal.setGlobalVarBitLvar, 2, 'set_global_var_bit_lvar ${1} ${2}', {false, false})
-- INI: 08BD=2,set %1d% bit %2h%
Opcode.register(0x08bd, SanAndreasOpcodeGlobal.setLocalVarBitConst, 2, 'set_local_var_bit_const ${1} ${2}', {false, false})
-- INI: 08BE=2,set %1d% bit %2d%
Opcode.register(0x08be, SanAndreasOpcodeGlobal.setLocalVarBitVar, 2, 'set_local_var_bit_var ${1} ${2}', {false, false})
-- INI: 08BF=2,set %1d% bit %2d%
Opcode.register(0x08bf, SanAndreasOpcodeGlobal.setLocalVarBitLvar, 2, 'set_local_var_bit_lvar ${1} ${2}', {false, false})
-- INI: 08C0=2,clear %1d% bit %2h%
Opcode.register(0x08c0, SanAndreasOpcodeGlobal.clearGlobalVarBitConst, 2, 'clear_global_var_bit_const ${1} ${2}', {false, false})
-- INI: 08C1=2,clear %1d% bit %2d%
Opcode.register(0x08c1, SanAndreasOpcodeGlobal.clearGlobalVarBitVar, 2, 'clear_global_var_bit_var ${1} ${2}', {false, false})
-- INI: 08C2=2,clear %1d% bit %2d%
Opcode.register(0x08c2, SanAndreasOpcodeGlobal.clearGlobalVarBitLvar, 2, 'clear_global_var_bit_lvar ${1} ${2}', {false, false})
-- INI: 08C3=2,clear %1d% bit %2h%
Opcode.register(0x08c3, SanAndreasOpcodeGlobal.clearLocalVarBitConst, 2, 'clear_local_var_bit_const ${1} ${2}', {false, false})
-- INI: 08C4=2,clear %1d% bit %2d%
Opcode.register(0x08c4, SanAndreasOpcodeGlobal.clearLocalVarBitVar, 2, 'clear_local_var_bit_var ${1} ${2}', {false, false})
-- INI: 08C5=2,clear %1d% bit %2d%
Opcode.register(0x08c5, SanAndreasOpcodeGlobal.clearLocalVarBitLvar, 2, 'clear_local_var_bit_lvar ${1} ${2}', {false, false})
-- INI: 08F9=2,  %1d% == %2d%
Opcode.register(0x08f9, SanAndreasOpcodeGlobal.opcode08F9, 2, '${1} == ${2}', {false, false})
-- INI: 08FA=2,  %1d% == %2d%
Opcode.register(0x08fa, SanAndreasOpcodeGlobal.opcode08FA, 2, '${1} == ${2}', {false, false})
-- INI: 098B=3,%3d% = %1d% + %2d% ; all string variables
Opcode.register(0x098b, SanAndreasOpcodeGlobal.opcode098B, 3, '${3} = ${1} + ${2}', {false, false, true})
-- INI: 098C=3,%3d% = %1d% + %2d% ; all string variables
Opcode.register(0x098c, SanAndreasOpcodeGlobal.opcode098C, 3, '${3} = ${1} + ${2}', {false, false, true})
-- INI: 0A4E=0,increment_useless_flag
Opcode.register(0x0a4e, SanAndreasOpcodeGlobal.opcode0A4E, 0, 'is_xbox_player2_pressing_start', {})
Opcode.register(0x0a94, SanAndreasOpcodeGlobal.loadAndLaunchCustomMission, -1, 'load_and_launch_custom_mission ${1}', {})
-- INI: 0A95=0,save_this_custom_script
Opcode.register(0x0a95, SanAndreasOpcodeGlobal.saveThisCustomScript, 0, 'save_this_custom_script', {})
-- INI: 2000=2,%2s% = resolve_filepath %1s%
Opcode.register(0x2000, SanAndreasOpcodeGlobal.getCleoArgCount, 1, '${1} = get_cleo_arg_count', {true})
Opcode.register(0x2002, SanAndreasOpcodeGlobal.cleoReturnWith, -1, 'cleo_return_with ${1}', {})
Opcode.register(0x2003, SanAndreasOpcodeGlobal.cleoReturnFail, -1, 'cleo_return_fail', {})
Opcode.register(0x0e6f, SanAndreasOpcodeGlobal.streamCustomScriptFromLabel, 1, 'stream_custom_script_from_label ${pointer.1}', {false})
-- INI: 0E9E=3,get_model_available_by_name %1d% to %2d% store_to %3d%
Opcode.register(0x0e9e, SanAndreasOpcodeGlobal.getModelDoesntExistInRange, 3, '${3} = get_model_doesnt_exist_in_range ${1} ${2}', {false, false, true})
-- INI: 0EB3=4,convert_direction_to_quat %1d% dir %2d% %3d% %4d%
Opcode.register(0x0eb3, SanAndreasOpcodeGlobal.convertDirectionToQuat, 4, 'convert_direction_to_quat ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0EBA=3,get_model_ped_type_and_stat %1d% store_to %2d% %3d%
Opcode.register(0x0eba, SanAndreasOpcodeGlobal.getModelPedTypeAndStat, 3, '${1}, ${2} = get_model_ped_type_and_stat ${3}', {false, true, true})
-- INI: 0ED0=0,return_script_event
Opcode.register(0x0ed0, SanAndreasOpcodeGlobal.returnScriptEvent, 0, 'return_script_event', {})
-- INI: 0ED1=3,set_script_event_save_confirmation %1d% label %2p% var_slot %3d%
Opcode.register(0x0ed1, SanAndreasOpcodeGlobal.setScriptEventSaveConfirmation, 3, 'set_script_event_save_confirmation ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0ED2=3,set_script_event_char_delete %1d% label %2p% var_char %3d%
Opcode.register(0x0ed2, SanAndreasOpcodeGlobal.setScriptEventCharDelete, 3, 'set_script_event_char_delete ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0ED3=3,set_script_event_char_create %1d% label %2p% var_char %3d%
Opcode.register(0x0ed3, SanAndreasOpcodeGlobal.setScriptEventCharCreate, 3, 'set_script_event_char_create ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0ED4=3,set_script_event_car_delete %1d% label %2p% var_car %3d%
Opcode.register(0x0ed4, SanAndreasOpcodeGlobal.setScriptEventCarDelete, 3, 'set_script_event_car_delete ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0ED5=3,set_script_event_car_create %1d% label %2p% var_car %3d%
Opcode.register(0x0ed5, SanAndreasOpcodeGlobal.setScriptEventCarCreate, 3, 'set_script_event_car_create ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0ED6=3,set_script_event_object_delete %1d% label %2p% var_object %3d%
Opcode.register(0x0ed6, SanAndreasOpcodeGlobal.setScriptEventObjectDelete, 3, 'set_script_event_object_delete ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0ED7=3,set_script_event_object_create %1d% label %2p% var_object %3d%
Opcode.register(0x0ed7, SanAndreasOpcodeGlobal.setScriptEventObjectCreate, 3, 'set_script_event_object_create ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0ED8=3,set_script_event_on_menu %1d% label %2p% var_just_paused %3d%
Opcode.register(0x0ed8, SanAndreasOpcodeGlobal.setScriptEventOnMenu, 3, 'set_script_event_on_menu ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0EDA=3,set_script_event_char_process %1d% label %2p% var_char %3d%
Opcode.register(0x0eda, SanAndreasOpcodeGlobal.setScriptEventCharProcess, 3, 'set_script_event_char_process ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0EDB=3,set_script_event_car_process %1d% label %2p% var_car %3d%
Opcode.register(0x0edb, SanAndreasOpcodeGlobal.setScriptEventCarProcess, 3, 'set_script_event_car_process ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0EDC=3,set_script_event_object_process %1d% label %2p% var_object %3d%
Opcode.register(0x0edc, SanAndreasOpcodeGlobal.setScriptEventObjectProcess, 3, 'set_script_event_object_process ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0EDD=3,set_script_event_building_process %1d% label %2p% var_building %3d%
Opcode.register(0x0edd, SanAndreasOpcodeGlobal.setScriptEventBuildingProcess, 3, 'set_script_event_building_process ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0EDE=3,set_script_event_char_damage %1d% label %2p% var_char %3d%
Opcode.register(0x0ede, SanAndreasOpcodeGlobal.setScriptEventCharDamage, 3, 'set_script_event_char_damage ${1} ${pointer.2} ${3}', {false, false, false})
-- INI: 0EDF=3,set_script_event_car_weapon_damage %1d% label %2p% var_car %3d%
Opcode.register(0x0edf, SanAndreasOpcodeGlobal.setScriptEventCarWeaponDamage, 3, 'set_script_event_car_weapon_damage ${1} ${2} ${3}', {false, false, false})
-- INI: 0EE0=6,set_script_event_bullet_impact %1d% label %2p% var_owner %3d% var_victim %4d% var_weapon %5d% var_colpoint %6d%
Opcode.register(0x0ee0, SanAndreasOpcodeGlobal.setScriptEventBulletImpact, 6, 'set_script_event_bullet_impact ${1} ${pointer.2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0EF3=4,lerp %1d% %2d% %3d% store_to %4d%
Opcode.register(0x0ef3, SanAndreasOpcodeGlobal.lerp, 4, '${4} = lerp ${1} ${2} ${3}', {false, false, false, true})
Opcode.register(0x0f0a, SanAndreasOpcodeGlobal.returnTimes, 1, 'return_times ${1}')
Opcode.register(0x0f0b, SanAndreasOpcodeGlobal.setScriptEventBeforeGameProcess, 2, 'set_script_event_before_game_process ${1} ${2}', {false, false})
Opcode.register(0x0f0c, SanAndreasOpcodeGlobal.setScriptEventAfterGameProcess, 2, 'set_script_event_after_game_process ${1} ${2}', {false, false})
Opcode.register(0x0f0d, SanAndreasOpcodeGlobal.setMatrixLookDirection, 7, 'set_matrix_look_direction ${1} ${2} ${3} ${4} ${5} ${6} ${7}')
Opcode.register(0x0f0f, SanAndreasOpcodeGlobal.getDistanceMultiplier, 2, '${1}, ${2} = get_distance_multiplier')
Opcode.register(0x0f11, SanAndreasOpcodeGlobal.getClosestWaterDistance, 2, '${1}, ${2} = get_closest_water_distance')
Opcode.register(0x0f17, SanAndreasOpcodeGlobal.getModelNamePointer, 2, '${1} = get_model_name_pointer ${2}')
-- INI: 0D06=4,get_matrix %1d% position_to %2d% %3d% %4d%
Opcode.register(0x0d06, SanAndreasOpcodeGlobal.getMatrixPosition, 4, '${1}, ${2}, ${3} = get_matrix_position ${4}', {false, true, true, true})
-- INI: 0D07=7,get_coords %1d% %2d% %3d% offsets_relative_to_matrix %4d% store_to %5d% %6d% %7d%
Opcode.register(0x0d07, SanAndreasOpcodeGlobal.getCoordsOffsetsRelativeToMatrix, 7, '${5}, ${6}, ${7} = get_coords_offsets_relative_to_matrix ${1} ${2} ${3} ${4}', {false, false, false, false, true, true, true})
-- INI: 0D0E=3,set_car %1d% component %2s% state %3d% // IF and SET
Opcode.register(0x0d0e, SanAndreasOpcodeGlobal.setCarComponentState, 3, 'set_car_component_state ${1} ${2} ${3}', {false, false, false})
-- INI: 0D13=2,set_matrix %1d% x_angle %2d%
Opcode.register(0x0d13, SanAndreasOpcodeGlobal.setMatrixXRotation, 2, 'set_matrix_x_rotation ${1} ${2}', {false, false})
-- INI: 0D14=2,set_matrix %1d% y_angle %2d%
Opcode.register(0x0d14, SanAndreasOpcodeGlobal.setMatrixYRotation, 2, 'set_matrix_y_rotation ${1} ${2}', {false, false})
-- INI: 0D15=2,set_matrix %1d% z_angle %2d%
Opcode.register(0x0d15, SanAndreasOpcodeGlobal.setMatrixZRotation, 2, 'set_matrix_z_rotation ${1} ${2}', {false, false})
-- INI: 0D1B=3,get_entity %1d% type_to %2d% class_to %3d%
Opcode.register(0x0d1b, SanAndreasOpcodeGlobal.getEntityTypeAndClass, 3, '${1}, ${2} = get_entity_type_and_class ${3}', {false, false, false})
-- INI: 0D1C=1,normalize_vector %1d%
Opcode.register(0x0d1c, SanAndreasOpcodeGlobal.normaliseVector, 1, 'normalise_vector ${1}', {false})
-- INI: 0D1D=4,matrix_slerp %1d% %2d% %3d% %4d%
Opcode.register(0x0d1d, SanAndreasOpcodeGlobal.interpolateMatrix, 4, 'interpolate_matrix ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0D25=17,set_matrix %1d% elements %2d% %3d% %4d% %5d% %6d% %7d% %8d% %9d% %10d% %11d% %12d% %13d% %14d% %15d% %16d% %17d%
Opcode.register(0x0d25, SanAndreasOpcodeGlobal.initialiseMatrix, 17, 'initialise_matrix ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0D26=4,set_vector %1d% elements %2d% %3d% %4d%
Opcode.register(0x0d26, SanAndreasOpcodeGlobal.initialiseVector, 4, 'initialise_vector ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0D28=4,get_vector %1d% elements_to %2d% %3d% %4d%
Opcode.register(0x0d28, SanAndreasOpcodeGlobal.getVectorElements, 4, '${2}, ${3}, ${4} = get_vector_elements ${1}', {false, true, true, true})
-- INI: 0D2A=2,%2d% = get_car %1d% number_of_collided_entites
Opcode.register(0x0d2a, SanAndreasOpcodeGlobal.getCarNumCollidedEntities, 2, '${1} = get_car_num_collided_entities ${2}', {true, false})
-- INI: 0D2B=2,%2d% = get_actor %1d% number_of_collided_entites
Opcode.register(0x0d2b, SanAndreasOpcodeGlobal.getCharNumCollidedEntities, 2, '${1} = get_char_num_collided_entities ${2}', {true, false})
-- INI: 0D2C=2,%2d% = get_object %1d% number_of_collided_entites
Opcode.register(0x0d2c, SanAndreasOpcodeGlobal.getObjectNumCollidedEntities, 2, '${1} = get_object_num_collided_entities ${2}', {true, false})
-- INI: 0D34=7,store_car %1d% collided_entities_to %2d% %3d% %4d% %5d% %6d% %7d%
Opcode.register(0x0d34, SanAndreasOpcodeGlobal.getCarCollidedEntities, 7, '${2}, ${3}, ${4}, ${5}, ${6}, ${7} = get_car_collided_entities ${1}', {false, true, true, true, true, true, true})
-- INI: 0D35=7,store_actor %1d% collided_entities_to %2d% %3d% %4d% %5d% %6d% %7d%
Opcode.register(0x0d35, SanAndreasOpcodeGlobal.getCharCollidedEntities, 7, '${2}, ${3}, ${4}, ${5}, ${6}, ${7} = get_char_collided_entities ${1}', {false, true, true, true, true, true, true})
-- INI: 0D36=7,store_object %1d% collided_entities_to %2d% %3d% %4d% %5d% %6d% %7d%
Opcode.register(0x0d36, SanAndreasOpcodeGlobal.getObjectCollidedEntities, 7, '${2}, ${3}, ${4}, ${5}, ${6}, ${7} = get_object_collided_entities ${1}', {false, true, true, true, true, true, true})
-- INI: 0D3D=2,get_colpoint_data %1d% lighting_to %2d%
Opcode.register(0x0d3d, SanAndreasOpcodeGlobal.getColDataLighting, 2, '${1} = get_col_data_lighting ${2}', {false, false})
-- INI: 0D3F=10,find_intersrction_between_circles %1d% %2d% %3d% and %4d% %5d% %6d% store_point1_to %7d% %8d% point2_to %9d% %10d% // IF and SET
Opcode.register(0x0d3f, SanAndreasOpcodeGlobal.findIntersectionBetweenCircles, 10, '${7}, ${8}, ${9}, ${10} = find_intersection_between_circles ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false, true, true, true, true})
-- INI: 0D40=8,draw_2d_shape_type %3d% texture %4d% numVerts %2d% pVerts %1d% vertexAlpha %5d% srcBlend %6d% dstBlend %7d% priority %8d% // IF and SET
Opcode.register(0x0d40, SanAndreasOpcodeGlobal.drawShape, 8, 'draw_shape ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false})
-- INI: 0D41=14,set_vertices %1d% vertex %2d% xyz %5d% %6d% %7d% rhw %8d% RGBA %9d% %10d% %11d% %12d% uv %13d% %14d% invertX %3d% invertY %4d%
Opcode.register(0x0d41, SanAndreasOpcodeGlobal.setupShapeVertex, 14, 'setup_shape_vertex ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0D42=2,load_txd %1s% from %2s% // IF and SET
Opcode.register(0x0d42, SanAndreasOpcodeGlobal.loadTxd, 2, 'load_txd ${1} ${2}', {false, false})
-- INI: 0D43=2,%2d% = txd %1s% id
Opcode.register(0x0d43, SanAndreasOpcodeGlobal.getTxdId, 2, '${2} = get_txd_id ${1}', {false, true})
-- INI: 0D44=3,%3d% = find_texture %1s% in_dictionary_named %2s% // IF and SET
Opcode.register(0x0d44, SanAndreasOpcodeGlobal.findTextureInTxdWithName, 3, '${3} = find_texture_in_txd_with_name ${1} ${2}', {false, false, true})
-- INI: 0D45=5,rotate_2d_vertices_shape %1d% num_verts %2d% aroundXY %3d% %4d% angle %5d%
Opcode.register(0x0d45, SanAndreasOpcodeGlobal.rotateShapeVertices, 5, 'rotate_shape_vertices ${1} ${2} ${3} ${4} ${5}', {false, false, false, false, false})
-- INI: 0D46=3,%3d% = find_texture %1s% in_dictionary_with_id %2d% // IF and SET
Opcode.register(0x0d46, SanAndreasOpcodeGlobal.findTextureInTxdWithId, 3, '${3} = find_texture_in_txd_with_id ${1} ${2}', {false, false, true})
-- INI: 0D47=2,%2d% = model %1d% txd_id // IF and SET
Opcode.register(0x0d47, SanAndreasOpcodeGlobal.getModelTxdId, 2, '${2} = get_model_txd_id ${1}', {false, true})
-- INI: 0D48=2,%2d% = model %1d% crc32_key // IF and SET
Opcode.register(0x0d48, SanAndreasOpcodeGlobal.getModelCrc, 2, '${2} = get_model_crc ${1}', {false, true})
-- INI: 0D49=3, %3d% = compare_strings %1s% %2s% // IF and SET
Opcode.register(0x0d49, SanAndreasOpcodeGlobal.stringCmp, 3, '${3} = string_cmp ${1} ${2}', {false, false, true})
-- INI: 0D4A=2,concatenate_strings %1d% %2s%
Opcode.register(0x0d4a, SanAndreasOpcodeGlobal.stringCat, 2, 'string_cat ${1} ${2}', {false, false})
-- INI: 0D4B=3, %3d% = locate_substring %1d% %2s% // IF and SET
Opcode.register(0x0d4b, SanAndreasOpcodeGlobal.stringStr, 3, '${3} = string_str ${1} ${2}', {false, false, true})
-- INI: 0D4F=4,struct %1d% offset %2d% size %3d% = %4d%
Opcode.register(0x0d4f, SanAndreasOpcodeGlobal.setStructField, 4, 'set_struct_field ${1} ${2} ${3} ${4}', {true, true, true, false})
-- INI: 0D50=14,draw_shadow_type %1d% position %2d% %3d% %4d% width %5d% height %6d% rotation %7d% distance %8d% texture %9d% intensity %10d% RGB %11d% %12d% %13d% shadow_data %14d%
Opcode.register(0x0d50, SanAndreasOpcodeGlobal.drawTemporaryShadow, 14, 'draw_temporary_shadow ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0D51=14,draw_permanent_shadow_type %1d% position %2d% %3d% %4d% width %5d% height %6d% rotation %7d% distance %8d% texture %9d% intensity %10d% RGB %11d% %12d% %13d% time %14d%
Opcode.register(0x0d51, SanAndreasOpcodeGlobal.drawPermanentShadow, 14, 'draw_permanent_shadow ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0D52=12,draw_light_type %1d% position %2d% %3d% %4d% direction %5d% %6d% %7d% radius %8d% RGBA %9d% %10d% %11d% affect_entity %12d%
Opcode.register(0x0d52, SanAndreasOpcodeGlobal.drawTemporaryLight, 12, 'draw_temporary_light ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12}', {false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0D53=10,draw_corona_with_texture %1d% color %2d% %3d% %4d% %5d% on_entity %6d% at %7d% %8d% %9d% size %10d%
Opcode.register(0x0d53, SanAndreasOpcodeGlobal.drawTemporaryCorona, 10, 'draw_temporary_corona ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10}', {false, false, false, false, false, false, false, false, false, false})
-- INI: 0D54=18,draw_corona_with_extra_params_texture %1d% color %2d% %3d% %4d% %5d% on_entity %6d% at %7d% %8d% %9d% size %10d% far_clip %11d% near_clip %12d% flare %13d% enable_reflection %14d% check_obstacles %15d% flash_while_fading %16d% fade_speed %17d% only_from_below %18d%
Opcode.register(0x0d54, SanAndreasOpcodeGlobal.drawTemporaryCoronaEx, 18, 'draw_temporary_corona_ex ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0D55=6,get_sun_colors_core_to %1d% %2d% %3d% glow_to %4d% %5d% %6d%
Opcode.register(0x0d55, SanAndreasOpcodeGlobal.getSunColors, 6, '${1}, ${2}, ${3}, ${4}, ${5}, ${6} = get_sun_colors', {true, true, true, true, true, true})
-- INI: 0D56=2,get_sun_screen_coords_XY_to %1d% %2d%
Opcode.register(0x0d56, SanAndreasOpcodeGlobal.getSunScreenCoors, 2, '${1}, ${2} = get_sun_screen_coors', {false, false})
-- INI: 0D57=3,get_sun_position_to %1d% %2d% %3d% // IF and SET
Opcode.register(0x0d57, SanAndreasOpcodeGlobal.getSunWorldCoors, 3, '${1}, ${2}, ${3} = get_sun_world_coors', {true, true, true})
-- INI: 0D58=2,get_sun_size_core_to %1d% glow_to %2d%
Opcode.register(0x0d58, SanAndreasOpcodeGlobal.getSunSize, 2, '${1}, ${2} = get_sun_size', {false, false})
-- INI: 0D5A=2,get_trafficlights_type_NS_current_color_to %1d% type_WE_current_color_to %2d%
Opcode.register(0x0d5a, SanAndreasOpcodeGlobal.getTrafficlightsCurrentColor, 2, '${1}, ${2} = get_trafficlights_current_color', {false, false})
-- INI: 0D5B=12,draw_spotlight_from %1d% %2d% %3d% to %4d% %5d% %6d% base_radius %7d% target_radius %8d% enable_shadow %9d% shadow_intensity %10d% flag1 %11d% flag2 %12d%
Opcode.register(0x0d5b, SanAndreasOpcodeGlobal.drawSpotlight, 12, 'draw_spotlight ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12}', {false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0D5C=3,%3d% = get_car %1d% light %2d% damage_state
Opcode.register(0x0d5c, SanAndreasOpcodeGlobal.getCarLightDamageStatus, 3, '${3} = get_car_light_damage_status ${1} ${2}', {false, false, true})
-- INI: 0D5D=3,set_car %1d% light %2d% damage_state %3d%
Opcode.register(0x0d5d, SanAndreasOpcodeGlobal.setCarLightDamageStatus, 3, 'set_car_light_damage_status ${1} ${2} ${3}', {false, false, false})
-- INI: 0D5E=3,get_vehicle %1d% class_to %2d% subclass_to %3d%
Opcode.register(0x0d5e, SanAndreasOpcodeGlobal.getVehicleClassAndSubclass, 3, '${1}, ${2} = get_vehicle_class_and_subclass ${3}', {false, false, false})
-- INI: 0D5F=7,get_vehicle %1d% dummy_element %2d% position %3d% to %5d% %6d% %7d% invert_x %4d% // IF and SET
Opcode.register(0x0d5f, SanAndreasOpcodeGlobal.getVehicleDummyPosn, 7, '${5}, ${6}, ${7} = get_vehicle_dummy_posn ${1} ${2} ${3} ${4}', {false, false, false, false, true, true, true})
-- INI: 0D60=10,create_projectile_type %1d% launched_from_entity %2d% origin %3d% %4d% %5d% target %6d% %7d% %8d% target_entity %9d% force %10d%
Opcode.register(0x0d60, SanAndreasOpcodeGlobal.createProjectile, 10, 'create_projectile ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10}', {false, false, false, false, false, false, false, false, false, false})
-- INI: 0D65=6,print %1s% at %2d% %3d% scale %4d% %5d% style %6d%
Opcode.register(0x0d65, SanAndreasOpcodeGlobal.printTemporaryText, 6, 'print_temporary_text ${1} ${2} ${3} ${4} ${5} ${6}', {false, false, false, false, false, false})
-- INI: 0D66=25,print %1s% at %2d% %3d% scale %4d% %5d% style %6d% prop %7d% align %8d% wrap %9d% justify %10d% color %11d% %12d% %13d% %14d% outline %15d% shadow %16d% dropColor %17d% %18d% %19d% %20d% background %21d% backColor %22d% %23d% %24d% %25d%
Opcode.register(0x0d66, SanAndreasOpcodeGlobal.printTemporaryTextEx, 25, 'print_temporary_text_ex ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17} ${18} ${19} ${20} ${21} ${22} ${23} ${24} ${25}', {false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false, false})
-- INI: 0D72=3,get_sfx_volume_to %2d% radio_volume_to %3d% type %1d%
Opcode.register(0x0d72, SanAndreasOpcodeGlobal.getGameVolume, 3, '${1}, ${2} = get_game_volume ${3}', {false, false, false})
-- INI: 0D73=3,get_screen_width_to %2d% height_to %3d% type %1d%
Opcode.register(0x0d73, SanAndreasOpcodeGlobal.getScreenWidthAndHeight, 3, '${1}, ${2} = get_screen_width_and_height ${3}', {false, false, false})
-- INI: 0D76=3,%3d% = component %1d% object %2d%
Opcode.register(0x0d76, SanAndreasOpcodeGlobal.getComponentObject, 3, '${3} = get_component_object ${1} ${2}', {false, false, true})
-- INI: 0D77=2,object_atomic %1d% hide %2d%
Opcode.register(0x0d77, SanAndreasOpcodeGlobal.hideObjectAtomic, 2, 'hide_object_atomic ${1} ${2}', {false, false})
-- INI: 0D78=3,%3d% = get_object %1d% atomic_flag %2d%
Opcode.register(0x0d78, SanAndreasOpcodeGlobal.getObjectAtomicFlag, 3, '${3} = get_object_atomic_flag ${1} ${2}', {false, false, true})
-- INI: 0D79=3,set_object %1d% atomic_flag %2d% state %3d%
Opcode.register(0x0d79, SanAndreasOpcodeGlobal.setObjectAtomicFlag, 3, 'set_object_atomic_flag ${1} ${2} ${3}', {false, false, false})
-- INI: 0D7A=2,%2d% = get_object %1d% num_materials
Opcode.register(0x0d7a, SanAndreasOpcodeGlobal.getObjectAtomicNumMaterials, 2, '${1} = get_object_atomic_num_materials ${2}', {true, false})
-- INI: 0D7B=3,%3d% = get_object %1d% material %2d% texture
Opcode.register(0x0d7b, SanAndreasOpcodeGlobal.getObjectAtomicMaterialTexture, 3, '${3} = get_object_atomic_material_texture ${1} ${2}', {false, false, true})
-- INI: 0662=1,printstring %1h%
Opcode.register(0x0662, SanAndreasOpcodeGlobal.writeDebug, 1, 'write_debug ${1}', {false})
-- INI: 0663=2,printint %1h% %2d%
Opcode.register(0x0663, SanAndreasOpcodeGlobal.writeDebugWithInt, 2, 'write_debug_with_int ${1} ${2}', {false, false})
-- INI: 0664=2,printfloat %1h% %2d%
Opcode.register(0x0664, SanAndreasOpcodeGlobal.writeDebugWithFloat, 2, 'write_debug_with_float ${1} ${2}', {false, false})
Opcode.register(0x2705, SanAndreasOpcodeGlobal.opcode2705, 3, '${1} = ${2} + ${3}')
Opcode.register(0x2706, SanAndreasOpcodeGlobal.opcode2706, 3, '${1} = ${2} - ${3}')
Opcode.register(0x2707, SanAndreasOpcodeGlobal.opcode2707, 3, '${1} = ${2} * ${3}')
Opcode.register(0x2708, SanAndreasOpcodeGlobal.opcode2708, 3, '${1} = ${2} / ${3}')
Opcode.register(0x2408, SanAndreasOpcodeGlobal.terminateScript, 1, 'terminate_script ${1}')
