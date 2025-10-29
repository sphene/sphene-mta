ViceCityOpcodeWeapon = {}
ViceCityOpcodeWeapon.__index = ViceCityOpcodeWeapon

-- Opcode: 0x0604
-- Instruction: [var heading: float] = get_heading_from_vector_2d {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0604
function ViceCityOpcodeWeapon.getModel(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0605
-- Instruction: task_play_anim {handle} [Char] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {keepLastFrame} [bool] {time} [int]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0605
function ViceCityOpcodeWeapon.getTypeForModel(actor, animation, block, _, looped, locked, _, _, time)
    if (actor == -1) then
        return -- Ignore for now, -1 is for AS packs.
    end

    Script.setOpcodePartiallyImplemented()
    return actor:setAnimation(block, animation,
        time, ((looped == 1) and true or false),
        ((locked == 1) and false or true))
end


Opcode.register(0x0604, ViceCityOpcodeWeapon.getModel, '[var heading: float] = get_heading_from_vector_2d {x} [float] {y} [float]')
Opcode.register(0x0605, ViceCityOpcodeWeapon.getTypeForModel, 'task_play_anim {handle} [Char] {animationName} [string] {animationFile} [string] {blendSpeed} [float] {loop} [bool] {lockX} [bool] {lockY} [bool] {keepLastFrame} [bool] {time} [int]')
