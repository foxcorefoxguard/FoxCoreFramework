-- 💸 Automatic Paycheck Timer
CreateThread(function()
    while true do
        Wait(Config.PaycheckInterval * 60 * 1000)

        local players = GetPlayers()
        for _, src in pairs(players) do
            local identifier = Framework.GetPlayerIdentifier(src)
            local job = Framework.GetPlayerJob(src)
            local amount = Config.Jobs[job] or 100

            -- Deposit into Primary Account
            TriggerEvent('foxcore_banking:depositPrimaryAccount', identifier, amount)
            TriggerClientEvent('foxcore_framework:notify', src, string.format("💸 Automatic paycheck deposited: $%d", amount))
        end
    end
end)

-- 🏦 Manual Paycheck Collection via Target Interaction
RegisterNetEvent("foxcore_paycheck:collect")
AddEventHandler("foxcore_paycheck:collect", function(bankAccount)
    local src = source
    local identifier = Framework.GetPlayerIdentifier(src)
    local job = Framework.GetPlayerJob(src)
    local amount = Config.Jobs[job] or 100

    -- Deposit to the Selected Bank Account
    TriggerEvent('foxcore_banking:depositToAccount', identifier, bankAccount, amount)
    TriggerClientEvent('foxcore_framework:notify', src, string.format("💸 Paycheck of $%d collected at %s!", amount, bankAccount))
end)
