SharedOpcodeCarGenerator = {}
SharedOpcodeCarGenerator.__index = SharedOpcodeCarGenerator

-- Opcode: 0x014B
-- Instruction: [var handle: CarGenerator] = create_car_generator {x} [float] {y} [float] {z} [float] {heading} [float] {modelId} [model_vehicle] {primaryColor} [int] {secondaryColor} [int] {forceSpawn} [bool] {alarmChance} [int] {doorLockChance} [int] {minDelay} [int] {maxDelay} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/014B
function SharedOpcodeCarGenerator.create(posX, posY, posZ, angle, model, color1, color2, forceSpawn, alarm, doorLock, minDelay, maxDelay, _)
    --[[local car = VehicleElement:create(model, true)
    car:spawn(posX, posY, posZ)

    Script.setOpcodePartiallyImplemented()
    opcodes[0x0229](car, color1, color2)]]

    --return CarGenerator:create(model, posX, posY, posZ, angle, color1, color2, forceSpawn, alarm, doorLock, minDelay, maxDelay)

    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x014C
-- Instruction: switch_car_generator [CarGenerator] {amount} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/014C
function SharedOpcodeCarGenerator.switch(generatorHandle, spawns)
    return Script.setOpcodePartiallyImplemented()
end


Opcode.register(0x014b, SharedOpcodeCarGenerator.create, '[var handle: CarGenerator] = create_car_generator {x} [float] {y} [float] {z} [float] {heading} [float] {modelId} [model_vehicle] {primaryColor} [int] {secondaryColor} [int] {forceSpawn} [bool] {alarmChance} [int] {doorLockChance} [int] {minDelay} [int] {maxDelay} [int]')
Opcode.register(0x014c, SharedOpcodeCarGenerator.switch, 'switch_car_generator [CarGenerator] {amount} [int]')
