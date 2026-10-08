-----------------------------------
-- * Variables
-----------------------------------

Camera = {}
Camera.__index = Camera

Camera.fadeColor = { 0, 0, 0 }
Camera.fadeEnd = 0

Camera.SWITCH_TYPE = {
    NONE = 0,
    INTERPOLATION = 1,
    JUMPCUT = 2
}

-- CameraAnimation of the position and the look point, false when none
Camera.positionAnimation = false
Camera.lookAnimation = false

-- SA's persistPosition and persistTrack
Camera.persistPosition = false
Camera.persistLook = false

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

function Camera.setPersistPosition(state)
    Camera.persistPosition = state
end

function Camera.setPersistLook(state)
    Camera.persistLook = state
end

function Camera.resetScriptableComponents()
    Camera.persistPosition = false
    Camera.persistLook = false

    CameraShake.stop()
end

function Camera.setPosition(posX, posY, posZ)
    Camera.positionAnimation = false
    Camera.lookAnimation = false

    local camera = getCamera()
    local _, _, _, currentRotX, currentRotY, currentRotZ, roll, fov = getCameraMatrix(camera)

    setCameraMatrix(posX, posY, posZ, currentRotX, currentRotY, currentRotZ, roll, fov)
end

function Camera.setRotation(rotX, rotY, rotZ)
    setElementRotation(getCamera(), rotX, rotY, rotZ)
end

function Camera.setLookAtPoint(posX, posY, posZ)
    Camera.positionAnimation = false
    Camera.lookAnimation = false

    local camera = getCamera()
    local cameraX, cameraY, cameraZ, _, _, _ = getCameraMatrix(camera)

    setCameraMatrix(cameraX, cameraY, cameraZ, posX, posY, posZ)
end

function Camera.restoreToUserDefined()
    --setCameraTarget(PlayerElement.getLocalPlayer().element)
end

function Camera.pointWithSwitchStyle(posX, posY, posZ, switchStyle)
    Camera.lookAnimation = false

    -- Pan from the current view (not the game's transition curve), anything else cuts
    if (switchStyle == Camera.SWITCH_TYPE.INTERPOLATION) then
        local cameraX, cameraY, cameraZ, lookX, lookY, lookZ = getCameraMatrix()
        local position = RwVector3:create(cameraX, cameraY, cameraZ)
        local target = RwVector3:create(posX, posY, posZ)
        local front = (RwVector3:create(lookX, lookY, lookZ) - position):getNormalised()

        -- Start at the target's distance, a look point 1 unit ahead would rush the turn
        Camera.animateLookPoint(position + front * (target - position):getLength(), target, false, false, 3000)
    elseif (switchStyle == Camera.SWITCH_TYPE.NONE or switchStyle == Camera.SWITCH_TYPE.JUMPCUT) then
        Camera.setLookAtPoint(posX, posY, posZ)
    end
end

function Camera.animatePosition(startPoint, endPoint, ease, returnToStart, time)
    Camera.positionAnimation = CameraAnimation:create(startPoint, endPoint, ease, returnToStart, time)
end

function Camera.animateLookPoint(startPoint, endPoint, ease, returnToStart, time)
    Camera.lookAnimation = CameraAnimation:create(startPoint, endPoint, ease, returnToStart, time)
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
    Camera.positionAnimation = false
    Camera.lookAnimation = false

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

function Camera.processPositionAnimation(camera)
    local animation = Camera.positionAnimation

    if (not animation:isFinished()) then
        setElementPosition(camera, animation:getInterpolatedPoint():unpack())
        return
    end

    if (not Camera.persistPosition) then
        setElementPosition(camera, animation:getFinalPoint():unpack())
    end

    Camera.positionAnimation = false
end

function Camera.processLookAnimation(camera)
    local animation = Camera.lookAnimation
    local cameraX, cameraY, cameraZ = getElementPosition(camera)

    if (not animation:isFinished()) then
        setCameraMatrix(cameraX, cameraY, cameraZ, animation:getInterpolatedPoint():unpack())
        return
    end

    if (not Camera.persistLook) then
        setCameraMatrix(cameraX, cameraY, cameraZ, animation:getFinalPoint():unpack())
    end

    Camera.lookAnimation = false
end

function Camera.onPreFrame(timeSlice)
    local camera = getCamera()

    if (Camera.positionAnimation) then
        Camera.processPositionAnimation(camera)
    end

    if (Camera.lookAnimation) then
        Camera.processLookAnimation(camera)
    end

    CameraShake.process(timeSlice)
end

function Camera.cleanup()
    Camera.resetScriptableComponents()
    Camera.restore(true)
end
