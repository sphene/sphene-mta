-----------------------------------
-- * Variables
-----------------------------------

TaskHandler = {}
TaskHandler.__index = TaskHandler
TaskHandler.hasFailed = false
TaskHandler.failureMsg = ""
TaskHandler.currentTask = -1
TaskHandler.savedResponses = {}

TaskHandler.tasks = {
    [TaskCode.GIVE_WEAPON] = function(...)
        return TaskHandler.onGiveWeapon(unpack(arg))
    end,
    [TaskCode.WARP_INTO_VEHICLE] = function(...)
        return TaskHandler.onWarpIntoVehicle(unpack(arg))
    end,
    [TaskCode.GIVE_PLAYER_MONEY] = function(...)
        return TaskHandler.onGivePlayerMoney(unpack(arg))
    end,
    [TaskCode.GIVE_ACTOR_JETPACK] = function(...)
        return TaskHandler.onGiveActorJetpack(unpack(arg))
    end,
    [TaskCode.REMOVE_ACTOR_JETPACK] = function(...)
        return TaskHandler.onRemoveActorJetpack(unpack(arg))
    end,
    [TaskCode.REMOVE_WEAPON] = function(...)
        return TaskHandler.onRemoveWeapon(unpack(arg))
    end,
    [TaskCode.ELEMENT_SET_INTERIOR] = function(...)
        return TaskHandler.onElementSetInterior(unpack(arg))
    end,
    [TaskCode.ACTOR_KILL] = function(...)
        return TaskHandler.onKillActor(unpack(arg))
    end,
    [TaskCode.EXPLODE_VEHICLE] = function(...)
        return TaskHandler.onExplodeVehicle(unpack(arg))
    end,
    [TaskCode.REMOVE_FROM_VEHICLE] = function(...)
        return TaskHandler.onRemoveFromVehicle(unpack(arg))
    end,
    [TaskCode.PLAYER_SET_WANTED_LEVEL] = function(...)
        return TaskHandler.onPlayerSetWantedLevel(unpack(arg))
    end,
    [TaskCode.DESTROY_ELEMENT] = function(...)
        return TaskHandler.onDestroyElement(unpack(arg))
    end,
    [TaskCode.SET_WEAPONS_HIDDEN] = function(...)
        return TaskHandler.onSetWeaponsHidden(unpack(arg))
    end,
    [TaskCode.SYNC_CAMERA_INTERIOR] = function(...)
        return TaskHandler.onSyncCameraInterior(unpack(arg))
    end,
    [TaskCode.ELEMENT_SET_POSITION] = function(...)
        return TaskHandler.onSetPositionElement(unpack(arg))
    end,
    [TaskCode.ELEMENT_SET_ROTATION] = function(...)
        return TaskHandler.onSetRotationElement(unpack(arg))
    end,
    [TaskCode.ACTOR_SYNC] = function(_, _, actor, vehicle, seat)
        local actorVehicle = getPedOccupiedVehicle(actor)

        if (actorVehicle and (actorVehicle ~= vehicle or getPedOccupiedVehicleSeat(actor) ~= seat)) then
            removePedFromVehicle(actor)
            actorVehicle = false
        end

        if (vehicle and (not actorVehicle or actorVehicle ~= vehicle)) then
            warpPedIntoVehicle(actor, vehicle, seat)
        end

        if (getElementType(actor) == 'player') then
            --setCameraTarget(actor, actor)
        end

        return true
    end,
    [TaskCode.PLAYER_ADD_TO_VEHICLE] = function(player, _)
        Core.players[player]:warpIntoVehicle()
        return true
    end,
    [TaskCode.PLAYER_REMOVE_FROM_VEHICLE] = function(player, _)
        Core.players[player]:removeFromVehicle()
        return true
    end,
}

-----------------------------------
-- * Functions
-----------------------------------

function TaskHandler.onHandleTask(task, taskId, ...)
    if (TaskHandler.tasks[task] == nil) then
        Logger.error('TASK HANDLER', 'Received unknown task: {}!', task)
        return
    end

    TaskHandler.currentTask = task

    TaskHandler.hasFailed = false
    TaskHandler.failureMsg = ""

    local response = {TaskHandler.tasks[task](client, taskId, unpack(arg))}
    TaskHandler.sendResponse(client, taskId,
        {["failed"] = TaskHandler.hasFailed, ["message"] = TaskHandler.failureMsg}, unpack(response))

    TaskHandler.hasFailed = false
    TaskHandler.failureMsg = ""
end

function TaskHandler.onGiveWeapon(clientPointer, taskId, actor, weapon, ammo)
    if (not giveWeapon(actor, weapon, ammo)) then
        return TaskHandler.fail("Unable to give weapon to ped.")
    end

    return true
end

function TaskHandler.onGivePlayerMoney(clientPointer, taskId, money)
    if (not clientPointer:setMoney(clientPointer:getMoney() + money)) then
        return TaskHandler.fail("Unable to give money to player.")
    end

    return true
