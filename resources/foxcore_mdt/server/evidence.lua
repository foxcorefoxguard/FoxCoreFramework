RegisterNetEvent("foxcore_mdt:saveEvidence")
AddEventHandler("foxcore_mdt:saveEvidence", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.execute("INSERT INTO mdt_evidence (officer, case_id, description, file_path) VALUES (?, ?, ?, ?)",
        { identifier, data.case_id, data.description, data.file_path })

    TriggerClientEvent("chat:addMessage", src, { args = { "[MDT]", "✅ Evidence uploaded successfully!" } })
end)

RegisterNetEvent("foxcore_mdt:getEvidence")
AddEventHandler("foxcore_mdt:getEvidence", function(case_id)
    local src = source
    MySQL.query("SELECT * FROM mdt_evidence WHERE case_id = ?", {case_id}, function(results)
        TriggerClientEvent("foxcore_mdt:receiveEvidence", src, results)
    end)
end)
