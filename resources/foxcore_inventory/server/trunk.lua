RegisterNetEvent("foxcore_inventory:openTrunk", function(plate)
    local src = source

    MySQL.Async.fetchAll("SELECT item, quantity FROM vehicle_trunks WHERE plate = @plate", {
        ["@plate"] = plate
    }, function(result)
        local trunkInventory = {}
        for _, row in ipairs(result) do
            trunkInventory[row.item] = row.quantity
        end
        TriggerClientEvent("foxcore_inventory:openTrunkUI", src, trunkInventory)
    end)
end)

RegisterNetEvent("foxcore_inventory:storeTrunkItem", function(plate, item, quantity)
    local src = source

    MySQL.Async.execute("INSERT INTO vehicle_trunks (plate, item, quantity) VALUES (@plate, @item, @quantity) ON DUPLICATE KEY UPDATE quantity = quantity + @quantity", {
        ["@plate"] = plate,
        ["@item"] = item,
        ["@quantity"] = quantity
    })
end)
