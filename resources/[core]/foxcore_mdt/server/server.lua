local MySQL = exports['oxmysql']
local officerLocations = {}

-- 📡 Update Officer Location
RegisterNetEvent("foxcore_mdt:updateOfficerLocation")
AddEventHandler("foxcore_mdt:updateOfficerLocation", function(coords)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    officerLocations[identifier] = coords
    TriggerClientEvent("foxcore_mdt:receiveOfficerLocations", -1, officerLocations)
end)

RegisterNetEvent("foxcore_mdt:search")
AddEventHandler("foxcore_mdt:search", function(data)
    local src = source
    local query = data.query

    MySQL.query("SELECT * FROM mdt_records WHERE name LIKE ? OR plate LIKE ?", {'%'..query..'%', '%'..query..'%'}, function(results)
        TriggerClientEvent("foxcore_mdt:searchResults", src, results)
    end)
end)

RegisterNetEvent("foxcore_mdt:submitReport")
AddEventHandler("foxcore_mdt:submitReport", function(data)
    local src = source
    local officer = GetPlayerName(src)
    local reportText = data.text

    MySQL.execute("INSERT INTO mdt_reports (officer, report) VALUES (?, ?)", {officer, reportText})
end)

RegisterNetEvent("foxcore_mdt:saveMugshot")
AddEventHandler("foxcore_mdt:saveMugshot", function(imagePath)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    
    MySQL.execute("UPDATE mdt_records SET mugshot = ? WHERE identifier = ?", {imagePath, identifier})
end)

RegisterNetEvent("foxcore_mdt:jailPlayer")
AddEventHandler("foxcore_mdt:jailPlayer", function(targetId, jailTime)
    TriggerClientEvent("foxcore_mdt:arrestPlayer", targetId, jailTime)
end)

RegisterNetEvent("foxcore_mdt:setBOLO")
AddEventHandler("foxcore_mdt:setBOLO", function(data)
    TriggerClientEvent("foxcore_phone:sendBOLOAlert", -1, data)
end)

RegisterNetEvent("foxcore_mdt:getFingerprint")
AddEventHandler("foxcore_mdt:getFingerprint", function(targetId)
    local src = source
    local identifier = GetPlayerIdentifier(targetId, 0)

    MySQL.query("SELECT * FROM mdt_fingerprints WHERE identifier = ?", {identifier}, function(result)
        if result[1] then
            TriggerClientEvent("foxcore_mdt:receiveFingerprintData", src, {
                name = result[1].name,
                dob = result[1].dob,
                criminalRecord = result[1].criminal_record,
                fingerprintImage = result[1].fingerprint
            })
        else
            TriggerClientEvent("foxcore_mdt:receiveFingerprintData", src, {
                name = "Unknown",
                dob = "N/A",
                criminalRecord = "No record found",
                fingerprintImage = "nui://foxcore_mdt/nui/media/fingerprints/default.png"
            })
        end
    end)
end)

-- 📜 Create a New Court Case
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

-- ⚖️ Update Court Case Status
RegisterNetEvent("foxcore_mdt:updateCourtCase")
AddEventHandler("foxcore_mdt:updateCourtCase", function(caseId, status)
    MySQL.execute("UPDATE mdt_court_cases SET case_status = ? WHERE id = ?", { status, caseId })
end)

RegisterNetEvent("foxcore_mdt:issueWarrant")
AddEventHandler("foxcore_mdt:issueWarrant", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.execute("INSERT INTO mdt_warrants (officer, suspect, charge, status) VALUES (?, ?, ?, 'Pending')",
        { identifier, data.suspect, data.charge })

    TriggerClientEvent("chat:addMessage", src, { args = { "[MDT]", "✅ Arrest Warrant Issued!" } })
end)

RegisterNetEvent("foxcore_mdt:getWarrants")
AddEventHandler("foxcore_mdt:getWarrants", function()
    local src = source
    MySQL.query("SELECT * FROM mdt_warrants ORDER BY date_created DESC", {}, function(results)
        TriggerClientEvent("foxcore_mdt:receiveWarrants", src, results)
    end)
end)

RegisterNetEvent("foxcore_mdt:updateWarrantStatus")
AddEventHandler("foxcore_mdt:updateWarrantStatus", function(warrantId, status)
    MySQL.execute("UPDATE mdt_warrants SET status = ? WHERE id = ?", {status, warrantId})
end)
