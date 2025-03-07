RegisterNetEvent("foxcore_inventory:openStash", function(stashId)
    local src = source

    MySQL.Async.fetchAll("SELECT item, quantity FROM stash WHERE stash_id = @stashId", {
        ["@stashId"] = stashId
    }, function(result)
        local stashInventory = {}
        for _, row in ipairs(result) do
            stashInventory[row.item] = row.quantity
        end
        TriggerClientEvent("foxcore_inventory:openStashUI", src, stashInventory)
    end)
end)

RegisterNetEvent("foxcore_inventory:storeItem", function(stashId, item, quantity)
    local src = source

    MySQL.Async.execute("INSERT INTO stash (stash_id, item, quantity) VALUES (@stashId, @item, @quantity) ON DUPLICATE KEY UPDATE quantity = quantity + @quantity", {
        ["@stashId"] = stashId,
        ["@item"] = item,
        ["@quantity"] = quantity
    })
end)
