RegisterNetEvent("foxcore_phone:getBalance", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchScalar("SELECT bank FROM players WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    }, function(balance)
        TriggerClientEvent("foxcore_phone:updateBalance", src, balance)
    end)
end)

RegisterNetEvent("foxcore_phone:transferMoney", function(number, amount)
    local src = source
    local sender = GetPlayerIdentifier(src, 0)

    MySQL.Async.execute("UPDATE players SET bank = bank - @amount WHERE identifier = @sender", {
        ["@amount"] = amount,
        ["@sender"] = sender
    })

    MySQL.Async.execute("UPDATE players SET bank = bank + @amount WHERE identifier = @receiver", {
        ["@amount"] = amount,
        ["@receiver"] = number
    })

    TriggerClientEvent("foxcore_phone:notify", src, "Money Sent!")
end)
