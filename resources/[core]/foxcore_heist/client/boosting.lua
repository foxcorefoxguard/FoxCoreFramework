RegisterNetEvent("foxcore_heist:startBoosting")
AddEventHandler("foxcore_heist:startBoosting", function()
    TriggerEvent('foxcore_framework:notify', "🚗 Boosting Job Started. Steal the vehicle and deliver it to the drop-off.")
end)
