RegisterNetEvent("foxcore_banking:openBankUI")
AddEventHandler("foxcore_banking:openBankUI", function(balance, accounts, cards)
    SendNUIMessage({
        type = "openBank",
        balance = balance,
        accounts = accounts,
        cards = cards
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback("depositMoney", function(data)
    TriggerServerEvent("foxcore_banking:deposit", data.amount, data.account)
end)

RegisterNUICallback("withdrawMoney", function(data)
    TriggerServerEvent("foxcore_banking:withdraw", data.amount, data.account)
end)

RegisterNUICallback("closeBank", function()
    SetNuiFocus(false, false)
end)
