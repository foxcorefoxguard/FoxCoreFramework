RegisterNetEvent("foxcore:setJob", function(job)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    if Jobs.List[job] then
        MySQL.Async.execute("UPDATE characters SET job = @job WHERE identifier = @identifier", {
            ["@job"] = job,
            ["@identifier"] = identifier
        })
        TriggerClientEvent("foxcore:updateJob", src, job)
    else
        print("^1[FoxCore]^7 Invalid job assignment!")
    end
end)
