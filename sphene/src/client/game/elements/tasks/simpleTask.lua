-----------------------------------
-- * Locals (for perfomance)
-----------------------------------


-----------------------------------
-- * Variables
-----------------------------------

SimpleTask = {}
SimpleTask.__index = SimpleTask

-----------------------------------
-- * Functions
-----------------------------------

function SimpleTask:create(ped)
    Task.create(self, ped)
end

Core.mergeInto(SimpleTask, Task)

-----------------------------------
-- * Events
-----------------------------------
