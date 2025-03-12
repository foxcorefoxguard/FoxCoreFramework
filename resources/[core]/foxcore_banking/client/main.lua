RegisterCommand("openbank", function()
    local balance = 10000 -- Replace with real balance fetch
    local transactions = {
        { type = "Deposit", amount = 5000, date = "2024-05-01" },
        { type = "Withdraw", amount = 3000, date = "2024-05-02" }
    }

    SendNUIMessage({
        action = "openBanking",
        balance = balance,
        transactions = transactions
    })
    SetNuiFocus(true, true)
end)

RegisterNUICallback("closeBanking", function()
    SetNuiFocus(false, false)
end)
