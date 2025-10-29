SanAndreasOpcodeMouse = {}
SanAndreasOpcodeMouse.__index = SanAndreasOpcodeMouse

-- Opcode: 0x0A4A
-- Instruction: [var deltaX: float], [var deltaY: float] = get_pc_mouse_movement
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A4A
function SanAndreasOpcodeMouse.getMovement(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0A4C
-- Instruction: is_mouse_using_vertical_inversion
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0A4C
function SanAndreasOpcodeMouse.isUsingVerticalInversion()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E10
-- Instruction: is_mouse_wheel_up
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E10
function SanAndreasOpcodeMouse.isWheelUp()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E11
-- Instruction: is_mouse_wheel_down
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E11
function SanAndreasOpcodeMouse.isWheelDown()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0E23
-- Instruction: [var sensibility: float] = get_mouse_sensibility
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0E23
function SanAndreasOpcodeMouse.getSensibility(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0a4a, SanAndreasOpcodeMouse.getMovement, '[var deltaX: float], [var deltaY: float] = get_pc_mouse_movement')
Opcode.register(0x0a4c, SanAndreasOpcodeMouse.isUsingVerticalInversion, 'is_mouse_using_vertical_inversion')
Opcode.register(0x0e10, SanAndreasOpcodeMouse.isWheelUp, 'is_mouse_wheel_up')
Opcode.register(0x0e11, SanAndreasOpcodeMouse.isWheelDown, 'is_mouse_wheel_down')
Opcode.register(0x0e23, SanAndreasOpcodeMouse.getSensibility, '[var sensibility: float] = get_mouse_sensibility')
