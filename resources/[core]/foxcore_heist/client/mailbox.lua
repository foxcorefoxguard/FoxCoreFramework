RegisterNetEvent("foxcore_heist:startMailbox")
AddEventHandler("foxcore_heist:startMailbox", function()
    TriggerEvent('foxcore_framework:notify', "✉️ Mailbox Heist Started. Check for valuable packages.")
end)
