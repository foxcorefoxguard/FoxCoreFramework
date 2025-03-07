RegisterNUICallback("sendMessage", function(data, cb)
    TriggerServerEvent("foxcore_phone:sendMessage", data.number, data.message)
    cb("ok")
end)

RegisterNetEvent("foxcore_phone:newMessage", function(sender, message)
    SendNUIMessage({
        type = "newMessage",
        sender = sender,
        message = message
    })
end)
