RegisterNetEvent('foxcore_mechanic:purchasePart')
AddEventHandler('foxcore_mechanic:purchasePart', function(partType, level)
    local src = source
    local mechanic = exports['foxcore_framework']:GetPlayer(src)
    local partData = Config.PartLevels[partType][level]

    if partData then
        if exports['foxcore_banking']:ChargePlayer(src, partData.price, "company_funds") then
            exports['foxcore_inventory']:AddItem(src, partType .. "_lvl" .. level, 1)
            TriggerClientEvent("chat:addMessage", src, { args = { "Purchased " .. partData.label .. " for $" .. partData.price } })
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "Not enough funds!" } })
        end
    end
end)
