RegisterNetEvent('foxcore_jail:txdoc:lockCell')
AddEventHandler('foxcore_jail:txdoc:lockCell', function(cellID)
    -- Logic to lock a prison cell
    TriggerClientEvent('foxcore_jail:txdoc:lockCell', -1, cellID)
end)

RegisterNetEvent('foxcore_jail:txdoc:unlockCell')
AddEventHandler('foxcore_jail:txdoc:unlockCell', function(cellID)
    -- Logic to unlock a prison cell
    TriggerClientEvent('foxcore_jail:txdoc:unlockCell', -1, cellID)
end)

RegisterNetEvent('foxcore_jail:txdoc:searchPrisoner')
AddEventHandler('foxcore_jail:txdoc:searchPrisoner', function(target)
    local items = exports['foxcore_inventory']:GetPlayerInventory(target)
    
    for _, item in pairs(items) do
        if item.contraband then
            exports['foxcore_inventory']:RemoveItem(target, item.name, item.count)
            TriggerClientEvent("chat:addMessage", target, { args = { "A guard found and confiscated your contraband!" } })
        end
    end
end)
