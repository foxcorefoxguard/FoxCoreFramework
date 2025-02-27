RegisterNetEvent("foxcore_banking:getBalance", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchScalar("SELECT bank FROM players WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    }, function(balance)
        TriggerClientEvent("foxcore_banking:openATM", src, balance)
    end)
end)

RegisterNetEvent("foxcore_banking:deposit", function(amount)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.execute("UPDATE players SET bank = bank + @amount WHERE identifier = @identifier", {
        ["@amount"] = amount,
        ["@identifier"] = identifier
    })
end)

RegisterNetEvent("foxcore_banking:withdraw", function(amount)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.execute("UPDATE players SET bank = bank - @amount WHERE identifier = @identifier", {
        ["@amount"] = amount,
        ["@identifier"] = identifier
    })
end)
