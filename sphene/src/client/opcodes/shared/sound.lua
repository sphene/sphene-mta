SharedOpcodeSound = {}
SharedOpcodeSound.__index = SharedOpcodeSound

-- Opcode: 0x018C
-- Instruction: add_one_off_sound {x} [float] {y} [float] {z} [float] {soundId} [ScriptSound]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/018C
function SharedOpcodeSound.addOneOffSound(posX, posY, posZ, soundId)
    local bank = math.floor((soundId - 2000) / 200)
    local slot = ((soundId - 2000) % 200)

    if (posX == 0 and posY == 0 and posZ == 0) then
        local sfx = playSFX("script", bank,
            slot, false)

        if (sfx) then
            setSoundVolume(sfx, 1.0)
        end
    else
        local sfx = playSFX3D("script", bank,
            slot, posX, posY, posZ, false)

        if (sfx) then
            setSoundVolume(sfx, 1.0)
        end
    end

    --Audio.playSound(soundId, posX, posY, posZ)

    return true
end

-- Opcode: 0x018E
-- Instruction: remove_sound [Sound]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/018E
function SharedOpcodeSound.remove(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x018c, SharedOpcodeSound.addOneOffSound, 'add_one_off_sound {x} [float] {y} [float] {z} [float] {soundId} [ScriptSound]')
Opcode.register(0x018e, SharedOpcodeSound.remove, 'remove_sound [Sound]')
