RegisterNetEvent("foxcore_criminal:lockpick")
AddEventHandler("foxcore_criminal:lockpick", function()
    local playerPed = PlayerPedId()
    local vehicle = GetClosestVehicle()
    
    if DoesEntityExist(vehicle) then
        exports["foxcore_ui"]:ShowProgress("Lockpicking...", 10)
        Wait(10000)
        
        if math.random(1, 100) <= Config.CarTheft.LockpickSuccessChance then
            -- Unlock the vehicle
            SetVehicleDoorsLocked(vehicle, 1)
            exports["foxcore_ui"]:ShowNotification("Vehicle Unlocked!")
        else
            exports["foxcore_ui"]:ShowNotification("Lockpicking Failed!")
            if math.random(1, 100) <= Config.CarTheft.AlarmChance then
                -- Alert Police
                TriggerServerEvent("foxcore_police:alert", "Car Theft in Progress", GetEntityCoords(vehicle))
            end
        end
    end
end)
