RegisterNetEvent("foxcore_heist:startPackage")
AddEventHandler("foxcore_heist:startPackage", function()
    TriggerEvent('foxcore_framework:notify', "📦 Package Heist Started. Deliver the package to the destination.")
end)
