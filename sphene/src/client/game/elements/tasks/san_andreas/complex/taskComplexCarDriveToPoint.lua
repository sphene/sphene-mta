-----------------------------------
-- * Variables
-----------------------------------

TaskComplexCarDriveToPoint = {}
TaskComplexCarDriveToPoint.__index = TaskComplexCarDriveToPoint

-----------------------------------
-- * Functions
-----------------------------------

function TaskComplexCarDriveToPoint:create(ped, car, posX, posY, posZ, speed, speed2, model, drivingStyle)
    local mt = setmetatable({}, TaskComplexCarDriveToPoint)

    mt.parent.create(mt, ped)
    mt.car = car
    mt.posX = posX
    mt.posY = posY
    mt.posZ = posZ
    mt.speed = speed
    mt.speed2 = speed2
    mt.model = model
    mt.drivingStyle = drivingStyle

    return mt
end

function TaskComplexCarDriveToPoint:process()
    if (TaskComplexCarDriveToPoint.parent.process(self)) then
        if (not self:getPed():isInVehicle()) then
            self:setSubTask(TaskComplexEnterCarAsDriver:create(self:getPed(), self.car))
        else
            local vehX, vehY, vehZ = self:getPed():getOccupiedVehicle():getPosition()

            if (getDistanceBetweenPoints3D(vehX, vehY, vehZ, self.posX, self.posY, self.posZ) <= 3) then
                self:setFinished()
                return
            end

            self:setSubTask(TaskSimpleCarDrive:create(self:getPed(), self.posX, self.posY, self.posZ, self.speed, self.speed2, self.drivingStyle))
        end
    end
end

function TaskComplexCarDriveToPoint:getName()
    return "TASK_COMPLEX_CAR_DRIVE_TO_POINT"
end

Task.register(0x05D1, TaskComplexCarDriveToPoint)

Core.mergeInto(TaskComplexCarDriveToPoint, ComplexTask)
