RegisterNUICallback("startHeist", function(data, cb)
    local src = source
    local player = Framework.GetPlayer(src)
    local heist = data.heist
    local requiredItem = Config.Heists[heist].requiredItem

    -- Check if Player Has Required Item
    if not player.hasItem(requiredItem) then
        TriggerClientEvent('foxcore_framework:notify', src, "❌ You don't have the required item for this heist!")
        return
    end

    -- Start Heist Logic
    TriggerClientEvent('foxcore_framework:notify', src, "✅ Heist Started: " .. heist)
end)

RegisterNetEvent('foxcore_heist:completeHeist')
AddEventHandler('foxcore_heist:completeHeist', function(heist, reward)
    local src = source
    Framework.AddMoney(src, reward)
    TriggerClientEvent('foxcore_framework:notify', src, "💰 Heist completed! Earned $" .. reward)
end)
