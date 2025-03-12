local activeHeists = {}

-- Handle Heist Start with Cooldown Logic
RegisterNetEvent('foxcore_heist:startHeist')
AddEventHandler('foxcore_heist:startHeist', function(heist)
    local src = source
    local player = Framework.GetPlayer(src)
    local requiredItem = Config.Heists[heist].requiredItem
    local cooldown = Config.Heists[heist].cooldown

    -- Check for Item
    if not player.hasItem(requiredItem) then
        TriggerClientEvent('foxcore_framework:notify', src, "❌ Required item missing: " .. requiredItem)
        return
    end

    -- Cooldown Check
    if activeHeists[src] and (os.time() - activeHeists[src]) < cooldown then
        local timeLeft = cooldown - (os.time() - activeHeists[src])
        TriggerClientEvent('foxcore_framework:notify', src, "⌛ Heist on cooldown. Try again in " .. math.ceil(timeLeft / 60) .. " minutes.")
        return
    end

    -- Start Heist
    activeHeists[src] = os.time()
    TriggerClientEvent("foxcore_heist:start" .. heist:gsub("^%l", string.upper), src)
end)
