RegisterNetEvent("foxcore_inventory:getItems")
AddEventHandler("foxcore_inventory:getItems", function()
    local src = source
    TriggerClientEvent("foxcore_inventory:receiveItems", src, Config.Items)
end)
