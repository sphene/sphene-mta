ViceCityOpcodeSound = {}
ViceCityOpcodeSound.__index = ViceCityOpcodeSound

-- Opcode: 0x018D
-- Instruction: [var handle: Sound] = add_continuous_sound {x} [float] {y} [float] {z} [float] {soundId} [ScriptSound]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/018D
function ViceCityOpcodeSound.addContinuous(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x018d, ViceCityOpcodeSound.addContinuous, '[var handle: Sound] = add_continuous_sound {x} [float] {y} [float] {z} [float] {soundId} [ScriptSound]')
