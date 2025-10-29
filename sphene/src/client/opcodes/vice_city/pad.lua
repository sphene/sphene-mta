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


Opcode.register(0x0601, ViceCityOpcodePad.isButtonPressedWithSensitivity, 'is_char_stopped_in_angled_area_in_car_3d [Char] {leftBottomX} [float] {leftBottomY} [float] {leftBottomZ} [float] {rightTopX} [float] {rightTopY} [float] {rightTopZ} [float] {angle} [float] {drawSphere} [bool]')
Opcode.register(0x0602, ViceCityOpcodePad.emulateButtonPressWithSensitivity, 'is_char_in_taxi [Char]')
Opcode.register(0x0585, ViceCityOpcodePad.isInCarFireButtonPressed, 'is_in_car_fire_button_pressed')
