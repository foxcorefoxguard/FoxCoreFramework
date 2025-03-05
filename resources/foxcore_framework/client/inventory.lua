local inventory = {}

RegisterNetEvent("foxcore:updateInventory", function(items)
    inventory = items
end)

RegisterCommand("useitem", function(source, args)
    local itemName = args[1]
    if inventory[itemName] then
        TriggerServerEvent("foxcore:useItem", itemName)
    else
        print("^1[FoxCore]^7 You don't have this item!")
    end
end, false)
