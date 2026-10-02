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


-- INI: 014b=13,%13d% = init_car_generator %5m% %6d% %7d% force_spawn %8d% alarm %9d% door_lock %10d% min_delay %11d% max_delay %12d% at %1d% %2d% %3d% angle %4d%
Opcode.register(0x014b, SharedOpcodeCarGenerator.create, 13, '${13} = create_car_generator ${vehicle.5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${1} ${2} ${3} ${4}', {false, false, false, false, false, false, false, false, false, false, false, false, true})
-- INI: 014c=2,set_parked_car_generator %1d% cars_to_generate_to %2d%
Opcode.register(0x014c, SharedOpcodeCarGenerator.switch, 2, 'switch_car_generator ${1} ${2}', {false, true})
