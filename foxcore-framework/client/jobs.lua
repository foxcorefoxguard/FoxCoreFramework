local currentJob = "unemployed"

RegisterNetEvent("foxcore:updateJob", function(job)
    currentJob = job
    Framework.Debug("Updated job to: " .. job)
end)
