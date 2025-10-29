-----------------------------------
-- * Variables
-----------------------------------

AssertInsideFunction = {}
AssertInsideFunction.__index = AssertInsideFunction

-----------------------------------
-- * Functions
-----------------------------------

function AssertInsideFunction.execute(runtime, actor, vehicle, seat)
    if (type(actor) ~= 'table' or actor.__instanceof == nil or not actor:__instanceof(actor, ActorClass)) then
        return runtime:error("AssertLoaded: Expected a Actor object on argument 1")
    end

    if (type(vehicle) ~= 'table' or vehicle.__instanceof == nil or not vehicle:__instanceof(vehicle, VehicleClass)) then
        return runtime:error("AssertLoaded: Expected a Vehicle object on argument 2")
    end

    if (seat ~= nil and type(seat) ~= 'number') then
        return runtime:error("AssertLoaded: Expected a number or NULL on argument 3")
    end

    if (not actor.actor or not isElement(actor.actor.element)) then
        return runtime:error("AssertLoaded: Actor is not loaded")
    end

    if (not vehicle.vehicle or not isElement(vehicle.vehicle.element)) then
        return runtime:error("AssertLoaded: Vehicle is not loaded")
    end

    if (getPedOccupiedVehicle(actor.actor.element) ~= vehicle.vehicle.element) then
        return runtime:error("AssertLoaded: Actor is not in the vehicle")
    end

    if (seat and getPedOccupiedVehicleSeat(actor.actor.element) ~= seat) then
        return runtime:error("AssertLoaded: Actor is not in the correct seat")
    end

    return true
end

Core.mergeInto(AssertInsideFunction, AbstractFunction)