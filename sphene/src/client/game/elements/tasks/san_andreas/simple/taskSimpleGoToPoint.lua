-----------------------------------
-- * Variables
-----------------------------------

TaskSimpleGoToPoint = {}
TaskSimpleGoToPoint.__index = TaskSimpleGoToPoint

-----------------------------------
-- * Functions
-----------------------------------

function TaskSimpleGoToPoint:create(ped, x, y, z)
    local mt = setmetatable({}, TaskSimpleGoToPoint)

    mt.parent.create(self, ped)

    mt.x = x
    mt.y = y
    mt.z = z
    mt.path = false

    return mt
end

function TaskSimpleGoToPoint:create(ped, x, y, z)
    local mt = setmetatable({}, TaskSimpleGoToPoint)

    mt.parent.create(self, ped)

    mt.x = x
    mt.y = y
    mt.z = z

    return mt
end

function TaskSimpleGoToPoint:process()
    self.parent.process(self)

    if (not self:hasStarted()) then
        self:setStarted()
    end

    if (not self.path) then
        self.path = Path:create(self:getPed())
        self.path:find(self.x, self.y, self.z)
    end

    local ped = self:getPed()

    if (ped:distanceTo(self.x, self.y, self.z) < 0.1) then
        ped:setAnalogControlState("forwards", 0)

        self:setFinished()
        return
    end

    local node = self.path:findNextWaypoint(1)

    if node == nil then
        node = {
            x = self.x,
            y = self.y,
            z = self.z,
        }
    end

    local x, y, _ = ped:getPosition()
    local rotX, rotY, _ = getElementRotation(ped.element)

    local angle = findRotation(x, y, node.x, node.y)

    ped:setRotation(rotX, rotY, -angle)
    ped:setAnalogControlState("forwards", 1)
end

function TaskSimpleGoToPoint:getName()
    return "TASK_SIMPLE_GO_TO_POINT"
end

Task.register(0x05C5, TaskSimpleGoToPoint)

Core.mergeInto(TaskSimpleGoToPoint, SimpleTask)
