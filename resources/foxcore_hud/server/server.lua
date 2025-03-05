local MySQL = exports['oxmysql']

-- 📡 Sync Player HUD Data (Health, Armor, Hunger, Thirst, Stress, Money)
RegisterNetEvent("foxcore_hud:requestPlayerData")
AddEventHandler("foxcore_hud:requestPlayerData", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT cash, bank, stress FROM banking_accounts WHERE identifier = ?", {identifier}, function(result)
        if result[1] then
            TriggerClientEvent("foxcore_hud:updatePlayerData", src, result[1].cash, result[1].bank, result[1].stress or 0)
        end
    end)
end)

-- 🧠 Save Stress Level (Triggered on Quit or Periodically)
RegisterNetEvent("foxcore_hud:updateStress")
AddEventHandler("foxcore_hud:updateStress", function(stressLevel)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    
    MySQL.execute("UPDATE banking_accounts SET stress = ? WHERE identifier = ?", {stressLevel, identifier})
end)

-- 🚗 Sync Speed & Fuel Data from Vehicles (Ensures Accurate Values)
RegisterNetEvent("foxcore_hud:syncVehicleData")
AddEventHandler("foxcore_hud:syncVehicleData", function(vehicleData)
    local src = source
    TriggerClientEvent("foxcore_hud:updateVehicleHUD", src, vehicleData.fuel, vehicleData.speed)
end)

-- ⏳ Auto-Save Stress Every 5 Minutes
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(300000) -- 5 minutes
        
        for _, playerId in ipairs(GetPlayers()) do
            TriggerClientEvent("foxcore_hud:requestStressSave", playerId)
        end
    end
end)

RegisterNetEvent("foxcore_hud:requestPlayerData")
AddEventHandler("foxcore_hud:requestPlayerData", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT cash, bank FROM banking_accounts WHERE identifier = ?", {identifier}, function(result)
        if result[1] then
            TriggerClientEvent("foxcore_hud:updatePlayerData", src, result[1].cash, result[1].bank)
        end
    end)
end)
