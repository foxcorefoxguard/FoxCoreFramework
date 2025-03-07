RegisterNetEvent('foxcore_mechanic:startRepair')
AddEventHandler('foxcore_mechanic:startRepair', function(partType)
    local ped = PlayerPedId()
    local repairTime = Config.RepairTime
    local anim = Config.RepairAnimations[partType] or "WORLD_HUMAN_WELDING"

    TaskStartScenarioInPlace(ped, anim, 0, true)

    exports['progressbar']:Progress({
        name = "repairing",
        duration = repairTime * 1000,
        label = "Repairing " .. partType .. "...",
        useWhileDead = false
    }, function(status)
        if not status then
            ClearPedTasksImmediately(ped)
            exports['mythic_notify']:SendAlert('success', partType .. " repaired!", 5000)
        end
    end)
end)
