RegisterNetEvent('foxcore_mechanic:chargeCustomer')
AddEventHandler('foxcore_mechanic:chargeCustomer', function(target, amount, paymentMethod)
    local src = source
    local mechanic = exports['foxcore_framework']:GetPlayer(src)
    local customer = exports['foxcore_framework']:GetPlayer(target)

    if customer and amount > 0 then
        if exports['foxcore_banking']:ChargePlayer(target, amount, paymentMethod) then
            mechanic.addMoney(amount)
            TriggerClientEvent("chat:addMessage", src, { args = { "You charged $" .. amount .. " for repairs." } })
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "Payment failed!" } })
        end
    end
end)
