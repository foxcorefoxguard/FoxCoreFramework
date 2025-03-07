RegisterNetEvent('foxcore_jail:txdoc:lockCell')
AddEventHandler('foxcore_jail:txdoc:lockCell', function(cellID)
    -- Apply visual lock effect
    exports['foxcore_target']:ShowLockEffect(cellID)
end)

RegisterNetEvent('foxcore_jail:txdoc:unlockCell')
AddEventHandler('foxcore_jail:txdoc:unlockCell', function(cellID)
    -- Remove lock effect
    exports['foxcore_target']:HideLockEffect(cellID)
end)

RegisterNetEvent('foxcore_jail:txdoc:searchPrisoner')
AddEventHandler('foxcore_jail:txdoc:searchPrisoner', function(target)
    -- Play frisk animation
    TaskStartScenarioInPlace(PlayerPedId(), "WORLD_HUMAN_PAT_DOWN", 0, true)
end)

RegisterCommand("makeprisonerfight", function(source, args)
    local target = tonumber(args[1])
    if target then
        TriggerServerEvent('foxcore_jail:assignPrisonerTask', target, "fight")
    end
end, false)

RegisterCommand("makeprisonersit", function(source, args)
    local target = tonumber(args[1])
    if target then
        TriggerServerEvent('foxcore_jail:assignPrisonerTask', target, "sit")
    end
end, false)

RegisterCommand("makeprisonerworkout", function(source, args)
    local target = tonumber(args[1])
    if target then
        TriggerServerEvent('foxcore_jail:assignPrisonerTask', target, "workout")
    end
end, false)
