RegisterNetEvent("foxcore_blackmarket:launderMoney")
AddEventHandler("foxcore_blackmarket:launderMoney", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT dirty_money FROM player_wallet WHERE identifier = ?", {identifier}, function(result)
        if result[1] and result[1].dirty_money > 0 then
            local amount = result[1].dirty_money
            local cleanAmount = math.floor(amount * Config.Laundering.Rate)

            MySQL.execute("UPDATE player_wallet SET dirty_money = 0, cash = cash + ? WHERE identifier = ?", {cleanAmount, identifier})
            TriggerClientEvent("chat:addMessage", src, { args = { "[Money Launderer]", "✅ You laundered $" .. amount .. " and received $" .. cleanAmount } })
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "[Money Launderer]", "❌ No dirty money to launder!" } })
        end
    end)
end)
