RegisterNetEvent('foxcore_jail:alarmTrigger')
AddEventHandler('foxcore_jail:alarmTrigger', function()
    TriggerClientEvent('foxcore_jail:alarmSound', -1)
    print("🚨 Prison Alarm Triggered by TXDOC Guard!")
end)
