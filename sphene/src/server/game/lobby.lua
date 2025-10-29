-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local _setmetatable = setmetatable

-----------------------------------
-- * Variables
-----------------------------------

Lobby = {}
Lobby.__index = Lobby

-----------------------------------
-- * Functions
-----------------------------------

function Lobby:create(dimension)
    local mt = _setmetatable({}, Lobby)

    mt.element = createElement('lobby')
    mt.dimension = dimension

    setElementData(mt.element, "dimension", dimension)

    return mt
end

function Lobby:join(player)
    setElementParent(player, self.element)
    setElementDimension(player, self.dimension)

    setTimer(function()
        Core.players[player]:setLobby(self)

        setTimer(function()
            triggerClientEvent(player, 'sphene:core:lobby:ready', player,
                self.dimension
            )
        end, 1000, 1)
    end, 100, 1)
end

function Lobby:getDimension()
    return self.dimension
end

function Lobby:getElement()
    return self.element
end

-----------------------------------
-- * Events
-----------------------------------
