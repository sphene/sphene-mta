SharedOpcodeSphere = {}
SharedOpcodeSphere.__index = SharedOpcodeSphere

-- Opcode: 0x03A1
-- Instruction: draw_sphere {x} [float] {y} [float] {z} [float] {diameter} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03A1
function SharedOpcodeSphere.draw(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x03BC
-- Instruction: [var handle: Sphere] = add_sphere {x} [float] {y} [float] {z} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03BC
function SharedOpcodeSphere.create(posX, posY, posZ, radius, _)
    local marker = MarkerElement:create(posX, posY, posZ, "cylinder", radius, 255, 0, 0)
    marker:setAlpha(0xE4)
    marker:setResetPosition()

    return marker
end

-- Opcode: 0x03BD
-- Instruction: remove_sphere [Sphere]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03BD
function SharedOpcodeSphere.remove(marker)
    if (type(marker) ~= "table") then
        return false
    end

    for _, dependantElement in pairs(marker.dependantElements) do
        dependantElement:setAlpha(0)
    end

    return marker:destroy()
end


-- INI: 03a1=4,draw_sphere %1d% %2d% %3d% radius %4d%
Opcode.register(0x03a1, SharedOpcodeSphere.draw, 4, 'draw_sphere ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 03bc=5,%5d% = create_sphere %1d% %2d% %3d% %4d%
Opcode.register(0x03bc, SharedOpcodeSphere.create, 5, '${5} = add_sphere ${1} ${2} ${3} ${4}', {false, false, false, false, true})
-- INI: 03bd=1,destroy_sphere %1d%
Opcode.register(0x03bd, SharedOpcodeSphere.remove, 1, 'remove_sphere ${1}', {false})
