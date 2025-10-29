-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local positionAnimation = {}
local lookPointAnimation = {}

-----------------------------------
-- * Variables
-----------------------------------

Camera = {}
Camera.__index = Camera

Camera.fadeColor = { 0, 0, 0 }
Camera.fadeEnd = 0

-----------------------------------
-- * Functions
-----------------------------------

function Camera.setTarget(target)
    if (target == nil or target == false) then
        return
    end

    local x, y, z = target:getPosition()

    if (type(target) == "table") then
        target = target.element
    end

    setCameraTarget(x, y, z)

    if (isElement(target)) then
        setCameraTarget(target)
    end
end

function Camera.setFadeColor(r, g, b)
    Camera.fadeColor = { r, g, b }
end

function Camera.setShakeLevel(intensity)
    setCameraDrunkLevel(intensity)
end

function Camera.setPosition(posX, posY, posZ)
    positionAnimation = {}
    lookPointAnimation = {}

    local camera = getCamera()
    local _, _, _, currentRotX, currentRotY, currentRotZ, roll, fov = getCameraMatrix(camera)

    setCameraMatrix(posX, posY, posZ, currentRotX, currentRotY, currentRotZ, roll, fov)
end

function Camera.setRotation(rotX, rotY, rotZ)
    setElementRotation(getCamera(), rotX, rotY, rotZ)
end

function Camera.setLookAtPoint(posX, posY, posZ)
    positionAnimation = {}
    lookPointAnimation = {}

    local camera = getCamera()
    local cameraX, cameraY, cameraZ, _, _, _ = getCameraMatrix(camera)

    setCameraMatrix(cameraX, cameraY, cameraZ, posX, posY, posZ)
end

function Camera.restoreToUserDefined()
    --setCameraTarget(PlayerElement.getLocalPlayer().element)
end

function Camera.pointWithSwitchStyle(posX, posY, posZ, switchstyle)
    lookPointAnimation = {}

    if (switchStyle == 1) then
        local camera = getCamera()
        --local cameraX, cameraY, cameraZ = getElementPosition(camera)
        local _, _, _, lookX, lookY, lookZ = getElementMatrix(camera)

        Camera.animateLookPoint(lookX or posX, lookY or posY, lookZ or posZ, posX, posY, posZ, false, false, 3000)
    else
        Camera.setLookAtPoint(posX, posY, posZ)
    end
end

function Camera.animatePosition(posX, posY, posZ, endX, endY, endZ, ease, returnToStart, time)
    positionAnimation = {
        startX = posX,
        startY = posY,
        startZ = posZ,
        endX = endX,
        endY = endY,
        endZ = endZ,
        ease = ease,
        returnToStart = returnToStart,
        startTick = getTickCount(),
        endTick = getTickCount() + time
    }
end

function Camera.animateLookPoint(posX, posY, posZ, endX, endY, endZ, ease, returnToStart, time)
    lookPointAnimation = {
        startX = posX,
        startY = posY,
        startZ = posZ,
        endX = endX,
        endY = endY,
        endZ = endZ,
        ease = ease,
        returnToStart = returnToStart,
        startTick = getTickCount(),
        endTick = getTickCount() + time
    }
end

function Camera.fade(fade, time)
    if (fade) then
        fadeCamera(true, time / 1000, Camera.fadeColor[1], Camera.fadeColor[2], Camera.fadeColor[3])
    else
        fadeCamera(false, time / 1000, Camera.fadeColor[1], Camera.fadeColor[2], Camera.fadeColor[3])
    end

    Camera.fadeEnd = getTickCount() + time
end

function Camera.restore(withJumpCut)
    positionAnimation = {}
    lookPointAnimation = {}

    -- TODO: Add a animation to restore the camera if withJumpCut is false

    Camera.setTarget(PlayerElement.getLocalPlayer())
end

function Camera.isFading()
    return getTickCount() < Camera.fadeEnd
end

function Camera.getAsElement()
    return getCamera()
end

function Camera.getTarget()
    local camera = getCamera()
    local target = getCameraTarget(camera)

    if isElement(target) then
        return ElementManager.getElementFromHandle(target)
    end

    return nil
end

function Camera.onPreFrame()
    if (positionAnimation.startX ~= nil) then
        local camera = getCamera()

        if (getTickCount() > positionAnimation.endTick) then
            if (positionAnimation.returnToStart) then
                setElementPosition(camera, positionAnimation.startX, positionAnimation.startY, positionAnimation.startZ)
            else
                setElementPosition(camera, positionAnimation.endX, positionAnimation.endY, positionAnimation.endZ)
            end

            positionAnimation = {}
        else
            local progress =
                1 / ((positionAnimation.endTick - positionAnimation.startTick) / (getTickCount() - positionAnimation.startTick))

            if (positionAnimation.ease) then
                progress = getEasingValue(progress, "InOutQuad")
            end

            local animX = positionAnimation.startX + ((positionAnimation.endX - positionAnimation.startX) * progress)
            local animY = positionAnimation.startY + ((positionAnimation.endY - positionAnimation.startY) * progress)
            local animZ = positionAnimation.startZ + ((positionAnimation.endZ - positionAnimation.startZ) * progress)

            setElementPosition(camera, animX, animY, animZ)
        end
    end

    if (lookPointAnimation.startX ~= nil) then
        local camera = getCamera()
        local cameraX, cameraY, cameraZ = getElementPosition(camera)

        if (getTickCount() > lookPointAnimation.endTick) then
            if (lookPointAnimation.returnToStart) then
                setCameraMatrix(cameraX, cameraY, cameraZ, lookPointAnimation.startX, lookPointAnimation.startY, lookPointAnimation.startZ)
            else
                setCameraMatrix(cameraX, cameraY, cameraZ, lookPointAnimation.endX, lookPointAnimation.endY, lookPointAnimation.endZ)
            end

            lookPointAnimation = {}
        else
            local progress =
                1 / ((lookPointAnimation.endTick - lookPointAnimation.startTick) / (getTickCount() - lookPointAnimation.startTick))

            if (lookPointAnimation.ease) then
                progress = getEasingValue(progress, "InOutQuad")
            end

            local animX = lookPointAnimation.startX + ((lookPointAnimation.endX - lookPointAnimation.startX) * progress)
            local animY = lookPointAnimation.startY + ((lookPointAnimation.endY - lookPointAnimation.startY) * progress)
            local animZ = lookPointAnimation.startZ + ((lookPointAnimation.endZ - lookPointAnimation.startZ) * progress)

            setCameraMatrix(cameraX, cameraY, cameraZ, animX, animY, animZ)
        end
    end
end

function Camera.cleanup()
    Camera.restore(true)
end