RegisterNetEvent("foxcore_blackmarket:buyWeapon")
AddEventHandler("foxcore_blackmarket:buyWeapon", function(weaponName, price)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT cash FROM player_wallet WHERE identifier = ?", {identifier}, function(result)
        if result[1] and result[1].cash >= price then
            MySQL.execute("UPDATE player_wallet SET cash = cash - ? WHERE identifier = ?", {price, identifier})
            MySQL.execute("INSERT INTO player_inventory (identifier, item, quantity) VALUES (?, ?, 1)", {identifier, weaponName})
            TriggerClientEvent("chat:addMessage", src, { args = { "[Black Market]", "✅ Weapon purchased successfully!" } })
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "[Black Market]", "❌ Not enough money!" } })
        end
    end)
end)

RegisterNetEvent("foxcore_blackmarket:buyAttachment")
AddEventHandler("foxcore_blackmarket:buyAttachment", function(attachmentName, price)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT cash FROM player_wallet WHERE identifier = ?", {identifier}, function(result)
        if result[1] and result[1].cash >= price then
            MySQL.execute("UPDATE player_wallet SET cash = cash - ? WHERE identifier = ?", {price, identifier})
            MySQL.execute("INSERT INTO player_inventory (identifier, item, quantity) VALUES (?, ?, 1)", {identifier, attachmentName})
            TriggerClientEvent("chat:addMessage", src, { args = { "[Black Market]", "✅ Attachment purchased successfully!" } })
        else
            TriggerClientEvent("chat:addMessage", src, { args = { "[Black Market]", "❌ Not enough money!" } })
        end
    end)
end)

RegisterNetEvent("foxcore_blackmarket:checkKeycard")
AddEventHandler("foxcore_blackmarket:checkKeycard", function(requiredKeycard)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.query("SELECT * FROM player_inventory WHERE identifier = ? AND item = ?", {identifier, requiredKeycard}, function(result)
        if result[1] then
            TriggerClientEvent("foxcore_blackmarket:accessGranted", src)
        else
            TriggerClientEvent("foxcore_blackmarket:accessDenied", src)
        end
    end)
end)
