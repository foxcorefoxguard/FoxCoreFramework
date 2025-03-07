RegisterNetEvent('foxcore_mechanic:orderParts')
AddEventHandler('foxcore_mechanic:orderParts', function(supplier, part, quantity)
    local src = source
    local mechanic = exports['foxcore_framework']:GetPlayer(src)
    local supplierData = Config.Suppliers[supplier]

    if supplierData then
        local totalCost = (Config.PartLevels[part][1].price * quantity) * (1 + (supplierData.markup / 100))

        if exports['foxcore_banking']:ChargePlayer(src, totalCost, "company_funds") then
            TriggerClientEvent("chat:addMessage", src, { args = { "✅ Order placed with " .. supplierData.name .. "!" } })
            Wait(supplierData.deliveryTime * 60000)
            exports['foxcore_inventory']:AddItem(src, part .. "_lvl1", quantity)
            TriggerClientEvent("chat:addMessage", src, { args = { "📦 Your order has arrived!" } })
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "❌ Not enough company funds!" } })
        end
    end
end)
