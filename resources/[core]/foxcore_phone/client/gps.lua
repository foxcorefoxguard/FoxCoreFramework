RegisterNUICallback("setWaypoint", function(data, cb)
    SetNewWaypoint(data.x, data.y)
    cb("ok")
end)

RegisterNUICallback("shareLocation", function(data, cb)
    TriggerServerEvent("foxcore_phone:shareLocation", data.friend, data.x, data.y)
    cb("ok")
end)

RegisterNetEvent("foxcore_phone:receiveLocation", function(x, y, sender)
    SendNUIMessage({
        type = "newLocation",
        sender = sender,
        x = x,
        y = y
    })
end)
