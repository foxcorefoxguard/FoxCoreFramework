RegisterNetEvent("foxcore_inventory:getInventory", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchAll("SELECT item, quantity FROM inventory WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    }, function(result)
        local inventory = {}
        for _, row in ipairs(result) do
            inventory[row.item] = row.quantity
        end
        TriggerClientEvent("foxcore_inventory:openInventory", src, inventory)
    end)
end)

RegisterNetEvent("foxcore_inventory:useItem", function(item)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchScalar("SELECT quantity FROM inventory WHERE identifier = @identifier AND item = @item", {
        ["@identifier"] = identifier,
        ["@item"] = item
    }, function(quantity)
        if quantity and quantity > 0 then
            -- Consume or use the item
            if item == "water" then
                TriggerClientEvent("foxcore_inventory:drinkWater", src)
            elseif item == "bread" then
                TriggerClientEvent("foxcore_inventory:eatBread", src)
            end
            -- Remove 1 item after use
            MySQL.Async.execute("UPDATE inventory SET quantity = quantity - 1 WHERE identifier = @identifier AND item = @item", {
                ["@identifier"] = identifier,
                ["@item"] = item
            })
        end
    end)
end)

RegisterNetEvent("foxcore_inventory:giveItem", function(target, item, quantity)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.execute("INSERT INTO inventory (identifier, item, quantity) VALUES (@identifier, @item, @quantity) ON DUPLICATE KEY UPDATE quantity = quantity + @quantity", {
        ["@identifier"] = identifier,
        ["@item"] = item,
        ["@quantity"] = quantity
    })
    TriggerClientEvent("foxcore_inventory:updateInventory", target)
end)
