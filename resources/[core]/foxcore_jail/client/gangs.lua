RegisterNetEvent('foxcore_jail:joinGang')
AddEventHandler('foxcore_jail:joinGang', function(gang)
    if Config.Gangs.EnableGangs then
        if table.contains(Config.Gangs.AvailableGangs, gang) then
            TriggerServerEvent('foxcore_jail:addToGang', gang)
        else
            print("❌ Invalid Gang Name!")
        end
    end
end)
