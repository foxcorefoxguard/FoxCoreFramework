RegisterServerEvent("foxcore_jobcenter:applyTaxi")
AddEventHandler("foxcore_jobcenter:applyTaxi", function()
    local src = source
    local identifier = GetPlayerIdentifier(src)
    MySQL.Async.execute("UPDATE foxcore_users SET job = 'taxi', job_grade = 0 WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    })
    TriggerClientEvent("esx:showNotification", src, "You are now a Taxi Driver!")
end)

RegisterServerEvent("foxcore_jobcenter:applyDelivery")
AddEventHandler("foxcore_jobcenter:applyDelivery", function()
    local src = source
    local identifier = GetPlayerIdentifier(src)
    MySQL.Async.execute("UPDATE foxcore_users SET job = 'delivery', job_grade = 0 WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    })
    TriggerClientEvent("esx:showNotification", src, "You are now a Delivery Driver!")
end)
