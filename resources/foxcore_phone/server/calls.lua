RegisterNetEvent("foxcore_phone:startCall", function(number)
    local src = source
    local caller = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchScalar("SELECT identifier FROM phone_contacts WHERE number = @number", {
        ["@number"] = number
    }, function(receiver)
        if receiver then
            TriggerClientEvent("foxcore_phone:incomingCall", receiver, caller)
        else
            TriggerClientEvent("foxcore_phone:notify", src, "Number not found.")
        end
    end)
end)

RegisterNetEvent("foxcore_phone:endCall", function()
    -- Logic to end call
end)
