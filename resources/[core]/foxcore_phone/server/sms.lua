RegisterNetEvent("foxcore_phone:getMessages")
AddEventHandler("foxcore_phone:getMessages", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT * FROM phone_messages WHERE receiver = ? ORDER BY time DESC LIMIT 20", {identifier}, function(results)
        TriggerClientEvent("foxcore_phone:loadMessages", src, results)
    end)
end)

RegisterNetEvent("foxcore_phone:sendMessage")
AddEventHandler("foxcore_phone:sendMessage", function(data)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    local receiver = data.number
    local message = data.message

    MySQL.execute("INSERT INTO phone_messages (sender, receiver, message) VALUES (?, ?, ?)", {identifier, receiver, message})
    TriggerClientEvent("foxcore_phone:newMessage", receiver, {from = identifier, message = message})
end)
