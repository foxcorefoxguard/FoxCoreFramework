RegisterNetEvent("foxcore:playerJoined", function()
    local src = source
    local playerData = Framework.GetPlayer(src)
    Framework.Debug("Player joined: " .. playerData.identifier)

    -- Send data to the client
    TriggerClientEvent("foxcore:initializePlayer", src, playerData)
end)

AddEventHandler("playerConnecting", function(name, setCallback, deferrals)
    local src = source
    deferrals.defer()
    Wait(1000)
    deferrals.done() -- Continue connection
end)
