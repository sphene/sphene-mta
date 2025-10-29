-----------------------------------
-- * Variables
-----------------------------------

AssertLoadedFunction = {}
AssertLoadedFunction.__index = AssertLoadedFunction

-----------------------------------
-- * Functions
-----------------------------------

function AssertLoadedFunction.execute(runtime, element)
    if (type(element) ~= 'table' or element.__instanceof == nil or (not element:__instanceof(element, ActorClass) and not element:__instanceof(element, VehicleClass))) then
        return runtime:error("AssertLoaded: Expected an Actor or Vehicle object on argument 1")
    end

    if (element:__instanceof(element, ActorClass)) then
        if (element.actor and not isElement(element.actor.element)) then
            return runtime:error("AssertLoaded: Actor is not loaded")
        elseif (not element.actor) then
            return runtime:error("AssertLoaded: Actor may not exist")
        end
    elseif (element:__instanceof(element, VehicleClass)) then
        if (element.vehicle and not isElement(element.vehicle.element)) then
            return runtime:error("AssertLoaded: Vehicle is not loaded")
        elseif (not element.vehicle) then
            return runtime:error("AssertLoaded: Vehicle may not exist")
        end
    else
        return runtime:error("AssertLoaded: Expected an Actor or Vehicle object")
    end

    return true
end

Core.mergeInto(AssertLoadedFunction, AbstractFunction)