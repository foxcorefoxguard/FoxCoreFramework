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

-- Display weapons in inventory
for weapon, data in pairs(FoxCoreWeapons) do
    print(("Weapon: %s | Label: %s | Weight: %.1fkg"):format(weapon, data.label, data.weight))
end

RegisterCommand("openinventory", function()
    local playerItems = {}

    for k, v in pairs(Items) do
        table.insert(playerItems, {
            name = v.name,
            label = v.label,
            image = v.image
        })
    end

    SendNUIMessage({
        action = "openInventory",
        items = playerItems
    })
    SetNuiFocus(true, true)
end)
