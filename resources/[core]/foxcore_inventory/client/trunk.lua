RegisterNetEvent("foxcore_inventory:openTrunkUI", function(trunkInventory)
    SetNuiFocus(true, true)
    SendNUIMessage({
        type = "openTrunk",
        inventory = trunkInventory
    })
end)
