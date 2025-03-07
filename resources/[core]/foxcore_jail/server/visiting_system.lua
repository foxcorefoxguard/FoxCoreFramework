RegisterNetEvent('foxcore_jail:requestVisit')
AddEventHandler('foxcore_jail:requestVisit', function(target)
    local src = source
    local player = exports['foxcore_framework']:GetPlayer(src)
    
    if Config.Visiting.EnableVisitingHours then
        if player.job.name == "lawyer" or exports['foxcore_jail']:IsInmate(target) then
            TriggerClientEvent('foxcore_jail:startVisiting', src)
        else
            print("❌ You are not authorized for a visit.")
        end
    end
end)
