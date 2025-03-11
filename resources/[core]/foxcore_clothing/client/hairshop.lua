RegisterNetEvent("foxcore_hairshop:openShop")
AddEventHandler("foxcore_hairshop:openShop", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ type = "openHairUI" })
end)

RegisterNUICallback("purchaseHaircut", function(data, cb)
    local price = Config.HairPrices[data.type] or 100
    TriggerServerEvent("foxcore_hairshop:processHairPurchase", data, price)
    cb("success")
end)
