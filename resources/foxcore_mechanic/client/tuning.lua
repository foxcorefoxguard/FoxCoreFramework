RegisterCommand('tune', function()
    local playerPed = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(playerPed, false)

    if vehicle then
        SetVehicleMod(vehicle, 11, 3, false) -- Engine
        SetVehicleMod(vehicle, 12, 2, false) -- Brakes
        SetVehicleMod(vehicle, 15, 3, false) -- Suspension
        SetVehicleMod(vehicle, 18, 1, false) -- Turbo
        exports['mythic_notify']:SendAlert('success', "Vehicle Tuned!", 5000)
    end
end)

RegisterNetEvent('foxcore_mechanic:upgradePart')
AddEventHandler('foxcore_mechanic:upgradePart', function(partType, level)
    local vehicle = GetVehiclePedIsIn(PlayerPedId(), false)

    if vehicle then
        local partData = Config.PartLevels[partType][level]
        if partData then
            SetVehicleMod(vehicle, GetModType(partType), level, false)
            exports['mythic_notify']:SendAlert('success', "Installed " .. partData.label .. "!", 5000)
        end
    end
end)
