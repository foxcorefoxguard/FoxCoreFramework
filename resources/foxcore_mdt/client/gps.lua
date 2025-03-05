local policeOfficers = {}

-- 📡 Update Officer Location Every 5 Seconds
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
        
        if IsPolice() then
            local coords = GetEntityCoords(PlayerPedId())
            TriggerServerEvent("foxcore_mdt:updateOfficerLocation", coords)
        end
    end
end)

-- 🚔 Receive Live Officer Locations
RegisterNetEvent("foxcore_mdt:receiveOfficerLocations")
AddEventHandler("foxcore_mdt:receiveOfficerLocations", function(officers)
    policeOfficers = officers
end)

-- 📡 Show Officers on the Map
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(500)
        
        for _, officer in pairs(policeOfficers) do
            DrawMarker(1, officer.x, officer.y, officer.z - 1, 0, 0, 0, 0, 0, 0, 0.5, 0.5, 0.5, 0, 0, 255, 150, false, false, 2, false, nil, nil, false)
        end
    end
end)
