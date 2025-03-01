MySQL.ready(function()
    Framework.Debug("Database connected successfully.")
end)

function SavePlayerData(player)
    MySQL.Async.execute("INSERT INTO players (identifier) VALUES (@identifier) ON DUPLICATE KEY UPDATE last_seen=NOW()", {
        ["@identifier"] = player.identifier
    })
end