end

function TaskHandler.onGiveActorJetpack(clientPointer, taskId, actorPointer)
    if (not setPedWearingJetpack(actorPointer, true)) then
        return TaskHandler.fail("Unable to give jetpack to actor.")
    end

    return true
end

function TaskHandler.onRemoveActorJetpack(clientPointer, taskId, actorPointer)
    if (not setPedWearingJetpack(actorPointer, false)) then
        return TaskHandler.fail("Unable to remove jetpack from actor.")
    end

    return true
end

function TaskHandler.onWarpIntoVehicle(clientPointer, taskId, actorPointer, carPointer, seat)
    if (not warpPedIntoVehicle(actorPointer, carPointer, seat)) then
        return TaskHandler.fail("Unable to warp ped into vehicle.")
    end

    setVehicleEngineState(carPointer, true)

    return true
end

function TaskHandler.onRemoveWeapon(clientPointer, taskId, actorPointer, weaponId)
    weaponId = weaponId or -1

    if (weaponId == -1) then
        if (not takeAllWeapons(actorPointer)) then
            return TaskHandler.fail("Unable to remove all weapons.")
        end
    else
        takeWeapon(actorPointer, weaponId)
    end

    return true
end

function TaskHandler.onElementSetInterior(clientPointer, taskId, elementPointer, interior)
    interior = interior or 0

    if (not setElementInterior(elementPointer, interior)) then
        return TaskHandler.fail("Unable to set interior for element ["
            ..tostring(getElementType(elementPointer))..":"..tostring(interior).."].")
    end

    return true
end

function TaskHandler.onKillActor(clientPointer, taskId, actorPointer)
    if (not killPed(actorPointer)) then
        return TaskHandler.fail("Unable to kill actor.")
    end

    return true
end

function TaskHandler.onExplodeVehicle(clientPointer, taskId, car, preventRadiusDamage)
    preventRadiusDamage = preventRadiusDamage or false

    if (not car:blow(not preventRadiusDamage)) then
        return TaskHandler.fail("Unable to blow up vehicle.")
    end

    return true
end

function TaskHandler.onRemoveFromVehicle(clientPointer, taskId, actorPointer)
    if (getPedOccupiedVehicle(actorPointer)) then
        if (not removePedFromVehicle(actorPointer)) then
            return TaskHandler.fail("Unable to remove ped from vehicle.")
        end
    end

    return true
end

function TaskHandler.onPlayerSetWantedLevel(clientPointer, taskId, wantedLevel)
    if (not setPlayerWantedLevel(clientPointer, wantedLevel)) then
        return TaskHandler.fail("Unable to set wanted level.")
    end

    return true
end

function TaskHandler.onDestroyElement(clientPointer, taskId, element)
    if (not destroyElement(element)) then
        return TaskHandler.fail("Unable to destroy element.")
    end

    return true
end

function TaskHandler.onSetWeaponsHidden(clientPointer, taskId, actor, setHidden)
    if (setHidden) then
        actor:setData("beast_last_weapon_slot", getPedWeaponSlot(actor))
        if (not setPedWeaponSlot(actor, 0)) then
            return TaskHandler.fail("Unable to hide actor weapons.")
        end
    else
        local lastSlot = actor:getData("beast_last_weapon_slot")

        if (lastSlot == false) then
            lastSlot = 0
        end

        if (not setPedWeaponSlot(actor, lastSlot)) then
            return TaskHandler.fail("Unable to show actor weapons.")
        end
    end

    return true
end

function TaskHandler.onSyncCameraInterior(clientPointer, taskId, interior)
    return setCameraInterior(clientPointer, interior)
end

function TaskHandler.onSetPositionElement(clientPointer, taskId, element, x, y, z)
    if (not setElementPosition(element, x, y, z)) then
        return TaskHandler.fail("Unable to set position for element.")
    end

    return true
end

function TaskHandler.onSetRotationElement(clientPointer, taskId, element, rotX, rotY, rotZ)
    if (not setElementRotation(element, rotX, rotY, rotZ)) then
        return TaskHandler.fail("Unable to set rotation for element.")
    end

    return true
end

function TaskHandler.fail(failureMsg)
    TaskHandler.failureMsg = failureMsg or ""
    TaskHandler.hasFailed = true
end

function TaskHandler.sendResponse(clientPointer, taskId, failureState, ...)
    if failureState["failed"] then
        Logger.error('TASK HANDLER', 'Task {} failed: {}!', taskId, failureState["message"])
    end

    triggerClientEvent(clientPointer, "sphene:task:response", resourceRoot, taskId, failureState, unpack(arg))
end

-----------------------------------
-- * Events
-----------------------------------

addEvent("sphene:task", true)
addEventHandler("sphene:task", resourceRoot, TaskHandler.onHandleTask)
