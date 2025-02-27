RegisterNUICallback("makeCall", function(data, cb)
    TriggerServerEvent("foxcore_phone:startCall", data.number)
    cb("ok")
end)

RegisterNetEvent("foxcore_phone:incomingCall", function(caller)
    SendNUIMessage({
        type = "incomingCall",
        caller = caller
    })
end)

RegisterNUICallback("acceptCall", function()
    TriggerServerEvent("foxcore_phone:acceptCall")
end)

RegisterNUICallback("endCall", function()
    TriggerServerEvent("foxcore_phone:endCall")
end)
