-----------------------------------
-- * Variables
-----------------------------------

TaskComplexCarDriveToPoint = {}
TaskComplexCarDriveToPoint.__index = TaskComplexCarDriveToPoint

-----------------------------------
-- * Functions
-----------------------------------

function TaskComplexCarDriveToPoint:create(ped, car, posX, posY, posZ, speed, driveMode, model, drivingStyle)
    local mt = setmetatable({}, TaskComplexCarDriveToPoint)

    mt.parent.create(mt, ped)
    mt.car = car
    mt.posX = posX
    mt.posY = posY
    mt.posZ = posZ
    mt.speed = speed
    mt.driveMode = driveMode
    mt.model = model
    mt.drivingStyle = drivingStyle

    return mt
end

function TaskComplexCarDriveToPoint:createFirstSubTask()
    local ped = self:getPed()

    if (not ped:isInVehicle()) then
        return TaskComplexEnterCarAsDriver:create(ped, self.car)
    end

    local vehX, vehY, vehZ = ped:getOccupiedVehicle():getPosition()

    if (getDistanceBetweenPoints3D(vehX, vehY, vehZ, self.posX, self.posY, self.posZ) <= TaskSimpleCarDrive.ARRIVE_DISTANCE) then
        return false
    end

    return TaskSimpleCarDrive:create(ped, self.posX, self.posY, self.posZ, self.speed, self.driveMode, self.model, self.drivingStyle)
end

function TaskComplexCarDriveToPoint:createNextSubTask()
    return self:createFirstSubTask()
end

function TaskComplexCarDriveToPoint:getName()
    return "TASK_COMPLEX_CAR_DRIVE_TO_POINT"
end

Task.register(0x05D1, TaskComplexCarDriveToPoint)

Core.mergeInto(TaskComplexCarDriveToPoint, ComplexTask)
