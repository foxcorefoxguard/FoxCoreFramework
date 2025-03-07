local targetActive = false
local targetEntity = nil
local targetType = nil

RegisterCommand("target", function()
    targetActive = not targetActive
    SetNuiFocus(targetActive, targetActive)

    if targetActive then
        SendNUIMessage({ type = "showTarget", active = true })
        findTarget()
    else
        SendNUIMessage({ type = "showTarget", active = false })
    end
end, false)

function findTarget()
    Citizen.CreateThread(function()
        while targetActive do
            Citizen.Wait(0)
            local playerPed = PlayerPedId()
            local coords = GetEntityCoords(playerPed)
            local entity, distance = GetClosestObjectOrPed(coords)

            if entity and distance < 2.0 then
                targetEntity = entity
                targetType = GetEntityType(entity)
                SendNUIMessage({ type = "updateTarget", entity = entity, entityType = targetType })
            else
                SendNUIMessage({ type = "clearTarget" })
            end
        end
    end)
end
