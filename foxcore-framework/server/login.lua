RegisterNetEvent("foxcore:playerJoined", function()
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)

    MySQL.Async.fetchAll("SELECT * FROM characters WHERE identifier = @identifier", {
        ["@identifier"] = identifier
    }, function(result)
        if #result > 0 then
            TriggerClientEvent("foxcore:openLoginUI", src, result)
        else
            TriggerClientEvent("foxcore:openLoginUI", src, {})
        end
    end)
end)

RegisterNetEvent("foxcore:createCharacter", function(firstName, lastName)
    local src = source
    local identifier = GetPlayerIdentifier(src, 0)
    local characterName = firstName .. " " .. lastName

    MySQL.Async.insert("INSERT INTO characters (identifier, name) VALUES (@identifier, @name)", {
        ["@identifier"] = identifier,
        ["@name"] = characterName
    }, function()
        TriggerClientEvent("foxcore:playerCreated", src)
    end)
end)
