RegisterNUICallback("postTweet", function(data, cb)
    TriggerServerEvent("foxcore_phone:postTweet", data.message)
    cb("ok")
end)

RegisterNetEvent("foxcore_phone:loadTweets", function(tweets)
    SendNUIMessage({
        type = "loadTweets",
        tweets = tweets
    })
end)
