RegisterNetEvent("foxcore_phone:getCallLog")
AddEventHandler("foxcore_phone:getCallLog", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT * FROM phone_calls WHERE identifier = ? ORDER BY time DESC LIMIT 10", {identifier}, function(results)
        TriggerClientEvent("foxcore_phone:loadCallLog", src, results)
    end)
end)

RegisterNetEvent("foxcore_phone:getVoicemail")
AddEventHandler("foxcore_phone:getVoicemail", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT * FROM phone_voicemail WHERE identifier = ? ORDER BY time DESC LIMIT 5", {identifier}, function(results)
        TriggerClientEvent("foxcore_phone:loadVoicemail", src, results)
    end)
end)
