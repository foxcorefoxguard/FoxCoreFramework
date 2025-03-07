RegisterCommand("revive", function(source, args)
    local targetPlayer = tonumber(args[1])

    if not targetPlayer then
        TriggerEvent("chat:addMessage", { args = { "[EMS]", "❌ Specify player ID!" } })
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
