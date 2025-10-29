-----------------------------------
-- * Variables
-----------------------------------

VCGame = {}
VCGame.__index = VCGame

VCGame.hiddenPackages = false

-----------------------------------
-- * Functions
-----------------------------------

function VCGame.setHiddenPackages(hiddenPackages)
    VCGame.hiddenPackages = hiddenPackages
end

Core.mergeInto(Game, VCGame)