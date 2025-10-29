Enex = {
    enexes = {}
}

Enex.__index = Enex
Enex.MARKER_SPEED = 2000

-----------------------------------
-- * Functions
-----------------------------------

function Enex:create(entranceX, entranceY, entranceZ, enterAngle, xWidth, yWidth, exitX, exitY, exitZ, exitAngle, interiorId, flags, sky, timeEnableAt, timeDisableAt)
    local mt = setmetatable({}, Enex)

    mt.loaded = false
    mt.element = false

    mt.entranceX = entranceX
    mt.entranceY = entranceY
    mt.entranceZ = entranceZ
    mt.enterAngle = enterAngle
    mt.xWidth = xWidth
    mt.yWidth = yWidth
    mt.exitX = exitX
    mt.exitY = exitY
    mt.exitZ = exitZ
    mt.exitAngle = exitAngle
    mt.interiorId = interiorId
    mt.flags = flags
    mt.sky = sky
    mt.timeEnableAt = timeEnableAt
    mt.timeDisableAt = timeDisableAt

    mt.animation = {
        baseOffsetZ = 0,
        startTick = getTickCount(),
        endTick = getTickCount() + Enex.MARKER_SPEED
    }

    mt.group = false
    mt.enexes[#Enex.enexes + 1] = mt

    Logger.debug('ENEX', 'Creating Enex with entranceX {}, entranceY {}, entranceZ {}, enterAngle {}, xWidth {}, yWidth {}, exitX {}, exitY {}, exitZ {}, exitAngle {}, interiorId {}, flags {}, sky {}, timeEnableAt {}, timeDisableAt {}',
        entranceX, entranceY, entranceZ, enterAngle, xWidth, yWidth, exitX, exitY, exitZ, exitAngle, interiorId, flags, sky, timeEnableAt, timeDisableAt)

    return mt
end

function Enex:destroy()
    for i=1, #Enex.enexes do
        if (Enex.enexes[i] == self) then
            table.remove(Enex.enexes, i)
            break
        end
    end
end

function Enex:setGroup(group)
    self.group = group
end

function Enex:render()

end

function Enex:preFrame()
    local player = PlayerElement.getLocalPlayer()

    local z = self.entranceZ + 2

    if player then
        local px, py, pz = player:getPosition()
        local interior = player:getInterior()

        if interior == self.interiorId and getDistanceBetweenPoints3D(px, py, pz, self.entranceX, self.entranceY, self.entranceZ) < 50 then
            if not self.loaded then
                self.loaded = true
                self.element = MarkerElement:create(self.entranceX, self.entranceY, z, 'arrow', 1.5, 230, 223, 23, 255)
                self.element:setDimension(player:getDimension())
                self.element:setInterior(self.interiorId)

                Logger.debug('ENEX', 'Creating Enex marker at entranceX {}, entranceY {}, entranceZ {}, interior {}', self.entranceX, self.entranceY, self.entranceZ, self.interiorId)
            end

            if (not player:isInVehicle() and getDistanceBetweenPoints3D(px, py, pz, self.entranceX, self.entranceY, self.entranceZ) < 1) then
                if player:getTeleportedToEnex() ~= self then
                    local groupEnexes = self:getGroup():getEnexes()
                    local activeEnex = player:getActiveEnex()
                    local linkedEnex

                    if activeEnex and activeEnex ~= self and activeEnex:getGroup() == self:getGroup() then
                        linkedEnex = activeEnex
                    else
                        linkedEnex = groupEnexes[#groupEnexes]
                    end

                    if linkedEnex == false or linkedEnex == self then
                        for i=1, #groupEnexes do
                            if groupEnexes[i] ~= self then
                                linkedEnex = groupEnexes[i]
                                break
                            end
                        end
                    end

                    if linkedEnex ~= self then
                        local x, y
                        x, y, z = linkedEnex.exitX, linkedEnex.exitY, linkedEnex.exitZ

                        local angle = linkedEnex.exitAngle
                        interior = linkedEnex.interiorId

                        player:setPosition(x, y, z)
                        player:setRotation(0, 0, angle)
                        player:setInterior(interior)
                        player:setTeleportedToEnex(linkedEnex)
                        player:adjustPosition()

                        if activeEnex == linkedEnex or interior == 0 then
                            player:setActiveEnex(false)
                            player:setActiveInteriorName('UNKNOWN')
                            Logger.info('ENEX', 'Teleporting player to {}, {}, {}, interior {}, active interior name: {}', x, y, z, interior, 'UNKNOWN')
                        else
                            player:setActiveInteriorName(self:getGroup().name)
                            player:setActiveEnex(self)
                            Logger.info('ENEX', 'Teleporting player to {}, {}, {}, interior {}, active interior name: {}', x, y, z, interior, self:getGroup().name)
                        end
                    end
                end
            elseif player:getTeleportedToEnex() == self then
                player:setTeleportedToEnex(false)
            end
        elseif self.loaded and self.element then
            Logger.debug('ENEX', 'Destroying Enex marker at entranceX {}, entranceY {}, entranceZ {}, interior {}', self.entranceX, self.entranceY, self.entranceZ, self.interiorId)

            self.loaded = false
            self.element:destroy()
            self.element = false
        end
    else
        if self.loaded then
            if self.element then
                self.element:destroy()
                self.element = false
            end
        end
    end

    if self.loaded and self.element then
        local minOffsetZ = -0.1
        local maxOffsetZ = 0.1
        local progress

        if (getTickCount() > self.animation.endTick) then
            progress = 1
            self.animation.startTick = getTickCount()
            self.animation.endTick = getTickCount() + MarkerElement.ABOVE_ELEMENT_MARKER_SPEED
        else
            progress = 1 / ((self.animation.endTick - self.animation.startTick) / (self.animation.endTick - getTickCount()))
        end

        if (progress < 0.5) then
            self.element:setPosition(self.entranceX, self.entranceY, z + minOffsetZ + ((maxOffsetZ - minOffsetZ) * (progress * 2)))
        else
            self.element:setPosition(self.entranceX, self.entranceY, z + minOffsetZ + ((maxOffsetZ - minOffsetZ) - ((maxOffsetZ - minOffsetZ) * ((progress - 0.5) * 2))))
        end
    end
end

function Enex:getGroup()
    return self.group
end

function Enex.getEnexes()
    return Enex.enexes
end

function Enex:onRender()
    for i=1, #Enex.enexes do
        Enex.enexes[i]:render()
    end
end

function Enex.onPreFrame()
    for i=1, #Enex.enexes do
        Enex.enexes[i]:preFrame()
    end
end