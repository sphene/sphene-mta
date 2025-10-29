Player = {}
Player.__index = Player

function Player:create(playerElement)
    local mt = setmetatable({}, Player)

    mt.element = playerElement
    mt.lobby = nil
    mt.vehicle = createVehicle(411, 0, 0, -100)

    setElementFrozen(mt.vehicle, true)
    setElementAlpha(mt.vehicle, 0)
    setElementCollisionsEnabled(mt.vehicle, false)

    return mt
end

function Player:destroy()
    if isElement(self.vehicle) then
        destroyElement(self.vehicle)
    end
end

function Player:setLobby(lobby)
    self.lobby = lobby
    setElementDimension(self.vehicle, lobby:getDimension())
end

function Player:warpIntoVehicle()
    warpPedIntoVehicle(self.element, self.vehicle)
end

function Player:removeFromVehicle()
    removePedFromVehicle(self.element)
end