RegisterNetEvent("foxcore_phone:postTweet", function(message)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.execute("INSERT INTO tweets (identifier, message) VALUES (@identifier, @message)", {
        ["@identifier"] = identifier,
        ["@message"] = message
    })

    MySQL.Async.fetchAll("SELECT * FROM tweets ORDER BY id DESC LIMIT 10", {}, function(tweets)
        TriggerClientEvent("foxcore_phone:loadTweets", -1, tweets)
    end)
end)
