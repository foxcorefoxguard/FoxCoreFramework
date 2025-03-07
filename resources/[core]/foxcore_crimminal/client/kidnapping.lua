RegisterNetEvent("foxcore_criminal:kidnap")
AddEventHandler("foxcore_criminal:kidnap", function(target)
    local playerPed = PlayerPedId()
    local targetPed = GetPlayerPed(GetPlayerFromServerId(target))

    if not targetPed then return end

    if exports["foxcore_inventory"]:HasItem("rope", 1) then
        exports["foxcore_ui"]:ShowProgress("Tying Up Target...", 5)
        Wait(5000)

        AttachEntityToEntity(targetPed, playerPed, 0, 0.0, 0.6, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)
        exports["foxcore_ui"]:ShowNotification("Target is restrained!")
    else
        exports["foxcore_ui"]:ShowNotification("You need rope to do this!")
    end
end)
