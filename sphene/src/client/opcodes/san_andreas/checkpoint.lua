SanAndreasOpcodeCheckpoint = {}
SanAndreasOpcodeCheckpoint.__index = SanAndreasOpcodeCheckpoint

-- Opcode: 0x06D5
-- Instruction: [var handle: Checkpoint] = create_checkpoint {type} [CheckpointType] {x} [float] {y} [float] {z} [float] {pointX} [float] {pointY} [float] {pointZ} [float] {radius} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06D5
function SanAndreasOpcodeCheckpoint.create(type, posX, posY, posZ, pointX, pointY, pointZ, radius)
    local checkpoint = MarkerElement:create(posX, posY, posZ, MarkerType.CHECKPOINT, radius, 255, 0, 0)

    checkpoint:setTarget(pointX, pointY, pointZ)
    checkpoint:setAlpha(0xE4)
    checkpoint:setCheckpointType(type)

    return checkpoint
end

-- Opcode: 0x06D6
-- Instruction: delete_checkpoint [Checkpoint]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/06D6
function SanAndreasOpcodeCheckpoint.delete(checkpoint)
    if (type(checkpoint) ~= 'table') then
        return false
    end

    return checkpoint:destroy()
end

-- Opcode: 0x07F3
-- Instruction: set_checkpoint_coords [Checkpoint] {x} [float] {y} [float] {z} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/07F3
function SanAndreasOpcodeCheckpoint.setCoords(checkpoint, posX, posY, posZ)
    return checkpoint:setPosition(posX, posY, posZ)
end

-- Opcode: 0x0996
-- Instruction: set_checkpoint_heading [Checkpoint] {heading} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0996
function SanAndreasOpcodeCheckpoint.setHeading(marker, zAngle)
    local rotX, rotY, _ = marker:getRotation()
    return marker:setRotation(rotX, rotY, zAngle)
end


-- INI: 06D5=9,%9d% = create_racing_checkpoint_at %2d% %3d% %4d% point_to %5d% %6d% %7d% type %1d% radius %8d%
Opcode.register(0x06d5, SanAndreasOpcodeCheckpoint.create, 9, '${9} = create_checkpoint ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false, true})
-- INI: 06D6=1,disable_racing_checkpoint %1d%
Opcode.register(0x06d6, SanAndreasOpcodeCheckpoint.delete, 1, 'delete_checkpoint ${1}', {false})
-- INI: 07F3=4,move_racing_checkpoint %1d% to %2d% %3d% %4d%
Opcode.register(0x07f3, SanAndreasOpcodeCheckpoint.setCoords, 4, 'set_checkpoint_coords ${1} ${2} ${3} ${4}', {false, false, false, false})
-- INI: 0996=2,set_racing_checkpoint %1d% Z_angle_to %2d%
Opcode.register(0x0996, SanAndreasOpcodeCheckpoint.setHeading, 2, 'set_checkpoint_heading ${1} ${2}', {false, true})
