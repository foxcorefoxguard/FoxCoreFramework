local isJailed = false

RegisterNetEvent('foxcore_jail:sendToJail', function(time, jailType)
    local jailLocation = Config.Jails[jailType] or Config.Jails["bolingbroke"]

    if jailLocation then
        SetEntityCoords(PlayerPedId(), jailLocation.x, jailLocation.y, jailLocation.z)
        isJailed = true
        FreezeEntityPosition(PlayerPedId(), true)
        exports['foxcore_hud']:ShowJailTimer(time)
    end
end)

RegisterNetEvent('foxcore_jail:releaseFromJail', function()
    isJailed = false
    FreezeEntityPosition(PlayerPedId(), false)
    exports['foxcore_hud']:HideJailTimer()
end)

RegisterNetEvent('foxcore_jail:openJailUI')
AddEventHandler('foxcore_jail:openJailUI', function(time, location)
    SendNUIMessage({
        action = "updateJailUI",
        time = time,
        location = location
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback("closeJailUI", function(data, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)
