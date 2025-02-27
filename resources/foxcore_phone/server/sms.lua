RegisterNetEvent("foxcore_phone:sendMessage", function(number, message)
    local src = source
    local sender = GetPlayerIdentifier(src, 0)

    MySQL.Async.execute("INSERT INTO phone_messages (sender, receiver, message) VALUES (@sender, @number, @message)", {
        ["@sender"] = sender,
        ["@number"] = number,
        ["@message"] = message
    })

    TriggerClientEvent("foxcore_phone:newMessage", number, sender, message)
end)
