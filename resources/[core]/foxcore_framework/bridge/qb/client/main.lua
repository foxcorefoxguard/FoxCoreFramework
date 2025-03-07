RegisterNetEvent('qb-core:client:OnPlayerLoaded')
AddEventHandler('qb-core:client:OnPlayerLoaded', function()
    if Config.Framework == "foxcore" then
        TriggerEvent("foxcore_framework:playerLoaded")
    end
end)

RegisterNetEvent('foxcore_framework:playerLoaded')
AddEventHandler('foxcore_framework:playerLoaded', function()
    if Config.Framework == "qbcore" then
        TriggerEvent("qb-core:client:OnPlayerLoaded")
    end
end)
