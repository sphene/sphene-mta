-- Profiler
--
-- Traces every Lua call through a debug hook, so nothing has to be added to the
-- code being measured:
--
--     Profiler.start()
--     ... run the thing ...
--     Profiler.report()
--
-- Calls are recorded as a tree, so a function shows up under the one that called it.
-- Everything here does nothing unless PROFILER is enabled.
--
-- It is recommended to read the output in MTA/logs/clientscript.log folder.

-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _os_clock = os.clock
local _string_format = string.format
local _string_match = string.match
local _string_rep = string.rep
local _string_sub = string.sub
local _table_sort = table.sort
local _type = type
local _pairs = pairs

local _debug_getinfo = debug and debug.getinfo
local _debug_gethook = debug and debug.gethook
local _debug_sethook = debug and debug.sethook

-----------------------------------
-- * Constants
-----------------------------------

-- Records MTA and standard library functions as well. Off because tracing those
-- is what makes the hook expensive, turn it on to find out what a native costs.
local TRACE_NATIVES = false

-- The tree characters are three bytes but one column wide, so the name column is
-- padded by hand instead of through the format string.
local NAME_WIDTH = 56
local INDENT = '│  '
local BRANCH = '├─ '
local LAST_BRANCH = '└─ '
local BLANK = '   '
local ROW_FORMAT = '%s %9.1f ms %9d calls %9.2f us/call %6.1f%% %9.1f ms self'

-----------------------------------
-- * Variables
-----------------------------------

Profiler = {}
Profiler.__index = Profiler

local roots = {}
local current = nil

-- One entry per frame the hook has seen: the node it opened, or false for a frame
-- that is not recorded (a native, or the profiler itself). Skipped frames have to
-- stay on the stack, so their return does not close somebody else's node.
local stack = {}
local depth = 0

local running = false
local previousHook = nil

-- What to do with a function: its section name, or false when it is not recorded.
-- Decided on the first call and kept, it is the expensive part of tracing.
local resolved = setmetatable({}, { __mode = 'k' })
local profilerSource = _debug_getinfo and _debug_getinfo(1, 'S').source
local profilerShortSource = _debug_getinfo and _debug_getinfo(1, 'S').short_src

-----------------------------------
-- * Recording
-----------------------------------

local function push(name)
    local node

    -- A function calling itself keeps one node, otherwise recursion would add a
    -- tree level per step.
    if (current ~= nil and current.name == name) then
        node = current
    else
        local siblings = (current ~= nil) and current.children or roots

        node = siblings[name]

        if (node == nil) then
            node = {
                name = name,
                parent = current,
                total = 0,
                calls = 0,
                startTime = 0,
                open = 0,
                children = {}
            }

            siblings[name] = node
        end
    end

    if (node.open == 0) then
        node.startTime = _os_clock()
    end

    node.calls = node.calls + 1
    node.open = node.open + 1

    current = node
    depth = depth + 1
    stack[depth] = node
end

local function pop()
    if (depth == 0) then
        return
    end

    local node = stack[depth]

    stack[depth] = nil
    depth = depth - 1

    if (not node) then
        return
    end

    node.open = node.open - 1

    if (node.open == 0) then
        node.total = node.total + (_os_clock() - node.startTime)
        current = node.parent
    else
        current = node
    end
end

local function isEnabled()
    return (config('profiler') == 1 or config('profiler') == 'true')
end

-- Both sources disappoint in their own way: MTA hands back a slice of the code
-- itself for some chunks instead of the chunk name, and short_src is safe but cut
-- off by Lua when the path is long. Take the first one that looks like a file, and
-- never anything with a newline in it.
local function fileName(source)
    if (source == nil) then
        return nil
    end

    local name = _string_match(source, '^[@=]?([^\r\n]*)') or ''

    -- MTA reports sources as [string "src/client/game/game.lua"].
    name = _string_match(name, '%[string "(.-)"%]') or name
    name = _string_match(name, '([^/\\]+)$') or name

    return _string_match(name, '^[%w_%-%.]+$')
end

local function resolveName(func, info)
    local name = false

    if (info ~= nil and info.source ~= profilerSource and info.short_src ~= profilerShortSource
        and (info.what ~= 'C' or TRACE_NATIVES)) then
        name = info.name

        if (name == nil or name == '?') then
            name = (info.what == 'main') and 'main chunk' or 'anonymous'
        end

        if (info.what == 'C') then
            name = name .. ' [native]'
        else
            local source = fileName(info.source) or fileName(info.short_src) or 'dynamic'

            name = name .. ' @' .. source .. ':' .. (info.linedefined or 0)
        end
    end

    resolved[func] = name

    return name
