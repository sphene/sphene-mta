local environmentData = false

function env(key, default)
    if (environmentData == false) then
        environmentData = {}
        parseEnvironmentFile()
    end

    return environmentData[key] or default
end

function parseEnvironmentFile()
    local path = false

    if (fileExists('.env')) then
        path = '.env'
    elseif (fileExists('.env.local')) then
        path = '.env.local'
    elseif (fileExists('.env.example')) then
        path = '.env.example'
    end

    environmentData = {}

    if (path == false) then
        return
    end

    local file = fileOpen(path)

    if (file) then
        local data = fileRead(file, fileGetSize(file))

        if (data) then
            local lines = split(data, '\n')

            for _, line in ipairs(lines) do
                local key, value = line:match('([^ =]+)=(.*)')

                if (key and value) then
                    local hasQuotes = value:sub(1, 1) == '"' or value:sub(1, 1) == "'"

                    value = value:gsub('\r', '')
                    value = value:gsub('#.*', '')
                    value = value:gsub('^%s*(.-)%s*$', '%1')
                    value = value:gsub('^"(.*)"$', '%1')

                    if not hasQuotes and tonumber(value) then
                        value = tonumber(value)
                    end

                    environmentData[key] = value
                end
            end
        end

        fileClose(file)
    end
end