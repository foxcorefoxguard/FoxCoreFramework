RegisterCommand('mechanicTablet', function()
    if Config.Tablet.EnableTablet and exports['foxcore_framework']:HasJob("mechanic") then
        SendNUIMessage({ action = "openTablet" })
        SetNuiFocus(true, true)
    end
end, false)

RegisterNUICallback("closeTablet", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNetEvent('foxcore_mechanic:addXP')
AddEventHandler('foxcore_mechanic:addXP', function(amount)
    local playerXP = exports['foxcore_framework']:GetPlayerData().mechanicXP or 0
    local newXP = playerXP + amount

    -- 📌 Check for Rank Up
    for rank, data in pairs(Config.JobLevels) do
        if newXP >= data.requiredXP then
            exports['foxcore_framework']:SetPlayerData("mechanicRank", rank)
            exports['mythic_notify']:SendAlert('success', "🎖️ You've been promoted to " .. data.name .. "!", 5000)
        end
    end

    exports['foxcore_framework']:SetPlayerData("mechanicXP", newXP)
    TriggerClientEvent("chat:addMessage", source, { args = { "🔧 You gained " .. amount .. " XP!" } })
end)
