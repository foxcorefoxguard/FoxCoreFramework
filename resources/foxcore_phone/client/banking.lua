RegisterNUICallback("checkBalance", function(data, cb)
    TriggerServerEvent("foxcore_phone:getBalance")
    cb("ok")
end)

RegisterNetEvent("foxcore_phone:updateBalance", function(balance)
    SendNUIMessage({
        type = "updateBalance",
        balance = balance
    })
end)

RegisterNUICallback("sendMoney", function(data)
    TriggerServerEvent("foxcore_phone:transferMoney", data.number, tonumber(data.amount))
end)
