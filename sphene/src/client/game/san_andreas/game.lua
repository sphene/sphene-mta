-----------------------------------
-- * Variables
-----------------------------------

SAGame = {}
SAGame.__index = SAGame

SAGame.riotsEnabled = false

-----------------------------------
-- * Functions
-----------------------------------

function SAGame.setRiotsEnabled(enabled)
    SAGame.riotsEnabled = enabled
end

Core.mergeInto(Game, SAGame)