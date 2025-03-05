RegisterNetEvent("foxcore_ambulance:revivePlayer")
AddEventHandler("foxcore_ambulance:revivePlayer", function(targetPlayer)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    -- 🛑 Avoid Unnecessary DB Queries
    local emsData = getEMSData(identifier)
    if not emsData or not Config.EMSRanks[emsData.rank].revive then
        TriggerClientEvent("chat:addMessage", src, { args = { "[EMS]", "❌ You do not have permission to revive!" } })
        return
    end

    -- ✅ Revive the Player
    TriggerClientEvent("foxcore_ambulance:playerRevived", targetPlayer)
    TriggerClientEvent("chat:addMessage", src, { args = { "[EMS]", "✅ You revived Player ID: " .. targetPlayer } })
end)
