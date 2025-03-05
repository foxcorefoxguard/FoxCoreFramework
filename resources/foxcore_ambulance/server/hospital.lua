RegisterNetEvent("foxcore_ambulance:admitPatient")
AddEventHandler("foxcore_ambulance:admitPatient", function(targetPlayer)
    local src = source
    MySQL.execute("INSERT INTO hospital_records (patient_id, admitted_by) VALUES (?, ?)", {targetPlayer, src})
    TriggerClientEvent("chat:addMessage", src, { args = { "[EMS]", "✅ Patient ID: " .. targetPlayer .. " has been admitted." } })
end)
