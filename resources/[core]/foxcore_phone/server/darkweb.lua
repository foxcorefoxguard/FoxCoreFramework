RegisterNetEvent("foxcore_phone:getBlackMarketItems", function()
    local src = source
    MySQL.Async.fetchAll("SELECT * FROM black_market", {}, function(items)
        TriggerClientEvent("foxcore_phone:loadBlackMarket", src, items)
    end)
end)

RegisterNetEvent("foxcore_phone:buyBlackMarketItem", function(item, quantity)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchScalar("SELECT price FROM black_market WHERE item = @item", {
        ["@item"] = item
    }, function(price)
        if price then
            local totalPrice = price * quantity
            MySQL.Async.execute("UPDATE players SET cash = cash - @amount WHERE identifier = @identifier", {
                ["@amount"] = totalPrice,
                ["@identifier"] = identifier
            })

            MySQL.Async.execute("INSERT INTO inventory (identifier, item, quantity) VALUES (@identifier, @item, @quantity) ON DUPLICATE KEY UPDATE quantity = quantity + @quantity", {
                ["@identifier"] = identifier,
                ["@item"] = item,
                ["@quantity"] = quantity
            })

            TriggerClientEvent("foxcore_phone:notify", src, "Purchase Successful!")
        else
            TriggerClientEvent("foxcore_phone:notify", src, "Item not available.")
        end
    end)
end)
