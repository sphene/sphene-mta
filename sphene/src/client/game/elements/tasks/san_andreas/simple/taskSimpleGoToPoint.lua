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

    mt.parent.create(mt, ped)

    mt.x = x
    mt.y = y
    mt.z = z
    mt.path = false

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
    local x, y, z = ped:getPosition()

    local distance = getDistanceBetweenPoints3D(x, y, z, self.x, self.y, z)

    if distance <= 0.15 then
        ped:setAnalogControlState("forwards", 0)
        ped:setControlState("walk", false)

        self:setFinished()
        return
    end

    local node = self.path:findNextWaypoint(0.1)

    if node == nil then
        ped:setAnalogControlState("forwards", 0)
        ped:setControlState("walk", false)

        self:setFinished()
        return
    end

    x, y, _ = ped:getPosition()
    local rotX, rotY, _ = getElementRotation(ped.element)

    local angle = findRotation(x, y, node.x, node.y)

    ped:setRotation(rotX, rotY, -angle)
    ped:setAnalogControlState("forwards", 1)
    ped:setControlState("walk", true)
end

function TaskSimpleGoToPoint:getName()
    return "TASK_SIMPLE_GO_TO_POINT"
end

function TaskSimpleGoToPoint:getDebugParameters()
    local ped = self:getPed()
    local node = self.path and self.path:findNextWaypoint(0.1) or false

    local x, y, z = ped:getPosition()

    return {
        Ped = tostring(ped:getId() or 'UNKNOWN'),
        Position = string.format("x: %.2f, y: %.2f, z: %.2f", self.x, self.y, self.z),
        Distance = string.format("%.2f", getDistanceBetweenPoints3D(x, y, z, self.x, self.y, z)),
        NextNode = string.format("x: %.2f, y: %.2f, z: %.2f", node and node.x or -1, node and node.y or -1, node and node.z or -1),
        AngleToNode = string.format("%.2f", node and findRotation(x, y, node.x, node.y) or -1)
    }
end

Task.register(0x05C5, TaskSimpleGoToPoint)

Core.mergeInto(TaskSimpleGoToPoint, SimpleTask)
