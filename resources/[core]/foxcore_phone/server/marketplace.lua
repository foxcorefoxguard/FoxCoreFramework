RegisterNetEvent("foxcore_phone:getMarketplace")
AddEventHandler("foxcore_phone:getMarketplace", function()
    local src = source

    MySQL.query("SELECT * FROM phone_marketplace ORDER BY time DESC LIMIT 20", {}, function(results)
        TriggerClientEvent("foxcore_phone:loadMarketplace", src, results)
    end)
end)

RegisterNetEvent("foxcore_phone:listMarketplaceItem")
AddEventHandler("foxcore_phone:listMarketplaceItem", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.execute("INSERT INTO phone_marketplace (seller, name, price) VALUES (?, ?, ?)", {identifier, data.name, data.price})
end)
