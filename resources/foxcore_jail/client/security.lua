local securityActive = false

RegisterCommand('toggleCameras', function()
    if exports['foxcore_framework']:HasJob("txdoc") then
        securityActive = not securityActive
        SendNUIMessage({ type = "toggleSecurity", status = securityActive })
    end
end, false)

RegisterCommand('triggerAlarm', function()
    if exports['foxcore_framework']:HasJob("txdoc") then
        TriggerServerEvent('foxcore_jail:alarmTrigger')
    end
end, false)
