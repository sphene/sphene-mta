-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local BENCHMARK_VERSION = 3

-----------------------------------
-- * Variables
-----------------------------------

Benchmark = {}
Benchmark.__index = Benchmark

-----------------------------------
-- * Functions
-----------------------------------

function Benchmark.onResultsRecord(data)
    local playerSerial = getPlayerSerial(client)

    local record = {
        ['hash'] = hash('hmac', playerSerial, {
            key = playerSerial,
            algorithm = 'sha256'
        })
    }

    for k, v in pairs(data[1]) do
        record[k] = v
    end

    for k, v in pairs(data[2]) do
        record[k] = v
    end

    record['benchmarkVersion'] = BENCHMARK_VERSION

    local recordJson = toJSON(record)
    local hmac = encodeString('base64', hash('hmac', recordJson, {
        key = config('benchmark.secret_key'),
        algorithm = 'sha256'
    }))

    local player = client

    fetchRemote('https://api.sphene.dev/api/benchmark', {
        method = 'POST',
        headers = {
            ['X-Sphene-Hmac-Sha256'] = hmac,
        },
        postData = recordJson
    }, function(response, info)
        if (info.statusCode == 200) then
            triggerClientEvent(player, "sphene:benchmark:record:success", resourceRoot)
        else
            triggerClientEvent(player, "sphene:benchmark:record:error", resourceRoot)
        end
    end)
end

function Benchmark.fetchLeaderboard(clientHash, type, isLegacy)
    isLegacy = isLegacy or false

    local playerSerial = getPlayerSerial(client)
    local hash = hash('hmac', playerSerial, {
        key = playerSerial,
        algorithm = 'sha256'
    })

    local player = client
    local url = 'https://api.sphene.dev/api/benchmark/leaderboard?hash='..hash..'&type='..type

    if (isLegacy) then
        url = url..'&legacy=true'
    end

    fetchRemote(url, {
        method = 'GET',
    }, function(response, info)
        if (info.statusCode == 200) then
            local data = fromJSON("["..response.."]")
            triggerClientEvent(player, "sphene:benchmark:leaderboard:received", resourceRoot, clientHash, data)
        else
            triggerClientEvent(player, "sphene:benchmark:leaderboard:error", resourceRoot, clientHash)
        end
    end)
end

function Benchmark.fetchHistory(clientHash, type)
    local playerSerial = getPlayerSerial(client)
    local hash = hash('hmac', playerSerial, {
        key = playerSerial,
        algorithm = 'sha256'
    })

    local player = client

    fetchRemote('https://api.sphene.dev/api/benchmark/history?hash='..hash..'&type='..type, {
        method = 'GET',
    }, function(response, info)
        if (info.statusCode == 200) then
            local data = fromJSON("["..response.."]")
            triggerClientEvent(player, "sphene:benchmark:history:received", resourceRoot, clientHash, data)
        else
            triggerClientEvent(player, "sphene:benchmark:history:error", resourceRoot, clientHash)
        end
    end)
end

addEvent("sphene:benchmark:record", true)
addEventHandler("sphene:benchmark:record", resourceRoot, Benchmark.onResultsRecord)

addEvent("sphene:benchmark:leaderboard:request", true)
addEventHandler("sphene:benchmark:leaderboard:request", resourceRoot, Benchmark.fetchLeaderboard)

addEvent("sphene:benchmark:history:request", true)
addEventHandler("sphene:benchmark:history:request", resourceRoot, Benchmark.fetchHistory)

addEvent("sphene:quit", true)
addEventHandler("sphene:quit", resourceRoot, function()
    kickPlayer(client, "Sphene", "We'll see you next time!")
end)