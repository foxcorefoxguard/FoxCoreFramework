RegisterServerEvent("foxcore_police:alert")
AddEventHandler("foxcore_police:alert", function(type, coords)
    local officers = GetPoliceOnline()

    for _, officer in pairs(officers) do
        TriggerClientEvent("foxcore_ui:showNotification", officer, "🚔 Police Alert: " .. type)
        TriggerClientEvent("foxcore_mdt:addBlip", officer, coords, "Crime Scene")
    end
end)

function GetPoliceOnline()
    local officers = {}
    for _, player in ipairs(GetPlayers()) do
        if exports["foxcore_framework"]:GetJob(player) == "police" then
            table.insert(officers, player)
        end
    end
    return officers
end
