-----------------------------------
-- * Variables
-----------------------------------

World = {}
World.__index = World

-- Z coordinate probes where GTA starts from and ends
World.GROUND_PROBE_TOP_Z = 1000
World.GROUND_PROBE_BOTTOM_Z = -1000

-- In GTA, when ray-cast hits nothing, it returns 20
World.DEFAULT_GROUND_Z = 20

-- Scripts usually call for Z of -100 to place the car on the ground
World.SCRIPT_GROUND_Z_LIMIT = -100

-----------------------------------
-- * Functions
-----------------------------------

-- CWorld::FindGroundZForCoord is not identical to getGroundPosition, but it casts a
-- ray from GROUND_PROBE_TOP_Z to GROUND_PROBE_BOTTOM_Z, ignoring everything but
-- buildings and dummies, and returns Z. If ray hits nothing, it returns DEFAULT_GROUND_Z.
function World.findGroundZForCoord(x, y)
    local hit, _, _, hitZ = processLineOfSight(
        x, y, World.GROUND_PROBE_TOP_Z,
        x, y, World.GROUND_PROBE_BOTTOM_Z,
        true, false, false, false, true
    )

    return hit and hitZ or World.DEFAULT_GROUND_Z
end

-- CWorld::FindGroundZFor3DCoord is actually what MTA calls inside getGroundPosition.
-- Difference to CWorld::FindGroundZForCoord is:
--   (1) It doesn't hit dummies (IPL props)
--   (2) When it misses, it returns 0
--   (3) Returns true or false on ray hit and the entity that was hit
function World.findGroundZFor3DCoord(x, y, z)
    return getGroundPosition(x, y, z)
end
