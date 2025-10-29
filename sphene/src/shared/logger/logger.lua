-----------------------------------
-- * Variables
-----------------------------------

Logger = {}
Logger.__index = Logger

-----------------------------------
-- * Functions
-----------------------------------

Logger.NONE = 0
Logger.ERROR = 1
Logger.WARNING = 2
Logger.INFO = 3
Logger.DEBUG = 4

function Logger.debug(tag, message, ...)
    if (config('log.level', 1) >= Logger.DEBUG) then
        Logger.log(tag, message, "DEBUG", 235, 223, 52, ...)
    end
end

function Logger.info(tag, message, ...)
    if (config('log.level', 1) >= Logger.INFO) then
        Logger.log(tag, message, "INFO", 52, 235, 110, ...)
    end
end

function Logger.warning(tag, message, ...)
    if (config('log.level', 1) >= Logger.WARNING) then
        Logger.log(tag, message, "WARNING", 235, 134, 52, ...)
    end
end

function Logger.error(tag, message, ...)
    if (config('log.level', 1) >= Logger.ERROR) then
        Logger.log(tag, message, "ERROR", 235, 52, 52, ...)
    end
end

function Logger.log(tag, message, level, r, g ,b, ...)
    local i = 0

    while (string.find(message, "{}") ~= nil) do
        i = i + 1

        local param = select(i, ...)

        if (param == nil) then
            break
        end

        param = string.gsub(tostring(param), "%%", "%%%%")
        message = string.gsub(message, "{}", param, 1)
    end

    if (config('debug') == 1 or config('debug') == 'true') then
        if (Overlay ~= nil and Overlay.isReady()) then
            -- @TODO: Store in table, load asynchronously in the overlay
            --Overlay.triggerEvent('onDebugAddLogEntry', level, tag, message)
        end
    end

    outputDebugString(level..": ["..tag.."]: ".. message, 4, r, g, b)
end