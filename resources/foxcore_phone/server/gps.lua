RegisterNetEvent("foxcore_phone:shareLocation", function(friend, x, y)
    local src = source
    TriggerClientEvent("foxcore_phone:receiveLocation", friend, x, y, src)
end)
