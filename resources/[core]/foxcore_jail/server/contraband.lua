RegisterNetEvent('foxcore_jail:checkContraband')
AddEventHandler('foxcore_jail:checkContraband', function(player)
    local items = exports['foxcore_inventory']:GetPlayerInventory(player)
    for _, item in pairs(items) do
        if item.contraband then
            exports['foxcore_inventory']:RemoveItem(player, item.name, item.count)
            TriggerClientEvent("chat:addMessage", player, { args = { "Contraband found and confiscated!" } })
        end
    end
end)
