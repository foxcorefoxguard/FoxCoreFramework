RegisterNetEvent("foxcore_banking:openATM", function(balance)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "openATM",
        balance = balance
    })
end)

RegisterNUICallback("deposit", function(data)
    TriggerServerEvent("foxcore_banking:deposit", tonumber(data.amount))
end)

RegisterNUICallback("withdraw", function(data)
    TriggerServerEvent("foxcore_banking:withdraw", tonumber(data.amount))
end)
