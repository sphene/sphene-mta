-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _config = {}

-----------------------------------
-- * Functions
-----------------------------------

function loadConfig(options)
    _config = options
end

function config(key, default)
    return _config[key] or default
end