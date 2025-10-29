-----------------------------------
-- * Locals
-----------------------------------

local screenWidth, screenHeight = guiGetScreenSize()

local browser = false
local isBrowserReady = false

local eventsToTrigger = {}

-----------------------------------
-- * Variables
-----------------------------------

Overlay = {}
Overlay.__index = Overlay

-----------------------------------
-- * Functions
-----------------------------------

function Overlay.start()
    Logger.info('OVERLAY', 'Starting overlay...')

    browser = createBrowser(screenWidth, screenHeight, true, true)
    isBrowserReady = false

    eventsToTrigger = ""

    setDevelopmentMode(true, true)

    addEventHandler("onClientBrowserCreated", browser,
        function()
            local debugJs = fileOpen("src/client/interface/js/debug.js", true)
            local spheneJsContent = fileRead(debugJs, fileGetSize(debugJs))
            fileClose(debugJs)

            local spheneJs = fileOpen("src/client/interface/js/sphene.js", true)
            spheneJsContent = spheneJsContent.."\n"..fileRead(spheneJs, fileGetSize(spheneJs))
            fileClose(spheneJs)

            spheneJsContent = spheneJsContent:gsub("{{ *debugMode *}}", tostring((config('debug') == 1 or config('debug') == 'true')))

            executeBrowserJavascript(browser, spheneJsContent)
            loadBrowserURL(browser, "http://mta/sphene-interface/build/index.html")

            Logger.info('OVERLAY', 'Browser created. Interface loaded')
        end
    )

    addEventHandler("onClientBrowserDocumentReady", browser,
        function(url)
            Logger.info('OVERLAY', 'Overlay ready.')
            isBrowserReady = true
        end
    )
end

function Overlay.render()
    if (browser and isBrowserReady) then
        dxDrawImage(0, 0, screenWidth, screenHeight, browser, 0, 0, 0, tocolor(255, 255, 255, 255))
    end
end

function Overlay.preRender()
    if (browser and eventsToTrigger ~= "") then
        executeBrowserJavascript(browser, eventsToTrigger)
        eventsToTrigger = ""
    end
end

function Overlay.focus()
    focusBrowser(browser)
end

function Overlay.unfocus()
    focusBrowser()
end

function Overlay.showCursor()
    showCursor(true)
    Overlay.focus()
end

function Overlay.hideCursor()
    showCursor(false)
    Overlay.unfocus()
end

function Overlay.onCursorClick(button, state)
    if (not isCursorShowing()) then
        return
    end

    if (state == "down") then
        injectBrowserMouseDown(browser, button)
    else
        injectBrowserMouseUp(browser, button)
    end
end

function Overlay.onCursorMove(_, _, absoluteX, absoluteY)
    if (not isCursorShowing()) then
        return
    end

    injectBrowserMouseMove(browser, absoluteX, absoluteY)
end

function Overlay.onClientKey(button)
    if (not isCursorShowing()) then
        return
    end

    if (button == "mouse_wheel_down") then
        injectBrowserMouseWheel(browser, -40, 0)
    elseif (button == "mouse_wheel_up") then
        injectBrowserMouseWheel(browser, 40, 0)
    end
end

function Overlay.triggerEvent(event, ...)
    local args = ""

    for _, argument in pairs({...}) do
        if (type(argument) == "table") then
            args = args..","..toJSON(argument, true):sub(2, -2)
        elseif (type(argument) == "number") then
            args = args..","..tostring(argument)
        elseif (type(argument) == "boolean") then
            args = args..","..tostring(argument)
        elseif (type(argument) == "string") then
            argument = argument:gsub("\\", "\\\\'")
            argument = argument:gsub("'", "\\'")
            argument = argument:gsub("\n", "\\n")
            args = args..",'"..tostring(argument).."'"
        else
            Logger.error('OVERLAY', 'Unsupported argument type: '..type(argument))
        end
    end

    if (event ~= "onDebugAddLogEntry") then
        Logger.debug('OVERLAY', 'Sphene.triggerEvent("{}"{});', event, args)
    end

    eventsToTrigger = eventsToTrigger..[[Sphene.triggerEvent("]]..event..[["]]..args..[[);]]
end

function Overlay.isReady()
    return isBrowserReady
end

-----------------------------------
-- * Events
-----------------------------------

addEventHandler("onClientClick", root, Overlay.onCursorClick)
addEventHandler("onClientCursorMove", root, Overlay.onCursorMove)
addEventHandler("onClientKey", root, Overlay.onClientKey)
addEventHandler("onClientRender", root, Overlay.render, true, "low-2")
addEventHandler("onClientPreRender", root, Overlay.preRender, true, "low-2")