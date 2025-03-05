local isOnDuty = false

-- 🚑 Toggle EMS Duty
RegisterCommand("emsduty", function()
    isOnDuty = not isOnDuty
    TriggerEvent("chat:addMessage", { args = { "[EMS]", isOnDuty and "✅ You are now ON DUTY!" or "❌ You are now OFF DUTY!" } })
end, false)

-- 🏥 Revive System
RegisterCommand("revive", function(source, args)
    local targetPlayer = tonumber(args[1])
    if not targetPlayer then
        TriggerEvent("chat:addMessage", { args = { "[EMS]", "❌ Specify a player ID!" } })
        return
    end

    if not isOnDuty then
        TriggerEvent("chat:addMessage", { args = { "[EMS]", "❌ You must be ON DUTY to revive players!" } })
        return
    end

    TriggerServerEvent("foxcore_ambulance:revivePlayer", targetPlayer)
end, false)

-- 📡 Receive Revive Notification
RegisterNetEvent("foxcore_ambulance:playerRevived")
AddEventHandler("foxcore_ambulance:playerRevived", function()
    local playerPed = PlayerPedId()
    SetEntityHealth(playerPed, 200)
    ClearPedBloodDamage(playerPed)
    TriggerEvent("chat:addMessage", { args = { "[EMS]", "✅ You have been revived!" } })
end)
