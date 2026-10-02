SharedOpcodeImGui = {}
SharedOpcodeImGui.__index = SharedOpcodeImGui

-- Opcode: 0x2200
-- Instruction: imgui_begin_frame {uniqueId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2200
function SharedOpcodeImGui.beginFrame()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2201
-- Instruction: imgui_end_frame
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2201
function SharedOpcodeImGui.endFrame()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2202
-- Instruction: [var state: bool] = imgui_begin {windowName} [string] {state} [bool] {noTitleBar} [bool] {noResize} [bool] {noMove} [bool] {autoResize} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2202
function SharedOpcodeImGui.begin()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2203
-- Instruction: imgui_end
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2203
function SharedOpcodeImGui.endUI()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2204
-- Instruction: imgui_begin_mainmenubar {uniqueId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2204
function SharedOpcodeImGui.beginMainMenuBar()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2205
-- Instruction: imgui_end_mainmenubar
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2205
function SharedOpcodeImGui.endMainMenuBar()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2206
-- Instruction: imgui_begin_child {uniqueId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2206
function SharedOpcodeImGui.beginChild()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2207
-- Instruction: imgui_end_child
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2207
function SharedOpcodeImGui.endChild()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2208
-- Instruction: [var index: int] = imgui_tabs {name} [string] {tabNames} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2208
function SharedOpcodeImGui.tabs()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2209
-- Instruction: imgui_collapsing_header {label} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2209
function SharedOpcodeImGui.collapsingHeader()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x220A
-- Instruction: imgui_set_window_pos {x} [float] {y} [float] {imGuiCond} [ImGuiCond]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/220A
function SharedOpcodeImGui.setWindowPos()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x220B
-- Instruction: imgui_set_window_size {width} [float] {height} [float] {imGuiCond} [ImGuiCond]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/220B
function SharedOpcodeImGui.setWindowSize()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x220C
-- Instruction: imgui_set_next_window_pos {x} [float] {y} [float] {imGuiCond} [ImGuiCond]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/220C
function SharedOpcodeImGui.setNextWindowPos()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x220D
-- Instruction: imgui_set_next_window_size {width} [float] {height} [float] {imGuiCond} [ImGuiCond]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/220D
function SharedOpcodeImGui.setNextWindowSize()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x220E
-- Instruction: imgui_text {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/220E
function SharedOpcodeImGui.text()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x220F
-- Instruction: imgui_text_centered {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/220F
function SharedOpcodeImGui.textCentered()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2210
-- Instruction: imgui_text_disabled {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2210
function SharedOpcodeImGui.textDisabled()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2211
-- Instruction: imgui_text_wrapped {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2211
function SharedOpcodeImGui.textWrapped()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2212
-- Instruction: imgui_text_colored {text} [string] {red} [float] {green} [float] {blue} [float] {alpha} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2212
function SharedOpcodeImGui.textColored()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2213
-- Instruction: imgui_bullet_text {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2213
function SharedOpcodeImGui.textWithBullet()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2214
-- Instruction: imgui_bullet
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2214
function SharedOpcodeImGui.bullet()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2215
-- Instruction: [var state: bool] = imgui_checkbox {label} [string] {isChecked} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2215
function SharedOpcodeImGui.checkbox()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2216
-- Instruction: [var selected: int] = imgui_combo {name} [string] {options} [string] {selection} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2216
function SharedOpcodeImGui.comboBox()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2217
-- Instruction: imgui_set_tooltip {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2217
function SharedOpcodeImGui.setTooltip()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2218
-- Instruction: imgui_button {buttonName} [string] {width} [float] {height} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2218
function SharedOpcodeImGui.button()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2219
-- Instruction: imgui_image_button {name} [string] {image} [int] {width} [float] {height} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2219
function SharedOpcodeImGui.buttonImage()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x221A
-- Instruction: imgui_invisible_button {buttonName} [string] {width} [float] {height} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/221A
function SharedOpcodeImGui.buttonInvisible()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x221B
-- Instruction: imgui_color_button {buttonName} [string] {red} [float] {green} [float] {blue} [float] {alpha} [float] {width} [float] {height} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/221B
function SharedOpcodeImGui.buttonColored()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x221C
-- Instruction: imgui_arrow_button {name} [string] {imGuiDir} [ImGuiDir]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/221C
function SharedOpcodeImGui.buttonArrow()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x221D
-- Instruction: [var val: int] = imgui_slider_int {label} [string] {initValue} [int] {min} [int] {max} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/221D
function SharedOpcodeImGui.sliderInt()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x221E
-- Instruction: [var val: float] = imgui_slider_float {label} [string] {initValue} [float] {min} [float] {max} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/221E
function SharedOpcodeImGui.sliderFloat()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x221F
-- Instruction: [var val: int] = imgui_input_int {label} [string] {initValue} [int] {min} [int] {max} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/221F
function SharedOpcodeImGui.inputInt()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2220
-- Instruction: [var val: float] = imgui_input_float {label} [string] {initValue} [float] {min} [float] {max} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2220
function SharedOpcodeImGui.inputFloat()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2221
-- Instruction: [var text: string] = imgui_input_text {label} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2221
function SharedOpcodeImGui.inputText()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2222
-- Instruction: [var val: int] = imgui_radio_button {label} [string] {selectedBtn} [int] {btnNo} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2222
function SharedOpcodeImGui.radioButton()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2223
-- Instruction: [var red: int], [var green: int], [var blue: int], [var alpha: int] = imgui_color_picker {label} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2223
function SharedOpcodeImGui.colorPicker()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2224
-- Instruction: imgui_menu_item {text} [string] {selected} [bool] {enabled} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2224
function SharedOpcodeImGui.menuItem()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2225
-- Instruction: imgui_selectable {text} [string] {selected} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2225
function SharedOpcodeImGui.selectable()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2226
-- Instruction: imgui_dummy {width} [float] {height} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2226
function SharedOpcodeImGui.dummy()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2227
-- Instruction: imgui_sameline
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2227
function SharedOpcodeImGui.sameLine()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2228
-- Instruction: imgui_newline
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2228
function SharedOpcodeImGui.newLine()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2229
-- Instruction: imgui_columns {count} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2229
function SharedOpcodeImGui.columns()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x222A
-- Instruction: imgui_next_column
-- https://library.sannybuilder.com/#/sa/script/extensions/default/222A
function SharedOpcodeImGui.nextColumn()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x222B
-- Instruction: imgui_spacing
-- https://library.sannybuilder.com/#/sa/script/extensions/default/222B
function SharedOpcodeImGui.spacing()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x222C
-- Instruction: imgui_separator
-- https://library.sannybuilder.com/#/sa/script/extensions/default/222C
function SharedOpcodeImGui.separator()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x222D
-- Instruction: imgui_push_item_width {width} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/222D
function SharedOpcodeImGui.pushItemWidth()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x222E
-- Instruction: imgui_pop_item_width
-- https://library.sannybuilder.com/#/sa/script/extensions/default/222E
function SharedOpcodeImGui.popItemWidth()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x222F
-- Instruction: imgui_is_item_active {uniqueId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/222F
function SharedOpcodeImGui.isItemActive()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2230
-- Instruction: imgui_is_item_clicked {uniqueId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2230
function SharedOpcodeImGui.isItemClicked()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2231
-- Instruction: imgui_is_item_focused {uniqueId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2231
function SharedOpcodeImGui.isItemFocused()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2232
-- Instruction: imgui_is_item_hovered {uniqueId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2232
function SharedOpcodeImGui.isItemHovered()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2233
-- Instruction: imgui_set_item_int {id} [string] {val} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2233
function SharedOpcodeImGui.setItemValueInt()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2234
-- Instruction: imgui_set_item_float {id} [string] {val} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2234
function SharedOpcodeImGui.setItemValueFloat()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2235
-- Instruction: imgui_set_item_text {id} [string] {val} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2235
function SharedOpcodeImGui.setItemValueText()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2236
-- Instruction: imgui_set_image_bg_color {r} [float] {g} [float] {b} [float] {a} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2236
function SharedOpcodeImGui.setImageBgColor()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2237
-- Instruction: imgui_set_image_tint_color {r} [float] {g} [float] {b} [float] {a} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2237
function SharedOpcodeImGui.setImageTintColor()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2238
-- Instruction: [var image: int] = imgui_load_image {path} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2238
function SharedOpcodeImGui.loadImage()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2239
-- Instruction: imgui_free_image {image} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2239
function SharedOpcodeImGui.freeImage()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x223A
-- Instruction: imgui_push_style_var {imGuiStyleVar} [ImGuiStyleVar] {val} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/223A
function SharedOpcodeImGui.pushStyleVar()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x223B
-- Instruction: imgui_push_style_var2 {imGuiStyleVar} [ImGuiStyleVar] {x} [float] {y} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/223B
function SharedOpcodeImGui.pushStyleVar2()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x223C
-- Instruction: imgui_push_style_color {imGuiCol} [ImGuiCol] {r} [int] {g} [int] {b} [int] {a} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/223C
function SharedOpcodeImGui.pushStyleColor()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x223D
-- Instruction: imgui_pop_style_var {count} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/223D
function SharedOpcodeImGui.popStyleVar()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x223E
-- Instruction: imgui_pop_style_color {count} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/223E
function SharedOpcodeImGui.popStyleColor()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x223F
-- Instruction: [var drawList: int] = imgui_get_foreground_drawlist
-- https://library.sannybuilder.com/#/sa/script/extensions/default/223F
function SharedOpcodeImGui.getForegroundDrawList()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2240
-- Instruction: [var drawList: int] = imgui_get_background_drawlist
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2240
function SharedOpcodeImGui.getBackgroundDrawList()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2241
-- Instruction: [var drawList: int] = imgui_get_window_drawlist
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2241
function SharedOpcodeImGui.getWindowDrawlist()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2242
-- Instruction: imgui_drawlist_add_text {drawList} [int] {posX} [float] {posY} [float] {r} [int] {g} [int] {b} [int] {a} [int] {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2242
function SharedOpcodeImGui.addText()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2243
-- Instruction: imgui_drawlist_add_line {drawList} [int] {p1X} [float] {p1Y} [float] {p2X} [float] {p2Y} [float] {r} [int] {g} [int] {b} [int] {a} [int] {thickness} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2243
function SharedOpcodeImGui.addLine()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2245
-- Instruction: [var version: int] = imgui_get_version
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2245
function SharedOpcodeImGui.getVersion()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2246
-- Instruction: [var version: int] = imgui_get_plugin_version
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2246
function SharedOpcodeImGui.getPluginVersion()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2247
-- Instruction: imgui_set_cursor_visible {show} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2247
function SharedOpcodeImGui.setCursorVisible()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2248
-- Instruction: [var height: float] = imgui_get_frame_height
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2248
function SharedOpcodeImGui.getFrameHeight()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2249
-- Instruction: [var x: float], [var y: float] = imgui_get_window_pos {uniqueId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2249
function SharedOpcodeImGui.getWindowPos()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x224A
-- Instruction: [var width: float], [var height: float] = imgui_get_window_size {uniqueId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/224A
function SharedOpcodeImGui.getWindowSize()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x224B
-- Instruction: [var width: float], [var height: float] = imgui_calc_text_size {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/224B
function SharedOpcodeImGui.calcTextSize()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x224C
-- Instruction: [var width: float] = imgui_get_window_content_region_width {uniqueId} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/224C
function SharedOpcodeImGui.getWindowContentRegionWidth()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x224D
-- Instruction: [var x: float], [var y: float] = imgui_get_scaling_size {uniqueId} [string] {count} [int] {spacing} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/224D
function SharedOpcodeImGui.getScalingSize()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x224E
-- Instruction: [var width: float], [var height: float] = imgui_get_display_size
-- https://library.sannybuilder.com/#/sa/script/extensions/default/224E
function SharedOpcodeImGui.getDisplaySize()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x224F
-- Instruction: imgui_set_next_window_transparency {alpha} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/224F
function SharedOpcodeImGui.setNextWindowTransparency()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2250
-- Instruction: imgui_set_message {text} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2250
function SharedOpcodeImGui.setMessage()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2251
-- Instruction: imgui_set_column_width {index} [int] {width} [float]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2251
function SharedOpcodeImGui.setColumnWidth()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2252
-- Instruction: imgui_begin_childex {uniqueId} [string] {width} [float] {height} [float] {border} [bool] {flags} [int]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2252
function SharedOpcodeImGui.beginChildEx()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2253
-- Instruction: imgui_begin_disabled {disabled} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2253
function SharedOpcodeImGui.beginDisabled()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2254
-- Instruction: imgui_end_disabled
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2254
function SharedOpcodeImGui.endDisabled()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2255
-- Instruction: imgui_begin_menu {label} [string] {enabled} [bool]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2255
function SharedOpcodeImGui.beginMenu()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2256
-- Instruction: imgui_end_menu
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2256
function SharedOpcodeImGui.endMenu()
   return Script.setOpcodeUnimplemented()
end


Opcode.register(0x2200, SharedOpcodeImGui.beginFrame, 1, 'imgui_begin_frame ${1}')
Opcode.register(0x2201, SharedOpcodeImGui.endFrame, 0, 'imgui_end_frame')
Opcode.register(0x2202, SharedOpcodeImGui.begin, 7, '${1} = imgui_begin ${2} ${3} ${4} ${5} ${6} ${7}')
Opcode.register(0x2203, SharedOpcodeImGui.endUI, 0, 'imgui_end')
Opcode.register(0x2204, SharedOpcodeImGui.beginMainMenuBar, 1, 'imgui_begin_mainmenubar ${1}')
Opcode.register(0x2205, SharedOpcodeImGui.endMainMenuBar, 0, 'imgui_end_mainmenubar')
Opcode.register(0x2206, SharedOpcodeImGui.beginChild, 1, 'imgui_begin_child ${1}')
Opcode.register(0x2207, SharedOpcodeImGui.endChild, 0, 'imgui_end_child')
Opcode.register(0x2208, SharedOpcodeImGui.tabs, 3, '${1} = imgui_tabs ${2} ${3}')
Opcode.register(0x2209, SharedOpcodeImGui.collapsingHeader, 1, 'imgui_collapsing_header ${1}')
Opcode.register(0x220a, SharedOpcodeImGui.setWindowPos, 3, 'imgui_set_window_pos ${1} ${2} ${3}')
Opcode.register(0x220b, SharedOpcodeImGui.setWindowSize, 3, 'imgui_set_window_size ${1} ${2} ${3}')
Opcode.register(0x220c, SharedOpcodeImGui.setNextWindowPos, 3, 'imgui_set_next_window_pos ${1} ${2} ${3}')
Opcode.register(0x220d, SharedOpcodeImGui.setNextWindowSize, 3, 'imgui_set_next_window_size ${1} ${2} ${3}')
Opcode.register(0x220e, SharedOpcodeImGui.text, 1, 'imgui_text ${1}')
Opcode.register(0x220f, SharedOpcodeImGui.textCentered, 1, 'imgui_text_centered ${1}')
Opcode.register(0x2210, SharedOpcodeImGui.textDisabled, 1, 'imgui_text_disabled ${1}')
Opcode.register(0x2211, SharedOpcodeImGui.textWrapped, 1, 'imgui_text_wrapped ${1}')
Opcode.register(0x2212, SharedOpcodeImGui.textColored, 5, 'imgui_text_colored ${1} ${2} ${3} ${4} ${5}')
Opcode.register(0x2213, SharedOpcodeImGui.textWithBullet, 1, 'imgui_bullet_text ${1}')
Opcode.register(0x2214, SharedOpcodeImGui.bullet, 0, 'imgui_bullet')
Opcode.register(0x2215, SharedOpcodeImGui.checkbox, 3, '${1} = imgui_checkbox ${2} ${3}')
Opcode.register(0x2216, SharedOpcodeImGui.comboBox, 4, '${1} = imgui_combo ${2} ${3} ${4}')
Opcode.register(0x2217, SharedOpcodeImGui.setTooltip, 1, 'imgui_set_tooltip ${1}')
Opcode.register(0x2218, SharedOpcodeImGui.button, 3, 'imgui_button ${1} ${2} ${3}')
Opcode.register(0x2219, SharedOpcodeImGui.buttonImage, 4, 'imgui_image_button ${1} ${2} ${3} ${4}')
Opcode.register(0x221a, SharedOpcodeImGui.buttonInvisible, 3, 'imgui_invisible_button ${1} ${2} ${3}')
Opcode.register(0x221b, SharedOpcodeImGui.buttonColored, 7, 'imgui_color_button ${1} ${2} ${3} ${4} ${5} ${6} ${7}')
Opcode.register(0x221c, SharedOpcodeImGui.buttonArrow, 2, 'imgui_arrow_button ${1} ${2}')
Opcode.register(0x221d, SharedOpcodeImGui.sliderInt, 5, '${1} = imgui_slider_int ${2} ${3} ${4} ${5}')
Opcode.register(0x221e, SharedOpcodeImGui.sliderFloat, 5, '${1} = imgui_slider_float ${2} ${3} ${4} ${5}')
Opcode.register(0x221f, SharedOpcodeImGui.inputInt, 5, '${1} = imgui_input_int ${2} ${3} ${4} ${5}')
Opcode.register(0x2220, SharedOpcodeImGui.inputFloat, 5, '${1} = imgui_input_float ${2} ${3} ${4} ${5}')
Opcode.register(0x2221, SharedOpcodeImGui.inputText, 2, '${1} = imgui_input_text ${2}')
Opcode.register(0x2222, SharedOpcodeImGui.radioButton, 4, '${1} = imgui_radio_button ${2} ${3} ${4}')
Opcode.register(0x2223, SharedOpcodeImGui.colorPicker, 5, '${1}, ${2}, ${3}, ${4} = imgui_color_picker ${5}')
Opcode.register(0x2224, SharedOpcodeImGui.menuItem, 3, 'imgui_menu_item ${1} ${2} ${3}')
Opcode.register(0x2225, SharedOpcodeImGui.selectable, 2, 'imgui_selectable ${1} ${2}')
Opcode.register(0x2226, SharedOpcodeImGui.dummy, 2, 'imgui_dummy ${1} ${2}')
Opcode.register(0x2227, SharedOpcodeImGui.sameLine, 0, 'imgui_sameline')
Opcode.register(0x2228, SharedOpcodeImGui.newLine, 0, 'imgui_newline')
Opcode.register(0x2229, SharedOpcodeImGui.columns, 1, 'imgui_columns ${1}')
Opcode.register(0x222a, SharedOpcodeImGui.nextColumn, 0, 'imgui_next_column')
Opcode.register(0x222b, SharedOpcodeImGui.spacing, 0, 'imgui_spacing')
Opcode.register(0x222c, SharedOpcodeImGui.separator, 0, 'imgui_separator')
Opcode.register(0x222d, SharedOpcodeImGui.pushItemWidth, 1, 'imgui_push_item_width ${1}')
Opcode.register(0x222e, SharedOpcodeImGui.popItemWidth, 0, 'imgui_pop_item_width')
Opcode.register(0x222f, SharedOpcodeImGui.isItemActive, 1, 'imgui_is_item_active ${1}')
Opcode.register(0x2230, SharedOpcodeImGui.isItemClicked, 1, 'imgui_is_item_clicked ${1}')
Opcode.register(0x2231, SharedOpcodeImGui.isItemFocused, 1, 'imgui_is_item_focused ${1}')
Opcode.register(0x2232, SharedOpcodeImGui.isItemHovered, 1, 'imgui_is_item_hovered ${1}')
Opcode.register(0x2233, SharedOpcodeImGui.setItemValueInt, 2, 'imgui_set_item_int ${1} ${2}')
Opcode.register(0x2234, SharedOpcodeImGui.setItemValueFloat, 2, 'imgui_set_item_float ${1} ${2}')
Opcode.register(0x2235, SharedOpcodeImGui.setItemValueText, 2, 'imgui_set_item_text ${1} ${2}')
Opcode.register(0x2236, SharedOpcodeImGui.setImageBgColor, 4, 'imgui_set_image_bg_color ${1} ${2} ${3} ${4}')
Opcode.register(0x2237, SharedOpcodeImGui.setImageTintColor, 4, 'imgui_set_image_tint_color ${1} ${2} ${3} ${4}')
Opcode.register(0x2238, SharedOpcodeImGui.loadImage, 2, '${1} = imgui_load_image ${2}')
Opcode.register(0x2239, SharedOpcodeImGui.freeImage, 1, 'imgui_free_image ${1}')
Opcode.register(0x223a, SharedOpcodeImGui.pushStyleVar, 2, 'imgui_push_style_var ${1} ${2}')
Opcode.register(0x223b, SharedOpcodeImGui.pushStyleVar2, 3, 'imgui_push_style_var2 ${1} ${2} ${3}')
Opcode.register(0x223c, SharedOpcodeImGui.pushStyleColor, 5, 'imgui_push_style_color ${1} ${2} ${3} ${4} ${5}')
Opcode.register(0x223d, SharedOpcodeImGui.popStyleVar, 1, 'imgui_pop_style_var ${1}')
Opcode.register(0x223e, SharedOpcodeImGui.popStyleColor, 1, 'imgui_pop_style_color ${1}')
Opcode.register(0x223f, SharedOpcodeImGui.getForegroundDrawList, 1, '${1} = imgui_get_foreground_drawlist')
Opcode.register(0x2240, SharedOpcodeImGui.getBackgroundDrawList, 1, '${1} = imgui_get_background_drawlist')
Opcode.register(0x2241, SharedOpcodeImGui.getWindowDrawlist, 1, '${1} = imgui_get_window_drawlist')
Opcode.register(0x2242, SharedOpcodeImGui.addText, 8, 'imgui_drawlist_add_text ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8}')
Opcode.register(0x2243, SharedOpcodeImGui.addLine, 10, 'imgui_drawlist_add_line ${1} ${2} ${3} ${4} ${5} ${6} ${7} ${8} ${9} ${10}')
Opcode.register(0x2245, SharedOpcodeImGui.getVersion, 1, '${1} = imgui_get_version')
Opcode.register(0x2246, SharedOpcodeImGui.getPluginVersion, 1, '${1} = imgui_get_plugin_version')
Opcode.register(0x2247, SharedOpcodeImGui.setCursorVisible, 1, 'imgui_set_cursor_visible ${1}')
Opcode.register(0x2248, SharedOpcodeImGui.getFrameHeight, 1, '${1} = imgui_get_frame_height')
Opcode.register(0x2249, SharedOpcodeImGui.getWindowPos, 3, '${1}, ${2} = imgui_get_window_pos ${3}')
Opcode.register(0x224a, SharedOpcodeImGui.getWindowSize, 3, '${1}, ${2} = imgui_get_window_size ${3}')
Opcode.register(0x224b, SharedOpcodeImGui.calcTextSize, 3, '${1}, ${2} = imgui_calc_text_size ${3}')
Opcode.register(0x224c, SharedOpcodeImGui.getWindowContentRegionWidth, 2, '${1} = imgui_get_window_content_region_width ${2}')
Opcode.register(0x224d, SharedOpcodeImGui.getScalingSize, 5, '${1}, ${2} = imgui_get_scaling_size ${3} ${4} ${5}')
Opcode.register(0x224e, SharedOpcodeImGui.getDisplaySize, 2, '${1}, ${2} = imgui_get_display_size')
Opcode.register(0x224f, SharedOpcodeImGui.setNextWindowTransparency, 1, 'imgui_set_next_window_transparency ${1}')
Opcode.register(0x2250, SharedOpcodeImGui.setMessage, 1, 'imgui_set_message ${1}')
Opcode.register(0x2251, SharedOpcodeImGui.setColumnWidth, 2, 'imgui_set_column_width ${1} ${2}')
Opcode.register(0x2252, SharedOpcodeImGui.beginChildEx, 5, 'imgui_begin_childex ${1} ${2} ${3} ${4} ${5}')
Opcode.register(0x2253, SharedOpcodeImGui.beginDisabled, 1, 'imgui_begin_disabled ${1}')
Opcode.register(0x2254, SharedOpcodeImGui.endDisabled, 0, 'imgui_end_disabled')
Opcode.register(0x2255, SharedOpcodeImGui.beginMenu, 2, 'imgui_begin_menu ${1} ${2}')
Opcode.register(0x2256, SharedOpcodeImGui.endMenu, 0, 'imgui_end_menu')
