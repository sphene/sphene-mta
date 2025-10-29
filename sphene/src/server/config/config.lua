-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _config = {
    benchmark = {
        secret_key = env('BENCHMARK_SECRET_KEY', 'benchmark'),
    },
    log = {
        level = env('LOG_LEVEL', 1),
        pipe = env('LOG_PIPE', 'PIPE_DEBUG_SCRIPT'),
    },
    discord = {
        app_id = env('DISCORD_APP_ID', nil),
        asset = env('DISCORD_ASSET', nil),
    },
    debug = env('DEBUG', false),
    mode = env('MODE', 'game'),
    api_url = env('API_URL', 'http://127.0.0.1:8080'),
    cdn_url = env('CDN_URL', 'http://127.0.0.1:8080/cdn'),
    skip_api_load = env('SKIP_API_LOAD', false),
}

local _configCached = false

-----------------------------------
-- * Functions
-----------------------------------

function buildConfigCache(config, prefix)
    if (not _configCached) then
        _configCached = {}
    end

    for key, value in pairs(config) do
        if (type(value) == 'table') then
            buildConfigCache(value, prefix..key..'.')
        else
            _configCached[prefix..key] = value
        end
    end
end

function config(key, default)
    if (not _configCached) then
        buildConfigCache(_config, '')
    end

    return _configCached[key] or default
end

function getConfigOptions()
    if (not _configCached) then
        buildConfigCache(_config, '')
    end

    return _configCached
end