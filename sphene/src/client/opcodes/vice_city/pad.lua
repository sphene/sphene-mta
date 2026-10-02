ViceCityOpcodePad = {}
ViceCityOpcodePad.__index = ViceCityOpcodePad

-- Opcode: 0x0601
-- Instruction: is_char_stopped_in_angled_area_in_car_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0601
function ViceCityOpcodePad.isButtonPressedWithSensitivity(_, _, _, _, _, _, _, _, _)
    return Script.setOpcodePartiallyImplemented()
end

-- Opcode: 0x0602
-- Instruction: is_char_in_taxi [Char]
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0602
function ViceCityOpcodePad.emulateButtonPressWithSensitivity(actor)
    local vehicle = actor:getOccupiedVehicle()

    if (vehicle) then
        return vehicle:getVehicleType() == 'car' and vehicle:getVehicleClass() == 'taxi'
    end

    return false
end

-- Opcode: 0x0585
-- Instruction: is_in_car_fire_button_pressed
-- https://library.sannybuilder.com/#/vc/script/extensions/default/0585
function ViceCityOpcodePad.isInCarFireButtonPressed()
   return Script.setOpcodeUnimplemented()
end


-- INI: 0601=2, is_button_pressed_on_pad %1d% with_sensitivity %2d%
Opcode.register(0x0601, ViceCityOpcodePad.isButtonPressedWithSensitivity, 9, 'is_char_stopped_in_angled_area_in_car_3d ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9}', {false, false, false, false, false, false, false, false, false})
-- INI: 0602=2, emulate_button_press_on_pad %1d% with_sensitivity %2d%
Opcode.register(0x0602, ViceCityOpcodePad.emulateButtonPressWithSensitivity, 1, 'is_char_in_taxi ${1}', {false})
-- INI: 0585=0,  in_car_fire_button_pressed
Opcode.register(0x0585, ViceCityOpcodePad.isInCarFireButtonPressed, 0, 'is_in_car_fire_button_pressed', {})
