local inventory = {}

RegisterNetEvent("foxcore_inventory:openInventory", function(items)
    inventory = items
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "openInventory",
        inventory = inventory
    })
end)

RegisterNUICallback("useItem", function(data, cb)
    TriggerServerEvent("foxcore_inventory:useItem", data.item)
    cb("ok")
end)

RegisterNUICallback("closeInventory", function()
    SetNuiFocus(false, false)
end)
