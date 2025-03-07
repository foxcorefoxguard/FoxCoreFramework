MySQL.ready(function()
    Framework.Debug("Database connected successfully.")
    
    -- 🔄 Auto-Sync QBCore Players if QBCore is detected
    if GetResourceState("qb-core") == "started" then
        SyncQBCorePlayers()
    end
end)

-- 💾 Save Player Data (Works for QBCore & FoxCore)
function SavePlayerData(player)
    local isQBCore = GetResourceState("qb-core") == "started"

    if isQBCore then
        MySQL.Async.execute("INSERT INTO players (citizenid) VALUES (@identifier) ON DUPLICATE KEY UPDATE last_seen=NOW()", {
            ["@identifier"] = player.identifier
        })
    else
        MySQL.Async.execute("INSERT INTO foxcore_users (identifier) VALUES (@identifier) ON DUPLICATE KEY UPDATE last_seen=NOW()", {
            ["@identifier"] = player.identifier
        })
    end
end

-- 🔄 Sync All QBCore Players to FoxCore on Startup
function SyncQBCorePlayers()
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
