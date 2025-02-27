RegisterNetEvent("foxcore_inventory:openStashUI", function(stashInventory)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "openStash",
        inventory = stashInventory
    })
end)
