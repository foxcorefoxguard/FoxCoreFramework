RegisterServerEvent("foxcore_jobs:givePayout")
AddEventHandler("foxcore_jobs:givePayout", function(jobId)
    local src = source
    local player = Framework.GetPlayer(src)
    local job = FoxCoreJobs.List[jobId]

    if job then
        local payout = math.random(job.payout.min, job.payout.max)
        player.Functions.AddMoney("cash", payout)
        TriggerClientEvent('ox_lib:notify', src, { title = "Job Complete", description = "You earned $" .. payout, type = 'success' })
    else
        print("[FoxCore Jobs] Invalid job ID!")
    end
end)
