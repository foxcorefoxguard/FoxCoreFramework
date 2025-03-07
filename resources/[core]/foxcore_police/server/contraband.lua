RegisterNetEvent("foxcore_police:searchPlayerInventory")
AddEventHandler("foxcore_police:searchPlayerInventory", function(targetId)
    local src = source
    local identifier = GetPlayerIdentifier(targetId, 0)

    MySQL.query("SELECT * FROM player_inventory WHERE identifier = ?", {identifier}, function(results)
        local illegalItems = {}

        for _, item in pairs(results) do
            if Config.Items[item.name] and Config.Items[item.name].illegal then
                table.insert(illegalItems, item)
            end
        end

        TriggerClientEvent("foxcore_police:receiveSearchResults", src, illegalItems)
    end)
end)
