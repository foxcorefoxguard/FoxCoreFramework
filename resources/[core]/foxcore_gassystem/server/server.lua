local MySQL = exports['oxmysql']

RegisterNetEvent("foxcore_gassystem:checkBalance")
AddEventHandler("foxcore_gassystem:checkBalance", function(fuelType, liters)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    local pricePerLiter = Config.FuelTypes[fuelType].price
    local totalCost = math.floor(pricePerLiter * liters)

    MySQL.query("SELECT checking FROM banking_accounts WHERE identifier = ?", {identifier}, function(result)
        if result[1] and result[1].checking >= totalCost then
            TriggerClientEvent("foxcore_gassystem:refuel", src, fuelType, liters, totalCost)
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "[Gas Station]", "❌ Insufficient funds!" } })
        end
    end)
end)

RegisterNetEvent("foxcore_gassystem:processPayment")
AddEventHandler("foxcore_gassystem:processPayment", function(fuelType, liters, method)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    
    local pricePerLiter = Config.FuelTypes[fuelType].price
    local totalCost = math.floor(pricePerLiter * liters)

    if method == "bank" then
        MySQL.execute("UPDATE banking_accounts SET checking = checking - ? WHERE identifier = ?", {totalCost, identifier})
    end

    TriggerClientEvent("chat:addMessage", src, { args = { "[Bank]", "💳 Charged $" .. totalCost .. " for " .. liters .. " liters of " .. fuelType } })
end)
