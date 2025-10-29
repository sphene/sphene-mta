SharedOpcodeMemory = {}
SharedOpcodeMemory.__index = SharedOpcodeMemory

-- Opcode: 0x0A8C
-- Instruction: write_memory {address} [int] {size} [int] {value} [any] {vp} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A8C
function SharedOpcodeMemory.write(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A8D
-- Instruction: [var result: any] = read_memory {address} [int] {size} [int] {vp} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A8D
function SharedOpcodeMemory.read(_, _, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A96
-- Instruction: [var address: int] = get_ped_pointer {char} [Char]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A96
function SharedOpcodeMemory.getPedPointer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A97
-- Instruction: [var address: int] = get_vehicle_pointer {handle} [Car]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A97
function SharedOpcodeMemory.getVehiclePointer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A98
-- Instruction: [var address: int] = get_object_pointer {object} [Object]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A98
function SharedOpcodeMemory.getObjectPointer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A9F
-- Instruction: [var address: int] = get_this_script_struct
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A9F
function SharedOpcodeMemory.getThisScriptStruct(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AA5
-- Instruction: call_function {address} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AA5
function SharedOpcodeMemory.callFunction()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AA6
-- Instruction: call_method {address} [int] {struct} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AA6
function SharedOpcodeMemory.callMethod()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AA7
-- Instruction: [var funcRet: any] = call_function_return {address} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AA7
function SharedOpcodeMemory.callFunctionReturn()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AA8
-- Instruction: [var funcRet: any] = call_method_return {address} [int] {struct} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AA8
function SharedOpcodeMemory.callMethodReturn()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AAA
-- Instruction: [var address: int] = get_script_struct_named {scriptName} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AAA
function SharedOpcodeMemory.getScriptStructNamed(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AC6
-- Instruction: [var address: int] = get_label_pointer @label
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AC6
function SharedOpcodeMemory.getLabelPointer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AC7
-- Instruction: [var address: int] = get_var_pointer [var any]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AC7
function SharedOpcodeMemory.getVarPointer(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AC8
-- Instruction: [var address: int] = allocate_memory {size} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AC8
function SharedOpcodeMemory.allocate(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AC9
-- Instruction: free_memory {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AC9
function SharedOpcodeMemory.free(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AE9
-- Instruction: [var number: float] = pop_float
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AE9
function SharedOpcodeMemory.popFloat(_)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AEA
-- Instruction: [var handle: Char] = get_ped_ref {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AEA
function SharedOpcodeMemory.getPedRef(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AEB
-- Instruction: [var handle: Car] = get_vehicle_ref {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AEB
function SharedOpcodeMemory.getVehicleRef(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0AEC
-- Instruction: [var handle: Object] = get_object_ref {address} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AEC
function SharedOpcodeMemory.getObjectRef(_, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0a8c, SharedOpcodeMemory.write, 'write_memory {address} [int] {size} [int] {value} [any] {vp} [bool]')
Opcode.register(0x0a8d, SharedOpcodeMemory.read, '[var result: any] = read_memory {address} [int] {size} [int] {vp} [bool]')
Opcode.register(0x0a96, SharedOpcodeMemory.getPedPointer, '[var address: int] = get_ped_pointer {char} [Char]')
Opcode.register(0x0a97, SharedOpcodeMemory.getVehiclePointer, '[var address: int] = get_vehicle_pointer {handle} [Car]')
Opcode.register(0x0a98, SharedOpcodeMemory.getObjectPointer, '[var address: int] = get_object_pointer {object} [Object]')
Opcode.register(0x0a9f, SharedOpcodeMemory.getThisScriptStruct, '[var address: int] = get_this_script_struct')
Opcode.register(0x0aa5, SharedOpcodeMemory.callFunction, 'call_function {address} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]')
Opcode.register(0x0aa6, SharedOpcodeMemory.callMethod, 'call_method {address} [int] {struct} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]')
Opcode.register(0x0aa7, SharedOpcodeMemory.callFunctionReturn, '[var funcRet: any] = call_function_return {address} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]')
Opcode.register(0x0aa8, SharedOpcodeMemory.callMethodReturn, '[var funcRet: any] = call_method_return {address} [int] {struct} [int] {numParams} [int] {pop} [int] {funcParams} [arguments]')
Opcode.register(0x0aaa, SharedOpcodeMemory.getScriptStructNamed, '[var address: int] = get_script_struct_named {scriptName} [string]')
Opcode.register(0x0ac6, SharedOpcodeMemory.getLabelPointer, '[var address: int] = get_label_pointer @label')
Opcode.register(0x0ac7, SharedOpcodeMemory.getVarPointer, '[var address: int] = get_var_pointer [var any]')
Opcode.register(0x0ac8, SharedOpcodeMemory.allocate, '[var address: int] = allocate_memory {size} [int]')
Opcode.register(0x0ac9, SharedOpcodeMemory.free, 'free_memory {address} [int]')
Opcode.register(0x0ae9, SharedOpcodeMemory.popFloat, '[var number: float] = pop_float')
Opcode.register(0x0aea, SharedOpcodeMemory.getPedRef, '[var handle: Char] = get_ped_ref {address} [int]')
Opcode.register(0x0aeb, SharedOpcodeMemory.getVehicleRef, '[var handle: Car] = get_vehicle_ref {address} [int]')
Opcode.register(0x0aec, SharedOpcodeMemory.getObjectRef, '[var handle: Object] = get_object_ref {address} [int]')
