local isDead = false

RegisterNetEvent("foxcore:revivePlayer", function()
    local ped = PlayerPedId()
    if isDead then
        NetworkResurrectLocalPlayer(GetEntityCoords(ped), true, true, false)
        SetEntityHealth(ped, 200)
        ClearPedTasksImmediately(ped)
        ClearPedBloodDamage(ped)
        isDead = false
        Framework.Debug("Player revived")
    end
end)

-- Death event handler
AddEventHandler("baseevents:onPlayerDied", function()
    isDead = true
    Framework.Debug("Player died")
end)

RegisterNetEvent("foxcore:sendAnnouncement", function(message)
    SetNotificationTextEntry("STRING")
    AddTextComponentString(message)
    DrawNotification(false, true)
end)
