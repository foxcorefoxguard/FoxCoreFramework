RegisterNetEvent("foxcore_clothing:openShop")
AddEventHandler("foxcore_clothing:openShop", function()
    SetNuiFocus(true, true)
    SendNUIMessage({ type = "openUI" })
end)

RegisterNUICallback("purchaseClothing", function(data, cb)
    local price = Config.ClothingPrices[data.type] or 100
    TriggerServerEvent("foxcore_clothing:processPurchase", data, price)
    cb("success")
end)

RegisterNUICallback("saveOutfit", function(data, cb)
    TriggerServerEvent("foxcore_clothing:saveOutfit", data.name)
    cb("success")
end)

RegisterNUICallback("loadOutfit", function(data, cb)
    TriggerServerEvent("foxcore_clothing:loadOutfit", data.name)
    cb("success")
end)

RegisterNUICallback("closeUI", function()
    SetNuiFocus(false, false)
end)
