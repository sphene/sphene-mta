SanAndreasOpcodeMenuGrid = {}
SanAndreasOpcodeMenuGrid.__index = SanAndreasOpcodeMenuGrid

-- Opcode: 0x0964
-- Instruction: [var handle: MenuGrid] = create_menu_grid {header} [gxt_key] {topLeftX} [float] {topLeftY} [float] {width} [float] {numColumns} [int] {interactive} [bool] {background} [bool] {alignment} [Align]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0964
function SanAndreasOpcodeMenuGrid.create(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x0964, SanAndreasOpcodeMenuGrid.create, '[var handle: MenuGrid] = create_menu_grid {header} [gxt_key] {topLeftX} [float] {topLeftY} [float] {width} [float] {numColumns} [int] {interactive} [bool] {background} [bool] {alignment} [Align]')
