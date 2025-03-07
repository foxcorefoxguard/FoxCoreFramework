RegisterNetEvent("foxcore_police:storeEvidence")
AddEventHandler("foxcore_police:storeEvidence", function(evidenceType, coords)
    local src = source
    local officer = GetPlayerIdentifier(src, 0)

    MySQL.execute("INSERT INTO police_evidence (officer_id, description, location) VALUES (?, ?, ?)",
        { officer, evidenceType, json.encode(coords) })

    TriggerClientEvent("chat:addMessage", src, { args = { "[PD]", "✅ Evidence stored successfully!" } })
end)
