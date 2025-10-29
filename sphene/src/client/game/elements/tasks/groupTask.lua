-----------------------------------
-- * Locals (for perfomance)
-----------------------------------


-----------------------------------
-- * Variables
-----------------------------------

GroupTask = {}
GroupTask.__index = GroupTask

-----------------------------------
-- * Functions
-----------------------------------

function GroupTask:create(ped)
    Task.create(self, ped)
end

Core.mergeInto(GroupTask, Task)

-----------------------------------
-- * Events
-----------------------------------
