local PlayerInventories = {}

-- 📌 Load Inventory Once (Cache)
RegisterNetEvent("foxcore_ambulance:loadInventory")
AddEventHandler("foxcore_ambulance:loadInventory", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    if not PlayerInventories[identifier] then
        MySQL.query("SELECT * FROM player_inventory WHERE identifier = ?", {identifier}, function(result)
            PlayerInventories[identifier] = result
        end)
    end
end)

-- 📌 Use Item (No DB Query Needed Every Time)
RegisterNetEvent("foxcore_ambulance:useItem")
AddEventHandler("foxcore_ambulance:useItem", function(itemName)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    if PlayerInventories[identifier] then
        for _, item in pairs(PlayerInventories[identifier]) do
            if item.name == itemName then
                TriggerClientEvent("foxcore_ambulance:useMedicalItem", src, itemName)
                return
            end
        end
    end

    TriggerClientEvent("chat:addMessage", src, { args = { "[EMS]", "❌ You do not have this item!" } })
end)
