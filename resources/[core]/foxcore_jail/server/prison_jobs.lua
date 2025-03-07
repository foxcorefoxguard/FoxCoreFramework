RegisterNetEvent('foxcore_jail:startJob')
AddEventHandler('foxcore_jail:startJob', function(job)
    local src = source
    local player = exports['foxcore_framework']:GetPlayer(src)

    if Config.PrisonJobs[job] then
        local jobData = Config.PrisonJobs[job]
        Wait(jobData.requiredTime * 60000)
        exports['foxcore_banking']:AddMoney(src, "prison_tokens", jobData.pay)
        TriggerClientEvent("chat:addMessage", src, { args = { "You earned " .. jobData.pay .. " prison tokens!" } })
    end
end)
