SharedOpcodePad = {}
SharedOpcodePad.__index = SharedOpcodePad

-- Opcode: 0x00E1
-- Instruction: is_button_pressed {pad} [PadId] {buttonId} [Button]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/00E1
function SharedOpcodePad.isButtonPressed(player, key)
    if (player == 1) then
        return false
    end

    return Pad.isKeyPressed(key)
end

-- Opcode: 0x0293
-- Instruction: [var mode: ControllerMode] = get_controller_mode
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0293
function SharedOpcodePad.getControllerMode()
    Script.setOpcodePartiallyImplemented()
    return 0
end

-- Opcode: 0x03FD
-- Instruction: set_drunk_input_delay {pad} [PadId] {delay} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/03FD
function SharedOpcodePad.setDrunkInputDelay(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0494
-- Instruction: [var leftStickX: int], [var leftStickY: int], [var rightStickX: int], [var rightStickY: int] = get_position_of_analogue_sticks {pad} [PadId]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0494
function SharedOpcodePad.getPositionOfAnalogueSticks(_, _, _, _, _)
    local rightAnalogState = Pad.getAnalogState('right')

    if rightAnalogState == 0 then
        rightAnalogState = Pad.isControlPressed('right') and 1 or (Pad.isControlPressed('left') and -1 or 0)
    end

    local forwardsAnalogState = Pad.getAnalogState('forwards')

    if forwardsAnalogState == 0 then
        forwardsAnalogState = Pad.isControlPressed('forwards') and 1 or (Pad.isControlPressed('backwards') and -1 or 0)
    end

    local specialControlRightState = Pad.getAnalogState('special_control_right')

    if specialControlRightState == 0 then
        specialControlRightState = Pad.isControlPressed('special_control_right') and 1 or (Pad.isControlPressed('special_control_left') and -1 or 0)
    end

    local specialControlUpState = Pad.getAnalogState('special_control_up')

    if specialControlUpState == 0 then
        specialControlUpState = Pad.isControlPressed('special_control_up') and 1 or (Pad.isControlPressed('special_control_down') and -1 or 0)
    end

    Script.storeValueAtIndex(2, rightAnalogState)
    Script.storeValueAtIndex(3, forwardsAnalogState)
    Script.storeValueAtIndex(4, specialControlRightState)
    Script.storeValueAtIndex(5, specialControlUpState)
end

-- Opcode: 0x0AB0
-- Instruction: is_key_pressed {keyCode} [KeyCode]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0AB0
function SharedOpcodePad.isKeyPressed(code)
   return Pad.isKeyPressedByCode(code)
end

-- Opcode: 0x0ADC
-- Instruction: test_cheat {input} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0ADC
function SharedOpcodePad.testCheat(_)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x00e1, SharedOpcodePad.isButtonPressed, 'is_button_pressed {pad} [PadId] {buttonId} [Button]')
Opcode.register(0x0293, SharedOpcodePad.getControllerMode, '[var mode: ControllerMode] = get_controller_mode')
Opcode.register(0x03fd, SharedOpcodePad.setDrunkInputDelay, 'set_drunk_input_delay {pad} [PadId] {delay} [int]')
Opcode.register(0x0494, SharedOpcodePad.getPositionOfAnalogueSticks, '[var leftStickX: int], [var leftStickY: int], [var rightStickX: int], [var rightStickY: int] = get_position_of_analogue_sticks {pad} [PadId]')
Opcode.register(0x0ab0, SharedOpcodePad.isKeyPressed, 'is_key_pressed {keyCode} [KeyCode]')
Opcode.register(0x0adc, SharedOpcodePad.testCheat, 'test_cheat {input} [string]')
