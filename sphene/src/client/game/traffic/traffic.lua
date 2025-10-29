-----------------------------------
-- * Variables
-----------------------------------

Traffic = {}
Traffic.__index = Traffic

Traffic.multiplier = 1
Traffic.pedestrianMultiplier = 1

-----------------------------------
-- * Functions
-----------------------------------

function Traffic.setMultiplier(multiplier)
    Traffic.multiplier = multiplier
end

function Traffic.setPedestrianMultiplier(multiplier)
    Traffic.pedestrianMultiplier = multiplier
end

function Traffic.getMultiplier()
    return Traffic.multiplier
end

function Traffic.getPedestrianMultiplier()
    return Traffic.pedestrianMultiplier
end