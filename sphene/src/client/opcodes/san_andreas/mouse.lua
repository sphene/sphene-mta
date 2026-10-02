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


-- INI: 0A4A=2,store_joystick_X_offset_to %1h% Y_offset_to %2h%
Opcode.register(0x0a4a, SanAndreasOpcodeMouse.getMovement, 2, '${1}, ${2} = get_pc_mouse_movement', {true, true})
-- INI: 0A4C=0,  mouse_not_inverted_vertically
Opcode.register(0x0a4c, SanAndreasOpcodeMouse.isUsingVerticalInversion, 0, 'is_mouse_using_vertical_inversion', {})
-- INI: 0E10=0,is_mouse_wheel_up
Opcode.register(0x0e10, SanAndreasOpcodeMouse.isWheelUp, 0, 'is_mouse_wheel_up', {})
-- INI: 0E11=0,is_mouse_wheel_down
Opcode.register(0x0e11, SanAndreasOpcodeMouse.isWheelDown, 0, 'is_mouse_wheel_down', {})
-- INI: 0E23=1,get_mouse_sensibility_to %1d%
Opcode.register(0x0e23, SanAndreasOpcodeMouse.getSensibility, 1, '${1} = get_mouse_sensibility', {false})
