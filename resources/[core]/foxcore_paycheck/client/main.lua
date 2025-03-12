-- 🚀 Spawn Bank Peds for Paycheck Collection
CreateThread(function()
    for _, bank in pairs(Config.BankLocations) do
        RequestModel(bank.pedModel)
        while not HasModelLoaded(bank.pedModel) do
            Wait(10)
        end

        local ped = CreatePed(4, bank.pedModel, bank.location.x, bank.location.y, bank.location.z - 1, bank.heading, false, true)
        FreezeEntityPosition(ped, true)
        SetEntityInvincible(ped, true)
        SetBlockingOfNonTemporaryEvents(ped, true)

        -- 📌 Add FoxCore Target for Interaction
        exports['foxcore_target']:AddTargetEntity(ped, {
            options = {
                {
                    label = string.format("Collect Paycheck at %s 💰", bank.label),
                    icon = "fas fa-money-bill-wave",
                    action = function()
                        TriggerServerEvent("foxcore_paycheck:collect", bank.accountType)
                    end,
                    canInteract = function()
                        return true
                    end
                }
            },
            distance = 2.5
        })
    end
end)
