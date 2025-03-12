-- Tablet Animation and UI Trigger
RegisterCommand("heisttablet", function()
    local playerPed = PlayerPedId()

    -- Play Tablet Animation
    RequestAnimDict(Config.TabletAnim.dict)
    while not HasAnimDictLoaded(Config.TabletAnim.dict) do
        Wait(100)
    end
    TaskPlayAnim(playerPed, Config.TabletAnim.dict, Config.TabletAnim.anim, 8.0, -8.0, -1, 50, 0, false, false, false)

    -- Display Tablet UI
    SendNUIMessage({ action = "openTablet" })
    SetNuiFocus(true, true)
end)

-- Close Tablet UI
RegisterNUICallback("closeTablet", function()
    ClearPedTasks(PlayerPedId())
    SetNuiFocus(false, false)
end)
