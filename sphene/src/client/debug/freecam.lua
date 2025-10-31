-----------------------------------
-- * Locals
-----------------------------------

local screenWidth, screenHeight = guiGetScreenSize()

local cameraRotX, cameraRotY = 0, 0
local mouseSensitivity = 0.15
local moveSpeed = 0.05

-----------------------------------
-- * Variables
-----------------------------------

Freecam = {}
Freecam.__index = Freecam

Freecam.enabled = false

-----------------------------------
-- * Functions
-----------------------------------

function Freecam.enable()
    setElementFrozen(localPlayer, true)

    local x, y, z, lookX, lookY, lookZ = getCameraMatrix()

    setElementPosition(getCamera(), x, y, z)
    setCameraTarget(lookX, lookY, lookZ)

    setAnalogControlState("forwards", 0)
    setAnalogControlState("left", 0)
    setAnalogControlState("accelerate", 0)
    setAnalogControlState("brake_reverse", 0)

    toggleAllControls(true, true, true)

    Freecam.enabled = true

    addEventHandler("onClientPreRender", root, Freecam.preRender)
    addEventHandler("onClientCursorMove", root, Freecam.onMouseMove)
    addEventHandler("onClientKey", root, Freecam.onKey)
end

function Freecam.disable()
    setElementFrozen(localPlayer, false)

    Freecam.enabled = false

    removeEventHandler("onClientPreRender", root, Freecam.preRender)
    removeEventHandler("onClientCursorMove", root, Freecam.onMouseMove)
    removeEventHandler("onClientKey", root, Freecam.onKey)
end

function Freecam.preRender(delta)
    local x, y, z, _, _, _ = getCameraMatrix()

    if (getPedControlState(localPlayer, "forwards") or getPedControlState(localPlayer, "accelerate")) then
        x = x + math.sin(-math.rad(cameraRotY)) * (moveSpeed * delta)
        y = y + math.cos(-math.rad(cameraRotY)) * (moveSpeed * delta)
    end

    if (getPedControlState(localPlayer, "backwards") or getPedControlState(localPlayer, "brake_reverse")) then
        x = x - math.sin(-math.rad(cameraRotY)) * (moveSpeed * delta)
        y = y - math.cos(-math.rad(cameraRotY)) * (moveSpeed * delta)
    end

    if (getPedControlState(localPlayer, "left") or getPedControlState(localPlayer, "vehicle_left")) then
        x = x + math.sin(-math.rad(cameraRotY + 90)) * (moveSpeed * delta)
        y = y + math.cos(-math.rad(cameraRotY + 90)) * (moveSpeed * delta)
    end

    if (getPedControlState(localPlayer, "right") or getPedControlState(localPlayer, "vehicle_right")) then
        x = x + math.sin(-math.rad(cameraRotY - 90)) * (moveSpeed * delta)
        y = y + math.cos(-math.rad(cameraRotY - 90)) * (moveSpeed * delta)
    end

    if (getPedControlState(localPlayer, "sprint") or getKeyState('space')) then
        z = z + (moveSpeed * delta)
    end

    if (getPedControlState(localPlayer, "jump") or getKeyState('lshift')) then
        z = z - (moveSpeed * delta)
    end

    setElementPosition(getCamera(), x, y, z)
end

function Freecam.onMouseMove(_, _, absoluteX, absoluteY)
    if (not Freecam.enabled or isCursorShowing() or isMTAWindowActive() or isMainMenuActive()) then
        return
    end

    local relativeX, relativeY = absoluteX - screenWidth/2, absoluteY - screenHeight/2

    cameraRotX = cameraRotX - relativeY * mouseSensitivity
    cameraRotY = cameraRotY - relativeX * mouseSensitivity

    if (cameraRotX > 90) then cameraRotX = 90 end
    if (cameraRotX < -90) then cameraRotX = -90 end

    setElementRotation(getCamera(), cameraRotX, 0, cameraRotY)
    setCursorPosition(screenWidth/2, screenHeight/2)
end

function Freecam.onKey(key, state)
    -- Change speed depending on scroll, put limits in place with math.min and math.max
    if (key == "mouse_wheel_up") then
        moveSpeed = math.min(moveSpeed + 0.1, 0.25)
    elseif (key == "mouse_wheel_down") then
        moveSpeed = math.max(moveSpeed - 0.1, 0.01)
    end
end

-----------------------------------
-- * Events
-----------------------------------