SanAndreasOpcodeStreamedScript = {}
SanAndreasOpcodeStreamedScript.__index = SanAndreasOpcodeStreamedScript

-- Opcode: 0x07D3
-- Instruction: register_script_brain_for_code_use {id} [script_id] {_p2} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07D3
function SanAndreasOpcodeStreamedScript.registerScriptBrainForCodeUse(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0884
-- Instruction: register_attractor_script_brain_for_code_use {id} [script_id] {_p2} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0884
function SanAndreasOpcodeStreamedScript.registerAttractorScriptBrainForCodeUse(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x08A9
-- Instruction: stream_script {id} [script_id]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08A9
function SanAndreasOpcodeStreamedScript.stream(id)
   Script.loadExternalScript(id)
end

-- Opcode: 0x08AB
-- Instruction: has_streamed_script_loaded {id} [script_id]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/08AB
function SanAndreasOpcodeStreamedScript.hasLoaded(id)
   return Script.isExternalScriptLoaded(id)
end

-- Opcode: 0x090F
-- Instruction: mark_streamed_script_as_no_longer_needed {id} [script_id]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/090F
function SanAndreasOpcodeStreamedScript.markAsNoLongerNeeded(id)
    Script.stopExternalScript(id)
end

-- Opcode: 0x0910
-- Instruction: remove_streamed_script {id} [script_id]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0910
function SanAndreasOpcodeStreamedScript.remove(id)
    Script.releaseExternalScript(id)
end

-- Opcode: 0x0913
-- Instruction: start_new_streamed_script {id} [script_id] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0913
function SanAndreasOpcodeStreamedScript.startNew(id, ...)
   Script.runExternalScript(id, ...)
end

-- Opcode: 0x0926
-- Instruction: [var numScripts: int] = get_number_of_instances_of_streamed_script {id} [script_id]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0926
function SanAndreasOpcodeStreamedScript.getNumberOfInstances(id)
    return Script.getExternalScriptRunningCount(id)
end

-- Opcode: 0x0928
-- Instruction: allocate_streamed_script_to_random_ped {id} [script_id] {modelId} [model_char] {priority} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0928
function SanAndreasOpcodeStreamedScript.allocateToRandomPed(id, model, priority)
    ElementManager.registerExternalScriptTrigger('ped', id, model, priority, -1)
end

-- Opcode: 0x0929
-- Instruction: allocate_streamed_script_to_object {id} [script_id] {modelId} [model_object] {priority} [int] {radius} [float] {type} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0929
function SanAndreasOpcodeStreamedScript.allocateToObject(id, model, priority, radius, _)
    ElementManager.registerExternalScriptTrigger('object', id, model, priority, radius, _)
end


-- INI: 07D3=2,%2g% = init_external_script_named_handle %1x%
Opcode.register(0x07d3, SanAndreasOpcodeStreamedScript.registerScriptBrainForCodeUse, 2, 'register_script_brain_for_code_use ${1} ${2}', {false, true})
-- INI: 0884=2,%2g% = init_external_script_named_handle %1x%
Opcode.register(0x0884, SanAndreasOpcodeStreamedScript.registerAttractorScriptBrainForCodeUse, 2, 'register_attractor_script_brain_for_code_use ${1} ${2}', {false, true})
-- INI: 08A9=1,load_external_script %1x%
Opcode.register(0x08a9, SanAndreasOpcodeStreamedScript.stream, 1, 'stream_script ${1}', {false})
-- INI: 08AB=1,  external_script %1x% loaded
Opcode.register(0x08ab, SanAndreasOpcodeStreamedScript.hasLoaded, 1, 'has_streamed_script_loaded ${1}', {false})
-- INI: 090F=1,end_external_script %1x%
Opcode.register(0x090f, SanAndreasOpcodeStreamedScript.markAsNoLongerNeeded, 1, 'mark_streamed_script_as_no_longer_needed ${1}', {false})
-- INI: 0910=1,release_external_script %1x%
Opcode.register(0x0910, SanAndreasOpcodeStreamedScript.remove, 1, 'remove_streamed_script ${1}', {false})
Opcode.register(0x0913, SanAndreasOpcodeStreamedScript.startNew, -1, 'start_new_streamed_script ${1}', {})
-- INI: 0926=2,%2d% = external_script_status %1x%
Opcode.register(0x0926, SanAndreasOpcodeStreamedScript.getNumberOfInstances, 2, '${2} = get_number_of_instances_of_streamed_script ${1}', {false, true})
-- INI: 0928=3,init_external_script_trigger %1x% with_actor_model %2m% priority %3h%
Opcode.register(0x0928, SanAndreasOpcodeStreamedScript.allocateToRandomPed, 3, 'allocate_streamed_script_to_random_ped ${1} ${ped.2} ${3}', {false, false, false})
-- INI: 0929=5,init_external_script_trigger %1x% with_object_model %2o% priority %3h% radius %4d% type %5h%
Opcode.register(0x0929, SanAndreasOpcodeStreamedScript.allocateToObject, 5, 'allocate_streamed_script_to_object ${1} ${object.2} ${3} ${4} ${5}', {false, false, false, false, false})
