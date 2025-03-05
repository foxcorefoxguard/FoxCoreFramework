RegisterNetEvent("foxcore_ambulance:npcCall")
AddEventHandler("foxcore_ambulance:npcCall", function(coords)
    TriggerClientEvent("foxcore_ambulance:receiveNPCCall", -1, coords)
end)
