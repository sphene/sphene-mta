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


Opcode.register(0x06d5, SanAndreasOpcodeCheckpoint.create, '[var handle: Checkpoint] = create_checkpoint {type} [CheckpointType] {x} [float] {y} [float] {z} [float] {pointX} [float] {pointY} [float] {pointZ} [float] {radius} [float]')
Opcode.register(0x06d6, SanAndreasOpcodeCheckpoint.delete, 'delete_checkpoint [Checkpoint]')
Opcode.register(0x07f3, SanAndreasOpcodeCheckpoint.setCoords, 'set_checkpoint_coords [Checkpoint] {x} [float] {y} [float] {z} [float]')
Opcode.register(0x0996, SanAndreasOpcodeCheckpoint.setHeading, 'set_checkpoint_heading [Checkpoint] {heading} [float]')
