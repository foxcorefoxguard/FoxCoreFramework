local dutyOfficers = {}

-- 🛡️ Set Officer Duty Status
RegisterNetEvent("foxcore_police:setDutyStatus")
AddEventHandler("foxcore_police:setDutyStatus", function(status)
    local src = source
    dutyOfficers[src] = status
end)

-- 🚔 Arrest & Jail a Player
RegisterNetEvent("foxcore_police:arrest")
AddEventHandler("foxcore_police:arrest", function(targetId)
    local src = source
    if dutyOfficers[src] then
        TriggerClientEvent("foxcore_police:jail", targetId, 10) -- 10-minute jail time
        TriggerEvent("foxcore_mdt:logArrest", src, targetId)
    end
end)

RegisterNetEvent("foxcore_police:scanFingerprint")
AddEventHandler("foxcore_police:scanFingerprint", function(targetId)
    local src = source
    local identifier = GetPlayerIdentifier(targetId, 0)

    MySQL.query("SELECT * FROM police_fingerprints WHERE identifier = ?", {identifier}, function(result)
        if result[1] then
            TriggerClientEvent("foxcore_police:receiveFingerprint", src, {
                name = result[1].name,
                dob = result[1].dob,
                criminalRecord = result[1].criminal_record,
                fingerprintImage = result[1].fingerprint
            })
        else
            TriggerClientEvent("foxcore_police:receiveFingerprint", src, {
                name = "Unknown",
                dob = "N/A",
                criminalRecord = "No record found",
                fingerprintImage = "nui://foxcore_police/nui/media/fingerprints/default.png"
            })
        end
    end)
end)

RegisterNetEvent("foxcore_police:storeDNA")
AddEventHandler("foxcore_police:storeDNA", function(targetId)
    local src = source
    local identifier = GetPlayerIdentifier(targetId, 0)

    MySQL.query("SELECT * FROM police_dna WHERE identifier = ?", {identifier}, function(result)
        if result[1] then
            TriggerClientEvent("foxcore_police:receiveDNA", src, {
                suspect = result[1].suspect,
                match = "Match Found"
            })
        else
            TriggerClientEvent("foxcore_police:receiveDNA", src, {
                suspect = "Unknown",
                match = "No Match"
            })
        end
    end)
end)

RegisterNetEvent("foxcore_police:getCrimeScenes")
AddEventHandler("foxcore_police:getCrimeScenes", function()
    local src = source
    MySQL.query("SELECT * FROM police_crime_markers ORDER BY date_logged DESC", {}, function(results)
        TriggerClientEvent("foxcore_police:loadCrimeScenes", src, results)
    end)
end)
