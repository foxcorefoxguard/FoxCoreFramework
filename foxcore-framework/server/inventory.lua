RegisterNetEvent("foxcore:giveItem", function(target, item, quantity)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    if Items.GetItem(item) then
        MySQL.Async.execute("INSERT INTO inventory (identifier, item, quantity) VALUES (@identifier, @item, @quantity) ON DUPLICATE KEY UPDATE quantity = quantity + @quantity", {
            ["@identifier"] = identifier,
            ["@item"] = item,
            ["@quantity"] = quantity
        })
        TriggerClientEvent("foxcore:updateInventory", target)
    else
        print("^1[FoxCore]^7 Invalid item!")
    end
end)
