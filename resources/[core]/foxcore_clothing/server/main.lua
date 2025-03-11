RegisterServerEvent("foxcore_clothing:processPurchase")
AddEventHandler("foxcore_clothing:processPurchase", function(data, price)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    if exports["foxcore_banking"]:Withdraw(src, "bank", price) then
        MySQL.Async.execute("UPDATE foxcore_characters SET clothing = @clothing WHERE identifier = @identifier", {
            ["@identifier"] = identifier,
            ["@clothing"] = json.encode(data)
        })
        TriggerClientEvent("foxcore_ui:showNotification", src, "Purchase successful!")
    else
        TriggerClientEvent("foxcore_ui:showNotification", src, "Not enough money!")
    end
end)

RegisterServerEvent("foxcore_clothing:saveOutfit")
AddEventHandler("foxcore_clothing:saveOutfit", function(outfitName)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.execute("INSERT INTO foxcore_outfits (identifier, outfit_name, data) VALUES (@identifier, @outfitName, @data)", {
        ["@identifier"] = identifier,
        ["@outfitName"] = outfitName,
        ["@data"] = json.encode(GetPlayerClothingData(src))
    })
    TriggerClientEvent("foxcore_ui:showNotification", src, "Outfit saved!")
end)

RegisterServerEvent("foxcore_clothing:loadOutfit")
AddEventHandler("foxcore_clothing:loadOutfit", function(outfitName)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchAll("SELECT data FROM foxcore_outfits WHERE identifier = @identifier AND outfit_name = @outfitName", {
        ["@identifier"] = identifier,
        ["@outfitName"] = outfitName
    }, function(result)
        if result[1] then
            local outfitData = json.decode(result[1].data)
            TriggerClientEvent("foxcore_clothing:applyOutfit", src, outfitData)
        else
            TriggerClientEvent("foxcore_ui:showNotification", src, "Outfit not found!")
        end
    end)
end)

RegisterServerEvent("foxcore_clothing:saveWardrobeOutfit")
AddEventHandler("foxcore_clothing:saveWardrobeOutfit", function(outfitName)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.execute("INSERT INTO foxcore_wardrobes (identifier, outfit_name, data) VALUES (@identifier, @outfitName, @data)", {
        ["@identifier"] = identifier,
        ["@outfitName"] = outfitName,
        ["@data"] = json.encode(GetPlayerClothingData(src))
    })
    TriggerClientEvent("foxcore_ui:showNotification", src, "Outfit saved to your wardrobe!")
end)

RegisterServerEvent("foxcore_clothing:loadWardrobeOutfit")
AddEventHandler("foxcore_clothing:loadWardrobeOutfit", function(outfitName)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchAll("SELECT data FROM foxcore_wardrobes WHERE identifier = @identifier AND outfit_name = @outfitName", {
        ["@identifier"] = identifier,
        ["@outfitName"] = outfitName
    }, function(result)
        if result[1] then
            local outfitData = json.decode(result[1].data)
            TriggerClientEvent("foxcore_clothing:applyOutfit", src, outfitData)
        else
            TriggerClientEvent("foxcore_ui:showNotification", src, "Outfit not found in wardrobe!")
        end
    end)
end)
