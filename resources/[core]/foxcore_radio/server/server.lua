RegisterNetEvent("foxcore_radio:requestChannelAccess")
AddEventHandler("foxcore_radio:requestChannelAccess", function(channel)
    local src = source
    local job = exports["foxcore_framework"]:GetPlayerJob(src)

    -- Check if the channel is encrypted
    for jobName, channels in pairs(Config.EncryptedChannels) do
        if table.contains(channels, channel) and job ~= jobName then
            TriggerClientEvent("chat:addMessage", src, { args = { "[Radio]", "❌ This channel is encrypted!" } })
            return
        end
    end

    TriggerClientEvent("foxcore_radio:setChannel", src, channel)
end)