end

-- Runs on every single call, so it asks for the function only. The name and the
-- source behind it are read once, the first time that function is seen.
local function hook(event)
    if (event == 'call' or event == 'tail call') then
        local info = _debug_getinfo(2, 'f')
        local name = false

        if (info ~= nil) then
            name = resolved[info.func]

            if (name == nil) then
                name = resolveName(info.func, _debug_getinfo(2, 'nS'))
            end
        end

        if (name) then
            push(name)
        else
            depth = depth + 1
            stack[depth] = false
        end
    elseif (event == 'return' or event == 'tail return') then
        pop()
    end
end

-----------------------------------
-- * Functions
-----------------------------------

-- Clears whatever was recorded before and starts tracing.
--
-- The times include the tracing overhead, so read them against each other rather
-- than as absolute numbers. Code running inside a coroutine is not traced, hooks
-- are per coroutine in Lua 5.1.
function Profiler.start()
    if (not isEnabled()) then
        return false
    end

    if (_debug_sethook == nil or _debug_getinfo == nil) then
        Logger.warning('PROFILER', 'Profiler: debug.sethook is not available')
        return false
    end

    roots = {}
    stack = {}
    depth = 0
    current = nil

    -- MTA's own hook (the frozen script protection) is replaced while tracing. It
    -- comes back from gethook() as a string and can only be put back if it is a
    -- Lua function.
    if (not running and _debug_gethook ~= nil) then
        local previous, mask, count = _debug_gethook()

        previousHook = (_type(previous) == 'function') and { previous, mask, count } or nil
    end

    running = true

    _debug_sethook(hook, 'cr')

    return true
end

-- Stops tracing but keeps the recorded tree, so it can still be reported.
function Profiler.stop()
    if (not running) then
        return
    end

    running = false

    if (previousHook ~= nil) then
        _debug_sethook(previousHook[1], previousHook[2], previousHook[3])
    else
        _debug_sethook()
    end

    previousHook = nil

    -- Frames the hook was attached in the middle of never report their return.
    while (depth > 0) do
        pop()
    end
end

-----------------------------------
-- * Reporting
-----------------------------------

local function collect(nodes)
    local sorted = {}
    local total = 0

    for _, node in _pairs(nodes) do
        sorted[#sorted + 1] = node
        total = total + node.total
    end

    _table_sort(sorted, function(a, b)
        return a.total > b.total
    end)

    return sorted, total
end

local function reportNodes(tag, sorted, prefix, level, reference)
    for i = 1, #sorted do
        local node = sorted[i]
        local children, childTotal = collect(node.children)

        local average = (node.calls > 0) and (node.total / node.calls) or 0
        local percent = (reference > 0) and ((node.total / reference) * 100) or 0

        local last = (i == #sorted)
        local name = node.name
        local width = (level * 3) + #name

        if (width > NAME_WIDTH) then
            local keep = #name - (width - NAME_WIDTH) - 2

            name = _string_sub(name, 1, (keep > 1) and keep or 1) .. '..'
            width = (level * 3) + #name
        end

        if (level > 0) then
            name = prefix .. (last and LAST_BRANCH or BRANCH) .. name
        end

        Logger.info(tag, _string_format(ROW_FORMAT,
            name .. _string_rep(' ', NAME_WIDTH - width),
            node.total * 1000, node.calls, average * 1000000, percent, (node.total - childTotal) * 1000))

        reportNodes(tag, children, prefix .. ((level == 0) and '' or (last and BLANK or INDENT)), level + 1, node.total)
    end
end

-- Stops tracing and logs the call tree, each level sorted by total time. Top level
-- entries are a percentage of the largest one, nested entries a percentage of their
-- caller. The self column is the time that did not go into a recorded call.
function Profiler.report(tag)
    -- Before anything else, so the calls made from here are not traced.
    Profiler.stop()

    if (not isEnabled()) then
        return
    end

    tag = tag or 'PROFILER'

    local sorted = collect(roots)

    if (#sorted == 0) then
        Logger.info(tag, 'Profiler: no data recorded')
        return
    end

    Logger.info(tag, 'Profiler results:')

    reportNodes(tag, sorted, '', 0, sorted[1].total)
end
