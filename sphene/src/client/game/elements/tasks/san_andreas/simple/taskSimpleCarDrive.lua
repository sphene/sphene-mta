-----------------------------------
-- * Variables
-----------------------------------

TaskSimpleCarDrive = {}
TaskSimpleCarDrive.__index = TaskSimpleCarDrive

-----------------------------------
-- * Functions
-----------------------------------

function TaskSimpleCarDrive:create(ped, posX, posY, posZ, speed, speed2, model, drivingStyle)
    local mt = setmetatable({}, TaskSimpleCarDrive)

    mt.parent.create(mt, ped)
    mt.posX = posX
    mt.posY = posY
    mt.posZ = posZ
    mt.speed = speed
    mt.speed2 = speed2
    mt.model = model
    mt.drivingStyle = drivingStyle
    mt.trafficPath = false

    return mt
end

function TaskSimpleCarDrive:process()
    local ped = self:getPed()
    local vehicle = ped:getOccupiedVehicle()

    if (not ped.element) then
        Logger.debug(string.upper(self:getName()), "Ped element is nil for ped {}", ped.id)
        return
    end

    if (not vehicle and not ped.warpingIntoVehicle and not ped.enteringVehicle) then
        Logger.debug(string.upper(self:getName()), "Ped is not in vehicle for ped {}, ending task...", ped.id)
        self:setFinished()
        return
    end

    if (not self.trafficPath) then
        self.trafficPath = Path:create(vehicle)
        self.trafficPath:find(self.posX, self.posY, self.posZ)
    end

    local vehX, vehY, vehZ = vehicle:getPosition()

    if (getDistanceBetweenPoints3D(vehX, vehY, vehZ, self.posX, self.posY, self.posZ) <= 3) then
        ped:setAnalogControlState("accelerate", 0)
        ped:setAnalogControlState("brake_reverse", 0)
        ped:setControlState("vehicle_left", false)
        ped:setControlState("vehicle_right", false)

        Logger.debug(string.upper(self:getName()), "Ped reached destination for ped {}, ending task...", ped.id)

        self:setFinished()
        return
    end

    local speed = vehicle:getSpeed("km/h")
    local node = self.trafficPath:findNextWaypoint(speed * 0.1)

    if node == nil then
        node = {
            x = self.posX,
            y = self.posY,
            z = self.posZ,
            bend = false,
            angle = 0,
            isHighway = false,
            trafficLight = 0
        }
    end

    local nodeX, nodeY, nodeZ = node.x, node.y, node.z
    local maxSpeed = self.speed == -1 and ((node.isHighway) and 30 or 10) or (self.speed * 0.5)
    local power = (maxSpeed - speed) / maxSpeed
    local matrix = vehicle:getMatrix()

    local trafficLightState = getTrafficLightState()

    if (node.trafficLight == 1 and (trafficLightState == 6 or trafficLightState == 2 or trafficLightState == 3 or trafficLightState == 4 or trafficLightState == 6 or trafficLightState == 7)) then
        maxSpeed = 0
    end

    if (node.trafficLight == 2 and (trafficLightState == 0 or trafficLightState == 1 or trafficLightState == 2 or trafficLightState == 4 or trafficLightState == 6 or trafficLightState == 8)) then
        maxSpeed = 0
    end

    if (matrix) then
        nodeX, nodeY, nodeZ = nodeX - matrix:getPosition().x, nodeY - matrix:getPosition().y, nodeZ - matrix:getPosition().z

        -- luacheck:ignore 211
        local rotX, rotY, rotZ =
            nodeX * matrix.right.x + nodeY * matrix.right.y + nodeZ * matrix.right.z,
            nodeX * matrix.forward.x + nodeY * matrix.forward.y + nodeZ * matrix.forward.z,
            nodeX * matrix.up.x + nodeY * matrix.up.y + nodeZ * matrix.up.z

        if (node.bend) then
            maxSpeed = 40 * (1 / (170 / node.angle))
        end

        --[[dxDrawText("Max speed: "..tostring(maxSpeed), 402, 102, 0, 0, tocolor(0, 0, 0), 1, "default")
        dxDrawText("Max speed: "..tostring(maxSpeed), 400, 100, 0, 0, tocolor(255, 255, 255), 1, "default")

        dxDrawText("Speed: "..tostring(speed), 402, 122, 0, 0, tocolor(0, 0, 0), 1, "default")
        dxDrawText("Speed: "..tostring(speed), 400, 120, 0, 0, tocolor(255, 255, 255), 1, "default")]]

        if (speed > maxSpeed or maxSpeed == 0) then
            power = math.abs(power)
            power = getEasingValue(power, "OutQuad")

            if (speed - maxSpeed <= 20) then
                power = 0
            end

            --[[dxDrawText("Power: "..tostring(power).." (braking)", 402, 142, 0, 0, tocolor(0, 0, 0), 1, "default")
            dxDrawText("Power: "..tostring(power).." (braking)", 400, 140, 0, 0, tocolor(255, 255, 255), 1, "default")]]

            ped:setAnalogControlState("accelerate", 0)
            ped:setAnalogControlState("brake_reverse", power)
        else
            --[[dxDrawText("Power: "..tostring(power).." (acceleration)", 402, 142, 0, 0, tocolor(0, 0, 0), 1, "default")
            dxDrawText("Power: "..tostring(power).." (acceleration)", 400, 140, 0, 0, tocolor(255, 255, 255), 1, "default")]]

            power = getEasingValue(power, "OutBack")

            ped:setAnalogControlState("accelerate", power)
            ped:setAnalogControlState("brake_reverse", 0)
        end

        if rotY <= 0 then
            ped:setControlState("vehicle_left", rotX < 0)
            ped:setControlState("vehicle_right", rotX >= 0)
        else
            local secondpart = getTickCount() % 100
            ped:setControlState("vehicle_left", rotX * 500 / rotY < -secondpart)
            ped:setControlState("vehicle_right", rotX * 500 / rotY > secondpart)
        end
    end
end

function TaskSimpleCarDrive:getName()
    return "TASK_SIMPLE_CAR_DRIVE"
end

Core.mergeInto(TaskSimpleCarDrive, SimpleTask)
