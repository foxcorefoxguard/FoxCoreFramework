RegisterServerEvent('foxcore_mdt:getCharges')
AddEventHandler('foxcore_mdt:getCharges', function(chargeType)
    local src = source
    local charges = GetChargesByType(chargeType)
    TriggerClientEvent('foxcore_mdt:sendCharges', src, charges)
end)

-- Saving Evidence Logs
RegisterServerEvent('foxcore_mdt:saveEvidence')
AddEventHandler('foxcore_mdt:saveEvidence', function(data)
    MySQL.Async.execute('INSERT INTO police_evidence (officer, suspect, details, timestamp) VALUES (@officer, @suspect, @details, NOW())', {
        ['@officer'] = data.officer,
        ['@suspect'] = data.suspect,
        ['@details'] = json.encode(data.details)
    })
end)

-- Auto-Apply Jail Time & Fine System (FoxCore Integration)
RegisterServerEvent('foxcore_mdt:applyPunishment')
AddEventHandler('foxcore_mdt:applyPunishment', function(target, chargeData)
    local jailTime = chargeData.jailTime or 0
    local fineAmount = chargeData.fine or 0

    -- Apply Jail Time
    if jailTime > 0 then
        TriggerEvent('foxcore_jail:sendToJail', target, jailTime)
    end

    -- Apply Fine
    if fineAmount > 0 then
        TriggerEvent('foxcore_banking:removeMoney', target, fineAmount)
    end
end)
