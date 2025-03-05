RegisterNetEvent("foxcore_ambulance:addMedicalRecord")
AddEventHandler("foxcore_ambulance:addMedicalRecord", function(targetPlayer, diagnosis, treatment)
    local src = source
    local targetIdentifier = GetPlayerIdentifier(targetPlayer, 0)

    MySQL.execute("INSERT INTO medical_records (patient_id, diagnosis, treatment) VALUES (?, ?, ?)",
        {targetIdentifier, diagnosis, treatment})

    TriggerClientEvent("chat:addMessage", src, { args = { "[EMS]", "✅ Medical record added!" } })
end)
