ViceCityOpcodeStreaming = {}
ViceCityOpcodeStreaming.__index = ViceCityOpcodeStreaming

-- Opcode: 0x02F3
-- Instruction: load_special_model {cutsceneModelId} [model_any] {modelName} [string]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/02F3
function ViceCityOpcodeStreaming.loadSpecialModel(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x02f3, ViceCityOpcodeStreaming.loadSpecialModel, 'load_special_model {cutsceneModelId} [model_any] {modelName} [string]')
