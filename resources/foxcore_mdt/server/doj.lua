-- ⚖️ Create a Court Case
RegisterNetEvent("foxcore_mdt:createCourtCase")
AddEventHandler("foxcore_mdt:createCourtCase", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.execute("INSERT INTO mdt_court_cases (judge, defendant, charge, case_status) VALUES (?, ?, ?, 'Pending')",
        { identifier, data.defendant, data.charge })
    
    TriggerClientEvent("chat:addMessage", src, { args = { "[MDT]", "✅ Court case created successfully!" } })
end)

-- 📡 Get Court Cases
RegisterNetEvent("foxcore_mdt:getCourtCases")
AddEventHandler("foxcore_mdt:getCourtCases", function()
    local src = source
    MySQL.query("SELECT * FROM mdt_court_cases ORDER BY date_created DESC", {}, function(results)
        TriggerClientEvent("foxcore_mdt:receiveCourtCases", src, results)
    end)
end)

-- 👨‍⚖️ DOJ Panel: Approve or Deny a Warrant
RegisterNetEvent("foxcore_mdt:dojApproveWarrant")
AddEventHandler("foxcore_mdt:dojApproveWarrant", function(warrantId, status)
    MySQL.execute("UPDATE mdt_warrants SET status = ? WHERE id = ?", {status, warrantId})
end)

RegisterNetEvent("foxcore_mdt:logCourtroomMessage")
AddEventHandler("foxcore_mdt:logCourtroomMessage", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.execute("INSERT INTO mdt_court_logs (case_id, sender, message) VALUES (?, ?, ?)",
        { data.case_id, identifier, data.message })
end)

RegisterNetEvent("foxcore_mdt:getCourtroomLogs")
AddEventHandler("foxcore_mdt:getCourtroomLogs", function(case_id)
    local src = source
    MySQL.query("SELECT * FROM mdt_court_logs WHERE case_id = ?", {case_id}, function(results)
        TriggerClientEvent("foxcore_mdt:receiveCourtroomLogs", src, results)
    end)
end)

RegisterNetEvent("foxcore_mdt:requestPublicRecord")
AddEventHandler("foxcore_mdt:requestPublicRecord", function(document_id)
    local src = source
    MySQL.query("SELECT * FROM mdt_public_records WHERE id = ?", {document_id}, function(result)
        if result[1] then
            TriggerClientEvent("foxcore_mdt:receivePublicRecord", src, result[1])
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "[MDT]", "❌ No public record found." } })
        end
    end)
end)
