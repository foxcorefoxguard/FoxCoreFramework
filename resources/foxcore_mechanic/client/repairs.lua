RegisterNetEvent('foxcore_mechanic:startRepair')
AddEventHandler('foxcore_mechanic:startRepair', function(vehicle)
    local ped = PlayerPedId()
    local repairTime = Config.RepairTime

    if vehicle then
        TaskStartScenarioInPlace(ped, "WORLD_HUMAN_WELDING", 0, true)
        exports['progressbar']:Progress({
            name = "repairing",
            duration = repairTime * 1000,
            label = "Repairing Vehicle...",
            useWhileDead = false
        }, function(status)
            if not status then
                SetVehicleFixed(vehicle)
                SetVehicleEngineHealth(vehicle, 1000.0)
                SetVehicleDeformationFixed(vehicle)
                SetVehicleDirtLevel(vehicle, 0.0)
                ClearPedTasksImmediately(ped)
                exports['mythic_notify']:SendAlert('success', "Vehicle Repaired!", 5000)
            end
        end)
    end
end)
