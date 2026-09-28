-----------------------------------
-- * Variables
-----------------------------------

TaskComplexFollowNodeRoute = {}
TaskComplexFollowNodeRoute.__index = TaskComplexFollowNodeRoute

-----------------------------------
-- * Functions
-----------------------------------

function TaskComplexFollowNodeRoute:create(ped, x, y, z)
    local mt = setmetatable({}, TaskComplexFollowNodeRoute)

    mt.parent.create(mt, ped)

    mt.x = x
    mt.y = y
    mt.z = z
    mt.path = false

    return mt
end

-- Walks the route itself instead of through subtasks, so the task manager runs it like a simple task.
-- Not how GTA does it (see ComplexTask): it gives a CTaskSimpleGoToPoint subtask per node.
-- TODO: No makeAbortable yet, so a parent switching away from this task leaves forwards/walk held
-- TODO: Convert to complex task, right now it's like this for simplicity sake.
function TaskComplexFollowNodeRoute:isSimple()
    return true
end

function TaskComplexFollowNodeRoute:process()
    if (not self:hasStarted()) then
        self:setStarted()
    end

    if (not self.path) then
        self.path = Path:create(self:getPed())
        self.path:find(self.x, self.y, self.z)
    end

    local ped = self:getPed()
    local distance = ped:distanceTo(self.x, self.y, self.z)

    if distance <= 1.05 then
        ped:setAnalogControlState("forwards", 0)
        ped:setControlState("walk", false)

        return true
    end

    local node = self.path:findNextWaypoint(1)

    if node == nil then
        ped:setAnalogControlState("forwards", 0)
        ped:setControlState("walk", false)

        return true
    end

    local x, y, _ = ped:getPosition()
    local rotX, rotY, _ = getElementRotation(ped.element)

    local angle = findRotation(x, y, node.x, node.y)

    ped:setRotation(rotX, rotY, -angle)
    ped:setAnalogControlState("forwards", 1)
    ped:setControlState("walk", true)

    return false
end

function TaskComplexFollowNodeRoute:getName()
    return "TASK_COMPLEX_FOLLOW_NODE_ROUTE"
end

function TaskComplexFollowNodeRoute:getDebugParameters()
    local ped = self:getPed()

    return {
        Ped = tostring(ped:getId() or 'UNKNOWN'),
        Position = string.format("x: %.2f, y: %.2f, z: %.2f", self.x, self.y, self.z),
        Distance = string.format("%.2f", ped:distanceTo(self.x, self.y, self.z))
    }
end

Core.mergeInto(TaskComplexFollowNodeRoute, ComplexTask)
