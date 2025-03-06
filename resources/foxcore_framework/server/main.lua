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

RegisterNetEvent('foxcore:syncQBCorePlayers')
AddEventHandler('foxcore:syncQBCorePlayers', function()
    if isQBCore then
        MySQL.Async.fetchAll("SELECT * FROM players", {}, function(players)
            for _, player in pairs(players) do
                local identifier = player.citizenid
                MySQL.Async.execute("INSERT INTO foxcore_users (identifier, name, job, money, inventory) VALUES (@identifier, @name, @job, @money, @inventory) ON DUPLICATE KEY UPDATE job = @job, money = @money, inventory = @inventory", {
                    ['@identifier'] = identifier,
                    ['@name'] = player.charinfo.firstname .. " " .. player.charinfo.lastname,
                    ['@job'] = player.job.name,
                    ['@money'] = json.encode(player.money),
                    ['@inventory'] = json.encode(player.inventory)
                })
            end
            print("[🔥 FoxCore] QBCore Players Synced Successfully!")
        end)
    end
end)
