SanAndreasOpcodeCarGenerator = {}
SanAndreasOpcodeCarGenerator.__index = SanAndreasOpcodeCarGenerator

-- Opcode: 0x0732
-- Instruction: suppress_car_model {model} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0732
function SanAndreasOpcodeCarGenerator.suppressCarModel(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0733
-- Instruction: dont_suppress_car_model {modelId} [model_vehicle]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0733
function SanAndreasOpcodeCarGenerator.dontSuppressCarModel(_)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0734
-- Instruction: dont_suppress_any_car_models
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0734
function SanAndreasOpcodeCarGenerator.dontSuppressAnyCarModels()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x09E2
-- Instruction: [var handle: CarGenerator] = create_car_generator_with_plate {x} [float] {y} [float] {z} [float] {heading} [float] {modelId} [int] {primaryColor} [int] {secondaryColor} [int] {forceSpawn} [bool] {alarmChance} [int] {doorLockChance} [int] {minDelay} [int] {maxDelay} [int] {plateName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/09E2
function SanAndreasOpcodeCarGenerator.createWithPlate(posX, posY, posZ, angle, model, color1, color2, forceSpawn, alarm, doorLock, minDelay, maxDelay, numberplate, _)
    -- 014B: init_car_generator
    local car = opcodes[0x014B](posX, posY, posZ, angle, model, color1, color2, forceSpawn, alarm, doorLock, minDelay, maxDelay, nil)
    -- Use setVehiclePlateText function to set vehicle plate text

    -- Since this is parked car generator, we probably should trigger opcode 0A17 below?
    -- Took a look in decompiled SCM and it seems like they trigger 0A17, so I guess it's fine.

    Script.setOpcodePartiallyImplemented()

    return car
end

-- Opcode: 0x0A17
-- Instruction: set_has_been_owned_for_car_generator [CarGenerator] {state} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A17
function SanAndreasOpcodeCarGenerator.setHasBeenOwned(car, flag)
    -- If enabled, CJ will not receive a wanted level when entering the specified vehicle when police are around.
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0E02
-- Instruction: set_car_generator_no_save [CarGenerator]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E02
function SanAndreasOpcodeCarGenerator.setNoSave(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0732=1,random_car_generator_disable_model %1m%
Opcode.register(0x0732, SanAndreasOpcodeCarGenerator.suppressCarModel, 1, 'suppress_car_model ${vehicle.1}', {false})
-- INI: 0733=1,random_car_generator_enable_model %1m%
Opcode.register(0x0733, SanAndreasOpcodeCarGenerator.dontSuppressCarModel, 1, 'dont_suppress_car_model ${vehicle.1}', {false})
-- INI: 0734=0,reset_random_car_generator_models
Opcode.register(0x0734, SanAndreasOpcodeCarGenerator.dontSuppressAnyCarModels, 0, 'dont_suppress_any_car_models', {})
-- INI: 09E2=14,%14d% = parked_car_generator_w_numberplate %5m% colors %6d% %7d% force_spawn %8d% alarm %9d% door_lock %10d% min_delay %11d% max_delay %12d% plate %13h% at %1d% %2d% %3d% angle %4d%
Opcode.register(0x09e2, SanAndreasOpcodeCarGenerator.createWithPlate, 14, '${14} = create_car_generator_with_plate ${1} ${2} ${3} ${4} ${vehicle.5} ${6} ${7} ${8} ${9} ${10} ${11} ${12} ${13}', {false, false, false, false, false, false, false, false, false, false, false, false, false, true})
-- INI: 0A17=2,set_parked_car_generator %1d% to_player_owned %2h%
Opcode.register(0x0a17, SanAndreasOpcodeCarGenerator.setHasBeenOwned, 2, 'set_has_been_owned_for_car_generator ${1} ${2}', {false, false})
-- INI: 0E02=1,set_car_generator %1d% no_save
Opcode.register(0x0e02, SanAndreasOpcodeCarGenerator.setNoSave, 1, 'set_car_generator_no_save ${1}', {false})
