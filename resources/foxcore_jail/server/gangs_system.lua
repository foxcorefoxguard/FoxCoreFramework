RegisterNetEvent('foxcore_jail:addToGang')
AddEventHandler('foxcore_jail:addToGang', function(gang)
    local src = source
    local player = exports['foxcore_framework']:GetPlayer(src)
    
    if #exports['foxcore_jail']:GetGangMembers(gang) < Config.Gangs.MaxGangMembers then
        MySQL.Async.execute('UPDATE inmates SET gang = @gang WHERE identifier = @id', {
            ['@gang'] = gang,
            ['@id'] = player.identifier
        })
        print(player.name .. " joined " .. gang)
    else
        print("❌ This gang is full!")
    end
end)
