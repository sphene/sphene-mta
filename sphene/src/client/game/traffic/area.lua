-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local DIRECTORY = "data/game/san_andreas/data/Paths/"

local areas = {}

-----------------------------------
-- * Variables
-----------------------------------

TrafficArea = {}
TrafficArea.__index = TrafficArea

TrafficArea.NODE_TYPE_VEHICLE = "vehicleNodes"
TrafficArea.NODE_TYPE_PED = "pedNodes"
TrafficArea.NODE_TYPE_NAVI = "naviNodes"

-----------------------------------
-- * Functions
-----------------------------------

function TrafficArea.load()
    for area=0, 63 do
        local nodePath = DIRECTORY.."NODES"..area..".dat"

        local data = Loader.tryLoadCached(nodePath)

        if data == false then
            if (not fileExists(nodePath)) then
                Logger.error('TRAFFIC AREA', "Node file not found: {}", nodePath)
                return
            end

            local areaData = {
                [TrafficArea.NODE_TYPE_VEHICLE] = {},
                [TrafficArea.NODE_TYPE_PED] = {},
                [TrafficArea.NODE_TYPE_NAVI] = {}
            }

            local stream = BitStream:create(nodePath, nil, false)

            Logger.info('TRAFFIC AREA', "Loading: {}", nodePath)

            local nodeCount = stream:readUInt32(BitStream.LITTLE_ENDIAN)
            local vehicleNodeCount = stream:readUInt32(BitStream.LITTLE_ENDIAN)
            -- luacheck:ignore 211
            local pedNodeCount = stream:readUInt32(BitStream.LITTLE_ENDIAN)
            local naviNodeCount = stream:readUInt32(BitStream.LITTLE_ENDIAN)
            local linkCount = stream:readUInt32(BitStream.LITTLE_ENDIAN)

            local linksOffset = stream:getPos() + (nodeCount * 28) + (naviNodeCount * 14)
            local naviLinksOffset = linksOffset + (linkCount * 4) + 768

            local i = 1
            while (i <= nodeCount and (not stream:isEOF())) do
                if (not stream:setOffset(8)) then
                    Logger.error('TRAFFIC AREA', "Unexpected end of file: {}", nodePath)
                    return
                end

                local posX = stream:readInt16(BitStream.LITTLE_ENDIAN) / 8
                local posY = stream:readInt16(BitStream.LITTLE_ENDIAN) / 8
                local posZ = stream:readInt16(BitStream.LITTLE_ENDIAN) / 8
                local heuristicCost = stream:readUInt16(BitStream.LITTLE_ENDIAN)
                local linkId = stream:readUInt16(BitStream.LITTLE_ENDIAN)
                local areaId = stream:readUInt16(BitStream.LITTLE_ENDIAN)
                local nodeId = stream:readUInt16(BitStream.LITTLE_ENDIAN)
                local pathWidth = stream:readByte() / 8
                local nodeType = stream:readByte()
                local flags = stream:readUInt32(BitStream.LITTLE_ENDIAN)

                local nodeData = {
                    x = posX,
                    y = posY,
                    z = posZ,
                    heuristicCost = heuristicCost,
                    originalHeuristicCost = heuristicCost,
                    linkId = linkId,
                    areaId = areaId,
                    nodeId = nodeId,
                    pathWidth = pathWidth,
                    type = nodeType,
                    flags = flags,
                    isHighway = bitExtract(flags, 13, 1) == 1,
                    linkedNodes = {}
                }

                linkCount = bitExtract(flags, 0, 4)
                local position = stream:getPos()

                stream:setPos(linksOffset + (linkId * 4))

                if (linkCount > 0) then
                    for j=1, linkCount do
                        local linkAreaId = stream:readUInt16(BitStream.LITTLE_ENDIAN)
                        local linkNodeId = stream:readUInt16(BitStream.LITTLE_ENDIAN)

                        local linkPosition = stream:getPos()
                        stream:setPos(naviLinksOffset + (((linkId + (j - 1)) * 2)))

                        local naviLinkData = stream:readUInt16(BitStream.LITTLE_ENDIAN)
                        local naviNodeId = bitExtract(naviLinkData, 0, 10)
                        local naviAreaId = bitExtract(naviLinkData, 10, 6)

                        stream:setPos(linkPosition)

                        nodeData.linkedNodes[#nodeData.linkedNodes + 1] = { linkAreaId, linkNodeId, naviAreaId, naviNodeId }

                        Loader.yieldIfRequired()
                    end
                end

                stream:setPos(position)

                areaData[(i <= vehicleNodeCount) and TrafficArea.NODE_TYPE_VEHICLE or TrafficArea.NODE_TYPE_PED]
                    [nodeId + 1] = nodeData

                i = i + 1

                Loader.yieldIfRequired()
            end

            i = 1
            while (i <= naviNodeCount and (not stream:isEOF())) do
                local posX = stream:readInt16(BitStream.LITTLE_ENDIAN) / 8
                local posY = stream:readInt16(BitStream.LITTLE_ENDIAN) / 8
                local targetAreaId = stream:readUInt16(BitStream.LITTLE_ENDIAN)
                local targetNodeId = stream:readUInt16(BitStream.LITTLE_ENDIAN)
                local directionX = stream:readInt8() / 100
                local directionY = stream:readInt8() / 100
                local flags = stream:readUInt32(BitStream.LITTLE_ENDIAN)
                local pathWidth = bitExtract(flags, 0, 8)
                local leftLanes = bitExtract(flags, 8, 3)
                local rightLanes = bitExtract(flags, 11, 3)
                local trafficLightDirectionBehavior = bitExtract(flags, 14, 1)
                local trafficLightBehavior = bitExtract(flags, 16, 2)

                areaData[TrafficArea.NODE_TYPE_NAVI][i] = {
                    x = posX,
                    y = posY,
                    targetAreaId = targetAreaId,
                    targetNodeId = targetNodeId,
                    directionX = directionX,
                    directionY = directionY,
                    pathWidth = pathWidth,
                    leftLanes = leftLanes,
                    rightLanes = rightLanes,
                    trafficLightDirectionBehavior = trafficLightDirectionBehavior,
                    trafficLightBehavior = trafficLightBehavior,
                    color = tocolor(math.random(0, 255), math.random(0, 255), math.random(0, 255))
                }

                i = i + 1

                Loader.yieldIfRequired()
            end

            stream:close()

            areas[area + 1] = areaData

            Loader.saveToCache(nodePath, areaData)
        else
            local fixedData = {
                [TrafficArea.NODE_TYPE_VEHICLE] = {},
                [TrafficArea.NODE_TYPE_PED] = {},
                [TrafficArea.NODE_TYPE_NAVI] = {}
            }

            for key, node in pairs(data[TrafficArea.NODE_TYPE_VEHICLE]) do
                fixedData[TrafficArea.NODE_TYPE_VEHICLE][tonumber(key)] = node
            end

            for key, node in pairs(data[TrafficArea.NODE_TYPE_PED]) do
                fixedData[TrafficArea.NODE_TYPE_PED][tonumber(key)] = node
            end

            for key, node in pairs(data[TrafficArea.NODE_TYPE_NAVI]) do
                fixedData[TrafficArea.NODE_TYPE_NAVI][tonumber(key)] = node
            end

            areas[area + 1] = fixedData
        end

        Loader.yieldIfRequired()
    end
end

function TrafficArea.unload(areaOrX, y)
    local area = areaOrX

    if (y ~= nil) then
        area = TrafficArea.getIdByPosition(areaOrX, y)
    end

    if (areas[area] == nil) then
        return
    end

    areas[area] = nil
end

function TrafficArea.findClosestNode(type, x, y, z, areasToCheck)
    areasToCheck = areasToCheck or areas

    local closestNode = false
    local closestNodeDist = 0

    for _, nodeData in pairs(areasToCheck) do
        for _, node in pairs(nodeData[type]) do
            local dist = getDistanceBetweenPoints3D(x, y, z, node.x, node.y, node.z)

            if (closestNode == false or dist < closestNodeDist) then
                closestNode = node
                closestNodeDist = dist
            end
        end
    end

    return closestNode
end

function TrafficArea.get(xOrId, y)
    if (y == nil) then
        return areas[xOrId + 1]
    end

    local area = TrafficArea.getIdByPosition(xOrId, y)

    return areas[area + 1]
end

function TrafficArea.getAll()
    return areas
end

function TrafficArea.getIdByPosition(x, y)
    local areaRowId = ((math.ceil((y + 3000) / 750) - 1) * 8)
    local areaColId = (math.ceil((x + 3000) / 750) - 1)

    return areaRowId + areaColId
end

function TrafficArea.debugRenderVehiclePaths()
    local x, y, _ = getElementPosition(getCamera())

    for _, nodesData in pairs(areas) do
        for _, node in pairs(nodesData[TrafficArea.NODE_TYPE_VEHICLE]) do
            local distance = getDistanceBetweenPoints2D(x, y, node.x, node.y)

            if (distance < 100) then
                local screenX, screenY = getScreenFromWorldPosition(node.x, node.y, node.z)

                if (screenX) then
                    dxDrawCircle(screenX, screenY, 6, 0, 360, tocolor(255, 0, 0), tocolor(255, 0, 0))

                    screenX, screenY = getScreenFromWorldPosition(node.x, node.y, node.z + 1)

                    if (screenX) then
                        dxDrawText(tostring(node.heuristicCost), screenX, screenY, 0, 0, tocolor(255, 255, 255), 2, "default-bold")
                    end

                    for _, nodeId in pairs(node.linkedNodes) do
                        local areaForNode = areas[nodeId[1] + 1]

                        if (areaForNode) then
                            local linkedNode = areaForNode[TrafficArea.NODE_TYPE_VEHICLE][nodeId[2] + 1]

                            if (linkedNode) then
                                local rotation = findRotation(node.x, node.y, linkedNode.x, linkedNode.y)

                                if (rotation < 0) then
                                    rotation = rotation + 360
                                end

                                if (rotation > 180) then
                                    dxDrawLine3D(node.x, node.y, node.z + 0.6, linkedNode.x, linkedNode.y, linkedNode.z + 0.6, tocolor(255, 255, 0), 2)
                                else
                                    dxDrawLine3D(node.x, node.y, node.z + 0.3, linkedNode.x, linkedNode.y, linkedNode.z + 0.3, tocolor(255, 0, 0), 2)
                                end

                                local naviNode = areas[nodeId[3] + 1][TrafficArea.NODE_TYPE_NAVI][nodeId[4] + 1]
                                local matrix = Matrix(Vector3(node.x, node.y, 0), Vector3(0, 0, findRotation(node.x, node.y, linkedNode.x, linkedNode.y)))
                                local laneWidth = 2.8
                                local laneCount = naviNode.leftLanes + naviNode.rightLanes

                                dxDrawLine3D(node.x, node.y, node.z + 0.3, naviNode.x, naviNode.y, node.z + 0.3, tocolor(100, 255, 50), 2)

                                if (laneCount > 1) then
                                    local leftOfCenter = math.floor(laneCount / 2)
                                    local rightOfCenter = laneCount - leftOfCenter

                                    for i=1, leftOfCenter do
                                        local lane = matrix.position - matrix.right * ((node.pathWidth / 2) + (laneWidth * i))

                                        screenX, screenY = getScreenFromWorldPosition(lane.x, lane.y, node.z + 1)

                                        if (screenX) then
                                            dxDrawCircle(screenX, screenY, 6, 0, 360, tocolor(255, 255, 0), tocolor(0, 255, 255))
                                            dxDrawText("("..tostring(naviNode.leftLanes)..") "..tostring(node.pathWidth).." - "..tostring(naviNode.pathWidth).." ("..tostring(naviNode.rightLanes)..") ", screenX, screenY, 0, 0, tocolor(255, 255, 255), 2, "default-bold")
                                        end
                                    end

                                    for i=1, rightOfCenter do
                                        local lane = matrix.position + matrix.right * ((node.pathWidth / 2) + (laneWidth * i))

                                        screenX, screenY = getScreenFromWorldPosition(lane.x, lane.y, node.z + 1)

                                        if (screenX) then
                                            dxDrawCircle(screenX, screenY, 6, 0, 360, tocolor(255, 255, 0), tocolor(0, 255, 255))
                                            dxDrawText("("..tostring(naviNode.leftLanes)..") "..tostring(node.pathWidth).." - "..tostring(naviNode.pathWidth).." ("..tostring(naviNode.rightLanes)..") ", screenX, screenY, 0, 0, tocolor(255, 255, 255), 2, "default-bold")
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end

function TrafficArea.debugRenderPedPaths()
    local x, y, _ = getElementPosition(getCamera())

    for _, nodesData in pairs(areas) do
        for _, node in pairs(nodesData[TrafficArea.NODE_TYPE_PED]) do
            local distance = getDistanceBetweenPoints2D(x, y, node.x, node.y)

            if (distance < 100) then
                local screenX, screenY = getScreenFromWorldPosition(node.x, node.y, node.z)

                if (screenX) then
                    dxDrawCircle(screenX, screenY, 6, 0, 360, tocolor(0, 255, 0), tocolor(0, 255, 0))

                    for _, nodeId in pairs(node.linkedNodes) do
                        local areaForNode = areas[nodeId[1] + 1]

                        if (areaForNode) then
                            local linkedNode = nodesData[TrafficArea.NODE_TYPE_PED][nodeId[2] + 1]

                            if (linkedNode) then
                                dxDrawLine3D(node.x, node.y, node.z + 0.3, linkedNode.x, linkedNode.y, linkedNode.z + 0.3, tocolor(0, 255, 0), 2)
                            end
                        end
                    end
                end
            end
        end
    end
end

function TrafficArea.debugRenderNaviNodes()
    local x, y, _ = getElementPosition(getCamera())

    for _, nodesData in pairs(areas) do
        for key, node in pairs(nodesData[TrafficArea.NODE_TYPE_NAVI]) do
            local distance = getDistanceBetweenPoints2D(x, y, node.x, node.y)

            if (distance < 100) then
                local areaForNode = areas[node.targetAreaId + 1]

                if (areaForNode) then
                    local targetNode = nodesData[TrafficArea.NODE_TYPE_VEHICLE][node.targetNodeId + 1]

                    if (targetNode) then
                        dxDrawLine3D(node.x, node.y, targetNode.z + 0.5, targetNode.x, targetNode.y, targetNode.z + 0.5, tocolor(50, 100, 100), 2)

                        local screenX, screenY = getScreenFromWorldPosition(node.x, node.y, targetNode.z + 0.3)

                        if (screenX) then
                            dxDrawCircle(screenX, screenY, 3, 0, 360, node.color, tocolor(0, 0, 255))

                            screenX, screenY = getScreenFromWorldPosition(node.x, node.y, targetNode.z + 1)

                            if (screenX) then
                                local angle = math.atan2(node.directionY, node.directionX) * 180 / math.pi

                                if (node.accepted ~= nil) then
                                    dxDrawText(tostring(node.accepted).." - "..tostring(key).." "..tostring(angle).." : Left:"..tostring(node.leftLanes).." Right:"..tostring(node.rightLanes),
                                        screenX, screenY, 0, 0, tocolor(255, 255, 255), 2, "default-bold")
                                else
                                    dxDrawText(tostring(key).." "..tostring(angle).." : Left:"..tostring(node.leftLanes).." Right:"..tostring(node.rightLanes),
                                        screenX, screenY, 0, 0, tocolor(255, 255, 255), 2, "default-bold")
                                end
                            end
                        end
                    end
                end
            end
        end
    end
end