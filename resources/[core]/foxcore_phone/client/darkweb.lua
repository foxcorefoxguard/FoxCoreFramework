RegisterNUICallback("openDarkWeb", function(data, cb)
    TriggerServerEvent("foxcore_phone:getBlackMarketItems")
    cb("ok")
end)

RegisterNetEvent("foxcore_phone:loadBlackMarket", function(items)
    SendNUIMessage({
        type = "loadBlackMarket",
        items = items
    })
end)

RegisterNUICallback("buyBlackMarketItem", function(data, cb)
    TriggerServerEvent("foxcore_phone:buyBlackMarketItem", data.item, data.quantity)
    cb("ok")
end)
