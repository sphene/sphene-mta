SanAndreasOpcodeMenuGrid = {}
SanAndreasOpcodeMenuGrid.__index = SanAndreasOpcodeMenuGrid

-- Opcode: 0x0964
-- Instruction: [var handle: MenuGrid] = create_menu_grid {header} [gxt_key] {topLeftX} [float] {topLeftY} [float] {width} [float] {numColumns} [int] {interactive} [bool] {background} [bool] {alignment} [Align]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0964
function SanAndreasOpcodeMenuGrid.create(_, _, _, _, _, _, _, _, _)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0964=9,create_square_color_panel %1g% position %2d% %3d% width %4d% columns %5h% interactive %6h% background %7h% alignment %8h% panelID %9d%
Opcode.register(0x0964, SanAndreasOpcodeMenuGrid.create, 9, '${9} = create_menu_grid ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}', {false, false, false, false, false, false, false, false, true})
