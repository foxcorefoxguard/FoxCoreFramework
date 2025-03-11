RegisterCommand("jobcenter", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ action = "openJobCenter", jobs = Config.Jobs })
end, false)

RegisterNUICallback("applyJob", function(data, cb)
    local jobEvent = data.event
    if jobEvent then
        TriggerServerEvent(jobEvent)
    end
    SetNuiFocus(false, false)
    cb("ok")
end)

RegisterNUICallback("closeUI", function(_, cb)
    SetNuiFocus(false, false)
    cb("ok")
end)
