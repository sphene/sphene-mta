-----------------------------------
-- * Locals (for perfomance)
-----------------------------------

local INFINITE = 1/0

-----------------------------------
-- * Variables
-----------------------------------

Path = {}
Path.__index = Path

-----------------------------------
-- * Functions
-----------------------------------

function Path:create(element)
    local mt = setmetatable({}, Path)

    mt.path = {}
    mt.element = element
    mt.isVehicle = (element:getType() == "vehicle")

    return mt
end

function Path:find(destX, destY, destZ)
    local x, y, z = self.element:getPosition()

    local closestNode = Path.findClosestPoint(x, y, z, true, self.isVehicle)
    local closestDestNode = Path.findClosestPoint(destX, destY, destZ, false, self.isVehicle)

    if (not closestNode or not closestDestNode) then
        return {
            flags = 0,
            isHighway = false,
            linkId = 0,
            linkedNodes = {},
            areaId = 0,
            nodeId = 0,
            pathWidth = 0,
            type = 0,
            x = destX,
            y = destY,
            z = destZ,
            bend = false,
            angle = 0,
            trafficLight = 0,
        }
    end

    local areas = TrafficArea.getAll()
    local _, _, rotZ = self.element:getRotation()

    for _, linkedNode in pairs(closestNode.linkedNodes) do
        local node = areas[linkedNode[1] + 1][self.isVehicle and TrafficArea.NODE_TYPE_VEHICLE or TrafficArea.NODE_TYPE_PED][linkedNode[2] + 1]

        if (node) then
            if (math.abs(findRotation(x, y, node.x, node.y) - rotZ) > 90) then
                node.heuristicCost = 0xFFFFFF
            end
        end
    end

    local closedSet = {}
    local openSet = {closestNode}
    local cameFrom = {}

    local gScore, fScore = {}, {}

    gScore[closestNode] = closestNode.heuristicCost
    fScore[closestNode] = gScore[closestNode] +
        getDistanceBetweenPoints3D(closestNode.x, closestNode.y, closestNode.z, closestDestNode.x, closestDestNode.y, closestDestNode.z)

    while (#openSet > 0) do
        local lowest, current = INFINITE, nil

        for i=1, #openSet do
            local node = openSet[i]
            local score = fScore[node]

            if (score < lowest) then
                lowest, current = score, node
            end
        end

        if (current == closestDestNode) then
            local path = Path.unwind({}, cameFrom, closestDestNode)
            path[#path + 1] = closestDestNode

            local updatedPath = {}

            for i=1, #path do
                local node = path[i]

                local nodeX = node.x
                local nodeY = node.y
                local nodeZ = node.z
                local isBend = false
                local angle = 0
                local trafficLight = 0

                local previousNode = updatedPath[#updatedPath] or false
                local nextNode = path[i + 1] or false
                local nextNaviNode = false
                --local nextLinkedNode = false

                if (nextNode and self.isVehicle) then
                    for _, linkedNode in pairs(node.linkedNodes) do
                        if (linkedNode[1] == nextNode.areaId and linkedNode[2] == nextNode.nodeId) then
                            nextNaviNode = areas[linkedNode[3] + 1][TrafficArea.NODE_TYPE_NAVI][linkedNode[4] + 1]
                            --nextLinkedNode = areas[linkedNode[1] + 1][TrafficArea.NODE_TYPE_VEHICLE][linkedNode[2] + 1]
                            break
                        end
                    end

                    if (nextNaviNode.trafficLightDirectionBehavior == 1) then
                        trafficLight = nextNaviNode.trafficLightBehavior
                    end
                end

                if (previousNode and self.isVehicle) then
                    local previousNaviNode = false
                    local previousLinkedNode = false

                    for _, linkedNode in pairs(node.linkedNodes) do
                        if (linkedNode[1] == previousNode.areaId and linkedNode[2] == previousNode.nodeId) then
                            previousNaviNode = areas[linkedNode[3] + 1][TrafficArea.NODE_TYPE_NAVI][linkedNode[4] + 1]
                            previousLinkedNode = areas[linkedNode[1] + 1][self.isVehicle and TrafficArea.NODE_TYPE_VEHICLE or TrafficArea.NODE_TYPE_PED][linkedNode[2] + 1]
                            break
                        end
                    end

                    local laneWidth = 2.8
                    local laneCount = previousNaviNode.leftLanes + previousNaviNode.rightLanes
                    local matrix = Matrix(Vector3(node.x, node.y, 0), Vector3(0, 0, findRotation(previousLinkedNode.x, previousLinkedNode.y, node.x, node.y)))
                    local closestDistance = -1

                    if (laneCount > 1) then
                        local leftOfCenter = math.floor(laneCount / 2)
                        local rightOfCenter = laneCount - leftOfCenter
                        local lanesProcessed = 0

                        for j=1, leftOfCenter do
                            if (lanesProcessed >= previousNaviNode.leftLanes) then
                                local lane = matrix.position - matrix.right * ((node.pathWidth / 2) + (laneWidth * j))
                                local laneDistance = getDistanceBetweenPoints2D(lane.x, lane.y, previousNode.x, previousNode.y)

                                if (laneDistance < closestDistance or closestDistance == -1) then
                                    closestDistance = laneDistance
                                    nodeX, nodeY = lane.x, lane.y
                                end

                                lanesProcessed = lanesProcessed + 1
                            end
                        end

                        for j=1, rightOfCenter do
                            local lane = matrix.position + matrix.right * ((node.pathWidth / 2) + (laneWidth * j))
                            local laneDistance = getDistanceBetweenPoints2D(lane.x, lane.y, previousNode.x, previousNode.y)

                            if (laneDistance < closestDistance or closestDistance == -1) then
                                closestDistance = laneDistance
                                nodeX, nodeY = lane.x, lane.y
                            end
                        end
                    end

                    if (nextNode) then
                        local previousAngle = findRotation(previousLinkedNode.x, previousLinkedNode.y, node.x, node.y)
                        local nextAngle = findRotation(node.x, node.y, nextNode.x, nextNode.y)

                        if (nextAngle - previousAngle > 180) then
                            previousAngle = previousAngle + 360
                        elseif (previousAngle - nextAngle > 180) then
                            nextAngle = nextAngle + 360
                        end

                        local angleDifference = nextAngle - previousAngle
                        angle = math.abs(angleDifference)

                        if (angle > 35) then
                            local nextNodeX, nextNodeY, nextNodeZ = nextNode.x, nextNode.y, nextNode.z

                            laneCount = nextNaviNode.leftLanes + nextNaviNode.rightLanes
                            closestDistance = -1

                            local nextNodeMatrix = Matrix(Vector3(nextNode.x, nextNode.y, 0), Vector3(0, 0, findRotation(node.x, node.y, nextNode.x, nextNode.y)))
                            local isLeft = false
                            local laneId = 0

                            if (laneCount > 1) then
                                local leftOfCenter = math.floor(laneCount / 2)
                                local rightOfCenter = laneCount - leftOfCenter
                                local lanesProcessed = 0

                                for j=1, leftOfCenter do
                                    if (lanesProcessed >= nextNaviNode.leftLanes) then
                                        local lane = nextNodeMatrix.position - nextNodeMatrix.right * ((nextNode.pathWidth / 2) + (laneWidth * j))
                                        local laneDistance = getDistanceBetweenPoints2D(lane.x, lane.y, nodeX, nodeY)

                                        if (laneDistance < closestDistance or closestDistance == -1) then
                                            closestDistance = laneDistance
                                            nextNodeX, nextNodeY = lane.x, lane.y
                                            isLeft = true
                                            laneId = j
                                        end

                                        lanesProcessed = lanesProcessed + 1
                                    end
                                end

                                for j=1, rightOfCenter do
                                    local lane = nextNodeMatrix.position + nextNodeMatrix.right * ((nextNode.pathWidth / 2) + (laneWidth * j))
                                    local laneDistance = getDistanceBetweenPoints2D(lane.x, lane.y, nodeX, nodeY)

                                    if (laneDistance < closestDistance or closestDistance == -1) then
                                        closestDistance = laneDistance
                                        nextNodeX, nextNodeY = lane.x, lane.y
                                        isLeft = false
                                        laneId = j
                                    end
                                end
                            end

                            matrix = Matrix(Vector3(nodeX, nodeY, 0), Vector3(0, 0, findRotation(nodeX, nodeY, nextNodeX, nextNodeY)))
                            local lane

                            if (isLeft) then
                                lane = matrix.position - matrix.right * ((nextNode.pathWidth / 2) + (laneWidth * laneId))
                            else
                                lane = matrix.position + matrix.right * ((nextNode.pathWidth / 2) + (laneWidth * laneId))
                            end

                            local curveFirstDistance = getDistanceBetweenPoints2D(lane.x, lane.y, previousNode.x, previousNode.y)

                            if (curveFirstDistance > 10) then
                                curveFirstDistance = 10
                            end

                            local curveFirstMatrix = Matrix(Vector3(lane.x, lane.y, 0), Vector3(0, 0, findRotation(lane.x, lane.y, previousNode.x, previousNode.y)))
                            curveFirstMatrix = curveFirstMatrix.position + curveFirstMatrix.forward * curveFirstDistance

                            local curveFirstX = curveFirstMatrix.x
                            local curveFirstY = curveFirstMatrix.y

                            local curveSecondDistance = getDistanceBetweenPoints2D(lane.x, lane.y, nextNodeX, nextNodeY)

                            if (curveSecondDistance > 10) then
                                curveSecondDistance = 10
                            end

                            local curveSecondMatrix = Matrix(Vector3(lane.x, lane.y, 0), Vector3(0, 0, findRotation(lane.x, lane.y, nextNodeX, nextNodeY)))
                            curveSecondMatrix = curveSecondMatrix.position + curveSecondMatrix.forward * curveSecondDistance

                            local curveSecondX = curveSecondMatrix.x
                            local curveSecondY = curveSecondMatrix.y

                            for n=1, 5 do
                                local point = getQuadBezier(
                                    Vector2(curveFirstX, curveFirstY),
                                    Vector2(lane.x, lane.y),
                                    Vector2(curveSecondX, curveSecondY),
                                    n / 5
                                )

                                updatedPath[#updatedPath + 1] = {
                                    flags = node.flags,
                                    isHighway = node.isHighway,
                                    linkId = node.linkId,
                                    linkedNodes = node.linkedNodes,
                                    areaId = node.areaId,
                                    nodeId = node.nodeId,
                                    pathWidth = node.pathWidth,
                                    type = node.type,
                                    x = point.x,
                                    y = point.y,
                                    z = previousNode.z + (((nextNodeZ - previousNode.z) / 10) * n),
                                    bend = true,
                                    angle = angle,
                                    trafficLight = (i == 1) and trafficLight or 0,
                                }
                            end

                            isBend = true
                        end
                    end
                end

                if (not isBend) then
                    updatedPath[#updatedPath + 1] = {
                        flags = node.flags,
                        isHighway = node.isHighway,
                        linkId = node.linkId,
                        linkedNodes = node.linkedNodes,
                        areaId = node.areaId,
                        nodeId = node.nodeId,
                        pathWidth = node.pathWidth,
                        type = node.type,
                        x = nodeX,
                        y = nodeY,
                        z = nodeZ,
                        bend = isBend,
                        angle = angle,
                        trafficLight = trafficLight,
                    }
                end
            end

            updatedPath[#updatedPath + 1] = {
                flags = 0,
                isHighway = false,
                linkId = 0,
                linkedNodes = {},
                areaId = 0,
                nodeId = 0,
                pathWidth = 0,
                type = 0,
                x = destX,
                y = destY,
                z = destZ,
                bend = false,
                angle = 0,
                trafficLight = 0,
            }

            self.path = updatedPath

            return true
        end

        for i=1, #openSet do
            if (openSet[i] == current) then
                openSet[i] = openSet[#openSet]
                openSet[#openSet] = nil
                break
            end
        end

        closedSet[#closedSet + 1] = current

        for _, linkedNode in pairs(current.linkedNodes) do
            local neighbor = areas[linkedNode[1] + 1][self.isVehicle and TrafficArea.NODE_TYPE_VEHICLE or TrafficArea.NODE_TYPE_PED][linkedNode[2] + 1]

            local notIn = true

            for i=1, #closedSet do
                if (closedSet[i] == neighbor) then
                    notIn = false
                end
            end

            if (notIn) then
                local tentativeGScore = gScore[current] +
                    getDistanceBetweenPoints3D(current.x, current.y, current.z, neighbor.x, neighbor.y, neighbor.z)

                notIn = true

                for i=1, #openSet do
                    if (openSet[i] == neighbor) then
                        notIn = false
                    end
                end

                if (notIn or (tentativeGScore < gScore[neighbor])) then
                    cameFrom[neighbor] = current
                    gScore[neighbor] = neighbor.heuristicCost
                    fScore[neighbor] = gScore[neighbor] +
                        getDistanceBetweenPoints3D(closestDestNode.x, closestDestNode.y, closestDestNode.z,
                        neighbor.x, neighbor.y, neighbor.z)

                    notIn = true

                    for i=1, #openSet do
                        if (openSet[i] == neighbor) then
                            notIn = false
                        end
                    end

                    if (notIn) then
                        openSet[#openSet + 1] = neighbor
                    end
                end
            end
        end
    end

    return {
        {
            flags = 0,
            isHighway = false,
            linkId = 0,
            linkedNodes = {},
            areaId = 0,
            nodeId = 0,
            pathWidth = 0,
            type = 0,
            x = x,
            y = y,
            z = z,
            bend = false,
            angle = 0,
            trafficLight = 0,
        },
        {
            flags = 0,
            isHighway = false,
            linkId = 0,
            linkedNodes = {},
            areaId = 0,
            nodeId = 0,
            pathWidth = 0,
            type = 0,
            x = destX,
            y = destY,
            z = destZ,
            bend = false,
            angle = 0,
            trafficLight = 0,
        }
    }
end

function Path:findNextWaypoint(minDistance)
    local path = self.path

    if (#path == 0) then
        return
    end

    local x, y, z = self.element:getPosition()

    local closestNode = false
    local closestNodeDistance = 0
    local closestNodeX, closestNodeY, closestNodeZ = 0, 0, 0

    for i=1, #path do
        local distance = 0
        local node = path[i]
        local shortestX, shortestY, shortestZ = 0, 0, 0
        local duplicate = false

        if (i == #path) then
            distance = getDistanceBetweenPoints3D(x, y, z, node.x, node.y, node.z)
        else
            local nextNode = path[i + 1]

            local A = x - node.x
            local B = y - node.y
            local C = z - node.z
            local D = nextNode.x - node.x
            local E = nextNode.y - node.y
            local F = nextNode.z - node.z

            local point = A * D + B * E + C * F
            local lenSquare = D * D + E * E + F * F

            if (lenSquare ~= 0) then
                local parameter = point / lenSquare

                if parameter < 0 then
                    shortestX = node.x
                    shortestY = node.y
                    shortestZ = node.z
                elseif parameter > 1 then
                    shortestX = nextNode.x
                    shortestY = nextNode.y
                    shortestZ = nextNode.z
                else
                    shortestX = node.x + parameter * D
                    shortestY = node.y + parameter * E
                    shortestZ = node.z + parameter * F
                end

                distance = getDistanceBetweenPoints3D(x, y, z, shortestX, shortestY, shortestZ)
            else
                duplicate = true
            end

            node = nextNode
        end

        if (duplicate == false and (closestNode == false or (distance < closestNodeDistance and getDistanceBetweenPoints3D(x, y, z, node.x, node.y, node.z) >= (minDistance or 0)))) then
            closestNode = node
            closestNodeDistance = distance
            closestNodeX, closestNodeY, closestNodeZ = shortestX, shortestY, shortestZ
        end
    end

    return closestNode, closestNodeX, closestNodeY, closestNodeZ
end

function Path:render()
    local x, y, _ = self.element:getPosition()

    for i=1, #self.path do
        if (i > 1) then
            dxDrawLine3D(self.path[i - 1].x, self.path[i - 1].y, self.path[i - 1].z + 0.5,
                    self.path[i].x, self.path[i].y, self.path[i].z + 0.5, tocolor(255, 255, 255), 2)
        end

        local screenX, screenY = getScreenFromWorldPosition(self.path[i].x, self.path[i].y, self.path[i].z + 1)

        if (screenX) then
            if (self.path[i].trafficLight > 0) then
                dxDrawCircle(screenX, screenY, 6, 0, 360, tocolor(255, 100, 100), tocolor(255, 100, 100))
            else
                dxDrawCircle(screenX, screenY, 6, 0, 360, tocolor(255, 255, 0), tocolor(255, 255, 0))
            end
        end

        local node = self.path[i]
        local distance = getDistanceBetweenPoints2D(x, y, node.x, node.y)

        if (distance < 100) then
            screenX, screenY = getScreenFromWorldPosition(node.x, node.y, node.z + 2)

            if (screenX) then
                dxDrawText(tostring(node.angle), screenX, screenY, 0, 0, tocolor(255, 255, 255), 2, "default-bold")
            end

            screenX, screenY = getScreenFromWorldPosition(node.x, node.y, node.z + 3)

            if (screenX) then
                dxDrawText(tostring(node.bend), screenX, screenY, 0, 0, tocolor(255, 255, 255), 2, "default-bold")
            end
        end
    end

    local node, pointX, pointY, pointZ = self:findNextWaypoint()

    if (node) then
        local distance = getDistanceBetweenPoints2D(x, y, node.x, node.y)

        if (distance < 100) then
            screenX, screenY = getScreenFromWorldPosition(node.x, node.y, node.z)

            if (screenX) then
                dxDrawCircle(screenX, screenY, 6, 0, 360, tocolor(255, 0, 255), tocolor(255, 0, 255))
            end
        end

        screenX, screenY = getScreenFromWorldPosition(pointX, pointY, pointZ)

        if (screenX) then
            dxDrawCircle(screenX, screenY, 6, 0, 360, tocolor(255, 100, 100), tocolor(255, 100, 100))
        end
    end
end

function Path.unwind(flatPath, map, currentNode)
    if (map[currentNode]) then
        local node = map[currentNode]
        local linkedNodes = {}

        for i=1, #node.linkedNodes do
            local linkedNode = node.linkedNodes[i]
            linkedNodes[i] = { linkedNode[1], linkedNode[2], linkedNode[3], linkedNode[4] }
        end

        table.insert(flatPath, 1, {
            flags = node.flags,
            isHighway = node.isHighway,
            linkId = node.linkId,
            linkedNodes = linkedNodes,
            areaId = node.areaId,
            nodeId = node.nodeId,
            pathWidth = node.pathWidth,
            type = node.type,
            x = node.x,
            y = node.y,
            z = node.z,
        })

        return Path.unwind(flatPath, map, map[currentNode])
    else
        return flatPath
    end
end

function Path.findClosestPoint(x, y, z, resetHeuristics, isVehicle)
    local closestNode = false
    local closestNodeDist = 0

    local closestAreas = {
        TrafficArea.getIdByPosition(x, y),
        TrafficArea.getIdByPosition(x + 750, y),
        TrafficArea.getIdByPosition(x + 750, y + 750),
        TrafficArea.getIdByPosition(x + 750, y - 750),
        TrafficArea.getIdByPosition(x - 750, y),
        TrafficArea.getIdByPosition(x - 750, y + 750),
        TrafficArea.getIdByPosition(x - 750, y - 750),
        TrafficArea.getIdByPosition(x, y + 750),
        TrafficArea.getIdByPosition(x, y - 750),
    }

    for _, area in pairs(closestAreas) do
        area = TrafficArea.get(area)

        if (area) then
            for _, node in pairs(area[isVehicle and TrafficArea.NODE_TYPE_VEHICLE or TrafficArea.NODE_TYPE_PED]) do
                if (resetHeuristics) then
                    node.heuristicCost = node.originalHeuristicCost
                end

                local dist = getDistanceBetweenPoints3D(x, y, z, node.x, node.y, node.z)

                if (closestNode == false or dist < closestNodeDist) then
                    closestNode = node
                    closestNodeDist = dist
                end
            end
        end
    end

    return closestNode
end

local renderPath = false

addCommandHandler('path', function(_, x, y, z)
    if (not x or not y or not z) then
        outputChatBox("SYNTAX: /path [x] [y] [z]", 255, 100, 100)
        return
    end

    renderPath = Path:create(PlayerElement.getLocalPlayer())

    if (renderPath:find(tonumber(x), tonumber(y), tonumber(z))) then
        outputChatBox("Path created.", 100, 255, 100)
    else
        outputChatBox("No valid path found.", 255, 100, 100)
        renderPath = false
    end
end)

addEventHandler('onClientRender', root, function()
    if (renderPath) then
        renderPath:render()
    end
end)