ViceCityOpcodeSound = {}
ViceCityOpcodeSound.__index = ViceCityOpcodeSound

-- Opcode: 0x018D
-- Instruction: [var handle: Sound] = add_continuous_sound {x} [float] {y} [float] {z} [float] {soundId} [ScriptSound]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/018D
function ViceCityOpcodeSound.addContinuous(_, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 018d=5,%5d% = create_sound %4d% at %1d% %2d% %3d%
Opcode.register(0x018d, ViceCityOpcodeSound.addContinuous, 5, '${5} = add_continuous_sound ${4} ${1} ${2} ${3}', {false, false, false, false, true})
