ViceCityOpcodeStreaming = {}
ViceCityOpcodeStreaming.__index = ViceCityOpcodeStreaming

-- Opcode: 0x02F3
-- Instruction: load_special_model {cutsceneModelId} [model_any] {modelName} [string]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02F3
function ViceCityOpcodeStreaming.loadSpecialModel(_, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 02f3=2,load_object %1o% %2s%
Opcode.register(0x02f3, ViceCityOpcodeStreaming.loadSpecialModel, 2, 'load_special_model ${1} ${2}', {false, false})
