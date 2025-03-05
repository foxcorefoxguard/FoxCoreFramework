RegisterCommand("mdt", function(source)
    local src = source
    local job = exports["foxcore_framework"]:GetPlayerJob(src)

    -- Check if player's job is allowed to use the MDT
    if not table.contains(Config.MDTJobs, job) then
        TriggerClientEvent("chat:addMessage", src, { args = { "[MDT]", "❌ You do not have access to the MDT!" } })
        return
    end

    -- Open MDT for authorized players
    TriggerClientEvent("foxcore_mdt:open", src)
end, false)
