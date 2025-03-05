Citizen.CreateThread(function()
    while Config.EMS.NPC_EMS_Calls do
        Citizen.Wait(math.random(60000, 180000)) -- 1-3 minutes between NPC calls

        local playerCoords = GetEntityCoords(PlayerPedId())
        local randomNPC = GetRandomPedAtCoord(playerCoords.x, playerCoords.y, playerCoords.z, 50.0, 50.0, 50.0, 26)
        
        if DoesEntityExist(randomNPC) then
            local npcCoords = GetEntityCoords(randomNPC)
            TriggerServerEvent("foxcore_ambulance:npcCall", npcCoords)
        end
    end
end)

RegisterNetEvent("foxcore_ambulance:receiveNPCCall")
AddEventHandler("foxcore_ambulance:receiveNPCCall", function(coords)
    TriggerEvent("chat:addMessage", { args = { "[911]", "🚨 NPC has called EMS at location: " .. coords.x .. ", " .. coords.y } })
end)
