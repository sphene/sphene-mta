SanAndreasOpcodeDebugger = {}
SanAndreasOpcodeDebugger.__index = SanAndreasOpcodeDebugger

-- Opcode: 0x05A0
-- Instruction: is_debug_camera_on
-- https://library.sannybuilder.com/#/sa/script/extensions/default/05A0
function SanAndreasOpcodeDebugger.isDebugCameraOn()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2100
-- Instruction: breakpoint {blocking} [literal bool] {text} [string] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2100
function SanAndreasOpcodeDebugger.breakpoint()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2101
-- Instruction: trace {text} [string] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2101
function SanAndreasOpcodeDebugger.trace()
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x2102
-- Instruction: log_to_file {filename} [string] {timestamp} [bool] {text} [string] {args} [arguments]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/2102
function SanAndreasOpcodeDebugger.logLine()
   return Script.setOpcodeUnimplemented()
end


-- INI: 05a0=0,  is_unused_camera_world_viewer_being_used
Opcode.register(0x05a0, SanAndreasOpcodeDebugger.isDebugCameraOn, 0, 'is_debug_camera_on', {})
Opcode.register(0x2100, SanAndreasOpcodeDebugger.breakpoint, -1, 'breakpoint ${1} ${2}', {})
Opcode.register(0x2101, SanAndreasOpcodeDebugger.trace, -1, 'trace ${1}', {})
Opcode.register(0x2102, SanAndreasOpcodeDebugger.logLine, -1, 'log_to_file ${1} ${2} ${3}', {})
