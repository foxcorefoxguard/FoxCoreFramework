RegisterNetEvent('foxcore_jail:jailPlayer')
AddEventHandler('foxcore_jail:jailPlayer', function(target, time, jailType)
    local _source = source
    local targetPlayer = GetPlayerPed(target)
    
    if targetPlayer then
        TriggerClientEvent('foxcore_jail:sendToJail', target, time, jailType)
        print("Jailing player " .. target .. " for " .. time .. " minutes in " .. jailType)
    end
end)

RegisterNetEvent('foxcore_jail:releasePlayer')
AddEventHandler('foxcore_jail:releasePlayer', function(target)
    TriggerClientEvent('foxcore_jail:releaseFromJail', target)
end)
