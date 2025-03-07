-- 🏥 Store Medical Records
RegisterNetEvent("foxcore_ambulance:addMedicalRecord")
AddEventHandler("foxcore_ambulance:addMedicalRecord", function(targetPlayer, diagnosis, treatment)
    local src = source
    local targetIdentifier = GetPlayerIdentifier(targetPlayer, 0)

    MySQL.execute("INSERT INTO medical_records (patient_id, diagnosis, treatment) VALUES (?, ?, ?)",
        {targetIdentifier, diagnosis, treatment})

    TriggerClientEvent("chat:addMessage", src, { args = { "[EMS]", "✅ Medical record added!" } })
end)

-- 💰 Billing System
RegisterNetEvent("foxcore_ambulance:sendBill")
AddEventHandler("foxcore_ambulance:sendBill", function(targetPlayer, amount)
    local src = source
    local targetIdentifier = GetPlayerIdentifier(targetPlayer, 0)

    MySQL.execute("UPDATE player_wallet SET cash = cash - ? WHERE identifier = ?", {amount, targetIdentifier})
    TriggerClientEvent("chat:addMessage", src, { args = { "[EMS]", "✅ You charged Player ID: " .. targetPlayer .. " $" .. amount } })
    TriggerClientEvent("chat:addMessage", targetPlayer, { args = { "[EMS]", "💰 You were billed $" .. amount } })
end)
