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


Opcode.register(0x0d61, SanAndreasOpcodeTexture.loadFromBmpFile, '[var texture: any] = load_texture_from_bmp_file {bmp} [string] {mask} [string]')
Opcode.register(0x0d64, SanAndreasOpcodeTexture.loadFromPngFile, '[var texture: any] = load_texture_from_png_file {png} [string]')
Opcode.register(0x0d7c, SanAndreasOpcodeTexture.loadFromDdsFile, '[var texture: any] = load_texture_from_dds_file {dds} [string]')
Opcode.register(0x0d7d, SanAndreasOpcodeTexture.cleanLoaded, 'clean_loaded_texture [Texture]')
