RegisterNetEvent('foxcore_jail:buyFromShop')
AddEventHandler('foxcore_jail:buyFromShop', function(item)
    local shopItem = Config.PrisonShop[item]

    if shopItem then
        if exports['foxcore_banking']:RemoveMoney("prison_tokens", shopItem.price) then
            exports['foxcore_inventory']:AddItem(item, 1)
            TriggerEvent("chat:addMessage", { args = { "You purchased " .. item } })
        else
            TriggerEvent("chat:addMessage", { args = { "Not enough tokens!" } })
        end
    end
end)
