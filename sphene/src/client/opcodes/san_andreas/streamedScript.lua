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


Opcode.register(0x07d3, SanAndreasOpcodeStreamedScript.registerScriptBrainForCodeUse, 'register_script_brain_for_code_use {id} [script_id] {_p2} [string]')
Opcode.register(0x0884, SanAndreasOpcodeStreamedScript.registerAttractorScriptBrainForCodeUse, 'register_attractor_script_brain_for_code_use {id} [script_id] {_p2} [string]')
Opcode.register(0x08a9, SanAndreasOpcodeStreamedScript.stream, 'stream_script {id} [script_id]')
Opcode.register(0x08ab, SanAndreasOpcodeStreamedScript.hasLoaded, 'has_streamed_script_loaded {id} [script_id]')
Opcode.register(0x090f, SanAndreasOpcodeStreamedScript.markAsNoLongerNeeded, 'mark_streamed_script_as_no_longer_needed {id} [script_id]')
Opcode.register(0x0910, SanAndreasOpcodeStreamedScript.remove, 'remove_streamed_script {id} [script_id]')
Opcode.register(0x0913, SanAndreasOpcodeStreamedScript.startNew, 'start_new_streamed_script {id} [script_id] {args} [arguments]')
Opcode.register(0x0926, SanAndreasOpcodeStreamedScript.getNumberOfInstances, '[var numScripts: int] = get_number_of_instances_of_streamed_script {id} [script_id]')
Opcode.register(0x0928, SanAndreasOpcodeStreamedScript.allocateToRandomPed, 'allocate_streamed_script_to_random_ped {id} [script_id] {modelId} [model_char] {priority} [int]')
Opcode.register(0x0929, SanAndreasOpcodeStreamedScript.allocateToObject, 'allocate_streamed_script_to_object {id} [script_id] {modelId} [model_object] {priority} [int] {radius} [float] {type} [int]')
