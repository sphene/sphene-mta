SanAndreasOpcodeTexture = {}
SanAndreasOpcodeTexture.__index = SanAndreasOpcodeTexture

-- Opcode: 0x0D61
-- Instruction: [var texture: any] = load_texture_from_bmp_file {bmp} [string] {mask} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D61
function SanAndreasOpcodeTexture.loadFromBmpFile(_, _, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D64
-- Instruction: [var texture: any] = load_texture_from_png_file {png} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D64
function SanAndreasOpcodeTexture.loadFromPngFile(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D7C
-- Instruction: [var texture: any] = load_texture_from_dds_file {dds} [string]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D7C
function SanAndreasOpcodeTexture.loadFromDdsFile(_, _)
   return Script.setOpcodeUnimplemented()
end

-- Opcode: 0x0D7D
-- Instruction: clean_loaded_texture [Texture]
-- https://library.sannybuilder.com/#/sa/script/extensions/default/0D7D
function SanAndreasOpcodeTexture.cleanLoaded(_)
   return Script.setOpcodeUnimplemented()
end


-- INI: 0D61=3, %3d% = load_texture_bmp_from %1s% with_mask %2s% // IF and SET
Opcode.register(0x0d61, SanAndreasOpcodeTexture.loadFromBmpFile, 3, '${3} = load_texture_from_bmp_file ${1} ${2}', {false, false, true})
-- INI: 0D64=2, %2d% = load_texture_png_from %1s% // IF and SET
Opcode.register(0x0d64, SanAndreasOpcodeTexture.loadFromPngFile, 2, '${1} = load_texture_from_png_file ${2}', {true, false})
-- INI: 0D7C=2, %2d% = load_texture_dds_from %1s% // IF and SET
Opcode.register(0x0d7c, SanAndreasOpcodeTexture.loadFromDdsFile, 2, '${1} = load_texture_from_dds_file ${2}', {true, false})
-- INI: 0D7D=1,clean_loaded_texture %1d%
Opcode.register(0x0d7d, SanAndreasOpcodeTexture.cleanLoaded, 1, 'clean_loaded_texture ${1}', {false})
