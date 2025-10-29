-----------------------------------
-- * Variables
-----------------------------------

TextDraw = {}
TextDraw.__index = TextDraw

TextDraw.ALIGNMENT = {
    LEFT = 'left',
    CENTER = 'center',
    RIGHT = 'right'
}

TextDraw.enabled = false
TextDraw.shadow = { 0, 255, 255, 255, 255 }
TextDraw.letterSize = { 1, 1 }
TextDraw.color = { 255, 255, 255, 255 }
TextDraw.font = 1
TextDraw.lineWidth = -1
TextDraw.drawBehindTextures = false
TextDraw.alignment = TextDraw.ALIGNMENT.LEFT

-----------------------------------
-- * Functions
-----------------------------------

function TextDraw.reset()
    TextDraw.enabled = false
    TextDraw.shadow = { 0, 255, 255, 255, 255 }
    TextDraw.letterSize = { 1, 1 }
    TextDraw.color = { 255, 255, 255, 255 }
    TextDraw.font = 1
    TextDraw.lineWidth = -1
    TextDraw.drawBehindTextures = false
    TextDraw.centered = TextDraw.ALIGNMENT.LEFT
end

function TextDraw.setEnabled(enabled)
    TextDraw.enabled = enabled
end

function TextDraw.setShadow(weight, r, g, b, a)
    TextDraw.shadow = { weight, r, g, b, a }
end

function TextDraw.setLetterSize(x, y)
    TextDraw.letterSize = { x, y }
end

function TextDraw.setColor(r, g, b, a)
    TextDraw.color = { r, g, b, a }
end

function TextDraw.setFont(font)
    TextDraw.font = font
end

function TextDraw.setLineWidth(lineWidth)
    TextDraw.lineWidth = lineWidth
end

function TextDraw.setDrawBehindTextures(drawBehindTextures)
    TextDraw.drawBehindTextures = drawBehindTextures
end

function TextDraw.setAlignment(alignment)
    TextDraw.alignment = alignment
end

function TextDraw.drawText(text, posX, posY)
    posX = posX * (Game.screenWidth / 640)
    posY = posY * (Game.screenHeight / 480)

    local scaleWidth = TextDraw.letterSize[1] * (Game.screenWidth / 640)
    local scaleHeight = TextDraw.letterSize[2] * (Game.screenHeight / 480)
    local fontId = TextDraw.font

    local font = "default"

    local textWidth = dxGetTextWidth(text, scaleWidth, font, true)

    local lineWidth = textWidth
    local alignX = "left"

    if (TextDraw.lineWidth ~= -1) then
        lineWidth = TextDraw.lineWidth
    end

    if (TextDraw.alignment == TextDraw.ALIGNMENT.CENTER) then
        alignX = "center"
        lineWidth = (lineWidth / 2)
        posX = posX - (lineWidth / 2)
    elseif (TextDraw.alignment == TextDraw.ALIGNMENT.RIGHT) then
        alignX = "right"
        posX = posX - lineWidth
    end

    if (fontId == 1) then
        font = FONTS.futheavy
        scaleWidth = scaleWidth
        scaleHeight = scaleHeight / 4
    end

    local shadowWeight = TextDraw.shadow[1]

    if (shadowWeight ~= 0) then
        dxDrawText(text, posX + shadowWeight, posY + shadowWeight, posX + lineWidth + shadowWeight
            , Game.screenHeight, tocolor(TextDraw.shadow[2], TextDraw.shadow[3], TextDraw.shadow[4], TextDraw.shadow[5])
            , scaleWidth, scaleHeight, font, alignX, "top", false)
    end

    dxDrawText(text, posX, posY, posX + lineWidth, Game.screenHeight
        , tocolor(TextDraw.color[1], TextDraw.color[2], TextDraw.color[3], TextDraw.color[4])
        , scaleWidth, scaleHeight, font, alignX, "top", false)

    TextDraw.reset()
end

function TextDraw.drawRectangle(x, y, width, height, r, g, b, a)
    x = x * (Game.screenWidth / 640)
    y = y * (Game.screenHeight / 480)
    width = width * (Game.screenWidth / 640)
    height = height * (Game.screenHeight / 480)

    x = x - (width / 2)
    y = y - (height / 2)

    dxDrawRectangle(x, y, width, height, tocolor(r, g, b, a))
end