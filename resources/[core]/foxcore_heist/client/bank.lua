RegisterNetEvent("foxcore_heist:startBank")
AddEventHandler("foxcore_heist:startBank", function()
    TriggerEvent('foxcore_framework:notify', "🏦 Bank Heist Started. Use your hacking device to disable the security!")
end)
