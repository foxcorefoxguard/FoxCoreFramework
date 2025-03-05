RegisterNetEvent("foxcore_ambulance:revivePlayer")
AddEventHandler("foxcore_ambulance:revivePlayer", function(targetPlayer)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    -- Deduct payment from player
    MySQL.execute("UPDATE player_wallet SET cash = cash - ? WHERE identifier = ?", {Config.EMS.ReviveCost, identifier})

    -- Notify client & revive player
    TriggerClientEvent("foxcore_ambulance:playerRevived", targetPlayer)
    TriggerClientEvent("chat:addMessage", src, { args = { "[EMS]", "✅ You revived Player ID: " .. targetPlayer } })
end)

RegisterNetEvent("foxcore_ambulance:sendBill")
AddEventHandler("foxcore_ambulance:sendBill", function(targetPlayer, amount)
    local src = source
    local targetIdentifier = GetPlayerIdentifier(targetPlayer, 0)

    MySQL.execute("UPDATE player_wallet SET cash = cash - ? WHERE identifier = ?", {amount, targetIdentifier})
    TriggerClientEvent("chat:addMessage", src, { args = { "[EMS]", "✅ You charged Player ID: " .. targetPlayer .. " $" .. amount } })
    TriggerClientEvent("chat:addMessage", targetPlayer, { args = { "[EMS]", "💰 You were billed $" .. amount } })
end)

