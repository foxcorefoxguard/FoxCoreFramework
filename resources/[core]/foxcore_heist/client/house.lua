RegisterNetEvent("foxcore_heist:startHouse")
AddEventHandler("foxcore_heist:startHouse", function()
    TriggerEvent('foxcore_framework:notify', "🏠 House Robbery Started. Use a lockpick to enter!")
end)
