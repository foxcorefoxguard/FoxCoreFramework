RegisterNetEvent("foxcore_phone:openPhone", function()
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "openPhone"
    })
end)

RegisterNUICallback("closePhone", function()
    SetNuiFocus(false, false)
end)
